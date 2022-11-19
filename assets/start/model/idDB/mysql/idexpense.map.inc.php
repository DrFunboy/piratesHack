<?php
$xpdo_meta_map['idExpense']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'expense',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'dateexpence' => NULL,
    'sum' => 0.0,
    'typeexpence' => 0,
    'info' => NULL,
    'plan' => 'fact',
    'created' => 'CURRENT_TIMESTAMP',
    'author' => 0,
    'edited' => NULL,
    'editedby' => 0,
  ),
  'fieldMeta' => 
  array (
    'dateexpence' => 
    array (
      'dbtype' => 'date',
      'phptype' => 'date',
      'null' => false,
      'index' => 'index',
    ),
    'sum' => 
    array (
      'dbtype' => 'decimal',
      'precision' => '10,2',
      'phptype' => 'float',
      'null' => false,
      'default' => 0.0,
    ),
    'typeexpence' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
    'info' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'string',
      'null' => true,
    ),
    'plan' => 
    array (
      'dbtype' => 'enum',
      'precision' => '\'fact\',\'1m\'',
      'phptype' => 'string',
      'null' => false,
      'default' => 'fact',
    ),
    'created' => 
    array (
      'dbtype' => 'timestamp',
      'phptype' => 'timestamp',
      'null' => false,
      'default' => 'CURRENT_TIMESTAMP',
    ),
    'author' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'edited' => 
    array (
      'dbtype' => 'datetime',
      'phptype' => 'datetime',
      'null' => true,
    ),
    'editedby' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
  ),
  'indexes' => 
  array (
    'dateexpence' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'dateexpence' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'typeexpence' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'typeexpence' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
  ),
  'aggregates' => 
  array (
    'TypeExpence' => 
    array (
      'class' => 'idStatus',
      'local' => 'typeexpence',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
  ),
);
