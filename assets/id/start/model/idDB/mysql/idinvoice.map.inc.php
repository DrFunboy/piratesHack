<?php
$xpdo_meta_map['idInvoice']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'invoice',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'sportsmen' => 0,
    'typeinvoice' => 0,
    'dateinvoice' => NULL,
    'duedate' => NULL,
    'sum' => 0.0,
    'status' => '',
    'isauto' => 0,
    'lesson_amount' => 0,
    'info' => NULL,
    'created' => 'CURRENT_TIMESTAMP',
    'edited' => NULL,
    'author' => 0,
    'editedby' => 0,
  ),
  'fieldMeta' => 
  array (
    'sportsmen' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
    'typeinvoice' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
    'dateinvoice' => 
    array (
      'dbtype' => 'date',
      'phptype' => 'date',
      'null' => true,
      'index' => 'index',
    ),
    'duedate' => 
    array (
      'dbtype' => 'datetime',
      'phptype' => 'datetime',
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
    'status' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '125',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'isauto' => 
    array (
      'dbtype' => 'smallint',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'lesson_amount' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
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
    'typeinvoice' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'typeinvoice' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'dateinvoice' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'dateinvoice' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'duedate' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'duedate' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
  ),
  'composites' => 
  array (
    'idInvoicePay' => 
    array (
      'class' => 'idInvoicePay',
      'local' => 'id',
      'foreign' => 'idinvoice',
      'cardinality' => 'many',
      'owner' => 'local',
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
    'idInvoiceType' => 
    array (
      'class' => 'idInvoiceType',
      'local' => 'typeinvoice',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idSInvType' => 
    array (
      'class' => 'idSInvType',
      'local' => 'typeinvoice',
      'foreign' => 'typeinvoice',
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
