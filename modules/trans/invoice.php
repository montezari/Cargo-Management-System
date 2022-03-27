<?php
$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$view = (strtoupper($_POST["FormViewData"])=="VIEWDATA") ? 1 : 0;
if($_GET["key"] != ""){
  $view = 1;
}
$moduleid = "trans.invoice";

if((strtoupper($_POST["FormAction"])=="SIMPAN") && ($_POST["flag"]=="1")){
  $notrans = $_POST["noinv"];
  if($_POST["tglinv"]!=""){
	$tgl = explode("/",$_POST["tglinv"]);
	$tgltrans = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tgltrans = date('Y-m-d');
  }
  if($_POST["tglawal"]!=""){
	$tgl = explode("/",$_POST["tglawal"]);
	$tglawal = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tglawal = date('Y-m-d');
  }
  if($_POST["tglakhir"]!=""){
	$tgl = explode("/",$_POST["tglakhir"]);
	$tglakhir = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tglakhir = date('Y-m-d');
  }
  $totalinv = (isset($_POST["totalinv"]) && $_POST["totalinv"]!="") ? str_replace(",","",$_POST["totalinv"]) : "0";
  $jmlsmu = (isset($_POST["jmlsmu"]) && $_POST["jmlsmu"]!="") ? str_replace(",","",$_POST["jmlsmu"]) : "0";
  if($_POST["fkey"] != ""){
    $sql  = "update tr_invoice set dtglinv='$tgltrans',dtglawal='$tglawal',dtglakhir='$tglakhir', ";
	$sql .= "cjmlsmu='$jmlsmu',vtotalinv='$totalinv',vketerangan='$_POST[ket]', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where cinv = '$_POST[fkey]' ";
    $conn->Execute($sql); 
	$dokid  = $_POST["fkey"];
  }else{
    $notrans = settransno("INV");
	$sql  = "insert into tr_invoice (cnoinv,dtglinv,ckdagent,dtglawal,dtglakhir,ckdcurrency,cjmlsmu,vtotalinv,vketerangan, ";
	$sql .= "cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$notrans','$tgltrans','$_POST[kdagent]','$tglawal','$tglakhir','$_POST[kdcurr]','$jmlsmu','$totalinv','$_POST[ket]', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
    $conn->Execute($sql); 
	$dokid  = $conn->Insert_ID();
  }
  // update no dan tgl inv di trans muatan
  $sql = "UPDATE tr_muatanudara set cinv = NULL, cnoinv = NULL, dtglinv=NULL WHERE cinv = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  $sql = "UPDATE tr_muatanudara set cinv = '$dokid', cnoinv = '$notrans', dtglinv='$tgltrans' WHERE cidmuatan IN ($_POST[flistinv]) ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  //$sql = "delete from tr_invoice WHERE cinv = '$_POST[fkey]' ";
  //$conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$keyupdate = "";
$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT inv.*, agn.vnmagent, curr.vnmcurrency FROM tr_invoice inv ";
$sql .= "LEFT JOIN tm_agent agn ON agn.ckdagent = inv.ckdagent ";
$sql .= "LEFT JOIN tm_currency curr ON curr.ckdcurrency = inv.ckdcurrency ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE inv.cinv = '$_GET[key]' ";
  $keyupdate = "&key=$_GET[key]";
}
$sql .= " ORDER BY inv.cinv ";

if(($mode=="1") && isset($_POST["tglinv"]) && ($_POST["tglinv"]!="")){
  if($_POST["tglinv"]!=""){
    $tgl = explode("/",$_POST["tglinv"]);
    $tglinv = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
    $tglinv = date('Y-m-d');
  }
  if($_POST["tglawal"]!=""){
    $tgl = explode("/",$_POST["tglawal"]);
    $tglawal = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
    $tglawal = date('Y-m-01');
  }
  if($_POST["tglakhir"]!=""){
    $tgl = explode("/",$_POST["tglakhir"]);
    $tglakhir = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
    $tglakhir = date('Y-m-t');
  }
  $sql  = "SELECT '$_POST[fkey]' AS cinv, '$_POST[noinv]' AS cnoinv, '$tglinv' AS dtglinv, '$_POST[kdagent]' AS ckdagent, '$_POST[nmagent]' AS vnmagent, ";
  $sql .= "'$_POST[kdcurr]' AS ckdcurrency,  ";
  $sql .= "'$tglawal' AS dtglawal, '$tglakhir' AS dtglakhir, '$_POST[totalinv]' AS vtotalinv, '$_POST[jmlsmu]' AS cjmlsmu, '$_POST[ket]' AS vketerangan ";
}elseif(($mode=="1") && !isset($_GET["key"])){
  $tglinv = date('Y-m-d');
  $tglawal = date('Y-m-01');
  $tglakhir = date('Y-m-t');
  $sql  = "SELECT '$tglinv' AS dtglinv, '$tglawal' AS dtglawal, '$tglakhir' AS dtglakhir ";
}

