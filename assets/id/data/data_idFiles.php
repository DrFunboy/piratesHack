<?php

if ($cls = $rq["cls"]) {
    $w->innerJoin($cls, $cls, "{$cls}.key = idFiles.uid");
    if ( !is_null($modx->getFields($cls)['city']) && (!$rq['allCity'] || $rq['allCity'] == "false")) {
        $w->where( array( "{$cls}.city" => $_SESSION['club_city'] ) );
    }
    if ($where["filetype"]) {
        $fileType = getClubStatusAlias("idFileType", $where["filetype"]);
        if ($duedate = $fileType["extended"]["duedate"]) {
            $select[] = "{$duedate} as duedate";
        }
    }
    if ($cls=='idSportsmen') {
        //$w->innerJoin($tableadd, $tableadd, "{$tableadd}.key = idFiles.uid");
        $select[] = "{$cls}.name as sportsmen_name";
        $select[] = "{$cls}.id as sportsmen_id";
        //$select[] = "{$cls}.key as sportsmen_key"; // Не надо, посокльку есть uid
    }
}