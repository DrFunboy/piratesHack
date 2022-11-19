<?php

$from = $modx->getObject($table, $ids[0]);
if (!empty($from)) {
    $data = array_merge($from->toArray(), $data); // id будет удален из полей в обработчике dbedit
    $oper = 'add';
    unset($ids[0]);
    $from->remove();
}