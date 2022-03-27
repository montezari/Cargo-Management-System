<?php

$mode = strtoupper($_POST["FormAction"])=="VIEWDATA" ? 1 : 0;
$moduleid = "report.salessum";

if(isset($_POST["tglawal"]) && $_POST["tglawal"] != ""){
  $tgl = explode("/",$_POST["tglawal"]);
  $tglawal = $tgl[2]."-".$tgl[1]."-".$tgl[0];
}else{
  $tglawal = date('Y-m-01');
}
if(isset($_POST["tglakhir"]) && $_POST["tglakhir"] != ""){
  $tgl = explode("/",$_POST["tglakhir"]);
  $tglakhir = $tgl[2]."-".$tgl[1]."-".$tgl[0];
}else{
  $tglakhir = date('Y-m-t');
}

$reportTpl = new TTemplate($moduleid);
$reportTpl->template->MergeBlock("blk_curr","adodb","SELECT ckdcurrency,vnmcurrency FROM tm_currency ORDER BY ckdcurrency");
if($mode=="1"){
  $sql  = "SELECT mu.ckdagent, agen.vnmagent,  ";
  $sql .= "SUM(mu.cjmlberat) as cjmlberat, SUM(mu.cjmlkoli) as cjmlkoli, ";
  $sql .= "SUM(mu.vppn) as vppn, ";
  $sql .= "SUM(((mu.cjmlberat*mu.vtarifperkg)+(mu.cjmlkoli*mu.vtarifperkoli))+mu.vfuelsurcharge+mu.vbiayalain) AS vasagreed, "; 
  $sql .= "SUM(mu.vbiayaadmsmu) as vbiayaadmsmu, SUM(mu.vgrandtotal) as vgrandtotal ";
  $sql .= "FROM tr_muatanudara mu ";
  $sql .= "LEFT JOIN tm_agent agen ON agen.ckdagent = mu.ckdagent ";
  $sql .= "LEFT JOIN tm_kota asal ON asal.ckdkota = mu.ckdkotaasal ";
  $sql .= "LEFT JOIN tm_kota tuj ON tuj.ckdkota = mu.ckdkotatujuan ";
  $sql .= "WHERE mu.ckdcurrency = '$_POST[kdcurr]' ";
  $sql .= "AND STR_TO_DATE(mu.dtglmuatan,'%Y-%m-%d') BETWEEN '$tglawal' AND '$tglakhir' ";  
  $sql .= "GROUP BY mu.ckdagent, agen.vnmagent ";
  $rs = $conn->Execute($sql);
  $i=0;
  $datarpt = array();
  while(!$rs->EOF){
    $datarpt[$i]["ckdagent"] = $rs->fields["ckdagent"];
    $datarpt[$i]["vnmagent"] = $rs->fields["vnmagent"];
    $datarpt[$i]["cjmlberat"] = $rs->fields["cjmlberat"];
    $datarpt[$i]["cjmlkoli"] = $rs->fields["cjmlkoli"];
    $datarpt[$i]["vppn"] = $rs->fields["vppn"];
    $datarpt[$i]["vasagreed"] = $rs->fields["vasagreed"];
    $datarpt[$i]["vbiayaadmsmu"] = $rs->fields["vbiayaadmsmu"];
    $datarpt[$i]["vgrandtotal"] = $rs->fields["vgrandtotal"];
	$i++;
	$rs->MoveNext();
  }
  $rs->Close();
  $reportTpl->template->MergeBlock('grid_blk',$datarpt);
  
  $sql  = "SELECT SUM(mu.vgrandtotal) vtotal ";
  $sql .= "FROM tr_muatanudara mu ";
  $sql .= "WHERE mu.ckdcurrency = '$_POST[kdcurr]' ";
  $sql .= "AND STR_TO_DATE(mu.dtglmuatan,'%Y-%m-%d') BETWEEN '$tglawal' AND '$tglakhir' ";  
  $rs = $conn->Execute($sql);
  $vsumtotal = $rs->fields["vtotal"];
}
$reportTpl->moduleid  = $moduleid;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[REKAP_PENJUALAN_SUMMARY_HDR];
$gTpl->display  = $reportTpl->Show(false);
$content = $gTpl->Show(false);

?>