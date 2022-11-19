<?php
$xpdo_meta_map['idLink']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'link',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'tbl1' => NULL,
    'id1' => 0,
    'tbl2' => NULL,
    'id2' => 0,
  ),
  'fieldMeta' => 
  array (
    'tbl1' => 
    array (
      'dbtype' => 'enum',
      'precision' => '\'idSportsmen\',\'idLead\',\'idTrainer\',\'idGoal\',\'modUser\'',
      'phptype' => 'string',
      'null' => false,
    ),
    'id1' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
    'tbl2' => 
    array (
      'dbtype' => 'enum',
      'precision' => '\'idSportsmen\',\'idLead\',\'idTrainer\',\'idGoal\',\'idCity\',\'idLabel\'',
      'phptype' => 'string',
      'null' => false,
    ),
    'id2' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
  ),
  'indexes' => 
  array (
    'uq_link' => 
    array (
      'primary' => false,
      'unique' => true,
      'type' => 'BTREE',
      'columns' => 
      array (
        'id1' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
        'tbl1' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
        'id2' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
        'tbl2' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'link2' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'id2' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
  ),
);
