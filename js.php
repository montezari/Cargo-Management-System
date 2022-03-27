<?php

$script = $_GET['src'];
if(isset($_GET['src'])){
  if(file_exists("includes/js/".$script.".js")) {
    echo file_get_contents("includes/js/".$script.".js");
  }else{
    echo "";
  }
}else{
  echo "";
}
?>