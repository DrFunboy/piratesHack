<?php
$xpdo_meta_map['idPay']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'pay',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'sportsmen' => 0,
    'datepay' => NULL,
    'sum' => 0.0,
    'numpay' => '',
    'sumbank' => 0.0,
    'payd' => 1,
    'receipt' => NULL,
    'code1c' => '',
    'info' => NULL,
    'created' => 'CURRENT_TIMESTAMP',
    'author' => 0,
  ),
  'fieldMeta' => 
  array (
    'sportsmen' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
    'datepay' => 
    array (
      'dbtype' => 'date',
      'phptype' => 'date',
      'null' => true,
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
    'numpay' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '25',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'sumbank' => 
    array (
      'dbtype' => 'decimal',
      'precision' => '10,2',
      'phptype' => 'float',
      'null' => false,
      'default' => 0.0,
    ),
    'payd' => 
    array (
      'dbtype' => 'smallint',
      'phptype' => 'integer',
      'null' => true,
      'default' => 1,
    ),
    'receipt' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => true,
    ),
    'code1c' => 
    array (
      'dbtype' => 'char',
      'precision' => '36',
      'phptype' => 'string',
      'null' => true,
      'default' => '',
    ),
    'info' => 
    array (
      'dbtype' => 'text',
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
    'author' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
  ),
  'indexes' => 
  array (
    'datepay' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'datepay' => 
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
    'idAuthor' => 
    array (
      'class' => 'modUser',
      'local' => 'author',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
  ),
);
