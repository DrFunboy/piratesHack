<?php
$data = $_REQUEST;

clubLog('amocrm2', $data);

clubAllowOrigin();

$cache_path = CRM_PREFIX .'/clubHook/amo';
$amo_pause = $modx->cacheManager->get($cache_path);
if (empty($amo_pause)) {
    $new_amo_pause = true;
    $modx->cacheManager->set($cache_path, $new_amo_pause, 120);
}

use AmoCRM\Client\AmoCRMApiClient;
use AmoCRM\Exceptions\AmoCRMApiException;
use AmoCRM\Helpers\EntityTypesInterface;
//use AmoCRM\Models\Leads\Pipelines\PipelineModel;
//use AmoCRM\Collections\Leads\Pipelines\PipelinesCollection;
//use AmoCRM\Collections\Leads\Pipelines\Statuses\StatusesCollection;
use League\OAuth2\Client\Token\AccessTokenInterface;
use League\OAuth2\Client\Token\AccessToken;

include_once CRM_PATH . 'vendor/autoload.php';

$cfg = clubConfig('amo_token,amo_config');
global $token;

$token = getClubJSON($cfg['amo_token']);
$config = getClubJSON($cfg['amo_config']);

$json = array(
    'idLead' => $modx->getFieldMeta('idLead'),
    'idStatus' => getClubStatus('idLead'),
    'config' => $config,
);

if ($rq[2] == 'webhook') {
    $row = array();
    if (isset($data['contacts'])){
        if (!empty($data['contacts']['add'])) $contact = $data['contacts']['add'][0];
        if (!empty($data['contacts']['update'])) $contact = $data['contacts']['update'][0];
        if (!empty($contact)) {
            foreach($config['fieldsCONTACTS'] as $amo_field => $crm_field){
                if ($amo_field=='name') $row[$crm_field] = $contact['name'];
                $custom_fields = $contact['custom_fields'];
                if (!empty($custom_fields)) foreach($custom_fields as $cf) {
                    if ($cf['id'] == $amo_field) {
                        $value = $cf['values'][0];
                        $row[$crm_field] = (gettype($value)=='array')? $value['value'] : $value;
                    }
                }
            }
            if (!empty($contact['linked_leads_id'])) foreach($contact['linked_leads_id'] as $lkey => $llead) {
                $row['extid'] = $lkey;
            }
        }
    }
    
    if (isset($data['leads'])){
        if (!empty($data['leads']['add'])) $lead = $data['leads']['add'][0];
        if (!empty($data['leads']['update'])) $lead = $data['leads']['update'][0];
        if (!empty($data['leads']['delete'])) $lead = $data['leads']['delete'][0];
        //if (!empty($data['leads']['status'])) $lead = $data['leads']['status'][0];
        
        if (!empty($lead)) {
            $row['extid'] = $lead['id'];
            foreach($config['fieldsLEADS'] as $amo_field => $crm_field){
                if ($amo_field=='name') $row[$crm_field] = $lead['name'];
                $custom_fields = $lead['custom_fields'];
                if (!empty($custom_fields)) foreach($custom_fields as $cf) {
                    if ($cf['id'] == $amo_field) {
                        $value = $cf['values'][0];
                        $row[$crm_field] = $value = (gettype($value)=='array')? $value['value'] : $value;
                        if ($crm_field == 'datestart' && !empty($value)) {
                            try {
                                if (is_numeric($value)) {
                                    $date = new DateTime();
                                    $date->setTimestamp($value);
                                } else $date = new DateTime($value);
                                $row[$crm_field] = $date->format('c');
                            } catch (Exception $e) {
                                clubLog('amo_exception', $e->getMessage());
                                //$modx->log(modX::LOG_LEVEL_ERROR, "AmoExceptio.datestart ".$e->getMessage());
                            }
                        }
                    }
                }
            }
            
            // отключил, зачем пустые?
            //if (!empty($data['leads']['add']) && empty($row['name'])) {
            //    $row['name'] = empty($lead['name'])? $lead['id'] : $lead['name'];
            //}

            if (!empty($data['leads']['delete'])) {
                $status = 'x';
            } else {
                $status = $config['statuses'][ $lead['pipeline_id'].'_'.$lead['status_id'] ];
            }
            if (!empty($status)) $row['status'] = $status;
        }
    }
    
    //$modx->log(modX::LOG_LEVEL_ERROR, "AmoWebhookUpd ".json_encode($row));
    
    if (!empty($row['extid'])) {
        $row['table'] = 'idLead';
        $idLead = $modx->getObject('idLead', array(
            'extid' => $row['extid'],
        ));
        
        if (!empty($idLead)) {
            $row['oper'] = 'edit';
            if (!empty($row['status']) && $row['status'] == $idLead->get('status')) unset($row['status']); // Не менять статус если он уже равен
            if (!empty($idLead->get('edited')) && !empty($lead['last_modified'])) {
                if ((new DateTime($idLead->get('edited')))->format('U') > $lead['last_modified']) {
                    // Если какие-то изменения уже приходили, не затирать последние. Фикс глюка АМО.
                    $row['extid'] = null;
                }
            }
            //$lead
        } else {
            if (empty($row['name'])) $row['extid'] = null; // С пустым name не будет создавать
        }
        

        if (!empty($row['extid'])) $modx->runSnippet('dbedit', array(
            'data' => $row,
            'row' => $idLead, // null если не найден
        ));
    }
    //$modx->log(modX::LOG_LEVEL_ERROR, "AmoWebhook ".var_export($data, true));
}

