<?php

if (!empty($rq[2])) {
    $setUserCity = array(
        'idCity' => $modx->getObject('idCity', $rq[2]),
        'user' => $modx->getObject('modUser', $modx->getOption('user', $_REQUEST, 0)),
    );
    echo $modx->runSnippet('setUserCity', $setUserCity);
}