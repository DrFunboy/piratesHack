<?php
$xpdo_meta_map['idSportsmenSquad']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'sportsmensquad',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'published' => 1,
    'sportsmen' => 0,
    'squad' => 0,
    'created' => 'CURRENT_TIMESTAMP',
    'author' => 0,
    'dateend' => NULL,
    'editedby' => 0,
    'ismain' => 0,
  ),
  'fieldMeta' => 
  array (
    'published' => 
    array (
      'dbtype' => 'smallint',
      'phptype' => 'integer',
      'null' => true,
      'default' => 1,
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
    'squad' => 
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
      'index' => 'index',
    ),
    'author' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'dateend' => 
    array (
      'dbtype' => 'datetime',
      'phptype' => 'datetime',
      'null' => true,
      'index' => 'index',
    ),
    'editedby' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'ismain' => 
    array (
      'dbtype' => 'smallint',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
  ),
  'indexes' => 
  array (
    'uq_spsq_published' => 
    array (
      'primary' => false,
      'unique' => true,
      'type' => 'BTREE',
      'columns' => 
      array (
        'squad' => 
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
        'published' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => true,
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
    'created' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'created' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'dateend' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'dateend' => 
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
    'idAuthor' => 
    array (
      'class' => 'modUser',
      'local' => 'author',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idSquad' => 
    array (
      'class' => 'idSquad',
      'local' => 'squad',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idSportsmen' => 
    array (
      'class' => 'idSportsmen',
      'local' => 'sportsmen',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
  ),
);
