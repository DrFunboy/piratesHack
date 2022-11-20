<?php  return array (
  'resourceClass' => 'modDocument',
  'resource' => 
  array (
    'id' => 85,
    'type' => 'document',
    'contentType' => 'text/html',
    'pagetitle' => 'Авто водителя',
    'longtitle' => '',
    'description' => '',
    'alias' => 'spcars',
    'alias_visible' => 1,
    'link_attributes' => '',
    'published' => 1,
    'pub_date' => 0,
    'unpub_date' => 0,
    'parent' => 37,
    'isfolder' => 0,
    'introtext' => '',
    'content' => '<script id="idCars_tmpl" type="text/x-jsrender">
<div class=\'card-body pt-0\'>
<button type="button" class="btn btn-primary" data-link="{on addCar}">Добавить авто</button>
    <div class=\'row\'>
        {^{for cars}}
            <div class=\'col-sm-12 col-md-6 col-xl-4 my-2\'>
                <div class="card card-figure h-100 m-0">
                  <figure class="figure h-100 d-flex">
                    <div class="figure-img text-center">
                      <img class="img-fluid" src="{{:url}}" alt="">
                    </div>
                    <figcaption class="figure-caption flex-grow-1 d-flex">
                        <div>{{:vin}}</div>
                            {{if status == 1}}
                                <div class="tile tile-circle ml-auto">
                                    <span class="fa fa-clock-o"></span> 
                                </div>
                            {{else status == 2}}
                                <div class="tile tile-circle ml-auto bg-success">
                                    <span class="fa fa-check"></span> 
                                </div>
                            {{else status == 3}}
                                <div class="tile tile-circle ml-auto bg-danger">
                                    <span class="fa fa-times"></span> 
                                </div>
                            {{/if}}
                        <div class="ml-auto">{{:gosnum}}</div>
                    </figcaption>
                  </figure>
                </div>
            </div>
        {{/for}}
    </div>
</div>
</script>

<script>
var tabCars = {
    id: "tabCars",
    tpl: "#idCars_tmpl",
    name: "Мои авто",
    addCar: function(){
        var mdl = {
            cm_size: "lg",
            title: "Добавить автомобиль",
            body: "<div id=\'newtsform\'></div>"
        };
        
        club_Drawer(mdl)
        .on(\'shown.bs.modal\', function(){
            SCRM._run(`/chunk/eform/newts`, {
                container: \'#newtsform\'
            });
        });
    }
}
if (typeof sp_data != "undefined") $.observable(sp_data.addMenu).insert(tabCars);

$(\'a[href="#tabCars"]\').on(\'shown.bs.tab\', function (e) {
    var urls = ["https://5koleso.ru/wp-content/uploads/2022/01/img_5769-1024x683.jpg","https://cdnstatic.rg.ru/uploads/images/169/12/62/35_e43ba14c.jpg","https://moscowteslaclub.ru/upload/iblock/aef/aef61a6442bf9c86a44dc8b1e6333762.jpg"];
    pJSON("/hook/myCars", {
        key: sp_data.key
    }, function(autos){
        $.each(autos.rows, function(k, v){
            v.url = urls[k*sp_data.id];
            v.gosnum =  v.gosnum.toUpperCase();
        });
        SCRM.link(tabCars, {cars:autos.rows});
    })
})
</script>',
    'richtext' => 0,
    'template' => 0,
    'menuindex' => 3,
    'searchable' => 0,
    'cacheable' => 1,
    'createdby' => 1,
    'createdon' => 1668864602,
    'editedby' => 1,
    'editedon' => 1668935733,
    'deleted' => 0,
    'deletedon' => 0,
    'deletedby' => 0,
    'publishedon' => 1668864600,
    'publishedby' => 1,
    'menutitle' => '',
    'donthit' => 0,
    'privateweb' => 0,
    'privatemgr' => 0,
    'content_dispo' => 0,
    'hidemenu' => 1,
    'class_key' => 'modDocument',
    'context_key' => 'web',
    'content_type' => 1,
    'uri' => 'handlers/modules/spcars.html',
    'uri_override' => 0,
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'properties' => NULL,
    'club_id' => 0,
    '_content' => '<script id="idCars_tmpl" type="text/x-jsrender">
<div class=\'card-body pt-0\'>
<button type="button" class="btn btn-primary" data-link="{on addCar}">Добавить авто</button>
    <div class=\'row\'>
        {^{for cars}}
            <div class=\'col-sm-12 col-md-6 col-xl-4 my-2\'>
                <div class="card card-figure h-100 m-0">
                  <figure class="figure h-100 d-flex">
                    <div class="figure-img text-center">
                      <img class="img-fluid" src="{{:url}}" alt="">
                    </div>
                    <figcaption class="figure-caption flex-grow-1 d-flex">
                        <div>{{:vin}}</div>
                            {{if status == 1}}
                                <div class="tile tile-circle ml-auto">
                                    <span class="fa fa-clock-o"></span> 
                                </div>
                            {{else status == 2}}
                                <div class="tile tile-circle ml-auto bg-success">
                                    <span class="fa fa-check"></span> 
                                </div>
                            {{else status == 3}}
                                <div class="tile tile-circle ml-auto bg-danger">
                                    <span class="fa fa-times"></span> 
                                </div>
                            {{/if}}
                        <div class="ml-auto">{{:gosnum}}</div>
                    </figcaption>
                  </figure>
                </div>
            </div>
        {{/for}}
    </div>
</div>
</script>

<script>
var tabCars = {
    id: "tabCars",
    tpl: "#idCars_tmpl",
    name: "Мои авто",
    addCar: function(){
        var mdl = {
            cm_size: "lg",
            title: "Добавить автомобиль",
            body: "<div id=\'newtsform\'></div>"
        };
        
        club_Drawer(mdl)
        .on(\'shown.bs.modal\', function(){
            SCRM._run(`/chunk/eform/newts`, {
                container: \'#newtsform\'
            });
        });
    }
}
if (typeof sp_data != "undefined") $.observable(sp_data.addMenu).insert(tabCars);

$(\'a[href="#tabCars"]\').on(\'shown.bs.tab\', function (e) {
    var urls = ["https://5koleso.ru/wp-content/uploads/2022/01/img_5769-1024x683.jpg","https://cdnstatic.rg.ru/uploads/images/169/12/62/35_e43ba14c.jpg","https://moscowteslaclub.ru/upload/iblock/aef/aef61a6442bf9c86a44dc8b1e6333762.jpg"];
    pJSON("/hook/myCars", {
        key: sp_data.key
    }, function(autos){
        $.each(autos.rows, function(k, v){
            v.url = urls[k*sp_data.id];
            v.gosnum =  v.gosnum.toUpperCase();
        });
        SCRM.link(tabCars, {cars:autos.rows});
    })
})
</script>',
    '_isForward' => false,
  ),
  'contentType' => 
  array (
    'id' => 1,
    'name' => 'HTML',
    'description' => 'HTML content',
    'mime_type' => 'text/html',
    'file_extensions' => '.html',
    'headers' => NULL,
    'binary' => 0,
  ),
  'policyCache' => 
  array (
  ),
  'sourceCache' => 
  array (
    'modChunk' => 
    array (
    ),
    'modSnippet' => 
    array (
    ),
    'modTemplateVar' => 
    array (
    ),
  ),
);