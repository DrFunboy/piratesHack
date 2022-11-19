<?php
function id_logdir(){
    $logdir = $_SERVER['DOCUMENT_ROOT'].'/log/';
    if (!file_exists($logdir)) mkdir($logdir, 0755, true );
    return $logdir;
}
function id_setlog($type, $text){
    $dt = new DateTime();
    $fname = id_logdir().$dt->format("Y-m-d_H-i-s_").$type.mt_rand(1000,9999).".log";
    file_put_contents($fname, serialize(array(
        'dt' => $dt->format("Y-m-d H:i:s"),
        'logtype' => $type,
        'log' => $text,
    )));
    return $fname;
}

if (!empty($_REQUEST['oper'])) {
    $logdir = id_logdir();
    switch ($_REQUEST['oper']) {
    case 'settoken':
        file_put_contents('idlog.ini', serialize(array('token' => $_REQUEST['data'])));
        break;
    case 'log':
        echo id_setlog('test', $_REQUEST['data']);
        break;
    case 'getlog':
        if (isset($_REQUEST['fdata']) && is_array($_REQUEST['fdata'])) {
            foreach ($_REQUEST['fdata'] as $file){
                $file = $logdir.$file;
                if (file_exists($file)) {
                    unlink($file);
                }
            }
        }
        $out = array(
            "result" => "OK",
            "files" => [],
        );
        foreach (glob("{$logdir}*.log") as $file) {
            //$filedata = file_get_contents($file);
            $data = unserialize( file_get_contents($file) );
            $data['filename'] = basename($file);
            $out['files'][] = $data;
        }
        echo(serialize($out));
        break;
    }
}