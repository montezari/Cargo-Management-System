<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.komoditi";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fkey"] != ""){
    $sql  = "update tm_komoditi set vnmkomoditi='$_POST[nmkomoditi]', cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where ckdkomoditi = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_komoditi (ckdkomoditi,vnmkomoditi, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[kdkomoditi]','$_POST[nmkomoditi]', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_komoditi WHERE ckdkomoditi = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT * FROM tm_komoditi ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE ckdkomoditi = '$_GET[key]' ";
}
$sql .= " ORDER BY ckdkomoditi ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[KOMODITI_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>