<?php
require_once "../includes/global.inc.php";

$kode = $_GET['kd'];
$curr = $_GET['cr'];

$sql = "SELECT SUM(IF(cid='IN',vjumlah,0)+IF(cid='OUT',vjumlah*-1,0)) AS vjumlah FROM vw_kartu_pelanggan WHERE ckdagent = '$kode' and ckdcurrency = '$curr' ";
$rs = $conn->Execute($sql);

$i=0;
while(!$rs->EOF){
  $response->rows[$i]["saldo"]=$rs->fields["vjumlah"];
  $i++;
  $rs->MoveNext();
}        
$rs->Close();

echo json_encode($response);

?>
