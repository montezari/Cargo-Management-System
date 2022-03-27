<?php
require_once "../includes/global.inc.php";
  
  $response = array();
  $code = "";
  $message = "";
  if(isset($_POST["id"])){
    $nosmu = $_POST["id"];
	if($nosmu!=""){
      $sql  = "SELECT smu.*, agn.vnmagent, kota.vnmkota as kotatuj, tran.vnmkota AS kotatrans ";
      $sql .= "FROM tr_muatanudara smu ";
      $sql .= "LEFT JOIN tm_agent agn ON agn.ckdagent = smu.ckdagent ";
      $sql .= "LEFT JOIN tm_kota kota ON kota.ckdkota = smu.ckdkotatujuan ";
      $sql .= "LEFT JOIN tm_kota tran ON tran.ckdkota = smu.ckdkotatransit ";
      $sql .= "WHERE smu.cnomuatan = '$nosmu' ";
      $rs = $conn->Execute($sql);
      if($rs->RecordCount() > 0){
        $sql  = "SELECT smu.*, agn.vnmagent, kota.vnmkota as kotatuj, tran.vnmkota AS kotatrans ";
        $sql .= "FROM tr_muatanudara smu ";
        $sql .= "LEFT JOIN tm_agent agn ON agn.ckdagent = smu.ckdagent ";
        $sql .= "LEFT JOIN tm_kota kota ON kota.ckdkota = smu.ckdkotatujuan ";
        $sql .= "LEFT JOIN tm_kota tran ON tran.ckdkota = smu.ckdkotatransit ";
        $sql .= "WHERE smu.cnomuatan = '$nosmu' AND smu.cstatus = 'F' ";
        $rsf = $conn->Execute($sql);
	    if($rsf->RecordCount() > 0){
          $code = "300";
	      $message = "Data already confirm";
		}else{
		  $bykfield = $rs->FieldCount();
          $data = array();
          while(!$rs->EOF){
            for ($i = 0; $i < $bykfield; $i++){
              $fieldname = $rs->FetchField($i)->name;
	          $data[$fieldname] = $rs->fields[$fieldname];
	        } 
	        $rs->MoveNext();
          }
          //$data["success"] = true;
          $code = "200";
	      $message = "Success";
	      $rs->Close();
		}
	  }else{
        $code = "300";
	    $message = "Data not found";
	  }
    }else{
      //$data["info"] = "Parameter is null or blank.";
	  //$data["success"] = false;
	  $code = "300";
	  $message = "Parameter is null or blank";
	}
  }else{
    //$data["info"] = "Parameter not defined.";
	//$data["success"] = false;
	$code = "300";
	$message = "Parameter not defined";
  }
  //echo json_encode($data);
  //array_push($response,$data);	
  $response["code"] = $code;
  $response["data"] = $data;			
  $response["message"] = $message;
  echo json_encode($response);
?>