$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_curr","adodb","SELECT ckdcurrency,vnmcurrency FROM tm_currency ORDER BY ckdcurrency");
}

if(($mode=="1") && ($view=="1")){
  if($_POST["tglawal"]!=""){
	$tgl = explode("/",$_POST["tglawal"]);
	$tglawal = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tglawal = date('Y-m-d');
  }
  if($_POST["tglakhir"]!=""){
	$tgl = explode("/",$_POST["tglakhir"]);
	$tglakhir = $tgl[2]."-".$tgl[1]."-".$tgl[0];
  }else{
	$tglakhir = date('Y-m-d');
  }

  if(isset($_POST["flag"])){
	  $sql  = "SELECT -1 AS cidmuatan, 'SALDO AWAL' AS cnomuatan, NULL AS dtglmuatan, agen.ckdagent, agen.vnmagent, ";
	  $sql .= "'' AS cnopenerbangan, '' AS vnmkotaasal, '' AS vnmkotatuj, ";
	  $sql .= "0 AS cjmlberat,0 AS cjmlkoli,0 AS vtarifperkg,0 AS vtarifperkoli, 0 AS vtarif, 0 AS vppn, ";
	  $sql .= "0 AS  vasagreed, 0 AS vbiayaadmsmu,  COALESCE(mu.vgrandtotal,0) AS vjumlah, 0 as fcheck ";
	  $sql .= "FROM tm_agent agen ";
	  $sql .= "LEFT JOIN ( ";
	  $sql .= "  SELECT mu.ckdagent, SUM(mu.vgrandtotal) AS vgrandtotal ";
	  $sql .= "  FROM tr_muatanudara mu ";
	  $sql .= "  WHERE dtglinv IS NULL ";
	  $sql .= "  AND mu.ckdagent = '$_POST[kdagent]' AND mu.ckdcurrency = '$_POST[kdcurr]' AND STR_TO_DATE(mu.dtglmuatan,'%Y-%m-%d') < '$tglawal' ";
	  $sql .= "  GROUP BY mu.ckdagent "; 
	  $sql .= ") mu ON agen.ckdagent = mu.ckdagent ";
	  $sql .= "WHERE agen.ckdagent = '$_POST[kdagent]' ";
	  $sql .= "UNION ALL ";
	  $sql .= "SELECT mu.cidmuatan, mu.cnomuatan, mu.dtglmuatan, mu.ckdagent, agen.vnmagent, mu.cnopenerbangan, ";
	  $sql .= "asal.vnmkota AS vnmkotaasal, tuj.vnmkota AS vnmkotatuj, ";
	  $sql .= "mu.cjmlberat,mu.cjmlkoli,mu.vtarifperkg,mu.vtarifperkoli, ";
	  $sql .= "IF(mu.cjmlberat>0,mu.vtarifperkg,mu.vtarifperkoli) AS vtarif, mu.vppn, ";
	  $sql .= "((mu.cjmlberat*mu.vtarifperkg)+(mu.cjmlkoli*mu.vtarifperkoli))+mu.vfuelsurcharge+mu.vbiayalain AS vasagreed, "; 
	  $sql .= "mu.vbiayaadmsmu, mu.vgrandtotal, 0 as fcheck ";
	  $sql .= "FROM tr_muatanudara mu ";
	  $sql .= "LEFT JOIN tm_agent agen ON agen.ckdagent = mu.ckdagent ";
	  $sql .= "LEFT JOIN tm_kota asal ON asal.ckdkota = mu.ckdkotaasal ";
	  $sql .= "LEFT JOIN tm_kota tuj ON tuj.ckdkota = mu.ckdkotatujuan ";
	  $sql .= "WHERE dtglinv IS NULL ";
	  $sql .= "AND mu.ckdagent = '$_POST[kdagent]' AND mu.ckdcurrency = '$_POST[kdcurr]' ";
	  $sql .= "AND STR_TO_DATE(mu.dtglmuatan,'%Y-%m-%d') BETWEEN '$tglawal' AND '$tglakhir' "; 
	  if($_GET["key"] != ""){
		  $sql .= "UNION ALL ";
		  $sql .= "SELECT mu.cidmuatan, mu.cnomuatan, mu.dtglmuatan, mu.ckdagent, agen.vnmagent, mu.cnopenerbangan, ";
		  $sql .= "asal.vnmkota AS vnmkotaasal, tuj.vnmkota AS vnmkotatuj, ";
		  $sql .= "mu.cjmlberat,mu.cjmlkoli,mu.vtarifperkg,mu.vtarifperkoli, ";
		  $sql .= "IF(mu.cjmlberat>0,mu.vtarifperkg,mu.vtarifperkoli) AS vtarif, mu.vppn, ";
		  $sql .= "((mu.cjmlberat*mu.vtarifperkg)+(mu.cjmlkoli*mu.vtarifperkoli))+mu.vfuelsurcharge+mu.vbiayalain AS vasagreed, "; 
		  $sql .= "mu.vbiayaadmsmu, mu.vgrandtotal  AS vjumlah, '1' as fcheck ";
		  $sql .= "FROM tr_muatanudara mu ";
		  $sql .= "LEFT JOIN tm_agent agen ON agen.ckdagent = mu.ckdagent ";
		  $sql .= "LEFT JOIN tm_kota asal ON asal.ckdkota = mu.ckdkotaasal ";
		  $sql .= "LEFT JOIN tm_kota tuj ON tuj.ckdkota = mu.ckdkotatujuan ";
		  $sql .= "WHERE dtglinv IS NOT NULL ";
		  $sql .= "AND mu.cinv = '$_GET[key]' ";
	  }
  }else{
	  $sql  = "SELECT mu.cidmuatan, mu.cnomuatan, mu.dtglmuatan, mu.ckdagent, agen.vnmagent, mu.cnopenerbangan, ";
	  $sql .= "asal.vnmkota AS vnmkotaasal, tuj.vnmkota AS vnmkotatuj, ";
	  $sql .= "mu.cjmlberat,mu.cjmlkoli,mu.vtarifperkg,mu.vtarifperkoli, ";
	  $sql .= "IF(mu.cjmlberat>0,mu.vtarifperkg,mu.vtarifperkoli) AS vtarif, mu.vppn, ";
	  $sql .= "((mu.cjmlberat*mu.vtarifperkg)+(mu.cjmlkoli*mu.vtarifperkoli))+mu.vfuelsurcharge+mu.vbiayalain AS vasagreed, "; 
	  $sql .= "mu.vbiayaadmsmu, mu.vgrandtotal  AS vjumlah, '1' as fcheck ";
	  $sql .= "FROM tr_muatanudara mu ";
	  $sql .= "LEFT JOIN tm_agent agen ON agen.ckdagent = mu.ckdagent ";
	  $sql .= "LEFT JOIN tm_kota asal ON asal.ckdkota = mu.ckdkotaasal ";
	  $sql .= "LEFT JOIN tm_kota tuj ON tuj.ckdkota = mu.ckdkotatujuan ";
	  $sql .= "WHERE dtglinv IS NOT NULL ";
	  $sql .= "AND mu.cinv = '$_GET[key]' ";
  }
  $rs = $conn->Execute($sql);
  
  $i=0;
  $detail = array();
  while(!$rs->EOF){
    $detail[$i]["cidmuatan"] = $rs->fields["cidmuatan"];
    $detail[$i]["ckdagent"] = $rs->fields["ckdagent"];
    $detail[$i]["cnomuatan"] = $rs->fields["cnomuatan"];
    $detail[$i]["dtglmuatan"] = $rs->fields["dtglmuatan"];
    $detail[$i]["ckdcurrency"] = $rs->fields["ckdcurrency"];
    $detail[$i]["cnopenerbangan"] = $rs->fields["cnopenerbangan"];
    $detail[$i]["vnmkotaasal"] = $rs->fields["vnmkotaasal"];
    $detail[$i]["vnmkotatuj"] = $rs->fields["vnmkotatuj"];
    $detail[$i]["cjmlberat"] = $rs->fields["cjmlberat"];
    $detail[$i]["cjmlkoli"] = $rs->fields["cjmlkoli"];
    $detail[$i]["vtarif"] = $rs->fields["vtarif"];
    $detail[$i]["vppn"] = $rs->fields["vppn"];
    $detail[$i]["vasagreed"] = $rs->fields["vasagreed"];
    $detail[$i]["vtarifperkg"] = $rs->fields["vtarifperkg"];
    $detail[$i]["vtarifperkoli"] = $rs->fields["vtarifperkoli"];
    $detail[$i]["vbiayaadmsmu"] = $rs->fields["vbiayaadmsmu"];
    $detail[$i]["vjumlah"] = $rs->fields["vjumlah"];
    $detail[$i]["fcheck"] = $rs->fields["fcheck"];
	$i++;
	$rs->MoveNext();
  }
  $rs->Close();
  $admGrdTpl->template->MergeBlock('grid_inv',$detail);

  $sql = "SELECT cidmuatan FROM tr_muatanudara WHERE cinv = '$_GET[key]' ";
  $rs = $conn->Execute($sql);
  while(!$rs->EOF){
    $str .= $rs->fields["cidmuatan"].";";
	$rs->MoveNext();
  }
  $rs->Close();
  $finv_list = $str;

}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[GENERATE_INVOICE_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>