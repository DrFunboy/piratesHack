<?php

$schema_path = CRM_PATH.'setup/clubStuff.xml';

$schema = new DOMDocument();
$schema->load($schema_path);
$root = $schema->documentElement;
$objectIdx = 0;
while ($object = $root->childNodes->item($objectIdx++)) {
    if (strtolower($object->nodeName !== 'object')) continue;
    $className = $object->getAttribute('class');
    if (!empty($className)) {
    
        $idx = 0;
        while ($node = $object->childNodes->item($idx++)) {
            if (strtolower($node->nodeName === 'composite')) {
                $name = $node->getAttribute('class');
                $field = $node->getAttribute('foreign');
                echo "<br>$name - $className<br>";
                $ww = $modx->newQuery($name, array("{$name}.{$field}:!=" => 0));
                $ww->leftJoin($className);
                $ww->select("{$name}.id, COUNT({$className}.id) as cnt");
                $ww->groupby("{$name}.id");
                $ww->having("cnt<1");
                foreach($modx->getCollection($name,$ww) as $key => $row){
                    echo $row->get('id').' - '.$row->get('cnt').'<br>';
                    //if ($name == 'idInvoiceLesson') 
                    $row->remove();
                }
                //if (!empty($name)) $manager->addIndex($className, $name);
            }
        }
    }
}