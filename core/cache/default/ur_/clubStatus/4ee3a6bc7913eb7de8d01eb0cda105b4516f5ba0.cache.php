<?php if(time() > 1671358113){return null;} return array (
  0 => 
  array (
    'id' => 129,
    'name' => 'Ж',
    'tbl' => 'Gender',
    'alias' => '0',
    'cls' => '',
    'ico' => '',
    'menuindex' => 0,
    'extended' => NULL,
  ),
  1 => 
  array (
    'id' => 91,
    'name' => 'Группа',
    'tbl' => 'idSchedule',
    'alias' => 'a',
    'cls' => 'group',
    'ico' => 'fa-users',
    'menuindex' => 1,
    'extended' => 
    array (
      'group' => true,
      'duration' => 45,
    ),
  ),
  2 => 
  array (
    'id' => 22,
    'name' => 'Действует',
    'tbl' => 'idSportsmen',
    'alias' => 'active',
    'cls' => '',
    'ico' => 'fa-play',
    'menuindex' => 1,
    'extended' => NULL,
  ),
  3 => 
  array (
    'id' => 130,
    'name' => 'М',
    'tbl' => 'Gender',
    'alias' => '1',
    'cls' => '',
    'ico' => '',
    'menuindex' => 1,
    'extended' => NULL,
  ),
  4 => 
  array (
    'id' => 23,
    'name' => 'Больничный',
    'tbl' => 'idSportsmen',
    'alias' => 'ill',
    'cls' => '',
    'ico' => 'fa-thermometer-full',
    'menuindex' => 2,
    'extended' => 
    array (
      'idInvoice' => 1,
    ),
  ),
  5 => 
  array (
    'id' => 24,
    'name' => 'Отпуск',
    'tbl' => 'idSportsmen',
    'alias' => 'vacation',
    'cls' => '',
    'ico' => 'fa-plane',
    'menuindex' => 3,
    'extended' => 
    array (
      'idInvoice' => 1,
    ),
  ),
  6 => 
  array (
    'id' => 25,
    'name' => 'Обещанный платеж',
    'tbl' => 'idSportsmen',
    'alias' => 'promice',
    'cls' => '',
    'ico' => 'fa-clock-o',
    'menuindex' => 4,
    'extended' => NULL,
  ),
  7 => 
  array (
    'id' => 92,
    'name' => 'Инд.',
    'tbl' => 'idSchedule',
    'alias' => 'i',
    'cls' => 'ind',
    'ico' => 'fa-user',
    'menuindex' => 10,
    'extended' => 
    array (
      'duration' => 50,
      'reservation' => 1,
      'canAdd' => 
      array (
        0 => 'idTrainer',
      ),
    ),
  ),
  8 => 
  array (
    'id' => 96,
    'name' => 'Проба',
    'tbl' => 'idSportsmen',
    'alias' => 't',
    'cls' => '',
    'ico' => 'fa-futbol-o',
    'menuindex' => 10,
    'extended' => NULL,
  ),
  9 => 
  array (
    'id' => 26,
    'name' => 'Архив',
    'tbl' => 'idSportsmen',
    'alias' => 'arc',
    'cls' => '',
    'ico' => 'fa-ban',
    'menuindex' => 99,
    'extended' => NULL,
  ),
);