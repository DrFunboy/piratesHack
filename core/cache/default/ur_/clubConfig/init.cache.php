<?php if(time() > 1669183996){return null;} return array (
  'site_name' => 'PowerPark',
  'site_fullname' => '',
  'club_key' => 'e8908f9a-7bad-4ca1-955b-141a15e8c3e6',
  'club_logo' => '/files/_thumb/logo/ur_63779ba6af8b01.12899057.png.logo.jpeg',
  'club_modules' => 
  array (
    0 => 'clubStuff',
    1 => 'ur_',
  ),
  'https' => '1',
  'dbXML' => '<object class="idCar" table="car" extends="xPDOSimpleObject">
    <!-- ID водителя: -->
	<field key="idsportsmen" dbtype="int" phptype="integer" null="false" default="0" index="index" />
    <!-- статус заказа: -->
    <field key="status" dbtype="int" phptype="integer" null="false" default="0" index="index" />
    
    <field key="gosnum" dbtype="varchar" precision="11" phptype="string" null="false" default="" index="index"/>
    
    <field key="vin" dbtype="varchar" precision="50" phptype="string" null="false" default="" index="index"/>
    
    <field key="owner" dbtype="varchar" precision="255" phptype="string" null="false" default="" index="index"/>

    <!-- не уверен что следующие поля нужны: -->
    <field key="created" dbtype="timestamp" phptype="timestamp" null="false" default="CURRENT_TIMESTAMP" index="index" />
	<field key="author" dbtype="int" phptype="integer" attributes="unsigned" null="false" default="0" />
	<field key="edited" dbtype="datetime" phptype="datetime" null="true" />
	<field key="editedby" dbtype="int" phptype="integer" attributes="unsigned" null="false" default="0" />

    <aggregate alias="idSportsmen" class="idsportsmen" local="idsportsmen" foreign="id" cardinality="one" owner="foreign" />
	
    <index name="status" primary="false" unique="false" type="BTREE">
        <column key="status" length="" collation="A" null="false" />
    </index>
    
    <index name="owner" primary="false" unique="false" type="BTREE">
        <column key="owner" length="" collation="A" null="false" />
    </index>
    
    <index name="gosnum" primary="false" unique="true" type="BTREE">
        <column key="gosnum" length="" collation="A" null="false" />
    </index>
    
    <index name="idsportsmen" primary="false" unique="false" type="BTREE">
        <column key="idsportsmen" length="" collation="A" null="false" />
    </index>
    <index name="created" primary="false" unique="false" type="BTREE">
        <column key="created" length="" collation="A" null="false" />
    </index>
</object>',
  'crm_url' => '/assets/id/',
  'crmtools_url' => '/assets/clubtools/',
);