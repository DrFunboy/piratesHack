require_once CRM_PATH .'vendor/autoload.php';
$temp = array();
$data = $modx->getOption('data', $scriptProperties, array());

$handler = $modx->getOption('handler', $scriptProperties, $_REQUEST['handler']);
$tmpl = $modx->getOption('tmpl', $scriptProperties, $_REQUEST['tmpl']);
if (!empty($tmpl)) {
    $path_tmpl = pathinfo($tmpl);
    $doc_name = $tmpl = $path_tmpl['filename'];
    $doc_type = $path_tmpl['extension'];
    
    $idFile = $modx->getObject('idFiles', array(
        'uid' => 'usertmpl',
        'name' => $tmpl,
        //'fileext' => $doc_type,
    ));
    if (!empty($idFile)) {
        $tmplFile = CRM_FILES. "{$idFile->filetype}/{$idFile->key}.{$idFile->fileext}";
    } else {
        $tmplFile = CRM_PATH. "export/tmpl/{$tmpl}.{$doc_type}";
    }
} else {
    $doc_name = $doc_type = $modx->getOption('doc_type', $scriptProperties, 'docx');
}

switch ($doc_type) {
    case 'xlsx':
        $Doc = new \PhpOffice\PhpSpreadsheet\Spreadsheet();
        $content_type = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
        break;
    default:
        if (empty($tmpl)) {
            $Doc = new \PhpOffice\PhpWord\PhpWord();
        } else {
            $Doc = new \PhpOffice\PhpWord\TemplateProcessor($tmplFile);
        }
        $content_type = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
}

if (!empty($handler)) include(CRM_PATH. "export/{$handler}.php");

$begin = date('Y_m_d__H_i_s');
//header('Content-Description: File Transfer');
header("Content-Disposition: attachment;filename=\"{$doc_name}_{$begin}.{$doc_type}\"");
header("Content-Type: $content_type");
header('Content-Transfer-Encoding: binary');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0, max-age=0');
header('Expires: 0');

if (empty($tmpl)) {
    switch ($doc_type) {
        case 'xlsx':
            $Writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($Doc, 'Xlsx');
            break;
        default:
            $Writer = \PhpOffice\PhpWord\IOFactory::createWriter($Doc, 'Word2007');
    }
    $Writer->save("php://output");
} else {
    $temp_file = tempnam(sys_get_temp_dir(), $doc_type);
    $Doc->saveAs($temp_file);
    readfile($temp_file); // or echo file_get_contents($temp_file);
    $temp[] = $temp_file;
}

foreach($temp as $t_file) unlink($t_file); // remove temp file
exit();