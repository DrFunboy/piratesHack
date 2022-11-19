<?php
if (!empty($row) && 
    ($oper=='add' || (!empty($old_data) && $old_data['status'] != $row->get('status')))
) {

    $orderProfile = $modx->getObject('modUserProfile', array('internalKey' => $row->get('author')));
    $modx->runSnippet('makeMsg', array(
        'handler' => "idOrderItems_".$row->get('status'),
        'userProfile' => $orderProfile,
        'data' => $row->toArray(),
    ));
}