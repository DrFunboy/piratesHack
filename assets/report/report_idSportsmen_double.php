<?php
if (isset($_REQUEST['_source'])) {
    $w->leftJoin('idLead', 'idLead', "idLead.key = idSportsmen.key");
    $select[] = 'idLead.created as add_info';
} else {
    $select = array(
        "idSportsmen.name",
        "idSportsmen.birth",
        "COUNT(*) as cnt",
    );
    $w->having('cnt > 1');
    $w->groupby('idSportsmen.name'); 
}