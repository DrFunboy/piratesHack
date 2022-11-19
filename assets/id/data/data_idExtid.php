<?php

$w->innerJoin('idStatus', 'wExtype', "{$table}.extype=wExtype.id AND wExtype.tbl='idExtid' AND wExtype.published=1");
$select[] = 'wExtype.name';
$select[] = 'wExtype.alias';
$select[] = 'wExtype.cls';