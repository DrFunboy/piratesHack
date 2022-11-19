<?php
include('phplib/qr/qrlib.php');
$qparams = '';
switch ($_REQUEST['type']) {
    case 'sms':
        $qparams = 'sms:'.$_REQUEST['tel'].'&body='.rawurlencode($_REQUEST['text']);
        break;
    default:
        $qparams = $_REQUEST['text'];
}
QRcode::png($qparams);