<?php
if (!empty($row) && $row->get('ready')==0){
    $modx->runSnippet('sendMsg', array(
        "row" => $row,
    ));
}