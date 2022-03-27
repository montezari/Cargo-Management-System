<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.agent";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $notrans = $_POST["kdagent"];
  if($_POST["fkey"] != ""){
    $sql  = "update tm_agent set vnmagent='$_POST[nmagent]',valamat='$_POST[alamat]',ckdnegara='$_POST[kdnegara]',ckdkota='$_POST[kdkota]', ";
	$sql .= "ckodepos='$_POST[kdpos]',ctelp='$_POST[telp]',cfax='$_POST[fax]',cemail='$_POST[email]',cwebsite='$_POST[website]',ckontak='$_POST[kontak]', ";
	$sql .= "cleveltarif='$_POST[kdlevel]', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where ckdagent = '$_POST[fkey]' ";
  }else{
    $notrans = settransno("AGN");
	$sql  = "insert into tm_agent (ckdagent,vnmagent,valamat,ckdnegara,ckdkota,ckodepos,ctelp,cfax,cemail,cwebsite,ckontak,cleveltarif, ";
	$sql .= "cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$notrans','$_POST[nmagent]','$_POST[alamat]','$_POST[kdnegara]','$_POST[kdkota]','$_POST[kdpos]','$_POST[telp]', ";
	$sql .= "'$_POST[fax]','$_POST[email]','$_POST[website]','$_POST[kontak]','$_POST[kdlevel]', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_agent WHERE ckdagent = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT agen.*, ngr.vnmnegara, kota.vnmkota FROM tm_agent agen ";
$sql .= "LEFT JOIN tm_negara ngr ON ngr.ckdnegara = agen.ckdnegara ";
$sql .= "LEFT JOIN tm_kota kota ON kota.ckdkota = agen.ckdkota ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE agen.ckdagent = '$_GET[key]' ";
}
$sql .= " ORDER BY agen.ckdagent ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_ngr","adodb","SELECT ckdnegara,vnmnegara FROM tm_negara ORDER BY ckdnegara");
  $sql  = "SELECT 0 AS cid, 'DASAR' AS cinfo UNION ALL ";
  $sql .= "SELECT 1 AS cid, clevel1 FROM tm_param UNION ALL ";
  $sql .= "SELECT 2 AS cid, clevel2 FROM tm_param UNION ALL ";
  $sql .= "SELECT 3 AS cid, clevel3 FROM tm_param UNION ALL ";
  $sql .= "SELECT 4 AS cid, clevel4 FROM tm_param ";
  $admGrdTpl->template->MergeBlock("blk_lvl","adodb",$sql);

}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[DATA_PELANGGAN_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>