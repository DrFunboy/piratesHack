<?php

$manager = $modx->getManager();

$q_column = $modx->query("SELECT
TABLE_NAME, COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.`COLUMNS` WHERE TABLE_NAME LIKE '".CRM_PREFIX."%'");
$_column = array();
while ($row = $q_column->fetch(PDO::FETCH_ASSOC)) {
    //if (empty($_column[$row['TABLE_NAME']])) $_column[$row['TABLE_NAME']] = array();
    $_column[$row['TABLE_NAME']][$row['COLUMN_NAME']] = $row;
}
//print_r($_column);

$q_index = $modx->query("SELECT DISTINCT TABLE_NAME, INDEX_NAME FROM INFORMATION_SCHEMA.`STATISTICS`
WHERE TABLE_NAME LIKE '".CRM_PREFIX."%'");
$_index = array();
while ($row = $q_index->fetch(PDO::FETCH_ASSOC)) {
    //if (empty($_index[$row['TABLE_NAME']])) $_index[$row['TABLE_NAME']] = array();
    $_index[$row['TABLE_NAME']][$row['INDEX_NAME']] = $row;
}
//print_r($_index);
foreach($modx->classMap as $cmKey => $classArray) {
    foreach($classArray as $k => $className) {
        if (substr($className, 0, 2) == 'id') {
            //if ($debug) echo "{$className}:<br>";
            $tbl_name = $modx->getTableName($className);
            $tbl_name = str_replace('`', '', $tbl_name);
            if (empty($_column[$tbl_name])) {
                if ($debug) echo "createObjectContainer {$tbl_name}<br>";
                $manager->createObjectContainer($className);
            } else {
                foreach($modx->getFieldMeta($className) as $fld_name => $fld_v) {
                    $dbfld = $_column[$tbl_name][$fld_name];
                    if (empty($dbfld)) {
                        if ($debug) echo "addField {$fld_name}<br>";
                        $manager->addField($className, $fld_name);
                    } elseif ($fld_name != 'id' && ($dbfld['DATA_TYPE'] != $fld_v['dbtype'])) {
                        $dbtype = $fld_v['dbtype'];
                        if (in_array($dbtype, ['char','varchar','decimal'])) {
                            $dbtype = "$dbtype({$fld_v['precision']})";
                        }
                        if ($debug) echo "fieldType {$fld_name}<br>";
                        $modx->exec("ALTER TABLE `{$tbl_name}` MODIFY `{$fld_name}` $dbtype");
                        if ($debug) {
                            print_r($dbfld);
                            print_r($fld_v);
                        }
                    }
                }
                foreach($modx->getIndexMeta($className) as $idx_name => $idx_v) {
                    $dbidx = $_index[$tbl_name][$idx_name];
                    if (empty($dbidx) && $idx_name != 'PRIMARY') {
                        if ($debug) echo "addIndex {$idx_name}, ";
                        $manager->addIndex($className, $idx_name);
                    }
                }
            }
        }
    }
}

/*
$schema = new DOMDocument();
$schema->load($schema_path);
$root = $schema->documentElement;
$objectIdx = 0;
while ($object = $root->childNodes->item($objectIdx++)) {
    if (strtolower($object->nodeName !== 'object')) continue;
    $className = $object->getAttribute('class');
    if (!empty($className)) {
        $manager->createObjectContainer($className);
        $fld_names = array_keys( $modx->getFields($className) );
    	foreach ($fld_names as $key) {
    	    $manager->addField($className, $key);
    	    echo "$className - $key<br>";
    	}
    
        $idx = 0;
        while ($node = $object->childNodes->item($idx++)) {
            if (strtolower($node->nodeName === 'index')) {
                $name = $node->getAttribute('name');
                if (!empty($name)) $manager->addIndex($className, $name);
            }
        }
    }
}
*/
