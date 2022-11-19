<?php
$xpdo_meta_map['idExtid']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'extid',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'parent' => 0,
    'extype' => 0,
    'extid' => NULL,
    'extoken' => NULL,
    'created' => 'CURRENT_TIMESTAMP',
    'duedate' => NULL,
    'extended' => NULL,
  ),
  'fieldMeta' => 
  array (
    'parent' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
      'attributes' => 'unsigned',
      'index' => 'index',
    ),
    'extype' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
    'extid' => 
    array (
      'dbtype' => 'bigint',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => true,
      'index' => 'index',
    ),
    'extoken' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '200',
      'phptype' => 'string',
      'null' => true,
      'index' => 'index',
    ),
    'created' => 
    array (
      'dbtype' => 'timestamp',
      'phptype' => 'timestamp',
      'null' => false,
      'default' => 'CURRENT_TIMESTAMP',
    ),
    'duedate' => 
    array (
      'dbtype' => 'datetime',
      'phptype' => 'datetime',
      'null' => true,
      'index' => 'index',
    ),
    'extended' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'json',
      'null' => true,
    ),
  ),
  'indexes' => 
  array (
    'uq_extparent' => 
    array (
      'primary' => false,
      'unique' => true,
      'type' => 'BTREE',
      'columns' => 
      array (
        'parent' => 
        array (
          'collation' => 'A',
          'null' => false,
        ),
        'extype' => 
        array (
          'collation' => 'A',
          'null' => false,
        ),
        'extid' => 
        array (
          'collation' => 'A',
          'null' => true,
        ),
        'extoken' => 
        array (
          'collation' => 'A',
          'null' => true,
        ),
      ),
    ),
    'extid' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'extid' => 
        array (
          'collation' => 'A',
          'null' => true,
        ),
        'extype' => 
        array (
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'extoken' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'extoken' => 
        array (
          'collation' => 'A',
          'null' => true,
        ),
        'extype' => 
        array (
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
  'aggregates' => 
  array (
    'exType' => 
    array (
      'class' => 'idStatus',
      'local' => 'extype',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idSportsmen' => 
    array (
      'class' => 'idSportsmen',
      'local' => 'parent',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idCity' => 
    array (
      'class' => 'idCity',
      'local' => 'parent',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idUser' => 
    array (
      'class' => 'modUser',
      'local' => 'parent',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
  ),
);
