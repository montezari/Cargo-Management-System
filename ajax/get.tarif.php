<?php
require_once "../includes/global.inc.php";

$agent = $_GET['ag'];
$curr = $_GET['cr'];
$kotaasal = $_GET['asal'];
$kotatuj = $_GET['tuj'];
$jml = $_GET['jml'];

$level=-1;
$sql = "SELECT cleveltarif FROM tm_agent WHERE ckdagent = '$agent' ";
$rs = $conn->Execute($sql);
$level = $rs->fields["cleveltarif"];

switch($level){
  default:
	$response->rows[0]["tarifkg"]=0;
	$response->rows[0]["tarifkoli"]=0;
 	$response->rows[0]["tariffuel"]=0;
  break;
  case "0":
	$sql  = "SELECT vfuelsurcharge, vtarifdasarkg, vtarifdasarkoli FROM tm_tarifbiaya ";
	$sql .= "WHERE ckdkotaasal = '$kotaasal' AND ckdkotatujuan = '$kotatuj' AND ckdcurrency = '$curr' ";
	$rs = $conn->Execute($sql);
	$response->rows[0]["tarifkg"]=$rs->fields["vtarifdasarkg"];
	$response->rows[0]["tarifkoli"]=$rs->fields["vtarifdasarkoli"];
 	$response->rows[0]["tariffuel"]=$rs->fields["vfuelsurcharge"];
  break;
  case "1":
	$sql  = "SELECT vqtylevlrag1kg, vqtylevlrag2kg, vqtylevlrag3kg, ";
    $sql .= "vqtylevlrag1koli,vqtylevlrag2koli,vqtylevlrag3koli ";
    $sql .= "FROM tm_tarifbiaya ";
	$sql .= "WHERE ckdkotaasal = '$kotaasal' AND ckdkotatujuan = '$kotatuj' AND ckdcurrency = '$curr' ";
	$rs = $conn->Execute($sql);
	$kg_range1=$rs->fields["vqtylevlrag1kg"]; 
	$kg_range2=$rs->fields["vqtylevlrag2kg"]; 
	$kg_range3=$rs->fields["vqtylevlrag3kg"]; 
	$koli_range1=$rs->fields["vqtylevlrag1koli"]; 
	$koli_range2=$rs->fields["vqtylevlrag2koli"]; 
	$koli_range3=$rs->fields["vqtylevlrag3koli"]; 

	$sql  = "SELECT vfuelsurcharge,";
	$sql .= "vtariflev1kg, vhrglev1rag1kg, vhrglev1rag2kg,vhrglev1rag3kg, ";
	$sql .= "vtariflev1koli, vhrglev1rag1koli,vhrglev1rag2koli,vhrglev1rag3koli ";
	$sql .= "FROM tm_tarifbiaya ";
	$sql .= "WHERE ckdkotaasal = '$kotaasal' AND ckdkotatujuan = '$kotatuj' AND ckdcurrency = '$curr' ";
	$rs = $conn->Execute($sql);
	$kg_tarifdasar=$rs->fields["vtariflev1kg"]; 
	$kg_tarif1=$rs->fields["vhrglev1rag1kg"]; 
	$kg_tarif2=$rs->fields["vhrglev1rag2kg"]; 
	$kg_tarif3=$rs->fields["vhrglev1rag3kg"]; 
	$koli_tarifdasar=$rs->fields["vtariflev1koli"]; 
	$koli_tarif1=$rs->fields["vhrglev1rag1koli"]; 
	$koli_tarif2=$rs->fields["vhrglev1rag2koli"]; 
	$koli_tarif3=$rs->fields["vhrglev1rag3koli"]; 

 	$response->rows[0]["tariffuel"]=$rs->fields["vfuelsurcharge"];
    /* harga KG */
	if($jml>=0 && $jml<$kg_range1){
	   $response->rows[0]["tarifkg"]=$kg_tarifdasar;
	}elseif($jml>=$kg_range1 && $jml<$kg_range2){
	   $response->rows[0]["tarifkg"]=$kg_tarif1;
	}elseif($jml>=$kg_range2 && $jml<$kg_range3){
	   $response->rows[0]["tarifkg"]=$kg_tarif2;
	}elseif($jml>=$kg_range3){
	   $response->rows[0]["tarifkg"]=$kg_tarif2;
	}
    /* harga KOLI */
	if($jml>=0 && $jml<$koli_range1){
	   $response->rows[0]["tarifkoli"]=$koli_tarifdasar;
	}elseif($jml>=$koli_range1 && $jml<$koli_range2){
	   $response->rows[0]["tarifkoli"]=$koli_tarif1;
	}elseif($jml>=$koli_range2 && $jml<$koli_range3){
	   $response->rows[0]["tarifkoli"]=$koli_tarif2;
	}elseif($jml>=$koli_range3){
	   $response->rows[0]["tarifkoli"]=$koli_tarif3;
	}
  break;
  case "2":
	$sql  = "SELECT vqtylev2rag1kg, vqtylev2rag2kg, vqtylev2rag3kg, ";
    $sql .= "vqtylev2rag1koli,vqtylev2rag2koli,vqtylev2rag3koli ";
    $sql .= "FROM tm_tarifbiaya ";
	$sql .= "WHERE ckdkotaasal = '$kotaasal' AND ckdkotatujuan = '$kotatuj' AND ckdcurrency = '$curr' ";
	$rs = $conn->Execute($sql);
	$kg_range1=$rs->fields["vqtylev2rag1kg"]; 
	$kg_range2=$rs->fields["vqtylev2rag2kg"]; 
	$kg_range3=$rs->fields["vqtylev2rag3kg"]; 
	$koli_range1=$rs->fields["vqtylev2rag1koli"]; 
	$koli_range2=$rs->fields["vqtylev2rag2koli"]; 
	$koli_range3=$rs->fields["vqtylev2rag3koli"]; 

	$sql  = "SELECT vfuelsurcharge,";
	$sql .= "vtariflev2kg, vhrglev2rag1kg, vhrglev2rag2kg,vhrglev2rag3kg, ";
	$sql .= "vtariflev2koli, vhrglev2rag1koli,vhrglev2rag2koli,vhrglev2rag3koli ";
	$sql .= "FROM tm_tarifbiaya ";
	$sql .= "WHERE ckdkotaasal = '$kotaasal' AND ckdkotatujuan = '$kotatuj' AND ckdcurrency = '$curr' ";
	$rs = $conn->Execute($sql);
	$kg_tarifdasar=$rs->fields["vtariflev2kg"]; 
	$kg_tarif1=$rs->fields["vhrglev2rag1kg"]; 
	$kg_tarif2=$rs->fields["vhrglev2rag2kg"]; 
	$kg_tarif3=$rs->fields["vhrglev2rag3kg"]; 
	$koli_tarifdasar=$rs->fields["vtariflev2koli"]; 
	$koli_tarif1=$rs->fields["vhrglev2rag1koli"]; 
	$koli_tarif2=$rs->fields["vhrglev2rag2koli"]; 
	$koli_tarif3=$rs->fields["vhrglev2rag3koli"]; 

 	$response->rows[0]["tariffuel"]=$rs->fields["vfuelsurcharge"];
    /* harga KG */
	if($jml>=0 && $jml<$kg_range1){
	   $response->rows[0]["tarifkg"]=$kg_tarifdasar;
	}elseif($jml>=$kg_range1 && $jml<$kg_range2){
	   $response->rows[0]["tarifkg"]=$kg_tarif1;
	}elseif($jml>=$kg_range2 && $jml<$kg_range3){
	   $response->rows[0]["tarifkg"]=$kg_tarif2;
	}elseif($jml>=$kg_range3){
	   $response->rows[0]["tarifkg"]=$kg_tarif2;
	}
    /* harga KOLI */
	if($jml>=0 && $jml<$koli_range1){
	   $response->rows[0]["tarifkoli"]=$koli_tarifdasar;
	}elseif($jml>=$koli_range1 && $jml<$koli_range2){
	   $response->rows[0]["tarifkoli"]=$koli_tarif1;
	}elseif($jml>=$koli_range2 && $jml<$koli_range3){
	   $response->rows[0]["tarifkoli"]=$koli_tarif2;
	}elseif($jml>=$koli_range3){
	   $response->rows[0]["tarifkoli"]=$koli_tarif3;
	}
  break;
  case "3":
	$sql  = "SELECT vqtylev3rag1kg, vqtylev3rag2kg, vqtylev3rag3kg, ";
    $sql .= "vqtylev3rag1koli,vqtylev3rag2koli,vqtylev3rag3koli ";
    $sql .= "FROM tm_tarifbiaya ";
	$sql .= "WHERE ckdkotaasal = '$kotaasal' AND ckdkotatujuan = '$kotatuj' AND ckdcurrency = '$curr' ";
	$rs = $conn->Execute($sql);
	$kg_range1=$rs->fields["vqtylev3rag1kg"]; 
	$kg_range2=$rs->fields["vqtylev3rag2kg"]; 
	$kg_range3=$rs->fields["vqtylev3rag3kg"]; 
	$koli_range1=$rs->fields["vqtylev3rag1koli"]; 
	$koli_range2=$rs->fields["vqtylev3rag2koli"]; 
	$koli_range3=$rs->fields["vqtylev3rag3koli"]; 
    
	$sql  = "SELECT vfuelsurcharge,";
	$sql .= "vtariflev3kg, vhrglev3rag1kg, vhrglev3rag2kg,vhrglev3rag3kg, ";
	$sql .= "vtariflev3koli, vhrglev3rag1koli,vhrglev3rag2koli,vhrglev3rag3koli ";
	$sql .= "FROM tm_tarifbiaya ";
	$sql .= "WHERE ckdkotaasal = '$kotaasal' AND ckdkotatujuan = '$kotatuj' AND ckdcurrency = '$curr' ";
	$rs = $conn->Execute($sql);
	$kg_tarifdasar=$rs->fields["vtariflev3kg"]; 
	$kg_tarif1=$rs->fields["vhrglev3rag1kg"]; 
	$kg_tarif2=$rs->fields["vhrglev3rag2kg"]; 
	$kg_tarif3=$rs->fields["vhrglev3rag3kg"]; 
	$koli_tarifdasar=$rs->fields["vtariflev3koli"]; 
	$koli_tarif1=$rs->fields["vhrglev3rag1koli"]; 
	$koli_tarif2=$rs->fields["vhrglev3rag2koli"]; 
	$koli_tarif3=$rs->fields["vhrglev3rag3koli"]; 

 	$response->rows[0]["tariffuel"]=$rs->fields["vfuelsurcharge"];
    /* harga KG */
	if($jml>=0 && $jml<$kg_range1){
	   $response->rows[0]["tarifkg"]=$kg_tarifdasar;
	}elseif($jml>=$kg_range1 && $jml<$kg_range2){
	   $response->rows[0]["tarifkg"]=$kg_tarif1;
	}elseif($jml>=$kg_range2 && $jml<$kg_range3){
	   $response->rows[0]["tarifkg"]=$kg_tarif2;
	}elseif($jml>=$kg_range3){
	   $response->rows[0]["tarifkg"]=$kg_tarif2;
	}
    /* harga KOLI */
	if($jml>=0 && $jml<$koli_range1){
	   $response->rows[0]["tarifkoli"]=$koli_tarifdasar;
	}elseif($jml>=$koli_range1 && $jml<$koli_range2){
	   $response->rows[0]["tarifkoli"]=$koli_tarif1;
	}elseif($jml>=$koli_range2 && $jml<$koli_range3){
	   $response->rows[0]["tarifkoli"]=$koli_tarif2;
	}elseif($jml>=$koli_range3){
	   $response->rows[0]["tarifkoli"]=$koli_tarif3;
	}
  break;
  case "4":
	$sql  = "SELECT vqtylev4rag1kg, vqtylev4rag2kg, vqtylev4rag3kg, ";
    $sql .= "vqtylev4rag1koli,vqtylev4rag2koli,vqtylev4rag3koli ";
    $sql .= "FROM tm_tarifbiaya ";
	$sql .= "WHERE ckdkotaasal = '$kotaasal' AND ckdkotatujuan = '$kotatuj' AND ckdcurrency = '$curr' ";
	$rs = $conn->Execute($sql);
	$kg_range1=$rs->fields["vqtylev4rag1kg"]; 
	$kg_range2=$rs->fields["vqtylev4rag2kg"]; 
	$kg_range3=$rs->fields["vqtylev4rag3kg"]; 
	$koli_range1=$rs->fields["vqtylev4rag1koli"]; 
	$koli_range2=$rs->fields["vqtylev4rag2koli"]; 
	$koli_range3=$rs->fields["vqtylev4rag3koli"]; 

	$sql  = "SELECT vfuelsurcharge,";
	$sql .= "vtariflev4kg, vhrglev4rag1kg, vhrglev4rag2kg,vhrglev4rag3kg, ";
	$sql .= "vtariflev4koli, vhrglev4rag1koli,vhrglev4rag2koli,vhrglev4rag3koli ";
	$sql .= "FROM tm_tarifbiaya ";
	$sql .= "WHERE ckdkotaasal = '$kotaasal' AND ckdkotatujuan = '$kotatuj' AND ckdcurrency = '$curr' ";
	$rs = $conn->Execute($sql);
	$kg_tarifdasar=$rs->fields["vtariflev4kg"]; 
	$kg_tarif1=$rs->fields["vhrglev4rag1kg"]; 
	$kg_tarif2=$rs->fields["vhrglev4rag2kg"]; 
	$kg_tarif3=$rs->fields["vhrglev4rag3kg"]; 
	$koli_tarifdasar=$rs->fields["vtariflev4koli"]; 
	$koli_tarif1=$rs->fields["vhrglev4rag1koli"]; 
	$koli_tarif2=$rs->fields["vhrglev4rag2koli"]; 
	$koli_tarif3=$rs->fields["vhrglev4rag3koli"]; 

 	$response->rows[0]["tariffuel"]=$rs->fields["vfuelsurcharge"];
    /* harga KG */
	if($jml>=0 && $jml<$kg_range1){
	   $response->rows[0]["tarifkg"]=$kg_tarifdasar;
	}elseif($jml>=$kg_range1 && $jml<$kg_range2){
	   $response->rows[0]["tarifkg"]=$kg_tarif1;
	}elseif($jml>=$kg_range2 && $jml<$kg_range3){
	   $response->rows[0]["tarifkg"]=$kg_tarif2;
	}elseif($jml>=$kg_range3){
	   $response->rows[0]["tarifkg"]=$kg_tarif2;
	}
    /* harga KOLI */
	if($jml>=0 && $jml<$koli_range1){
	   $response->rows[0]["tarifkoli"]=$koli_tarifdasar;
	}elseif($jml>=$koli_range1 && $jml<$koli_range2){
	   $response->rows[0]["tarifkoli"]=$koli_tarif1;
	}elseif($jml>=$koli_range2 && $jml<$koli_range3){
	   $response->rows[0]["tarifkoli"]=$koli_tarif2;
	}elseif($jml>=$koli_range3){
	   $response->rows[0]["tarifkoli"]=$koli_tarif3;
	}
  break;
}

$rs->Close();

echo json_encode($response);

?>
