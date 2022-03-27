<?php

include "includes/qrbarcode/qrlib.php"; 
$filename = $PNG_TEMP_DIR.'test.png';
$errorCorrectionLevel = 'L';
$matrixPointSize = 3;

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "trans.muatan";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $notrans = $_POST["kdmuatan"];
  if($_POST["tglmuatan"]!=""){
	$tgl = explode("/",$_POST["tglmuatan"]);
	$tgltrans = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tgltrans = date('Y-m-d');
  }
  if($_POST["tglterbang"]!=""){
	$tgl = explode("/",$_POST["tglterbang"]);
	$tglterbang = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tglterbang = date('Y-m-d');
  }
  $saldoagent = (isset($_POST["saldoagent"]) && $_POST["saldoagent"]!="") ? str_replace(",","",$_POST["saldoagent"]) : "0";
  $sisakg = (isset($_POST["sisakg"]) && $_POST["sisakg"]!="") ? str_replace(",","",$_POST["sisakg"]) : "0";
  $sisakoli = (isset($_POST["sisakoli"]) && $_POST["sisakoli"]!="") ? str_replace(",","",$_POST["sisakoli"]) : "0";
  $jmlbrg = (isset($_POST["jmlbrg"]) && $_POST["jmlbrg"]!="") ? str_replace(",","",$_POST["jmlbrg"]) : "0";
  $jmlkg = (isset($_POST["jmlkg"]) && $_POST["jmlkg"]!="") ? str_replace(",","",$_POST["jmlkg"]) : "0";
  $jmlkoli = (isset($_POST["jmlkoli"]) && $_POST["jmlkoli"]!="") ? str_replace(",","",$_POST["jmlkoli"]) : "0";
  $hrgkg = (isset($_POST["hrgkg"]) && $_POST["hrgkg"]!="") ? str_replace(",","",$_POST["hrgkg"]) : "0";
  $hrgkoli = (isset($_POST["hrgkoli"]) && $_POST["hrgkoli"]!="") ? str_replace(",","",$_POST["hrgkoli"]) : "0";
  $biayaadm = (isset($_POST["biayaadm"]) && $_POST["biayaadm"]!="") ? str_replace(",","",$_POST["biayaadm"]) : "0";
  $biayafuel = (isset($_POST["biayafuel"]) && $_POST["biayafuel"]!="") ? str_replace(",","",$_POST["biayafuel"]) : "0";
  $biayalain = (isset($_POST["biayalain"]) && $_POST["biayalain"]!="") ? str_replace(",","",$_POST["biayalain"]) : "0";
  $ppnpers = (isset($_POST["ppnpers"]) && $_POST["ppnpers"]!="") ? str_replace(",","",$_POST["ppnpers"]) : "0";
  $ppn = (isset($_POST["ppn"]) && $_POST["ppn"]!="") ? str_replace(",","",$_POST["ppn"]) : "0";
  $total = (isset($_POST["total"]) && $_POST["total"]!="") ? str_replace(",","",$_POST["total"]) : "0";

  if($_POST["fkey"] != ""){
    $sql  = "update tr_muatanudara ";
	$sql .= "set dtglmuatan='$tgltrans',ckdcurrency='$_POST[kdcurr]',ckdagent='$_POST[kdagent]',vsaldoagent='$saldoagent',ckdkotaasal='$_POST[kdkotaasal]', ";
	$sql .= "ckdnegaratujuan='$_POST[kdnegaratuj]',ckdkotatujuan='$_POST[kdkotatuj]',ckdnegaratransit='$_POST[kdnegaratrans]',ckdkotatransit='$_POST[kdkotatrans]',";
	$sql .= "cnopenerbangan='$_POST[kdterbang]',dtglterbang='$tglterbang',csisakg='$sisakg',csisakoli='$sisakoli', ";
	$sql .= "ckdkomoditi='$_POST[kdkomoditi]',cjmlcargo='$jmlbrg',cjmlberat='$jmlkg',cjmlkoli='$jmlkoli', ";
	$sql .= "vtarifperkg='$hrgkg',vtarifperkoli='$hrgkoli',vfuelsurcharge='$biayafuel',vbiayaadmsmu='$biayaadm',vbiayalain='$biayalain', ";
	$sql .= "vppnpers='$ppnpers',vppn='$ppn',vgrandtotal='$total', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cidmuatan = '$_POST[fkey]' ";
  }else{
    $notrans = settransno("SMU");
	$sql  = "insert into tr_muatanudara ";
	$sql .= "(cnomuatan,dtglmuatan,ckdcurrency,ckdagent,vsaldoagent,ckdkotaasal,ckdnegaratujuan,ckdkotatujuan,ckdnegaratransit,ckdkotatransit, ";
	$sql .= "cnopenerbangan,dtglterbang,csisakg,csisakoli,ckdkomoditi,cjmlcargo,cjmlberat,cjmlkoli,vtarifperkg,vtarifperkoli,vfuelsurcharge,vbiayaadmsmu, ";
	$sql .= "vbiayalain,vppnpers,vppn,vgrandtotal, ";
	$sql .= "cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$notrans','$tgltrans','$_POST[kdcurr]','$_POST[kdagent]','$saldoagent','$_POST[kdkotaasal]','$_POST[kdnegaratuj]','$_POST[kdkotatuj]', ";
	$sql .= "'$_POST[kdnegaratrans]','$_POST[kdkotatrans]', ";
    $sql .= "'$_POST[kdterbang]','$tglterbang','$sisakg','$sisakoli','$_POST[kdkomoditi]','$jmlbrg','$jmlkg','$jmlkoli','$hrgkg','$hrgkoli','$biayafuel', ";
	$sql .= "'$biayaadm','$biayalain','$ppnpers','$ppn','$total', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  //echo $sql;
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="CANCEL"){
  $sql = "update tr_muatanudara set cstatus='C' WHERE cidmuatan = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT smu.*, agn.vnmagent, kota.vnmkota as kotatuj, tran.vnmkota AS kotatrans ";
$sql .= "FROM tr_muatanudara smu ";
$sql .= "LEFT JOIN tm_agent agn ON agn.ckdagent = smu.ckdagent ";
$sql .= "LEFT JOIN tm_kota kota ON kota.ckdkota = smu.ckdkotatujuan ";
$sql .= "LEFT JOIN tm_kota tran ON tran.ckdkota = smu.ckdkotatransit ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE smu.cidmuatan = '$_GET[key]' ";
}
$sql .= " ORDER BY smu.cidmuatan ";

