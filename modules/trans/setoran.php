<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "trans.setoran";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $notrans = $_POST["kdagent"];
  if($_POST["tglsetor"]!=""){
	$tgl = explode("/",$_POST["tglsetor"]);
	$tgltrans = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tgltrans = date('Y-m-d');
  }
  $jmlsetor = (isset($_POST["jmlsetor"]) && $_POST["jmlsetor"]!="") ? str_replace(",","",$_POST["jmlsetor"]) : "0";
  if($_POST["fkey"] != ""){
    $sql  = "update tr_setoranagent set dtglsetoran='$tgltrans',ckdagent='$_POST[kdagent]',ckdcurrency='$_POST[kdcurr]',vjmlsetoran='$jmlsetor',";
	$sql .= "ckdjenissetor='$_POST[kdjenissetor]',vketerangan='$_POST[ket]', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cnosetoran = '$_POST[fkey]' ";
  }else{
    $notrans = settransno("SET");
	$sql  = "insert into tr_setoranagent (cnosetoran,dtglsetoran,ckdagent,ckdcurrency,vjmlsetoran,ckdjenissetor,vketerangan, ";
	$sql .= "cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$notrans','$tgltrans','$_POST[kdagent]','$_POST[kdcurr]','$jmlsetor','$_POST[kdjenissetor]','$_POST[ket]', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tr_setoranagent WHERE cnosetoran = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT setor.*, agn.vnmagent, curr.vnmcurrency FROM tr_setoranagent setor ";
$sql .= "LEFT JOIN tm_agent agn ON agn.ckdagent = setor.ckdagent ";
$sql .= "LEFT JOIN tm_currency curr ON curr.ckdcurrency = setor.ckdcurrency ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE setor.cnosetoran = '$_GET[key]' ";
}
$sql .= " ORDER BY setor.cnosetoran ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_curr","adodb","SELECT ckdcurrency,vnmcurrency FROM tm_currency ORDER BY ckdcurrency");
  $admGrdTpl->template->MergeBlock("blk_setor","adodb","SELECT ckdjenissetor,vnmjenissetor FROM tm_jenissetor ORDER BY ckdjenissetor");
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[SETORAN_PELANGGAN_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>