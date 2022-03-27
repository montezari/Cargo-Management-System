<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.jenissetor";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fkey"] != ""){
    $sql  = "update tm_jenissetor set vnmjenissetor='$_POST[nmsetoran]', cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where ckdjenissetor = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_jenissetor (ckdjenissetor,vnmjenissetor, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[kdsetoran]','$_POST[nmsetoran]', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_jenissetor WHERE ckdjenissetor = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT * FROM tm_jenissetor  ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE ckdjenissetor = '$_GET[key]' ";
}
$sql .= " ORDER BY ckdjenissetor ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[JENIS_SETORAN_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>