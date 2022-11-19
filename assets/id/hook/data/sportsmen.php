<?php

if (empty($userID)) $modx->sendUnauthorizedPage();
echo $modx->runSnippet('idGetSportsmen');