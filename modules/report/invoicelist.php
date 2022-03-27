<?php

$mode = strtoupper($_POST["FormAction"])=="VIEWDATA" ? 1 : 0;
$moduleid = "report.invoicelist";

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
  $sql  = "SELECT inv.*, agn.vnmagent, curr.vnmcurrency FROM tr_invoice inv ";
  $sql .= "LEFT JOIN tm_agent agn ON agn.ckdagent = inv.ckdagent ";
  $sql .= "LEFT JOIN tm_currency curr ON curr.ckdcurrency = inv.ckdcurrency ";
  $sql .= "WHERE inv.ckdagent = '$_POST[kdagent]' AND inv.ckdcurrency = '$_POST[kdcurr]' ";
  $sql .= "AND STR_TO_DATE(inv.dtglinv,'%Y-%m-%d') BETWEEN '$tglawal' AND '$tglakhir' ";  
  $rs = $conn->Execute($sql);
  $i=0;
  $datarpt = array();
  while(!$rs->EOF){
    $datarpt[$i]["cinv"] = $rs->fields["cinv"];
    $datarpt[$i]["cnoinv"] = $rs->fields["cnoinv"];
    $datarpt[$i]["dtglinv"] = $rs->fields["dtglinv"];
    $datarpt[$i]["vnmagent"] = $rs->fields["vnmagent"];
    $datarpt[$i]["cjmlsmu"] = $rs->fields["cjmlsmu"];
    $datarpt[$i]["vnmcurrency"] = $rs->fields["vnmcurrency"];
    $datarpt[$i]["vtotalinv"] = $rs->fields["vtotalinv"];
	$i++;
	$rs->MoveNext();
  }
  $rs->Close();
  $reportTpl->template->MergeBlock('grid_blk',$datarpt);
  
}
$reportTpl->moduleid  = $moduleid;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[INVOICE_REPORT_HDR];
$gTpl->display  = $reportTpl->Show(false);
$content = $gTpl->Show(false);

?>