<?php

switch ($rq[1]) {
    case 'empty':
        dieJSON('Empty DATA request');
        break;
    case 'dbvalues':
        echo $modx->runSnippet('dbvalues');
        break;
    case 'shop':
        if (empty($userID)) dieJSON('Forbidden', 403);
        echo $modx->runSnippet('shopData');
        break;
    case 'hint':
        $json = getClubStatusAlias('Hint', $rq[2], 'info');
        break;
    case 'status':
        $json = array(
            'is_crew' => isCrew(),
            'rows' => getClubStatus($rq[2], 'info'),
        );
        if ($rq[2] == 'idHelp' && !empty($json['rows'])) {
            $rows = array();
            foreach($json['rows'] as $row) {
                $ext = empty($row['extended'])? array() : $row['extended'];
                if (!empty($ext['crew']) && empty($json['is_crew'])) continue;
                $rows[] = $row;
            }
            $json['rows'] = $rows;
        }
        break;
    case 'cabinet':
        echo $modx->runSnippet('dbdata', array(
            '_report' => 'cabinetData',
        ));
        break;
    default:
        if ($data_hook = $modx->scrm->sysFilePath("hook/data/{$rq[1]}.php")) {
            include_once($data_hook);
        }
}
