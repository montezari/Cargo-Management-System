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

$sql = "SELECT COUNT(*) AS count FROM tm_agent WHERE vnmagent like '$searchTerm' ";
$rs = $conn->Execute($sql);
$count = $rs->fields["count"];

if( $count >0 ) {
	$total_pages = ceil($count/$limit);
} else {
	$total_pages = 0;
}
if ($page > $total_pages) $page=$total_pages;
$start = $limit*$page - $limit; 

$sql  = "SELECT ckdagent,vnmagent,ckdnegara,ckdkota FROM tm_agent WHERE ckdagent is not null ";

if($total_pages!=0) $sql = $sql." AND vnmagent like '$searchTerm'  ORDER BY $sidx $sord LIMIT $start , $limit";
else $sql =  $sql." AND vnmagent like '$searchTerm'  ORDER BY $sidx $sord";
$rs = $conn->Execute($sql);

$response->page = $page;
$response->total = $total_pages;
$response->records = $count;
$i=0;
while(!$rs->EOF){
  $response->rows[$i]["ckdagent"]=$rs->fields["ckdagent"];
  $response->rows[$i]["vnmagent"]=$rs->fields["vnmagent"];
  $response->rows[$i]["ckdkota"]=$rs->fields["ckdkota"];
  $i++;
  $rs->MoveNext();
}        
$rs->Close();

echo json_encode($response);

?>
