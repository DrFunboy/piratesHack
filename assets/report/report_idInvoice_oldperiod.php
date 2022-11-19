<?php

if ($table == 'idInvoice') {
    $where[] = "idSportsmen.city = ".$_SESSION['club_city'];
    
    $where[] = "(idInvoice.created BETWEEN '{$d1}' AND '{$d2}')";
    $where[] = "idInvoice.created > DATE_ADD(idInvoice.dateinvoice, INTERVAL 62 DAY)";
}