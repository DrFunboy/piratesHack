<?php

$modx->updateCollection('idChanges', array('newvalue' => 'new'), array(
    'newvalue' => 'Новый',
    'chfield' => 'status',
));
// FIX NEW Field
$sql = "INSERT IGNORE INTO $idChanges
 (`sportsmen`, `chfield`, `newvalue`, `created`, `author`)
SELECT sp.id, 'status', 'new', sp.created, sp.author
FROM $idSportsmen sp
LEFT JOIN $idChanges ch on (ch.sportsmen=sp.id and ch.chfield='status' and ch.newvalue='new')
WHERE
ch.id is null";
echo $modx->exec($sql);
echo "<br>\n{$sql}<br>";