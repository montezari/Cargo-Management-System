<?php
require_once "../includes/global.inc.php";

$page = $_GET['page'];
$limit = $_GET['rows']; 
$sidx = $_GET['sidx'];
$sord = $_GET['sord'];
$searchTerm = $_GET['searchTerm'];
$param = $_GET['param'];

if(!$sidx) $sidx =1;
if ($searchTerm=="") {
	$searchTerm="%";
} else {
	$searchTerm = "%" . $searchTerm . "%";
}

$sql = "SELECT COUNT(*) AS count FROM tm_kota WHERE ckdnegara = '$param' AND vnmkota like '$searchTerm' ";
$rs = $conn->Execute($sql);
$count = $rs->fields["count"];

if( $count >0 ) {
	$total_pages = ceil($count/$limit);
} else {
	$total_pages = 0;
}
if ($page > $total_pages) $page=$total_pages;
$start = $limit*$page - $limit; 

$sql  = "SELECT ckdkota,vnmkota,vnmprovisi FROM tm_kota WHERE ckdnegara = '$param' ";

if($total_pages!=0) $sql = $sql." AND vnmkota like '$searchTerm'  ORDER BY $sidx $sord LIMIT $start , $limit";
else $sql =  $sql." AND vnmkota like '$searchTerm'  ORDER BY $sidx $sord";
$rs = $conn->Execute($sql);

$response->page = $page;
$response->total = $total_pages;
$response->records = $count;
$i=0;
while(!$rs->EOF){
  $response->rows[$i]["ckdkota"]=$rs->fields["ckdkota"];
  $response->rows[$i]["vnmkota"]=$rs->fields["vnmkota"];
  $response->rows[$i]["vnmprovisi"]=$rs->fields["vnmprovisi"];
  $i++;
  $rs->MoveNext();
}        
$rs->Close();

echo json_encode($response);

?>
