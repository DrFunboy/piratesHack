<?php
/* ********************************
параметры:
mode включает parent - перемещает ресурс к нужному родителю
ресурсы создает всегда с published=1
********************************* */

$setup->delOldFiles();

$manager = $modx->getManager();
$clubid_q = $modx->query("SELECT TABLE_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.`COLUMNS`
    WHERE TABLE_NAME LIKE '%_site_content' AND COLUMN_NAME = 'club_id'");
if (empty( $clubid_q->fetchAll(PDO::FETCH_ASSOC) )) {
    echo 'Добавляю поле club_id';
    $manager->addField('modResource', 'club_id');
}

$extension_packages = $modx->getObject('modSystemSetting', 'extension_packages');
if (!empty($extension_packages)) $extension_packages->remove();

$elems = array(
    'modChunk' => 'rowFile,chlogPlan,chlogFact,clubThumb,club_,club_scripts,dbRowSportsmenInvoice,dbRowSportsmenPay,idChCity,profileRow,mySportsmen,rowCity,payYandex,navParent4,shopGallery,leadForm,rgThumb,clubOnline,mailHelp,mailNew_idSportsmen,mailNew_idTrainer,tplPhoto,jsNewInvoice,jsSquad,tplNewCabinet,tpl_invoice',
    
    'modSnippet' => 'clubFileAdd,crmFiles,googleData,clubThumb,onlydigits,mySportsmen,idPayYandex,idPayYandexDemo,qrEnter,idGetCandidate,shop_attr,myTrainer,getClubPath,getTmplPath,fmtdate,goalNewForm,crmForm,clubMsgToAdm,idGetTrainer,idGetSportsmens,shopPay,club_thumb',
    
    'modPlugin' => 'afterProfileSave,shopScripts,on404',
);

foreach($elems as $el_key => $elem_names) {
    foreach($modx->getCollection($el_key, array(
        'name:IN' => explode(',', $elem_names),
    )) as $elem) {
        $elem->remove();
    }
}

/* ============================== */

$fields = array('pagetitle', 'longtitle', 'menutitle', 'alias', 'alias_visible', 'content', 'link_attributes',
'class_key', 'content_type', 'publishedon', 'isfolder', 'cacheable', 'searchable','hidemenu','richtext','club_id'); //, 'published'

$user_group = array();
foreach($data["modUserGroup"] as $key => $value){
    $w = array("name" => $value);
    if (!($el = $modx->getObject('modUserGroup', $w))) {
        $el = $modx->newObject('modUserGroup', $w);
        $el->save();
    }
    $user_group[$key] = $el->get('id');
}

$res_group = array();
foreach($data["modResourceGroup"] as $key => $value){
    $w = array("name" => $value);
    if (!($el = $modx->getObject('modResourceGroup', $w))) {
        $el = $modx->newObject('modResourceGroup', $w);
        $el->save();
    }
    $res_group[$key] = $el->get('id');
}

$wres = $modx->newQuery('modResource');
foreach (array_keys($modx->getFields('modResource')) as $_k) $wres->select($_k);
$stmt = $wres->prepare();
$stmt->execute();

$local_res = array();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $club_id = $row['club_id'];
    if (empty($club_id)) {
        //$prop = json_decode($row['properties'], true);
        //$club_id = $prop['club_id'];
        echo "Empty 'club_id' in {$row['id']}: {$row['pagetitle']}<br>";
    } else $local_res[$club_id] = $row['id'];
    //if (!empty($club_id)) $local_res[$club_id] = $row['id'];
}

foreach($data["modAccessResourceGroup"] as $key => $value){
    $w = array(
        "target" => $res_group[ "id".$value['target'] ],
        "principal" => $user_group[ "id".$value['principal'] ],
        "principal_class" => "modUserGroup",
        "policy" => 1,
        "context_key" => "web",
    );
    if (!($el = $modx->getObject('modAccessResourceGroup', $w))) {
        $el = $modx->newObject('modAccessResourceGroup', $w);
        $el->save();
    }
}

