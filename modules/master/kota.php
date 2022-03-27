<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.kota";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fkey"] != ""){
    $sql  = "update tm_kota set vnmkota='$_POST[nmkota]',vnmprovisi='$_POST[nmprop]',ckdnegara='$_POST[kdnegara]', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where ckdkota = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_kota (ckdkota,vnmkota,vnmprovisi,ckdnegara, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[kdkota]','$_POST[nmkota]','$_POST[nmprop]','$_POST[kdnegara]', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_kota WHERE ckdkota = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT kota.*, ngr.vnmnegara FROM tm_kota kota ";
$sql .= "LEFT JOIN tm_negara ngr ON ngr.ckdnegara = kota.ckdnegara ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE kota.ckdkota = '$_GET[key]' ";
}
$sql .= " ORDER BY kota.ckdkota ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_ngr","adodb","SELECT ckdnegara,vnmnegara FROM tm_negara ORDER BY ckdnegara");
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[KOTA_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>