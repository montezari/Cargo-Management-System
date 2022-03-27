<?php
require_once "../includes/global.inc.php";
  
  $data = array();
  $response = array();
  $code = "";
  $message = "";
  if(isset($_POST["user"]) && isset($_POST["pass"])){
    $user = $_POST["user"];
    $pass = encrypt_decrypt('encrypt',$_POST["pass"]);
    $sql = "select * from tsm_user where UPPER(cUserName) = UPPER('$user') and cPassword = '".$pass."'";
    $rs = $conn->Execute($sql);
    if($rs->RecordCount()>0){
	  $code = "200";
	  $data["nama"] = $rs->fields["cNamaLengkap"];
      $message = "Success login";
   }else{
	  $code = "300";
      $message = "User not found or wrong password";
    }
  }else{
    $code = "300";
    $message = "User or password not defined";
  }
  //echo json_encode($data);
  $response["code"] = $code;
  $response["data"] = $data;			
  $response["message"] = $message;
  echo json_encode($response);
?>