<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.currency";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fkey"] != ""){
    $sql  = "update tm_currency set vnmcurrency='$_POST[nmcurr]', cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where ckdcurrency = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_currency (ckdcurrency,vnmcurrency, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[kdcurr]','$_POST[nmcurr]', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_currency WHERE ckdcurrency = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT * FROM tm_currency  ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE ckdcurrency = '$_GET[key]' ";
}
$sql .= " ORDER BY ckdcurrency ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[MATA_UANG_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>