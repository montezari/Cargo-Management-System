<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.penerbangan";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $kuotakg = ($_POST["kuotakg"]!="") ? str_replace(",","",$_POST["kuotakg"]) : "0"; 
  $kuotakoli = ($_POST["kuotakoli"]!="") ? str_replace(",","",$_POST["kuotakoli"]) : "0"; 
  $jametd = ($_POST["jametd"]!="") ? $_POST["jametd"] : "00:00:00"; 
  $jameta = ($_POST["jameta"]!="") ? $_POST["jameta"] : "00:00:00"; 
  if($_POST["fkey"] != ""){
    $sql  = "update tm_penerbangan set ckdnegaraasal='$_POST[kdnegaraasal]',ckdkotaasal='$_POST[kdkotaasal]', ";
	$sql .= "ckdnegaratujuan='$_POST[kdnegaratuj]',ckdkotatujuan='$_POST[kdkotatuj]',cjametd='$jametd',cjameta='$jameta', ";
	$sql .= "ckuotakg='$kuotakg',ckuotakoli='$kuotakoli', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cnopenerbangan = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_penerbangan (cnopenerbangan,ckdnegaraasal,ckdkotaasal,ckdnegaratujuan,ckdkotatujuan,cjametd,cjameta,ckuotakg,ckuotakoli, ";
	$sql .= "cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[kdterbang]','$_POST[kdnegaraasal]','$_POST[kdkotaasal]','$_POST[kdnegaratuj]','$_POST[kdkotatuj]', ";
	$sql .= "'$jametd','$jameta','$kuotakg','$kuotakoli', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_penerbangan WHERE cnopenerbangan = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT pnb.*, asal.vnmkota AS vnmkotaasal, ngrasal.vnmnegara AS vnmnegaraasal, tuj.vnmkota AS vnmkotatuj, ngrtuj.vnmnegara AS vnmnegaratuj "; 
$sql .= "FROM tm_penerbangan pnb "; 
$sql .= "LEFT JOIN tm_kota asal ON asal.ckdkota = pnb.ckdkotaasal "; 
$sql .= "LEFT JOIN tm_negara ngrasal ON ngrasal.ckdnegara = pnb.ckdnegaraasal "; 
$sql .= "LEFT JOIN tm_kota tuj ON tuj.ckdkota = pnb.ckdkotatujuan "; 
$sql .= "LEFT JOIN tm_negara ngrtuj ON ngrtuj.ckdnegara = pnb.ckdnegaratujuan  ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE pnb.cnopenerbangan = '$_GET[key]' ";
}
$sql .= " ORDER BY pnb.cnopenerbangan ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_asal","adodb","SELECT ckdnegara,vnmnegara FROM tm_negara ORDER BY ckdnegara");
  $admGrdTpl->template->MergeBlock("blk_tuj","adodb","SELECT ckdnegara,vnmnegara FROM tm_negara ORDER BY ckdnegara");
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[DATA_PENERBANGAN_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>