<?php

foreach($modx->getCollection('modUser') as $u) {
    $u->joinGroup('www_id', 'Member', 110);
}