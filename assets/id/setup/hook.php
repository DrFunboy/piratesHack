<?php

$hook_file = __DIR__.'/hook/'.$rq[1].'.php';
if (file_exists($hook_file)) {
    include_once($hook_file);
}