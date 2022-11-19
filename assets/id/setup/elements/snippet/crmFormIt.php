$data = $_REQUEST;
if (!empty($hook)){
    $data = $hook->getValues();
}/* else {
    $token = $modx->getOption('club_key');
    if (isset($_REQUEST['club_key']) && ($_REQUEST['club_key'] == $token)) {
        
    }
}*/

if (!empty($data)){
    $data['oper'] = 'add';
    $data['table'] = 'idLead';
    $squad = explode('_', $data['squad']);
    $data['squad'] = $squad[0];
    if (sizeof($squad)>1) $data['club'] = $squad[1];
    
    $dbedit_out = $modx->runSnippet('dbedit', array(
        'data' => $data,
    ));
    $d_out = $modx->fromJSON($dbedit_out);
    $modx->runSnippet('dbedit', array(
        'data' => array(
            'oper' => 'add',
            'table' => 'idMsg',
            'info' => $modx->getChunk("mailNew_idLead", $d_out['data']),
            'msg_to' => $data['email'],
            'msg_subj' => 'Приглашаем на просмотр',
        )    
    ));
    if (!empty($hook) && !empty($d_out)){
        $hook->fields['key'] = $d_out['data']['key'];
    }
    file_get_contents('https://w.sportcrm.club/hook/wcatchcrmformit?'.http_build_query(
        array(
            'site' => $_SERVER['HTTP_HOST'],
            'club' => $data['club'],
            'email' => $data['email']
        )
    ));
}

return (!empty($hook))? true : $dbedit_out;