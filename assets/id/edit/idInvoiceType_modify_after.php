<?
if ( !empty($data["stype"]) && $oper == "add") {
    if (  gettype($data["stype"]) != "array" ) $data["stype"] = [$data["stype"]];
    foreach($data["stype"] as $alias) {
        if ( ($stypeRow = $modx->newObject("idSInvType", array(
                "typeinvoice" => $row->get("id"),
                "stype" => $alias
            ))) != null) {
            $stypeRow->save();
        }
    }
}