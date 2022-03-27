<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.tarif";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
	$hrgbhnbakar = ($_POST["hrgbhnbakar"]!="") ? str_replace(",","",$_POST["hrgbhnbakar"]) : "0";  

	$hrgdasarkg = ($_POST["hrgdasarkg"]!="") ?  str_replace(",","",$_POST["hrgdasarkg"]) : "0";  
	$hrgdasarkoli = ($_POST["hrgdasarkoli"]!="") ?  str_replace(",","",$_POST["hrgdasarkoli"]) : "0";  

	$vtariflev1kg = ($_POST["vtariflev1kg"]!="") ?  str_replace(",","",$_POST["vtariflev1kg"]) : "0";  
	$vqtylevlrag1kg = ($_POST["vqtylevlrag1kg"]!="") ?  str_replace(",","",$_POST["vqtylevlrag1kg"]) : "0";  
	$vhrglev1rag1kg = ($_POST["vhrglev1rag1kg"]!="") ?  str_replace(",","",$_POST["vhrglev1rag1kg"]) : "0";  
	$vqtylevlrag2kg = ($_POST["vqtylevlrag2kg"]!="") ?  str_replace(",","",$_POST["vqtylevlrag2kg"]) : "0";  
	$vhrglev1rag2kg = ($_POST["vhrglev1rag2kg"]!="") ?  str_replace(",","",$_POST["vhrglev1rag2kg"]) : "0";  
	$vqtylevlrag3kg = ($_POST["vqtylevlrag3kg"]!="") ?  str_replace(",","",$_POST["vqtylevlrag3kg"]) : "0";  
	$vhrglev1rag3kg = ($_POST["vhrglev1rag3kg"]!="") ?  str_replace(",","",$_POST["vhrglev1rag3kg"]) : "0";  
	$vtariflev1koli = ($_POST["vtariflev1koli"]!="") ?  str_replace(",","",$_POST["vtariflev1koli"]) : "0";  
	$vqtylevlrag1koli = ($_POST["vqtylevlrag1koli"]!="") ?  str_replace(",","",$_POST["vqtylevlrag1koli"]) : "0";  
	$vhrglev1rag1koli = ($_POST["vhrglev1rag1koli"]!="") ?  str_replace(",","",$_POST["vhrglev1rag1koli"]) : "0";  
	$vqtylevlrag2koli = ($_POST["vqtylevlrag2koli"]!="") ?  str_replace(",","",$_POST["vqtylevlrag2koli"]) : "0";  
	$vhrglev1rag2koli = ($_POST["vhrglev1rag2koli"]!="") ?  str_replace(",","",$_POST["vhrglev1rag2koli"]) : "0";  
	$vqtylevlrag3koli = ($_POST["vqtylevlrag3koli"]!="") ?  str_replace(",","",$_POST["vqtylevlrag3koli"]) : "0";  
	$vhrglev1rag3koli = ($_POST["vhrglev1rag3koli"]!="") ?  str_replace(",","",$_POST["vhrglev1rag3koli"]) : "0";  

	$vtariflev2kg = ($_POST["vtariflev2kg"]!="") ?  str_replace(",","",$_POST["vtariflev2kg"]) : "0";  
	$vqtylev2rag1kg = ($_POST["vqtylev2rag1kg"]!="") ?  str_replace(",","",$_POST["vqtylev2rag1kg"]) : "0";  
	$vhrglev2rag1kg = ($_POST["vhrglev2rag1kg"]!="") ?  str_replace(",","",$_POST["vhrglev2rag1kg"]) : "0";  
	$vqtylev2rag2kg = ($_POST["vqtylev2rag2kg"]!="") ?  str_replace(",","",$_POST["vqtylev2rag2kg"]) : "0";  
	$vhrglev2rag2kg = ($_POST["vhrglev2rag2kg"]!="") ?  str_replace(",","",$_POST["vhrglev2rag2kg"]) : "0";  
	$vqtylev2rag3kg = ($_POST["vqtylev2rag3kg"]!="") ?  str_replace(",","",$_POST["vqtylev2rag3kg"]) : "0";  
	$vhrglev2rag3kg = ($_POST["vhrglev2rag3kg"]!="") ?  str_replace(",","",$_POST["vhrglev2rag3kg"]) : "0";  
	$vtariflev2koli = ($_POST["vtariflev2koli"]!="") ?  str_replace(",","",$_POST["vtariflev2koli"]) : "0";  
	$vqtylev2rag1koli = ($_POST["vqtylev2rag1koli"]!="") ?  str_replace(",","",$_POST["vqtylev2rag1koli"]) : "0";  
	$vhrglev2rag1koli = ($_POST["vhrglev2rag1koli"]!="") ?  str_replace(",","",$_POST["vhrglev2rag1koli"]) : "0";  
	$vqtylev2rag2koli = ($_POST["vqtylev2rag2koli"]!="") ?  str_replace(",","",$_POST["vqtylev2rag2koli"]) : "0";  
	$vhrglev2rag2koli = ($_POST["vhrglev2rag2koli"]!="") ?  str_replace(",","",$_POST["vhrglev2rag2koli"]) : "0";  
	$vqtylev2rag3koli = ($_POST["vqtylev2rag3koli"]!="") ?  str_replace(",","",$_POST["vqtylev2rag3koli"]) : "0";  
	$vhrglev2rag3koli = ($_POST["vhrglev2rag3koli"]!="") ?  str_replace(",","",$_POST["vhrglev2rag3koli"]) : "0";  

	$vtariflev3kg = ($_POST["vtariflev3kg"]!="") ?  str_replace(",","",$_POST["vtariflev3kg"]) : "0";  
	$vqtylev3rag1kg = ($_POST["vqtylev3rag1kg"]!="") ?  str_replace(",","",$_POST["vqtylev3rag1kg"]) : "0";  
	$vhrglev3rag1kg = ($_POST["vhrglev3rag1kg"]!="") ?  str_replace(",","",$_POST["vhrglev3rag1kg"]) : "0";  
	$vqtylev3rag2kg = ($_POST["vqtylev3rag2kg"]!="") ?  str_replace(",","",$_POST["vqtylev3rag2kg"]) : "0";  
	$vhrglev3rag2kg = ($_POST["vhrglev3rag2kg"]!="") ?  str_replace(",","",$_POST["vhrglev3rag2kg"]) : "0";  
	$vqtylev3rag3kg = ($_POST["vqtylev3rag3kg"]!="") ?  str_replace(",","",$_POST["vqtylev3rag3kg"]) : "0";  
	$vhrglev3rag3kg = ($_POST["vhrglev3rag3kg"]!="") ?  str_replace(",","",$_POST["vhrglev3rag3kg"]) : "0";  
	$vtariflev3koli = ($_POST["vtariflev3koli"]!="") ?  str_replace(",","",$_POST["vtariflev3koli"]) : "0";  
	$vqtylev3rag1koli = ($_POST["vqtylev3rag1koli"]!="") ?  str_replace(",","",$_POST["vqtylev3rag1koli"]) : "0";  
	$vhrglev3rag1koli = ($_POST["vhrglev3rag1koli"]!="") ?  str_replace(",","",$_POST["vhrglev3rag1koli"]) : "0";  
	$vqtylev3rag2koli = ($_POST["vqtylev3rag2koli"]!="") ?  str_replace(",","",$_POST["vqtylev3rag2koli"]) : "0";  
	$vhrglev3rag2koli = ($_POST["vhrglev3rag2koli"]!="") ?  str_replace(",","",$_POST["vhrglev3rag2koli"]) : "0";  
	$vqtylev3rag3koli = ($_POST["vqtylev3rag3koli"]!="") ?  str_replace(",","",$_POST["vqtylev3rag3koli"]) : "0";  
	$vhrglev3rag3koli = ($_POST["vhrglev3rag3koli"]!="") ?  str_replace(",","",$_POST["vhrglev3rag3koli"]) : "0";  

	$vtariflev4kg = ($_POST["vtariflev4kg"]!="") ?  str_replace(",","",$_POST["vtariflev4kg"]) : "0";  
	$vqtylev4rag1kg = ($_POST["vqtylev4rag1kg"]!="") ?  str_replace(",","",$_POST["vqtylev4rag1kg"]) : "0";  
	$vhrglev4rag1kg = ($_POST["vhrglev4rag1kg"]!="") ?  str_replace(",","",$_POST["vhrglev4rag1kg"]) : "0";  
	$vqtylev4rag2kg = ($_POST["vqtylev4rag2kg"]!="") ?  str_replace(",","",$_POST["vqtylev4rag2kg"]) : "0";  
	$vhrglev4rag2kg = ($_POST["vhrglev4rag2kg"]!="") ?  str_replace(",","",$_POST["vhrglev4rag2kg"]) : "0";  
	$vqtylev4rag3kg = ($_POST["vqtylev4rag3kg"]!="") ?  str_replace(",","",$_POST["vqtylev4rag3kg"]) : "0";  
	$vhrglev4rag3kg = ($_POST["vhrglev4rag3kg"]!="") ?  str_replace(",","",$_POST["vhrglev4rag3kg"]) : "0";  
	$vtariflev4koli = ($_POST["vtariflev4koli"]!="") ?  str_replace(",","",$_POST["vtariflev4koli"]) : "0";  
	$vqtylev4rag1koli = ($_POST["vqtylev4rag1koli"]!="") ?  str_replace(",","",$_POST["vqtylev4rag1koli"]) : "0";  
	$vhrglev4rag1koli = ($_POST["vhrglev4rag1koli"]!="") ?  str_replace(",","",$_POST["vhrglev4rag1koli"]) : "0";  
	$vqtylev4rag2koli = ($_POST["vqtylev4rag2koli"]!="") ?  str_replace(",","",$_POST["vqtylev4rag2koli"]) : "0";  
	$vhrglev4rag2koli = ($_POST["vhrglev4rag2koli"]!="") ?  str_replace(",","",$_POST["vhrglev4rag2koli"]) : "0";  
	$vqtylev4rag3koli = ($_POST["vqtylev4rag3koli"]!="") ?  str_replace(",","",$_POST["vqtylev4rag3koli"]) : "0";  
	$vhrglev4rag3koli = ($_POST["vhrglev4rag3koli"]!="") ?  str_replace(",","",$_POST["vhrglev4rag3koli"]) : "0";  
  if($_POST["fkey"] != ""){
    $sql  = "update tm_tarifbiaya set ckdcurrency='$_POST[kdcurr]',ckdnegaraasal='$_POST[kdnegaraasal]',ckdkotaasal='$_POST[kdkotaasal]', ";
	$sql .= "ckdnegaratujuan='$_POST[kdnegaratuj]',ckdkotatujuan='$_POST[kdkotatuj]', ";
	$sql .= "vtarifdasarkg='$hrgdasarkg',vtarifdasarkoli='$hrgdasarkoli', ";
	$sql .= "vtariflev1kg = '$vtariflev1kg',vqtylevlrag1kg = '$vqtylevlrag1kg',vhrglev1rag1kg = '$vhrglev1rag1kg',vqtylevlrag2kg = '$vqtylevlrag2kg', ";
	$sql .= "vhrglev1rag2kg = '$vhrglev1rag2kg',vqtylevlrag3kg = '$vqtylevlrag3kg',vhrglev1rag3kg = '$vhrglev1rag3kg', ";
	$sql .= "vtariflev1koli = '$vtariflev1koli',vqtylevlrag1koli = '$vqtylevlrag1koli',vhrglev1rag1koli = '$vhrglev1rag1koli', ";
	$sql .= "vqtylevlrag2koli = '$vqtylevlrag2koli',vhrglev1rag2koli = '$vhrglev1rag2koli',vqtylevlrag3koli = '$vqtylevlrag3koli', ";
	$sql .= "vhrglev1rag3koli = '$vhrglev1rag3koli', ";
	$sql .= "vtariflev2kg = '$vtariflev2kg',vqtylev2rag1kg = '$vqtylev2rag1kg',vhrglev2rag1kg = '$vhrglev2rag1kg',vqtylev2rag2kg = '$vqtylev2rag2kg', ";
	$sql .= "vhrglev2rag2kg = '$vhrglev2rag2kg',vqtylev2rag3kg = '$vqtylev2rag3kg',vhrglev2rag3kg = '$vhrglev2rag3kg', ";
	$sql .= "vtariflev2koli = '$vtariflev2koli',vqtylev2rag1koli = '$vqtylev2rag1koli',vhrglev2rag1koli = '$vhrglev2rag1koli', ";
	$sql .= "vqtylev2rag2koli = '$vqtylev2rag2koli',vhrglev2rag2koli = '$vhrglev2rag2koli',vqtylev2rag3koli = '$vqtylev2rag3koli', ";
	$sql .= "vhrglev2rag3koli = '$vhrglev2rag3koli', ";
	$sql .= "vtariflev3kg = '$vtariflev3kg',vqtylev3rag1kg = '$vqtylev3rag1kg',vhrglev3rag1kg = '$vhrglev3rag1kg',vqtylev3rag2kg = '$vqtylev3rag2kg', ";
	$sql .= "vhrglev3rag2kg = '$vhrglev3rag2kg',vqtylev3rag3kg = '$vqtylev3rag3kg',vhrglev3rag3kg = '$vhrglev3rag3kg', ";
	$sql .= "vtariflev3koli = '$vtariflev3koli',vqtylev3rag1koli = '$vqtylev3rag1koli',vhrglev3rag1koli = '$vhrglev3rag1koli', ";
	$sql .= "vqtylev3rag2koli = '$vqtylev3rag2koli',vhrglev3rag2koli = '$vhrglev3rag2koli',vqtylev3rag3koli = '$vqtylev3rag3koli', ";
	$sql .= "vhrglev3rag3koli = '$vhrglev3rag3koli', ";
	$sql .= "vtariflev4kg = '$vtariflev4kg',vqtylev4rag1kg = '$vqtylev4rag1kg',vhrglev4rag1kg = '$vhrglev4rag1kg',vqtylev4rag2kg = '$vqtylev4rag2kg', ";
	$sql .= "vhrglev4rag2kg = '$vhrglev4rag2kg',vqtylev4rag3kg = '$vqtylev4rag3kg',vhrglev4rag3kg = '$vhrglev4rag3kg', ";
	$sql .= "vtariflev4koli = '$vtariflev4koli',vqtylev4rag1koli = '$vqtylev4rag1koli',vhrglev4rag1koli = '$vhrglev4rag1koli', ";
	$sql .= "vqtylev4rag2koli = '$vqtylev4rag2koli',vhrglev4rag2koli = '$vhrglev4rag2koli',vqtylev4rag3koli = '$vqtylev4rag3koli', ";
	$sql .= "vhrglev4rag3koli = '$vhrglev4rag3koli', ";
	$sql .= "vfuelsurcharge='$hrgbhnbakar', ";
	$sql .= "cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where ckdtarif = '$_POST[fkey]' ";
  }else{
	$sql  = "insert into tm_tarifbiaya (ckdtarif,ckdcurrency,ckdnegaraasal,ckdkotaasal,ckdnegaratujuan,ckdkotatujuan, ";
	$sql .= "vtarifdasarkg,vtarifdasarkoli, ";
	$sql .= "vtariflev1kg,vqtylevlrag1kg,vhrglev1rag1kg,vqtylevlrag2kg,vhrglev1rag2kg,vqtylevlrag3kg,vhrglev1rag3kg, ";
	$sql .= "vtariflev1koli,vqtylevlrag1koli,vhrglev1rag1koli,vqtylevlrag2koli,vhrglev1rag2koli,vqtylevlrag3koli,vhrglev1rag3koli, ";
	$sql .= "vtariflev2kg,vqtylev2rag1kg,vhrglev2rag1kg,vqtylev2rag2kg,vhrglev2rag2kg,vqtylev2rag3kg,vhrglev2rag3kg, ";
	$sql .= "vtariflev2koli,vqtylev2rag1koli,vhrglev2rag1koli,vqtylev2rag2koli,vhrglev2rag2koli,vqtylev2rag3koli,vhrglev2rag3koli,";
	$sql .= "vtariflev3kg,vqtylev3rag1kg,vhrglev3rag1kg,vqtylev3rag2kg,vhrglev3rag2kg,vqtylev3rag3kg,vhrglev3rag3kg, ";
	$sql .= "vtariflev3koli,vqtylev3rag1koli,vhrglev3rag1koli,vqtylev3rag2koli,vhrglev3rag2koli,vqtylev3rag3koli,vhrglev3rag3koli,";
	$sql .= "vtariflev4kg,vqtylev4rag1kg,vhrglev4rag1kg,vqtylev4rag2kg,vhrglev4rag2kg,vqtylev4rag3kg,vhrglev4rag3kg, ";
	$sql .= "vtariflev4koli,vqtylev4rag1koli,vhrglev4rag1koli,vqtylev4rag2koli,vhrglev4rag2koli,vqtylev4rag3koli,vhrglev4rag3koli, ";
	$sql .= "vfuelsurcharge, cUserEntry, cDateEntry, cUserEdit, cDateEdit) values( ";
    $sql .= "'$_POST[kdtarif]','$_POST[kdcurr]','$_POST[kdnegaraasal]','$_POST[kdkotaasal]','$_POST[kdnegaratuj]','$_POST[kdkotatuj]', ";
    $sql .= "'$hrgdasarkg','$hrgdasarkoli', ";
	$sql .= "'$vtariflev1kg','$vqtylevlrag1kg','$vhrglev1rag1kg','$vqtylevlrag2kg','$vhrglev1rag2kg','$vqtylevlrag3kg','$vhrglev1rag3kg', ";
    $sql .= "'$vtariflev1koli','$vqtylevlrag1koli','$vhrglev1rag1koli','$vqtylevlrag2koli','$vhrglev1rag2koli','$vqtylevlrag3koli','$vhrglev1rag3koli', ";
    $sql .= "'$vtariflev2kg','$vqtylev2rag1kg','$vhrglev2rag1kg','$vqtylev2rag2kg','$vhrglev2rag2kg','$vqtylev2rag3kg','$vhrglev2rag3kg', ";
    $sql .= "'$vtariflev2koli','$vqtylev2rag1koli','$vhrglev2rag1koli','$vqtylev2rag2koli','$vhrglev2rag2koli','$vqtylev2rag3koli','$vhrglev2rag3koli', ";
    $sql .= "'$vtariflev3kg','$vqtylev3rag1kg','$vhrglev3rag1kg','$vqtylev3rag2kg','$vhrglev3rag2kg','$vqtylev3rag3kg','$vhrglev3rag3kg', ";
    $sql .= "'$vtariflev3koli','$vqtylev3rag1koli','$vhrglev3rag1koli','$vqtylev3rag2koli','$vhrglev3rag2koli','$vqtylev3rag3koli','$vhrglev3rag3koli', ";
    $sql .= "'$vtariflev4kg','$vqtylev4rag1kg','$vhrglev4rag1kg','$vqtylev4rag2kg','$vhrglev4rag2kg','$vqtylev4rag3kg','$vhrglev4rag3kg', ";
    $sql .= "'$vtariflev4koli','$vqtylev4rag1koli','$vhrglev4rag1koli','$vqtylev4rag2koli','$vhrglev4rag2koli','$vqtylev4rag3koli','$vhrglev4rag3koli', ";
	$sql .= "'$hrgbhnbakar', '$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_tarifbiaya WHERE ckdtarif = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT tarif.*, asal.vnmkota AS kotaasal, ngrasal.vnmnegara AS negaraasal, tuj.vnmkota AS kotatuj, ngrtuj.vnmnegara AS negaratujuan ";
$sql .= "FROM tm_tarifbiaya tarif ";
$sql .= "LEFT JOIN tm_kota asal ON asal.ckdkota = tarif.ckdkotaasal ";
$sql .= "LEFT JOIN tm_negara ngrasal ON ngrasal.ckdnegara = tarif.ckdnegaraasal ";
$sql .= "LEFT JOIN tm_kota tuj ON tuj.ckdkota = tarif.ckdkotatujuan ";
$sql .= "LEFT JOIN tm_negara ngrtuj ON ngrtuj.ckdnegara = tarif.ckdnegaratujuan ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE tarif.ckdtarif = '$_GET[key]' ";
}
$sql .= " ORDER BY tarif.ckdtarif ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $admGrdTpl->template->MergeBlock("blk_curr","adodb","SELECT ckdcurrency,vnmcurrency FROM tm_currency ORDER BY ckdcurrency");
  $admGrdTpl->template->MergeBlock("blk_asal","adodb","SELECT ckdnegara,vnmnegara FROM tm_negara ORDER BY ckdnegara");
  $admGrdTpl->template->MergeBlock("blk_tuj","adodb","SELECT ckdnegara,vnmnegara FROM tm_negara ORDER BY ckdnegara");
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[TARIF_DAN_BIAYA_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>