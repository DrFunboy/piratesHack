<?php
$xpdo_meta_map['idInvoiceLesson']= array (
  'package' => 'idDB',
  'version' => '20.05.18.1',
  'table' => 'invoicelesson',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'sportsmen' => 0,
    'idinvoice' => 0,
    'idlesson' => NULL,
    'amount' => 0,
    'created' => 'CURRENT_TIMESTAMP',
  ),
  'fieldMeta' => 
  array (
    'sportsmen' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'idinvoice' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
    'idlesson' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => true,
      'index' => 'index',
    ),
    'amount' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'created' => 
    array (
      'dbtype' => 'timestamp',
      'phptype' => 'timestamp',
      'null' => false,
      'default' => 'CURRENT_TIMESTAMP',
    ),
  ),
  'indexes' => 
  array (
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
    'uq_idlesson' => 
    array (
      'primary' => false,
      'unique' => true,
      'type' => 'BTREE',
      'columns' => 
      array (
        'idlesson' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => true,
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
    'idInvoice' => 
    array (
      'class' => 'idInvoice',
      'local' => 'idinvoice',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idLesson' => 
    array (
      'class' => 'idLesson',
      'local' => 'idlesson',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
  ),
);