$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $sql  = "SELECT cnomuatan from tr_muatanudara WHERE cidmuatan = '$_GET[key]' ";
  $rs = $conn->Execute($sql); 
  $notrans_form = $rs->fields["cnomuatan"];
  $filename = $PNG_TEMP_DIR.'muatan'.md5($notrans_form.'|'.$errorCorrectionLevel.'|'.$matrixPointSize).'.png';
  QRcode::png($notrans_form, $filename, $errorCorrectionLevel, $matrixPointSize, 2);    
  $qrbarc_form = '<img src="'.$PNG_WEB_DIR.basename($filename).'" />'; 

  $admGrdTpl->template->MergeBlock("blk_tuj","adodb","SELECT ckdnegara,vnmnegara FROM tm_negara ORDER BY ckdnegara");
  $admGrdTpl->template->MergeBlock("blk_trans","adodb","SELECT ckdnegara,vnmnegara FROM tm_negara ORDER BY ckdnegara");
  $admGrdTpl->template->MergeBlock("blk_curr","adodb","SELECT ckdcurrency,vnmcurrency FROM tm_currency ORDER BY ckdcurrency");
  $admGrdTpl->template->MergeBlock("blk_komo","adodb","SELECT ckdkomoditi, vnmkomoditi FROM tm_komoditi ORDER BY ckdkomoditi");
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[SURAT_MUATAN_UDARA_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>