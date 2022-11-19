<?php

$ugroups = $modx->getOption('scrm_ugroups');
if (!in_array('idAdmin', $ugroups)) dieJSONForbidden();