<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.bandara";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fkey"] != ""){
    $sql  = "update tm_bandara set vnmbandara='$_POST[nmbandara]',ckdnegara='$_POST[kdnegara]',ckdkota='$_POST[kdkota]', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where ckdbandara = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_bandara (ckdbandara,vnmbandara,ckdnegara,ckdkota, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[kdbandara]','$_POST[nmbandara]','$_POST[kdnegara]','$_POST[kdkota]', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_bandara WHERE ckdbandara = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT bdr.*, ngr.vnmnegara, kota.vnmkota FROM tm_bandara bdr ";
$sql .= "LEFT JOIN tm_negara ngr ON ngr.ckdnegara = bdr.ckdnegara ";
$sql .= "LEFT JOIN tm_kota kota ON kota.ckdkota = bdr.ckdkota ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE bdr.ckdbandara = '$_GET[key]' ";
}
$sql .= " ORDER BY bdr.ckdbandara ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_ngr","adodb","SELECT ckdnegara,vnmnegara FROM tm_negara ORDER BY ckdnegara");
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[BANDAR_UDARA_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>