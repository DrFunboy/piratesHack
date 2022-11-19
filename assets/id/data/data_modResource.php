<?php

$w->leftJoin('modTemplate', 'modTemplate', 'modTemplate.id = modResource.template');
$select[] = 'modTemplate.templatename as templatename';

if ($_REQUEST['tableadd']=='shopItems') {
    $priceID = $modx->getObject('modTemplateVar', array('name' => 'price'));
    $sizesID = $modx->getObject('modTemplateVar', array('name' => 'shop_attr_size'));
    
    $w->leftJoin('modTemplateVarResource', 'TVprice', "TVprice.contentid = modResource.id AND TVprice.tmplvarid={$priceID->id}");
    $w->leftJoin('modTemplateVarResource', 'TVsize', "TVsize.contentid = modResource.id AND TVsize.tmplvarid={$sizesID->id}");
    $select[] = "IFNULL(TVprice.value, '0') AS `tv_price`";
    $select[] = "IFNULL(TVsize.value, '') AS `tv_shop_attr_size`";
}