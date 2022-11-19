<?php
require_once('../../id_init.php');

$idSportsmen = $modx->getTableName('idSportsmen');
$idChanges = $modx->getTableName('idChanges');

$sql = "INSERT IGNORE INTO $idChanges
 (`sportsmen`, `chfield`, `newvalue`, `created`, `author`)
SELECT sp.id, 'status', 'new', sp.created, sp.author
FROM $idSportsmen sp
LEFT JOIN $idChanges ch on (ch.sportsmen=sp.id and ch.chfield='status' and ch.newvalue='new')
WHERE
ch.id is null";
echo $modx->exec($sql);
echo "<br>\n{$sql}";

echo $modx->exec("DROP TRIGGER IF EXISTS `".CRM_PREFIX."sportsmen_ai`");
echo $modx->exec("CREATE TRIGGER `".CRM_PREFIX."sportsmen_ai`
    AFTER INSERT ON $idSportsmen
    FOR EACH ROW
    INSERT INTO $idChanges SET sportsmen = NEW.id, newvalue = 'new', author = NEW.author");