$token['redirect_url'] = $modx->getOption('site_url').'hook/amo.crm/'; //ltrim($_SERVER['PHP_SELF'], '/')

if (empty($token['client_id'])||empty($token['client_secret'])) {
    if (!empty($_REQUEST['client_id'])) {
        $token['client_id'] = $_REQUEST['client_id'];
        setClubConfig('amo_token', json_encode($token));
    }
    dieJSON('Empty client_id || client_secret');
}

$apiClient = new AmoCRMApiClient($token['client_id'], $token['client_secret'], $token['redirect_url']);

if (isset($_GET['code'])) {
    /*if (isset($_GET['referer'])) {
        $apiClient->setAccountBaseDomain($_GET['referer']);
    }
    $accessToken = $apiClient->getOAuthClient()->getAccessTokenByCode($_GET['code']);
    if (!$accessToken->hasExpired()) {
        $ownerDetails = $apiClient->getOAuthClient()->getResourceOwner($accessToken);
        $AccountId = $ownerDetails->getId();
        $token = array_merge($token, array(
            'access_token' => $accessToken->getToken(),
            'refresh_token' => $accessToken->getRefreshToken(),
            'expires' => $accessToken->getExpires(),
            'baseDomain' => $apiClient->getAccountBaseDomain(),
        ));

        $val = json_encode($token);
        setClubConfig('amo_token', $val);
        clubLog('amo_token_code', $val);
    }*/
    
    $baseDomain = $_REQUEST['referer'];

    $data = [
        'client_id' => $token['client_id'],
        'client_secret' => $token['client_secret'],
        'grant_type' => 'authorization_code',
        'code' => $_GET['code'],
        'redirect_uri' => "https://{$_SERVER['HTTP_HOST']}/hook/amo.crm/",
    ];
    
    $curl = curl_init("https://{$baseDomain}/oauth2/access_token");
    curl_setopt($curl,CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl,CURLOPT_USERAGENT,'amoCRM-oAuth-client/1.0');
    curl_setopt($curl,CURLOPT_HTTPHEADER,['Content-Type:application/json']);
    curl_setopt($curl,CURLOPT_HEADER, false);
    curl_setopt($curl,CURLOPT_CUSTOMREQUEST, 'POST');
    curl_setopt($curl,CURLOPT_POSTFIELDS, json_encode($data));
    curl_setopt($curl,CURLOPT_SSL_VERIFYPEER, 1);
    curl_setopt($curl,CURLOPT_SSL_VERIFYHOST, 2);
    $amo = curl_exec($curl);
    $code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    curl_close($curl);
    if ((int)$code == 200) {
        $response = json_decode($amo, true);
        
        $token = array_merge($token, array(
            'access_token' => $response['access_token'],
            'refresh_token' => $response['refresh_token'],
            'expires' => $response['expires_in'],
            'token_type' => $response['token_type'],
            'baseDomain' => $baseDomain,
        ));

        setClubConfig('amo_token', $token);
        clubLog('amo_token_code', $token);
    }
}

