<?php
$modx->controller->addHtml("<script>
function timeout(){
    setTimeout(function() {
        if (Ext.getCmp('modx-action-buttons') != undefined) {
            var toolBar = Ext.getCmp('modx-action-buttons');
            var buttons = [];
            buttons.push({
                text: '.git',
                handler: function () {
                    var commit = prompt('Описание версии'),
                    folder;
                    if ( commit != undefined ) {
                        var json = {
                            commit: commit
                        };
                        if ( Ext.getCmp('modx-resource-content' ) != undefined ) {
                            json.resid = MODx.request.id;
                        } else if ( Ext.getCmp('modx-file-content' ) != undefined ) {
                            json.folder = Ext.getCmp('modx-file-name').value;
                        } else if ( Ext.getCmp('modx-template-content' ) != undefined  ) {
                            json.tmplid = MODx.request.id;
                        } else if ( Ext.getCmp('modx-plugin-plugincode') != undefined  ) {
                            json.pluginid = MODx.request.id;
                        }
                        //var json = JSON.stringify(json);
                        Ext.Ajax.request({
                           url: '/hook/bitbucket', // where you wanna post
                           success: function() {
                                alert('Saved');
                           },   // function called on success
                           failure: function() {
                                alert('Failed');
                           },
                           params: json  // your json data
                        });
                        /*var xhr = new XMLHttpRequest();
                        var json = JSON.stringify(json);
                        xhr.open('POST', '/hook/bitbucket', true)
                        xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
                        xhr.send(json);*/
                    }
                }
            });
            toolBar.addButton(buttons);
            toolBar.doLayout();
        } else {
            timeout();
        }
    }, 100)
}
timeout();
</script>");
return;
