<?php
$xpdo_meta_map['idSportsmen']= array (
  'package' => 'idDB',
  'version' => '21.09.14.3',
  'table' => 'sportsmen',
  'extends' => 'xPDOSimpleObject',
  'tableMeta' => 
  array (
    'engine' => 'InnoDB',
  ),
  'fields' => 
  array (
    'gender' => 0,
    'num' => 0,
    'status' => 'Действует',
    'name' => '',
    'contract' => '',
    'contractdate' => NULL,
    'birth' => NULL,
    'height' => 0,
    'weight' => 0,
    'doc' => '',
    'contact' => '',
    'tel' => '',
    'email' => '',
    'pasp' => 0,
    'insdate' => NULL,
    'meddate' => NULL,
    'price' => 0,
    'discount' => NULL,
    'saldo' => 0.0,
    'razr' => '',
    'squad' => 0,
    'trainer' => 0,
    'city' => 0,
    'info' => NULL,
    'code1c' => '',
    'key' => '',
    'created' => 'CURRENT_TIMESTAMP',
    'author' => 0,
    'iduser' => 0,
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
    'num' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'status' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '25',
      'phptype' => 'string',
      'null' => false,
      'default' => 'Действует',
      'index' => 'index',
      'club_log' => '1',
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
    'contract' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '50',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
      'index' => 'index',
      'club_log' => '1',
    ),
    'contractdate' => 
    array (
      'dbtype' => 'date',
      'phptype' => 'date',
      'null' => true,
      'club_log' => '1',
    ),
    'birth' => 
    array (
      'dbtype' => 'date',
      'phptype' => 'date',
      'null' => true,
      'club_log' => '1',
    ),
    'height' => 
    array (
      'dbtype' => 'smallint',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
      'club_log' => '1',
    ),
    'weight' => 
    array (
      'dbtype' => 'smallint',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
      'club_log' => '1',
    ),
    'doc' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '150',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
      'club_log' => '1',
    ),
    'contact' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => true,
      'default' => '',
      'club_log' => '1',
    ),
    'tel' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '50',
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
    'pasp' => 
    array (
      'dbtype' => 'smallint',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
    ),
    'insdate' => 
    array (
      'dbtype' => 'date',
      'phptype' => 'date',
      'null' => true,
      'club_log' => '1',
    ),
    'meddate' => 
    array (
      'dbtype' => 'date',
      'phptype' => 'date',
      'null' => true,
      'club_log' => '1',
    ),
    'price' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'null' => false,
      'default' => 0,
      'club_log' => '1',
    ),
    'discount' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '50',
      'phptype' => 'string',
      'null' => true,
      'club_log' => '1',
    ),
    'saldo' => 
    array (
      'dbtype' => 'decimal',
      'precision' => '10,2',
      'phptype' => 'float',
      'null' => false,
      'default' => 0.0,
    ),
    'razr' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '10',
      'phptype' => 'string',
      'null' => true,
      'default' => '',
      'club_log' => '1',
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
    'trainer' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
      'club_log' => '1',
    ),
    'city' => 
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
    'code1c' => 
    array (
      'dbtype' => 'char',
      'precision' => '36',
      'phptype' => 'string',
      'null' => true,
      'default' => '',
      'index' => 'index',
    ),
    'key' => 
    array (
      'dbtype' => 'char',
      'precision' => '36',
      'phptype' => 'string',
      'null' => false,
      'default' => '',
      'index' => 'index',
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
    'iduser' => 
    array (
      'dbtype' => 'int',
      'phptype' => 'integer',
      'attributes' => 'unsigned',
      'null' => false,
      'default' => 0,
      'index' => 'index',
    ),
  ),
  'fieldAliases' => 
  array (
    'fio' => 'name',
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
    'city' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'city' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'squad' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'squad' => 
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
    'contract' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'contract' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'code1c' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'code1c' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'key' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'key' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
    'iduser' => 
    array (
      'primary' => false,
      'unique' => false,
      'type' => 'BTREE',
      'columns' => 
      array (
        'iduser' => 
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
    'idChanges' => 
    array (
      'class' => 'idChanges',
      'local' => 'id',
      'foreign' => 'sportsmen',
      'cardinality' => 'many',
      'owner' => 'local',
    ),
    'idContact' => 
    array (
      'class' => 'idContact',
      'local' => 'id',
      'foreign' => 'sportsmen',
      'cardinality' => 'many',
      'owner' => 'local',
    ),
    'idSportsmenSquad' => 
    array (
      'class' => 'idSportsmenSquad',
      'local' => 'id',
      'foreign' => 'sportsmen',
      'cardinality' => 'many',
      'owner' => 'local',
    ),
    'idInvoice' => 
    array (
      'class' => 'idInvoice',
      'local' => 'id',
      'foreign' => 'sportsmen',
      'cardinality' => 'many',
      'owner' => 'local',
    ),
    'idPay' => 
    array (
      'class' => 'idPay',
      'local' => 'id',
      'foreign' => 'sportsmen',
      'cardinality' => 'many',
      'owner' => 'local',
    ),
    'idLesson' => 
    array (
      'class' => 'idLesson',
      'local' => 'id',
      'foreign' => 'sportsmen',
      'cardinality' => 'many',
      'owner' => 'local',
    ),
    'idFiles' => 
    array (
      'class' => 'idFiles',
      'local' => 'key',
      'foreign' => 'uid',
      'cardinality' => 'many',
      'owner' => 'local',
    ),
    'idEventMember' => 
    array (
      'class' => 'idEventMember',
      'local' => 'id',
      'foreign' => 'sportsmen',
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
      'foreign' => 'name',
      'cardinality' => 'one',
      'owner' => 'foreign',
      'criteria' => 
      array (
        'local' => 
        array (
          0 => 'idStatus.tbl=\'idSportsmen\'',
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
    'idUser' => 
    array (
      'class' => 'modUser',
      'local' => 'iduser',
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
    'idSquad' => 
    array (
      'class' => 'idSquad',
      'local' => 'squad',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idTrainer' => 
    array (
      'class' => 'idTrainer',
      'local' => 'trainer',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
    'idCity' => 
    array (
      'class' => 'idCity',
      'local' => 'city',
      'foreign' => 'id',
      'cardinality' => 'one',
      'owner' => 'foreign',
    ),
  ),
);
