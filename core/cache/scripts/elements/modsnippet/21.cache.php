<?php  return '$menuGroups = $modx->getOption(\'scrm_grhash\');
$id = $modx->resource->get(\'id\');

$cache_path = CRM_PREFIX."/clubMenu/{$menuGroups}_".$id;
$menu = $modx->cacheManager->get($cache_path);
if (empty($menu)) {
    foreach($modx->getOption(\'club_modules\') as $midx => $module) {
        $menuWhere[] = \'"\'.$midx.\'":{"\'.
        (($midx==0)? \'\':\'OR:\').
        \'link_attributes:LIKE":"%\'. $module .\'%"}\';
    }
    $menuWhere = \'{ "0":{\'. implode(\',\', $menuWhere) .\' } }\';
    $menu = $modx->runSnippet(\'pdoMenu\', array(
        \'level\' => 2,
        \'scheme\' => \'abs\',
        \'useWeblinkUrl\' => 1,
        \'parents\' => 0,
        \'firstClass\' => 0,
        \'lastClass\' => 0,
        \'checkPermissions\' => \'list\',
        \'where\' => $menuWhere,
        //\'where\' => \'{"0":{"0":{"link_attributes:LIKE":"%clubStuff%"}, "1":{"OR:link_attributes:LIKE":"%clubShop1%"} } }\',
        \'showLog\' => 0,
        \'tplParentRow\' => \'@INLINE <li[[+classes]] id="menuitem[[+id]]">
        <a href="#menuwrapper[[+id]]" class="nav-link collapsed" data-toggle="collapse" [[+attributes]]>[[+menutitle]]</a>
        <div id="menuwrapper[[+id]]" class="collapse" data-parent="#left-menu">
        <ul class="nav flex-column">[[+wrapper]]</ul>
        </div>
        </li>\',
        \'tpl\' => \'@INLINE <li[[+classes]] id="mmenuitem[[+id]]"><a href="[[+link]]"[[+attributes]] class="nav-link">[[+menutitle]]</a>[[+wrapper]]</li>\',
        
        \'tplInner\' => \'@INLINE [[+wrapper]]\',
        \'tplOuter\' => \'@INLINE <ul id="left-menu" class="nav nav-pills flex-column">[[+wrapper]]</ul>\',
        \'rowClass\' => \'nav-item\',
    ));

    $modx->cacheManager->set($cache_path, $menu, 604800); //7 дней
}
return $menu;

/*
[[!pdoMenu?
    
    &parents=`0`
    &firstClass=`0` &lastClass=`0`
    
    &checkPermissions=`list`
    &cache=`1`
    &cache_key=`club_[[!#SESSION.club_groups]]`

    &tplParentRow=`@INLINE <li[[+classes]]>
        <a href="#menu[[+id]]" class="nav-link collapsed" data-toggle="collapse" [[+attributes]]>[[+menutitle]]</a>
        <div id="menu[[+id]]" class="collapse" data-parent="#left-menu">
        <ul class="nav flex-column">[[+wrapper]]</ul>
        </div>
    </li>`
    &tpl=`@INLINE <li[[+classes]]><a href="[[+link]]"[[+attributes]] class="nav-link">[[+menutitle]]</a>[[+wrapper]]</li>`
    &rowClass=`nav-item`
    &tplInner=`@INLINE [[+wrapper]]`
    &tplOuter=`@INLINE <ul id="left-menu" class="nav nav-pills flex-column">[[+wrapper]]</ul>`
    
    &showLog=`0`
]]
*/
return;
';