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

$sql = "SELECT COUNT(*) AS count FROM tm_penerbangan WHERE cnopenerbangan like '$searchTerm' ";
$rs = $conn->Execute($sql);
$count = $rs->fields["count"];

if( $count >0 ) {
	$total_pages = ceil($count/$limit);
} else {
	$total_pages = 0;
}
if ($page > $total_pages) $page=$total_pages;
$start = $limit*$page - $limit; 

$sql  = "SELECT pnb.cnopenerbangan, 0 AS csisakg, 0 AS csisakoli, asal.vnmkota AS vnmkotaasal, tuj.vnmkota AS vnmkotatuj ";
$sql .= "FROM tm_penerbangan pnb ";  
$sql .= "LEFT JOIN tm_kota asal ON asal.ckdkota = pnb.ckdkotaasal ";  
$sql .= "LEFT JOIN tm_kota tuj ON tuj.ckdkota = pnb.ckdkotatujuan ";  
$sql .= "WHERE pnb.cnopenerbangan IS NOT NULL ";

if($total_pages!=0) $sql = $sql." AND cnopenerbangan like '$searchTerm'  ORDER BY $sidx $sord LIMIT $start , $limit";
else $sql =  $sql." AND cnopenerbangan like '$searchTerm'  ORDER BY $sidx $sord";
$rs = $conn->Execute($sql);

$response->page = $page;
$response->total = $total_pages;
$response->records = $count;
$i=0;
while(!$rs->EOF){
  $response->rows[$i]["cnopenerbangan"]=$rs->fields["cnopenerbangan"];
  $response->rows[$i]["csisakg"]=$rs->fields["csisakg"];
  $response->rows[$i]["csisakoli"]=$rs->fields["csisakoli"];
  $response->rows[$i]["vnmkotaasal"]=$rs->fields["vnmkotaasal"];
  $response->rows[$i]["vnmkotatuj"]=$rs->fields["vnmkotatuj"];
  $i++;
  $rs->MoveNext();
}        
$rs->Close();

echo json_encode($response);

?>
