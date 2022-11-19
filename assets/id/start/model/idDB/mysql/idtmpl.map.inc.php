<?php
$xpdo_meta_map['idTmpl']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'tmpl',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'type' => 'email',
    'name' => '',
    'subj' => '',
    'content' => NULL,
    'handler' => '',
  ),
  'fieldMeta' => 
  array (
    'type' => 
    array (
      'dbtype' => 'char',
      'precision' => '5',
      'phptype' => 'string',
      'null' => false,
      'default' => 'email',
    ),
    'name' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '100',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'subj' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '255',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'content' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'string',
      'null' => true,
    ),
    'handler' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '255',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
      'index' => 'index',
    ),
  ),
  'indexes' => 
  array (
    'handler' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'handler' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
  ),
);
