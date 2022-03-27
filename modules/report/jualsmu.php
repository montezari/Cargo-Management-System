<?php

$mode = strtoupper($_POST["FormAction"])=="VIEWDATA" ? 1 : 0;
$moduleid = "report.jualsmu";

$val["bulan"] = isset($_POST["cmbbln"]) && $_POST["cmbbln"] != "" ? $_POST["cmbbln"] : date("m");
$val["tahun"] = isset($_POST["cmbtahun"]) && $_POST["cmbtahun"] != "" ? $_POST["cmbtahun"] : date("Y");

$reportTpl = new TTemplate($moduleid);
$reportTpl->template->MergeBlock("blk_bln","adodb","SELECT cbulanstr,vnmbulan FROM tm_bulan ORDER BY cbulan");
$reportTpl->template->MergeBlock("blk_curr","adodb","SELECT ckdcurrency,vnmcurrency FROM tm_currency ORDER BY ckdcurrency");
$reportTpl->template->MergeBlock("blk_tuj","adodb","SELECT ckdnegara,vnmnegara FROM tm_negara ORDER BY ckdnegara");
if($mode=="1"){
  $sql  = "SELECT mu.cidmuatan, mu.cnomuatan, mu.dtglmuatan, mu.ckdagent, agen.vnmagent, mu.cnopenerbangan, ";
  $sql .= "asal.vnmkota AS vnmkotaasal, tuj.vnmkota AS vnmkotatuj, ";
  $sql .= "mu.cjmlberat,mu.cjmlkoli,mu.vtarifperkg,mu.vtarifperkoli, ";
  $sql .= "IF(mu.cjmlberat>0,mu.vtarifperkg,mu.vtarifperkoli) AS vtarif, mu.vppn, ";
  $sql .= "((mu.cjmlberat*mu.vtarifperkg)+(mu.cjmlkoli*mu.vtarifperkoli))+mu.vfuelsurcharge+mu.vbiayalain AS vasagreed, "; 
  $sql .= "mu.vbiayaadmsmu, mu.vgrandtotal, 0 as fcheck ";
  $sql .= "FROM tr_muatanudara mu ";
  $sql .= "LEFT JOIN tm_agent agen ON agen.ckdagent = mu.ckdagent ";
  $sql .= "LEFT JOIN tm_kota asal ON asal.ckdkota = mu.ckdkotaasal ";
  $sql .= "LEFT JOIN tm_kota tuj ON tuj.ckdkota = mu.ckdkotatujuan ";
  $sql .= "WHERE mu.ckdcurrency = '$_POST[kdcurr]' ";
  $sql .= "AND YEAR(mu.dtglmuatan) = '$_POST[cmbtahun]' AND MONTH(mu.dtglmuatan) = '$_POST[cmbbln]' "; 
  $sql .= "AND mu.ckdkotaasal = '$_POST[kdkota]' ";
  $sql .= isset($_POST["kdkotatuj"]) && ($_POST["kdkotatuj"]!="") ? "AND mu.ckdkotatujuan = '$_POST[kdkotatuj]' " : "";
  $sql .= isset($_POST["kdterbang"]) && ($_POST["kdterbang"]!="") ? "AND mu.cnopenerbangan = '$_POST[kdterbang]' " : "";
  $rs = $conn->Execute($sql);
  $i=0;
  $datarpt = array();
  while(!$rs->EOF){
    $datarpt[$i]["ckdagent"] = $rs->fields["ckdagent"];
    $datarpt[$i]["vnmagent"] = $rs->fields["vnmagent"];
    $datarpt[$i]["cnomuatan"] = $rs->fields["cnomuatan"];
    $datarpt[$i]["dtglmuatan"] = $rs->fields["dtglmuatan"];
    $datarpt[$i]["ckdcurrency"] = $rs->fields["ckdcurrency"];
    $datarpt[$i]["cnopenerbangan"] = $rs->fields["cnopenerbangan"];
    $datarpt[$i]["vnmkotaasal"] = $rs->fields["vnmkotaasal"];
    $datarpt[$i]["vnmkotatuj"] = $rs->fields["vnmkotatuj"];
    $datarpt[$i]["cjmlberat"] = $rs->fields["cjmlberat"];
    $datarpt[$i]["cjmlkoli"] = $rs->fields["cjmlkoli"];
    $datarpt[$i]["vtarif"] = $rs->fields["vtarif"];
    $datarpt[$i]["vppn"] = $rs->fields["vppn"];
    $datarpt[$i]["vasagreed"] = $rs->fields["vasagreed"];
    $datarpt[$i]["vtarifperkg"] = $rs->fields["vtarifperkg"];
    $datarpt[$i]["vtarifperkoli"] = $rs->fields["vtarifperkoli"];
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
  $sql .= "AND YEAR(mu.dtglmuatan) = '$_POST[cmbtahun]' AND MONTH(mu.dtglmuatan) = '$_POST[cmbbln]' "; 
  $sql .= "AND mu.ckdkotaasal = '$_POST[kdkota]' ";
  $sql .= isset($_POST["kdkotatuj"]) && ($_POST["kdkotatuj"]!="") ? "AND mu.ckdkotatujuan = '$_POST[kdkotatuj]' " : "";
  $sql .= isset($_POST["kdterbang"]) && ($_POST["kdterbang"]!="") ? "AND mu.cnopenerbangan = '$_POST[kdterbang]' " : "";
  $rs = $conn->Execute($sql);
  $vsumtotal = $rs->fields["vtotal"];
}
$reportTpl->moduleid  = $moduleid;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[RINCIAN_PENJUALAN_SMU_HDR];
$gTpl->display  = $reportTpl->Show(false);
$content = $gTpl->Show(false);

?>