if ($token['access_token']) {
    $t_keys = array('access_token','refresh_token','expires','baseDomain');
    $t_keys = array_intersect_key($token, array_flip($t_keys));
    $accessToken = new AccessToken($t_keys);

    $apiClient->setAccessToken($accessToken)
    ->setAccountBaseDomain($token['baseDomain'])
    ->onAccessTokenRefresh(
        function (AccessTokenInterface $newAccessToken, string $baseDomain) {
            global $token;
            
            $token = array_merge($token, array(
                'access_token' => $newAccessToken->getToken(),
                'refresh_token' => $newAccessToken->getRefreshToken(),
                'expires' => $newAccessToken->getExpires(),
                'baseDomain' => $baseDomain,
            ));
            //$json['onAccessTokenRefresh'] = $token;
            setClubConfig('amo_token', json_encode($token));
            clubLog('amo_token', $token);
        }
    );

    if (!empty($AccountId)) {
        $webhook = new AmoCRM\Models\WebhookModel();
        $webhook->setDestination($token['redirect_url'].'webhook')
            //->setAccountId($AccountId)
            ->setSort(10)
            //->setDisabled(false)
            //->setCreatedAt(time())
            //->setCreatedBy($AccountId)
            ->setSettings([
                'add_lead',
                'add_contact',
                'update_lead',
                'update_contact',
                'status_lead',
            ]);
        //$modx->log(modX::LOG_LEVEL_ERROR, "AmoWH1 ".var_export($webhook, true));
        try {
            $webhook = $apiClient->webhooks()->subscribe($webhook);
            clubLog('amo_webhook', $token['redirect_url'].'webhook');
        }
        catch (AmoCRMApiException $e) {
            $errorTitle = $e->getTitle();
            $code = $e->getCode();
            $debugInfo = var_export($e->getLastRequestInfo(), true);
            clubLog('amo_error', $errorTitle."Code: {$code} | Debug: ".$debugInfo);
            //$modx->log(modX::LOG_LEVEL_ERROR, "AmoError $errorTitle Code: $code | Debug: $debugInfo");
        }
    }
    
    if ($rq[2] == 'list') {
        $pipelinesService = $apiClient->pipelines();
        $fieldsLEADS = $apiClient->customFields(EntityTypesInterface::LEADS);
        $fieldsCONTACTS = $apiClient->customFields(EntityTypesInterface::CONTACTS);
        try {
            $json['pipelines'] = $pipelinesService->get();
            $json['fieldsLEADS'] = $fieldsLEADS->get()->toArray();
            array_unshift($json['fieldsLEADS'], array('id' => 'name', 'name' => 'NAME'));
            $json['fieldsCONTACTS'] = $fieldsCONTACTS->get()->toArray();
            array_unshift($json['fieldsCONTACTS'], array('id' => 'name', 'name' => 'NAME'));

            //$webhooks = $apiClient->webhooks();
            //$json['webhooks'] = $webhooks->get();
        }
        catch (AmoCRMApiException $e) {
            $errorTitle = $e->getTitle();
            $code = $e->getCode();
            $debugInfo = var_export($e->getLastRequestInfo(), true);
            clubLog('amo_exception', $errorTitle."Code: {$code} | Debug: ".$debugInfo);
            //$modx->log(modX::LOG_LEVEL_ERROR, "AmoException $errorTitle | $code | $debugInfo");
        }
        //$wd = $apiClient->widgets();
        //$json['widgets'] = $wd->getOne('ktjkxdmp7jesvcim5euk9bkjpjdt45o6dz8hxsmf')->toArray(); //->get(); ->getSettings()
    }

    if ($rq[2] == 'widget') {
        $json['script'] = $json['config']['script'];
        //$json['script'] = $modx->getOption('site_url').ltrim(CRM_URL, '/').'wss/modules/amo.js';
    }
    
    
    if (empty($amo_pause)) {
        $remind = $modx->getOption('remind', $config, 1);
        $w = $modx->newQuery('idLead', array(
            'idLead.status:IN' => array('i','d','t','v'), // приглашен i, сегодня t, на рассмотрении d, пришел v
            'idLead.extid:!=' => '',
        ));
        $w->leftJoin('idSportsmen');
        $w->leftJoin('idLesson', 'lsn', "lsn.sportsmen = idLead.sportsmen AND lsn.status='y'");
        $w->select(array(
            'idLead.id',
            'idLead.status',
            'idLead.extid',
            'idLead.datestart',
            "IF(DATE(idLead.datestart) <= DATE_ADD(DATE(now()), INTERVAL $remind DAY), 1, 0) as tday",
            'idSportsmen.status as sp_status',
            'count(lsn.id) as lsn_cnt',
        ));
        $w->groupby('idLead.id');
        //$w->prepare();
        //$json['sql'] = $w->toSQL();
    
        $leadchange = array();
        foreach($modx->getIterator('idLead', $w) as $row) {
            $r = $row->toArray('', false, true);
            if (($r['sp_status']=='Действует') || ($r['lsn_cnt'] > 1)) {
                $leadchange[ $r['extid'] ] = 'a';
            } elseif ($r['status']=='v') {
                $leadchange[ $r['extid'] ] = 'd';
            } elseif ($r['status']=='i' && $r['tday']=='1') {
                $leadchange[ $r['extid'] ] = 't';
            }
        }
        $json['leadchange1'] = $leadchange;
        
        if (!empty($leadchange)) try {
            $statuses = array_flip($config['statuses']);
            // $lead['pipeline_id'].'_'.$lead['status_id'];
            $filter = new AmoCRM\Filters\LeadsFilter();
            $filter->setIds(array_keys($leadchange));
            $leads = $apiClient->leads()->get($filter, []);
            $amo_lead_keys = array();
            foreach ($leads as $lead) {
                //$need_update = false;
                $lead_id = $lead->getId();
                $leadch = $leadchange["{$lead_id}"];
                $amo_lead_keys["{$lead_id}"] = $leadch;
                $ch_status = $statuses[ $leadch ];
                $row = $lead->toArray();
                foreach($row['custom_fields_values'] as $n => $field) {
                    if (count($field['values']) > 1) {
                        //$need_update = true;
                        clubLog('custom_fields_values', $row);
                        //$row['custom_fields_values'][$n]['values'] = array( $field['values'][0] );
                    }
                }
                /*if ($need_update) {
                    $lead->fromArray($row);
                }*/

                if (!empty($ch_status) ) {
                    $status_arr = explode('_', $ch_status);
                    
                    $lead->setPipelineId((int)$status_arr[0]);
                    $lead->setStatusId((int)$status_arr[1]);
                }
            }
            $rr = array_diff_assoc($leadchange, $amo_lead_keys);
            if (!empty($rr)) clubLog('array_diff_assoc2', $rr);

            $apiClient->leads()->update($leads);
        } catch (AmoCRMApiException $e) {
            $errorTitle = $e->getTitle();
            $code = $e->getCode();
            $debugInfo = var_export($e->getLastRequestInfo(), true);
            clubLog('amo_exception2', $errorTitle."Code: {$code} | Debug: ".$debugInfo);
            //$modx->log(modX::LOG_LEVEL_ERROR, "AmoException $errorTitle | $code | $debugInfo");
        }
    }
    
    if ($rq[2] == 'getleads' && !empty($_POST['leads'])) {
        $filter = new AmoCRM\Filters\LeadsFilter();
        $filter->setIds($_POST['leads']);
        try {
            $leads = $apiClient->leads()->get($filter, []);
        } catch (AmoCRMApiException $e) {
            $leads = array();
        }
        foreach ($leads as $lead) {
            $row = $lead->toArray();
            /*if ($row['name']=='Эльмира Тест. НЕ трогать!!!') {
                foreach($row['custom_fields_values'] as $n => $field) {
                    if ($field['field_id'] == 309247) {
                        $row['custom_fields_values'][$n]['values'] = array(array('value' => 'Милана_'));
                    }
                }
                //$row['status_id'] = 31850836;
                
                $lead->fromArray($row);
                $lead->setStatusId(31850836);
                $apiClient->leads()->update($leads);
            }*/
            
            $json['rows'][] = $row;
        }
        $modx->cacheManager->delete($cache_path);
    }
}
