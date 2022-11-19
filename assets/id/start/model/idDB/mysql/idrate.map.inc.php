<?php
$xpdo_meta_map['idRate']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'rate',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'schedule' => 0,
    'sportsmen' => 0,
    'status' => 0,
    'value' => 0.0,
    'info' => NULL,
    'created' => 'CURRENT_TIMESTAMP',
    'edited' => NULL,
    'author' => 0,
    'editedby' => 0,
  ),
  'fieldMeta' => 
  array (
    'schedule' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
    'sportsmen' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
    'status' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'value' => 
    array (
      'dbtype' => 'decimal',
      'precision' => '10,2',
      'phptype' => 'float',
      'null' => false,
      'default' => 0.0,
    ),
    'info' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '255',
      'phptype' => 'string',
      'null' => true,
    ),
    'created' => 
    array (
      'dbtype' => 'timestamp',
      'phptype' => 'timestamp',
      'null' => false,
      'default' => 'CURRENT_TIMESTAMP',
    ),
    'edited' => 
    array (
      'dbtype' => 'datetime',
      'phptype' => 'datetime',
      'null' => true,
    ),
    'author' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
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
    'uq_rate' => 
    array (
      'primary' => false,
      'unique' => true,
      'type' => 'BTREE',
      'columns' => 
      array (
        'schedule' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
        'sportsmen' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
        'status' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'sportsmen' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'sportsmen' => 
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
    'idSportsmen' => 
    array (
      'class' => 'idSportsmen',
      'local' => 'sportsmen',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idSchedule' => 
    array (
      'class' => 'idSchedule',
      'local' => 'schedule',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idStatus' => 
    array (
      'class' => 'idStatus',
      'local' => 'status',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
  ),
);
