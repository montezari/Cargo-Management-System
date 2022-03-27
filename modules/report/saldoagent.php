<?php

$mode = strtoupper($_POST["FormAction"])=="VIEWDATA" ? 1 : 0;
$moduleid = "report.saldoagent";

$val["bulan"] = isset($_POST["cmbbln"]) && $_POST["cmbbln"] != "" ? $_POST["cmbbln"] : date("m");
$val["tahun"] = isset($_POST["cmbtahun"]) && $_POST["cmbtahun"] != "" ? $_POST["cmbtahun"] : date("Y");

$reportTpl = new TTemplate($moduleid);
$reportTpl->template->MergeBlock("blk_bln","adodb","SELECT cbulanstr,vnmbulan FROM tm_bulan ORDER BY cbulan");
$reportTpl->template->MergeBlock("blk_curr","adodb","SELECT ckdcurrency,vnmcurrency FROM tm_currency ORDER BY ckdcurrency");
if($mode=="1"){
  $sql  = "CALL sp_saldo_agent('$_POST[kdagent]','$_POST[kdcurr]','$_POST[cmbbln]','$_POST[cmbtahun]'); ";
  $rs = $conn->Execute($sql);
  $i=0;
  $datarpt = array();
  while(!$rs->EOF){
    $datarpt[$i]["ckdagent"] = $rs->fields["ckdagent"];
    $datarpt[$i]["cnotrans"] = $rs->fields["cnotrans"];
    $datarpt[$i]["dtgltrans"] = $rs->fields["dtgltrans"];
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
    $datarpt[$i]["vin"] = $rs->fields["vin"];
    $datarpt[$i]["vout"] = $rs->fields["vout"];
    $datarpt[$i]["vsaldo"] = $rs->fields["vsaldo"];
	$i++;
	$rs->MoveNext();
  }
  $rs->Close();
  $reportTpl->template->MergeBlock('grid_blk',$datarpt);
}
$reportTpl->moduleid  = $moduleid;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[SALDO_PELANGGAN_HDR];
$gTpl->display  = $reportTpl->Show(false);
$content = $gTpl->Show(false);

?>