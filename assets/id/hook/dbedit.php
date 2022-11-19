<?php

if (!isCrew()) dieJSONForbidden();
echo $modx->runSnippet('dbedit');