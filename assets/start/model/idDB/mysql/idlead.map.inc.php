<?php
$xpdo_meta_map['idLead']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'lead',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'gender' => 0,
    'status' => 'c',
    'name' => '',
    'birth' => NULL,
    'contact' => '',
    'tel' => '',
    'email' => '',
    'source' => '',
    'trainer' => 0,
    'sport' => 0,
    'club' => 0,
    'squad' => 0,
    'datestart' => NULL,
    'info' => NULL,
    'key' => '',
    'sportsmen' => 0,
    'author' => 0,
    'created' => 'CURRENT_TIMESTAMP',
    'edited' => NULL,
    'editedby' => 0,
    'extid' => '',
  ),
  'fieldMeta' => 
  array (
    'gender' => 
    array (
      'dbtype' => 'smallint',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'status' => 
    array (
      'dbtype' => 'char',
      'precision' => '1',
      'phptype' => 'string',
      'null' => false,
      'default' => 'c',
      'index' => 'index',
    ),
    'name' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '255',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'birth' => 
    array (
      'dbtype' => 'date',
      'phptype' => 'date',
      'null' => true,
    ),
    'contact' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '255',
      'phptype' => 'string',
      'null' => true,
      'default' => '',
    ),
    'tel' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '50',
      'phptype' => 'string',
      'null' => true,
      'default' => '',
    ),
    'email' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '150',
      'phptype' => 'string',
      'null' => true,
      'default' => '',
    ),
    'source' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '255',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
    ),
    'trainer' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
    ),
    'sport' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
    ),
    'club' => 
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
    ),
    'datestart' => 
    array (
      'dbtype' => 'datetime',
      'phptype' => 'datetime',
      'null' => true,
    ),
    'info' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'string',
      'null' => true,
    ),
    'key' => 
    array (
      'dbtype' => 'char',
      'precision' => '36',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
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
    'author' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
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
    'edited' => 
    array (
      'dbtype' => 'datetime',
      'phptype' => 'datetime',
      'null' => true,
    ),
    'editedby' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
    ),
    'extid' => 
    array (
      'dbtype' => 'char',
      'precision' => '50',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
      'index' => 'index',
    ),
  ),
  'indexes' => 
  array (
    'lead_status' => 
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
    'lead_club' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'club' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
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
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
  ),
  'composites' => 
  array (
    'idTascom' => 
    array (
      'class' => 'idTascom',
      'local' => 'key',
      'foreign' => 'uid',
      'cardinality' => 'many',
      'owner' => 'local',
    ),
  ),
  'aggregates' => 
  array (
    'idStatus' => 
    array (
      'class' => 'idStatus',
      'local' => 'status',
      'foreign' => 'alias',
      'cardinality' => 'one',
      'owner' => 'foreign',
      'criteria' => 
      array (
        'local' => 
        array (
          0 => 'idStatus.tbl=\'idLead\'',
          1 => 'idStatus.published=1',
        ),
      ),
    ),
    'Gender' => 
    array (
      'class' => 'idStatus',
      'local' => 'gender',
      'foreign' => 'alias',
      'cardinality' => 'one',
      'owner' => 'foreign',
      'criteria' => 
      array (
        'local' => 
        array (
          0 => 'Gender.tbl=\'Gender\'',
          1 => 'Gender.published=1',
        ),
      ),
    ),
    'idTrainer' => 
    array (
      'class' => 'idTrainer',
      'local' => 'trainer',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idSport' => 
    array (
      'class' => 'idSport',
      'local' => 'sport',
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
    'idAuthor' => 
    array (
      'class' => 'modUser',
      'local' => 'author',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idClub' => 
    array (
      'class' => 'idClub',
      'local' => 'club',
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
  ),
);
