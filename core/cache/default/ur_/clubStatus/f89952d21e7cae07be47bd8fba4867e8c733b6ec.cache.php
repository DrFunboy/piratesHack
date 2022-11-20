<?php if(time() > 1671358113){return null;} return array (
  0 => 
  array (
    'id' => 232,
    'name' => 'spContact',
    'tbl' => 'ecard',
    'alias' => 'spContact',
    'cls' => 'idSportsmen',
    'ico' => '',
    'menuindex' => 22,
    'extended' => 
    array (
      0 => 
      array (
        'name' => 'id',
        'hidden' => true,
        'key' => true,
        'tbl' => 'idSportsmen',
      ),
      1 => 
      array (
        'name' => 'contact',
        'label' => 'Контакт',
      ),
      2 => 
      array (
        'name' => 'tel',
        'label' => 'Телефон',
        'type' => 'tel',
        'popmenu' => 'tel',
      ),
      3 => 
      array (
        'name' => 'email',
        'label' => 'E-mail',
        'type' => 'email',
        'popmenu' => 'email',
      ),
    ),
  ),
  1 => 
  array (
    'id' => 233,
    'name' => 'spManager',
    'tbl' => 'ecard',
    'alias' => 'spManager',
    'cls' => 'idSportsmen',
    'ico' => '',
    'menuindex' => 24,
    'extended' => 
    array (
      0 => 
      array (
        'name' => 'id',
        'hidden' => true,
        'key' => true,
        'tbl' => 'idSportsmen',
      ),
      1 => 
      array (
        'name' => 'gender',
        'label' => 'Пол',
        'text' => 'gender_name',
        'type' => 'select',
        'clubStatus' => 'Gender',
        'lookupKey' => 'alias',
        'value0' => '-',
      ),
      2 => 
      array (
        'name' => 'birth',
        'label' => 'Дата рождения',
        'type' => 'date',
      ),
      3 => 
      array (
        'html' => '<hr>',
      ),
      4 => 
      array (
        'name' => 'contract',
        'label' => 'Договор',
      ),
      5 => 
      array (
        'name' => 'contractdate',
        'type' => 'date',
        'label' => 'Дата договора',
      ),
      6 => 
      array (
        'name' => 'price',
        'type' => 'number',
        'label' => 'Тариф',
      ),
      7 => 
      array (
        'name' => 'discount',
        'text' => 'discount',
        'label' => 'Скидка',
        'type' => 'select',
        'clubStatus' => 'Discount',
        'lookupKey' => 'name',
      ),
      8 => 
      array (
        'html' => '<hr>',
      ),
      9 => 
      array (
        'name' => 'meddate',
        'type' => 'date',
        'label' => 'Дата мед. допуска',
        'required' => true,
        'cls' => 'dateDiffColor',
        'dateDiffWarn' => -30,
        'dateDiffDanger' => 1,
      ),
      10 => 
      array (
        'name' => 'insdate',
        'type' => 'date',
        'label' => 'Дата страховки',
        'required' => true,
        'cls' => 'dateDiffColor',
      ),
      11 => 
      array (
        'name' => 'info',
        'type' => 'textarea',
      ),
      12 => 
      array (
        'name' => 'height',
        'type' => 'number',
        'label' => 'Рост',
      ),
      13 => 
      array (
        'name' => 'weight',
        'type' => 'number',
        'label' => 'Вес',
      ),
      14 => 
      array (
        'name' => 'pasp',
        'type' => 'checkbox',
        'label' => 'Паспорт',
      ),
      15 => 
      array (
        'type' => 'savebtn',
      ),
    ),
  ),
);