<?php
$xpdo_meta_map['idIncome']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'income',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'num' => '20',
    'status' => 0,
    'source' => 0,
    'name' => '',
    'medobj' => 0,
    'idtype' => 0,
    'info' => NULL,
    'totype' => 0,
    'tel' => '',
    'email' => '',
    'zip' => '',
    'address' => NULL,
    'created' => 'CURRENT_TIMESTAMP',
    'author' => 0,
  ),
  'fieldMeta' => 
  array (
    'num' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '20',
      'phptype' => 'string',
      'null' => false,
      'default' => '20',
      'index' => 'index',
    ),
    'status' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
    'source' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'name' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '255',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
      'index' => 'index',
      'club_log' => '1',
    ),
    'medobj' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
    'idtype' => 
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
    'totype' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'tel' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '25',
      'phptype' => 'string',
      'null' => true,
      'default' => '',
      'club_log' => '1',
    ),
    'email' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '150',
      'phptype' => 'string',
      'null' => true,
      'default' => '',
      'club_log' => '1',
    ),
    'zip' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '6',
      'phptype' => 'string',
      'null' => true,
      'default' => '',
    ),
    'address' => 
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
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
    ),
  ),
  'indexes' => 
  array (
    'status' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'status' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'medobj' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'medobj' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'name' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'name' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'num' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'num' => 
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
    'idStatus' => 
    array (
      'class' => 'idStatus',
      'local' => 'status',
      'foreign' => 'name',
      'cardinality' => 'one',
      'owner' => 'foreign',
      'criteria' => 
      array (
        'local' => 
        array (
          0 => 'idStatus.tbl=\'idIncome\'',
          1 => 'idStatus.published=1',
        ),
      ),
    ),
    'idSource' => 
    array (
      'class' => 'idStatus',
      'local' => 'status',
      'foreign' => 'name',
      'cardinality' => 'one',
      'owner' => 'foreign',
      'criteria' => 
      array (
        'local' => 
        array (
          0 => 'idSource.tbl=\'idSource\'',
          1 => 'idSource.published=1',
        ),
      ),
    ),
    'idTotype' => 
    array (
      'class' => 'idStatus',
      'local' => 'status',
      'foreign' => 'name',
      'cardinality' => 'one',
      'owner' => 'foreign',
      'criteria' => 
      array (
        'local' => 
        array (
          0 => 'idSource.tbl=\'idTotype\'',
          1 => 'idSource.published=1',
        ),
      ),
    ),
    'idAuthor' => 
    array (
      'class' => 'modUser',
      'local' => 'author',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idMedobj' => 
    array (
      'class' => 'idMedobj',
      'local' => 'medobj',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idTypes' => 
    array (
      'class' => 'idTypes',
      'local' => 'idtype',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
  ),
);