$templates = array();
foreach($club_modules as $categ) {
    $category = $modx->getObject('modCategory', array("category" => $categ));
    if (empty($category)) {
        $category = $modx->newObject('modCategory', array("category" => $categ));
        $category->save();
    }
    
    if (!empty($data["modSnippet_{$categ}"])) {
        foreach ($data["modSnippet_{$categ}"] as $name){
            $w = array('name' => $name);
            $el = $modx->getObject('modSnippet', $w);
            if (!$el) $el = $modx->newObject('modSnippet', $w);
            if (empty($el->get('static'))) {
                $el->fromArray([
                    //"source" => 1,
                    //"static" => 0,
                    //"static_file" => "",
                    "snippet" => file_get_contents("elements/snippet/{$name}.php"),
                    "category" => $category->id,
                ]);
                $el->save();
            }
        }
    }
    
    if (!empty($data["modChunk_{$categ}"])) {
        foreach ($data["modChunk_{$categ}"] as $name){
            $w = array('name' => $name);
            $el = $modx->getObject('modChunk', $w);
            if (!$el) $el = $modx->newObject('modChunk', $w);
            if (empty($el->get('static'))) {
                $el->fromArray([
                    //"source" => 1,
                    //"static" => 0,
                    //"static_file" => "",
                    "snippet" => file_get_contents("elements/chunk/{$name}.html"),
                    "category" => $category->id,
                ]);
                $el->save();
            }
        }
    }
    
    if (!empty($data["modTemplate_{$categ}"])) {
        foreach ($data["modTemplate_{$categ}"] as $name){
            $w = array('templatename' => $name);
            $el = $modx->getObject('modTemplate', $w);
            if (!$el) $el = $modx->newObject('modTemplate', $w);
            $el->fromArray([
                //"source" => 1,
                //"static" => 0,
                //"static_file" => "",
                "content" => file_get_contents("elements/tpl/{$name}.html"),
                "category" => $category->id,
            ]);
            $el->save();
            $templates[$name] = $el->get('id');
        }
    }
    
    if (!empty($data["modPlugin_{$categ}"])) {
        foreach ($data["modPlugin_{$categ}"] as $name){
            $w = array('name' => $name);
            $el = $modx->getObject('modPlugin', $w);
            if (!$el) $el = $modx->newObject('modPlugin', $w);
            $el->fromArray([
                //"source" => 1,
                //"static" => 0,
                //"static_file" => "",
                "plugincode" => file_get_contents("elements/plugin/{$name}.php"),
                "category" => $category->id,
            ]);
            $el->save();
            
            
            $PluginEvents = $data["PluginEvents_{$name}"];
            $elEvents = array();
            foreach($el->getMany('PluginEvents') as $pe){
                $event = $pe->get('event');
                $elEvents[] = $event;
                if (!in_array($event, $PluginEvents)) $pe->remove();
            }
            
            foreach ($PluginEvents as $plEvent) {
                if (in_array($plEvent, $elEvents)) continue;
                $mpev = $modx->newObject('modPluginEvent');
                $mpev->set('pluginid', $el->get('id'));
                $mpev->set('event', $plEvent);
                $mpev->save();
            }
        }
    }
    
}
    /* =========================== */
foreach($club_modules as $categ) {
    if (!empty($data["modResource_{$categ}"])) {
        $cntres = 0;
        foreach($data["modResource_{$categ}"] as $key => $res_data){
            echo "<br>Ищу {$res_data['id']}: {$res_data['pagetitle']}";
            
            $res_w = $local_res[ $res_data['id'] ]; // Поиск по ID из источника
            
            if (empty($res_w)) {
                echo " по uri {$res_data['uri']}.";
                $res_w = array('uri' => $res_data['uri']);
            }

            $res = $modx->getObject('modResource', $res_w);
            if (empty($res_data['parent'])) {
                $parent = 0;
            } else {
                $parent = $local_res[ $res_data['parent'] ];
                if (empty($parent)) $parent = -1;
            }
            echo " # Parent {$parent}";
            
            if (empty($res)) {
                if ($parent >= 0) {
                    echo " # Не нашел, создаю.";
                    $res = $modx->newObject('modResource', array(
                        //'parent' => $parent,
                        'published' => 1,
                        'menuindex' => $res_data['menuindex'],
                        'uri' => $res_data['uri'],
                    ));
                }
            } else {
                echo " # Нашел {$res->get('id')}";
            }
            
            if (!empty($res)) {
                if ($parent >= 0) {
                    $res->set('parent', $parent);
                }
                if (!empty($res_data['uri_override'])) {
                    array_push($fields, 'uri_override', 'uri');
                }
                $res->fromArray(array_intersect_key($res_data, array_flip($fields)));
                
                $res->set('content', file_get_contents("elements/res/{$res_data['id']}.html"));
                
                //$modx->log(modX::LOG_LEVEL_ERROR, "RRR ".$res_data['id']);
                
                $tpl = isset($res_data['Template'])? $templates[ $res_data['Template'] ] : 0;
                $res->set('template', $tpl);
                
                /*if (empty($res->get('club_id'))) {
                    $prop = $res->get('properties');
                    if (!empty($prop['club_id'])) {
                        $res->set('club_id', $prop['club_id']);
                    }
                }*/
                
                $res->save();
                $cntres++;

                $permiss = $data["modResourceGroupResource"][$key];
                if (!empty($permiss)) foreach($permiss as $old_group) {
                    $new_group = $res_group["id{$old_group}"];
                    $w = array(
                        "document" => $res->id,
                        "document_group" => $new_group,
                    );
                    $perm_obj = $modx->getObject('modResourceGroupResource', $w);
                    if (!$perm_obj) {
                        $perm_obj = $modx->newObject('modResourceGroupResource', $w);
                        $perm_obj->save();
                    }
                }
            }
        }
        echo "<br>{$categ}: update {$cntres} res";
    }
} // categ

$modx->updateCollection('modResource', array('deleted' => 1), array(
    'club_id:IN' => [174,181,169,180,163,135,29,194,58,206,203,16,20,211,198,202,208,209,207,172,121],
));
