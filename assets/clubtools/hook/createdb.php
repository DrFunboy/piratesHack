<?php


error_reporting(E_ALL);
ignore_user_abort(true);
set_time_limit(0);


$manager = $modx->getManager();
$generator = $manager->getGenerator();
$model_path = CRM_PATH.'start/model/';
$schema_path = CRM_PATH.'setup/clubStuff.xml';
$generator->parseSchema($schema_path, $model_path);

include_once(CRM_PATH.'setup/club_setup_db_fields.php');