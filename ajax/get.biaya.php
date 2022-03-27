<?php
require_once "../includes/global.inc.php";

$curr = $_GET['cr'];

$sql = "SELECT vbiayaadmsmu, vbiayalain, vppn FROM tm_biayaadd WHERE ckdcurrency = '$curr' ";
$rs = $conn->Execute($sql);

$i=0;
while(!$rs->EOF){
  $response->rows[$i]["biayasmu"]=$rs->fields["vbiayaadmsmu"];
  $response->rows[$i]["biayalain"]=$rs->fields["vbiayalain"];
  $response->rows[$i]["ppn"]=$rs->fields["vppn"];
  $i++;
  $rs->MoveNext();
}        
$rs->Close();

echo json_encode($response);

?>
