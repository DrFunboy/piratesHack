<?php
$xpdo_meta_map['idSInvType']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'sinvtype',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'stype' => NULL,
    'typeinvoice' => 0,
  ),
  'fieldMeta' => 
  array (
    'stype' => 
    array (
      'dbtype' => 'char',
      'precision' => '10',
      'phptype' => 'string',
      'null' => false,
      'index' => 'index',
    ),
    'typeinvoice' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
  ),
  'indexes' => 
  array (
    'uq_sinvtype' => 
    array (
      'primary' => false,
      'unique' => true,
      'type' => 'BTREE',
      'columns' => 
      array (
        'typeinvoice' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
        'stype' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'stype' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'stype' => 
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
    'idInvoiceType' => 
    array (
      'class' => 'idInvoiceType',
      'local' => 'typeinvoice',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idStatus' => 
    array (
      'class' => 'idStatus',
      'local' => 'stype',
      'foreign' => 'alias',
      'cardinality' => 'one',
      'owner' => 'foreign',
      'criteria' => 
      array (
        'local' => 
        array (
          0 => 'idStatus.tbl=\'idSchedule\'',
          1 => 'idStatus.published=1',
        ),
      ),
    ),
  ),
);
