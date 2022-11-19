<?php
$xpdo_meta_map['idLesson']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'lesson',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'status' => 'y',
    'mark' => NULL,
    'schedule' => 0,
    'sportsmen' => 0,
    'created' => 'CURRENT_TIMESTAMP',
    'edited' => NULL,
    'author' => 0,
    'editedby' => 0,
    'info' => NULL,
    'idinvoice' => 0,
  ),
  'fieldMeta' => 
  array (
    'status' => 
    array (
      'dbtype' => 'char',
      'precision' => '1',
      'phptype' => 'string',
      'null' => false,
      'default' => 'y',
    ),
    'mark' => 
    array (
      'dbtype' => 'smallint',
      'phptype' => 'integer',
      'null' => true,
    ),
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
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
    ),
    'editedby' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
    ),
    'info' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'string',
      'null' => true,
    ),
    'idinvoice' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
  ),
  'indexes' => 
  array (
    'uq_schedule_sportsmen' => 
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
    'idinvoice' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'idinvoice' => 
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
    'idInvoice' => 
    array (
      'class' => 'idInvoice',
      'local' => 'idinvoice',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
  ),
);
