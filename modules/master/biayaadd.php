<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.biayaadd";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $biayasmu = ($_POST["biayasmu"]!="") ? str_replace(",","",$_POST["biayasmu"]) : "0";
  $biayalain = ($_POST["biayalain"]!="") ? str_replace(",","",$_POST["biayalain"]) : "0";
  $ppn = ($_POST["ppn"]!="") ? str_replace(",","",$_POST["ppn"]) : "0";
  if($_POST["fkey"] != ""){
    $sql  = "update tm_biayaadd set vbiayaadmsmu='$biayasmu',vbiayalain='$biayalain',vppn='$ppn', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where ckdcurrency = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_biayaadd (ckdcurrency,vbiayaadmsmu,vbiayalain,vppn, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[kdcurr]','$biayasmu','$biayalain','$ppn', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT curr.ckdcurrency AS kdcurr, curr.vnmcurrency, byadd.* FROM tm_currency curr ";
$sql .= "LEFT JOIN tm_biayaadd byadd ON byadd.ckdcurrency = curr.ckdcurrency ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE curr.ckdcurrency = '$_GET[key]' ";
}
$sql .= " ORDER BY curr.ckdcurrency ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[BIAYA_TAMBAHAN_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>