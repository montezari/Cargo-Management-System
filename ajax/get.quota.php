<?php
require_once "../includes/global.inc.php";

$kode = $_GET['kd'];
$tgl = $_GET['tgl'];

$sql  = "SELECT ckuotakg, ckuotakoli FROM tm_penerbangan WHERE cnopenerbangan = '$kode' ";
$rs = $conn->Execute($sql);
$quotakg = $rs->fields["ckuotakg"];
$quotakoli = $rs->fields["ckuotakoli"];


$sql  = "SELECT cnopenerbangan, DATE_FORMAT(dtglterbang,'%d/%m/%Y') AS dtglterbang, SUM(cjmlberat) AS cjmlberat, SUM(cjmlkoli) AS cjmlkoli ";
$sql .= "FROM tr_muatanudara ";
$sql .= "WHERE cnopenerbangan = '$kode' and DATE_FORMAT(dtglterbang,'%d/%m/%Y') = '$tgl' ";
$sql .= "GROUP BY cnopenerbangan, DATE_FORMAT(dtglterbang,'%d/%m/%Y') ";
$rs = $conn->Execute($sql);
$jmlkg = $rs->fields["cjmlberat"];
$jmlkoli = $rs->fields["cjmlkoli"];

$response->rows[0]["sisakg"]=$quotakg-$jmlkg;
$response->rows[0]["sisakoli"]=$quotakoli-$jmlkoli;

echo json_encode($response);

?>
