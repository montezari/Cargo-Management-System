<?php
require_once "includes/global.inc.php";

$valid = true;
if (($_REQUEST["m"] == "master.negara") && isset($_POST['kdnegara'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_negara WHERE ckdnegara = '".$_POST['kdnegara']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}
if (($_REQUEST["m"] == "master.kota") && isset($_POST['kdkota'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_kota WHERE ckdkota = '".$_POST['kdkota']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}
if (($_REQUEST["m"] == "master.tarif") && isset($_POST['kdtarif'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_tarifbiaya WHERE ckdtarif = '".$_POST['kdtarif']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}
if (($_REQUEST["m"] == "master.bandara") && isset($_POST['kdbandara'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_bandara WHERE ckdbandara = '".$_POST['kdbandara']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}
if (($_REQUEST["m"] == "master.penerbangan") && isset($_POST['kdterbang'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_penerbangan WHERE cnopenerbangan = '".$_POST['kdterbang']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}
if (($_REQUEST["m"] == "master.biayaadd") && isset($_POST['kdbiaya'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_biayaadd WHERE cbiayaadd = '".$_POST['kdbiaya']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}
if (($_REQUEST["m"] == "master.jenissetor") && isset($_POST['kdsetoran'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_jenissetor WHERE ckdjenissetor = '".$_POST['kdsetoran']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}
if (($_REQUEST["m"] == "master.currency") && isset($_POST['kdcurr'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_currency WHERE ckdcurrency = '".$_POST['kdcurr']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}if (($_REQUEST["m"] == "master.komoditi") && isset($_POST['kdkomoditi'])){
  $sql = "SELECT COUNT(*) as jml FROM tm_komoditi WHERE ckdkomoditi = '".$_POST['kdkomoditi']."' ";
  $rs = $conn->Execute($sql);
  if($rs->fields["jml"]>0){
    $valid=false;
  }
}

echo json_encode(array(
    'valid' => $valid
));

?>