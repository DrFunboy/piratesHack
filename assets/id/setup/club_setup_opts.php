<?php

$settings = "enable_gravatar=0
allow_multiple_emails=0
blocked_minutes=20
failed_login_attempts=7
clear_cache_refresh_trees=1
friendly_alias_translit=russian
friendly_urls=1
use_alias_path=1
locale=ru_RU.UTF-8
manager_week_start=1
resource_tree_node_tooltip=alias
richtext_default=0
anonymous_sessions=1
search_default=0
session_cookie_lifetime=3024000
session_gc_maxlifetime=3024000
use_weblink_target=1
use_editor=0
date_timezone=Europe/Moscow
feed_modx_news_enabled=0
feed_modx_security_enabled=0
link_tag_scheme=abs
log_deprecated=0
password_generated_length=8";

foreach (explode(PHP_EOL, $settings) as $setting){
    $kv = explode('=', trim($setting));
    $opt = $modx->getObject('modSystemSetting', $kv[0]);
    if (empty($opt)){
        $opt = $modx->newObject('modSystemSetting');
        $opt->set('key', $kv[0]);
        
        $opt->set('xtype', 'textfield');
        $opt->set('namespace', 'core');            
    }
    $opt->set('value', $kv[1]);
    $opt->save();
    echo "{$kv[0]} :: {$opt->get('value')} | {$kv[1]}<br>";
}