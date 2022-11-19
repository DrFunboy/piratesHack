<?php if(time() > 1671256586){return null;} return array (
  0 => 
  array (
    'id' => 141,
    'name' => 'clubAdmin',
    'tbl' => 'idModule',
    'alias' => 'clubAdmin',
    'cls' => 'clubStuff',
    'ico' => '',
    'menuindex' => 7,
    'extended' => 
    array (
      'script' => '/js/{prugv}/admin.js',
      'group' => 'idAdmin',
    ),
  ),
  1 => 
  array (
    'id' => 241,
    'name' => 'Создание новостей',
    'tbl' => 'idModule',
    'alias' => 'addnews',
    'cls' => 'clubStuff',
    'ico' => '',
    'menuindex' => 10,
    'extended' => 
    array (
      'load' => '{modules}addnews.html',
      'club_id' => '666',
      'group' => 'idManager,idAdmin',
    ),
  ),
);