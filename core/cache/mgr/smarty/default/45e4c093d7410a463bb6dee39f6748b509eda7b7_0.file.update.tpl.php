<?php
/* Smarty version 3.1.39, created on 2022-04-09 18:49:39
  from '/home/s/sportcrm/uroboros_start123_ru/public_html/mx/templates/default/resource/weblink/update.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.39',
  'unifunc' => 'content_6251ab13eb08e7_51565672',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '45e4c093d7410a463bb6dee39f6748b509eda7b7' => 
    array (
      0 => '/home/s/sportcrm/uroboros_start123_ru/public_html/mx/templates/default/resource/weblink/update.tpl',
      1 => 1622181878,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6251ab13eb08e7_51565672 (Smarty_Internal_Template $_smarty_tpl) {
?><div id="modx-panel-weblink-div"></div>
<div id="modx-resource-tvs-div" class="modx-resource-tab x-form-label-left x-panel"><?php echo (($tmp = @$_smarty_tpl->tpl_vars['tvOutput']->value)===null||$tmp==='' ? '' : $tmp);?>
</div>

<?php echo $_smarty_tpl->tpl_vars['onDocFormPrerender']->value;?>

<?php if ($_smarty_tpl->tpl_vars['resource']->value->richtext && $_smarty_tpl->tpl_vars['_config']->value['use_editor']) {?>
    <?php echo $_smarty_tpl->tpl_vars['onRichTextEditorInit']->value;?>

<?php }
}
}
