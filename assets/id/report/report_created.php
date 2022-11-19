<?php
$rq['rows'] = 1;
$select = array("{$table}.created");

if (in_array('author', $fld_names)) {
    $w->leftJoin('modUser', 'idAUser', "idAUser.id = {$table}.author");
    $w->leftJoin('modUserProfile', 'idAUserProfile', "idAUserProfile.internalKey = idAUser.id");
    $w->select(array(
        "{$table}.author",
        'idAUser.username as author_username',
        'idAUserProfile.fullname as author_fullname',
        'idAUserProfile.email as author_email',
        'idAUserProfile.blocked as author_blocked',
    ));
}

if (in_array('edited', $fld_names)) $select[] = "{$table}.edited";
    
if (in_array('editedby', $fld_names)) {
    $w->leftJoin('modUser', 'idEUser', "idEUser.id = {$table}.editedby");
    $w->leftJoin('modUserProfile', 'idEditorProfile', "idEditorProfile.internalKey = idEUser.id");
    $w->select(array(
        "{$table}.editedby",
        'idEUser.username as editor_username',
        'idEditorProfile.fullname as editor_fullname',
        'idEditorProfile.email as editor_email',
        'idEditorProfile.blocked as editor_blocked',
    ));
}
