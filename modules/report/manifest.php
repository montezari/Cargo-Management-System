<?php

include "includes/qrbarcode/qrlib.php"; 
$filename = $PNG_TEMP_DIR.'test.png';
$errorCorrectionLevel = 'L';
$matrixPointSize = 7;

$mode = strtoupper($_POST["FormAction"])=="VIEWDATA" ? 1 : 0;
$moduleid = "report.manifest";

if(isset($_POST["tglawal"]) && $_POST["tglawal"] != ""){
  $tgl = explode("/",$_POST["tglawal"]);
  $tglawal = $tgl[2]."-".$tgl[1]."-".$tgl[0];
}else{
  $tglawal = date('Y-m-d');
}

$reportTpl = new TTemplate($moduleid);
if($mode=="1"){
  $sql  = "SELECT mu.cnomuatan, mu.dtglmuatan, mu.ckdagent, agen.vnmagent, "; 
  $sql .= "asal.vnmkota AS vnmkotaasal, tuj.vnmkota AS vnmkotatuj, ";
  $sql .= "kom.vnmkomoditi, mu.cjmlcargo, mu.cjmlberat, mu.cjmlkoli ";
  $sql .= "FROM tr_muatanudara mu "; 
  $sql .= "LEFT JOIN tm_komoditi kom ON kom.ckdkomoditi = mu.ckdkomoditi ";
  $sql .= "LEFT JOIN tm_agent agen ON agen.ckdagent = mu.ckdagent ";
  $sql .= "LEFT JOIN tm_kota asal ON asal.ckdkota = mu.ckdkotaasal "; 
  $sql .= "LEFT JOIN tm_kota tuj ON tuj.ckdkota = mu.ckdkotatujuan ";
  $sql .= "WHERE mu.cnopenerbangan = '$_POST[kdterbang]' ";
  $sql .= "AND STR_TO_DATE(mu.dtglterbang,'%Y-%m-%d') = '$tglawal' ";  
  $rs = $conn->Execute($sql);
  $bykdata = $rs->RecordCount();
  $i=0;
  $datarpt = array();
  while(!$rs->EOF){
    $datarpt[$i]["ckdagent"] = $rs->fields["ckdagent"];
    $datarpt[$i]["vnmagent"] = $rs->fields["vnmagent"];
    $datarpt[$i]["cnomuatan"] = $rs->fields["cnomuatan"];
    $datarpt[$i]["dtglmuatan"] = $rs->fields["dtglmuatan"];
    $datarpt[$i]["vnmkotaasal"] = $rs->fields["vnmkotaasal"];
    $datarpt[$i]["vnmkotatuj"] = $rs->fields["vnmkotatuj"];
    $datarpt[$i]["vnmkomoditi"] = $rs->fields["vnmkomoditi"];
    $datarpt[$i]["cjmlcargo"] = $rs->fields["cjmlcargo"];
    $datarpt[$i]["cjmlberat"] = $rs->fields["cjmlberat"];
    $datarpt[$i]["cjmlkoli"] = $rs->fields["cjmlkoli"];
	$i++;
	$rs->MoveNext();
  }
  $rs->Close();
  $reportTpl->template->MergeBlock('grid_blk',$datarpt);
  
  $sql  = "SELECT SUM(mu.cjmlcargo) as vtotcargo, SUM(mu.cjmlberat) as vtotberat, SUM(mu.cjmlkoli) as vtotkoli ";
  $sql .= "FROM tr_muatanudara mu ";
  $sql .= "WHERE mu.cnopenerbangan = '$_POST[kdterbang]' ";
  $sql .= "AND STR_TO_DATE(mu.dtglterbang,'%Y-%m-%d') = '$tglawal' ";  
  $rs = $conn->Execute($sql);
  $vtotcargo = $rs->fields["vtotcargo"];
  $vtotberat = $rs->fields["vtotberat"];
  $vtotkoli = $rs->fields["vtotkoli"];

  $sql  = "SELECT mu.cnomuatan, mu.cjmlcargo FROM tr_muatanudara mu ";
  $sql .= "WHERE mu.cnopenerbangan = '$_POST[kdterbang]' ";
  $sql .= "AND STR_TO_DATE(mu.dtglterbang,'%Y-%m-%d') = '$tglawal' ";  
  $rs = $conn->Execute($sql);
  $i=0; $j=0;
  $databarcode = array();
  while(!$rs->EOF){
    $cnotrans = $rs->fields["cnomuatan"];
	$byk=$rs->fields["cjmlcargo"];
    $databarcode[$i]["cnomuatan"] = $cnotrans;
    $databarcode[$i]["cjmlcargo"] = "(".$byk.") Item";
	$databarcode[$i]["cbarcode1"] = "";
	$databarcode[$i]["cbarcode2"] = "";
	$databarcode[$i]["cbarcode3"] = "";
	$databarcode[$i]["cbarcode4"] = "";
	$databarcode[$i]["cbarcode5"] = "";
	$filename = $PNG_TEMP_DIR.'test'.md5($cnotrans.'|'.$errorCorrectionLevel.'|'.$matrixPointSize).'.png';
	QRcode::png($cnotrans, $filename, $errorCorrectionLevel, $matrixPointSize, 2);    
	$qrbarc = '<img src="'.$PNG_WEB_DIR.basename($filename).'" />'; 
	//$qrbarc = $PNG_WEB_DIR.basename($filename); 
    $row=ceil($byk/5);
	$counter=1;
	for ($x=1;$x<=$row;$x++) {
	  $i++;
	  $barcode1 = $counter<=$byk ? $qrbarc : "";
	  $counter++;
	  $barcode2 = $counter<=$byk ? $qrbarc : "";
	  $counter++;
	  $barcode3 = $counter<=$byk ? $qrbarc : "";
	  $counter++;
	  $barcode4 = $counter<=$byk ? $qrbarc : "";
	  $counter++;
	  $barcode5 = $counter<=$byk ? $qrbarc : "";
	  $counter++;
      $databarcode[$i]["cnomuatan"] = "";
      $databarcode[$i]["cjmlcargo"] = "";
	  $databarcode[$i]["cbarcode1"] = $barcode1;
	  $databarcode[$i]["cbarcode2"] = $barcode2;
	  $databarcode[$i]["cbarcode3"] = $barcode3;
	  $databarcode[$i]["cbarcode4"] = $barcode4;
	  $databarcode[$i]["cbarcode5"] = $barcode5;
	} 
	$i++;
	$rs->MoveNext();
  }
  $rs->Close();
  $reportTpl->template->MergeBlock('grid_barcode',$databarcode);

}
$reportTpl->moduleid  = $moduleid;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[MANIFEST_PENERBANGAN_HDR];
$gTpl->display  = $reportTpl->Show(false);
$content = $gTpl->Show(false);

?>