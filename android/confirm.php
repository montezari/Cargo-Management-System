<?php
require_once "../includes/global.inc.php";
  

  $data = array();
  $response = array();
  $code = "";
  $message = "";
  if(isset($_POST["id"]) && isset($_POST["stat"])){
    $nosmu = $_POST["id"];
    $status = ($_POST["stat"]!="") ? $_POST["stat"] : "O";
	$sql = "SELECT count(*) as jml FROM tr_muatanudara WHERE cnomuatan = '$nosmu' ";
    $rs = $conn->Execute($sql);
    if($rs->fields["jml"]>0){
      if($status!=""){
	    $sql = "update tr_muatanudara set cstatus = '$status' WHERE cnomuatan = '$nosmu' ";
	    $rs = $conn->Execute($sql);
	    if($rs){
	      //$data["info"] = "Success update data.";
	      //$data["success"] = true;
		  $code = "200";
		  $message = "Success update data";
	    }else{
	      //$data["info"] = "Failed update data.";
	      //$data["success"] = false;
		  $code = "300";
		  $message = "Failed update data";
	    }
	  }
    }else{
      //$data["info"] = "Data not found.";
      //$data["success"] = false;
	  $code = "300";
	  $message = "Data not found";
    }
  }else{
      //$data["info"] = "Parameter not defined.";
      //$data["success"] = false;
    $code = "300";
    $message = "Parameter not defined";
  }
  //echo json_encode($data);
  $response["code"] = $code;
  $response["data"] = $data;			
  $response["message"] = $message;
  echo json_encode($response);
?>