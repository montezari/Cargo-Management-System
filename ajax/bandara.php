<?php
require_once "../includes/global.inc.php";

$page = $_GET['page'];
$limit = $_GET['rows']; 
$sidx = $_GET['sidx'];
$sord = $_GET['sord'];
$searchTerm = $_GET['searchTerm'];

if(!$sidx) $sidx =1;
if ($searchTerm=="") {
	$searchTerm="%";
} else {
	$searchTerm = "%" . $searchTerm . "%";
}

$sql = "SELECT COUNT(*) AS count FROM tm_bandara WHERE vnmbandara like '$searchTerm' ";
$rs = $conn->Execute($sql);
$count = $rs->fields["count"];

if( $count >0 ) {
	$total_pages = ceil($count/$limit);
} else {
	$total_pages = 0;
}
if ($page > $total_pages) $page=$total_pages;
$start = $limit*$page - $limit; 

$sql  = "SELECT bdr.ckdbandara, bdr.vnmbandara, bdr.ckdkota, kota.vnmkota, bdr.ckdnegara, neg.vnmnegara ";
$sql .= "FROM tm_bandara bdr ";
$sql .= "LEFT JOIN tm_negara neg ON neg.ckdnegara = bdr.ckdnegara ";
$sql .= "LEFT JOIN tm_kota kota ON kota.ckdkota = bdr.ckdkota ";
$sql .= "WHERE bdr.ckdbandara is not null ";

if($total_pages!=0) $sql = $sql." AND bdr.vnmbandara like '$searchTerm'  ORDER BY $sidx $sord LIMIT $start , $limit";
else $sql =  $sql." AND bdr.vnmbandara like '$searchTerm'  ORDER BY $sidx $sord";
$rs = $conn->Execute($sql);

$response->page = $page;
$response->total = $total_pages;
$response->records = $count;
$i=0;
while(!$rs->EOF){
  $response->rows[$i]["ckdbandara"]=$rs->fields["ckdbandara"];
  $response->rows[$i]["vnmbandara"]=$rs->fields["vnmbandara"];
  $response->rows[$i]["ckdkota"]=$rs->fields["ckdkota"];
  $response->rows[$i]["vnmkota"]=$rs->fields["vnmkota"];
  $response->rows[$i]["vnmnegara"]=$rs->fields["vnmnegara"];
  $i++;
  $rs->MoveNext();
}        
$rs->Close();

echo json_encode($response);

?>
