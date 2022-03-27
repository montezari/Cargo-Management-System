<?php

function konversi($x){
   
  $x = abs($x);
  $angka = array ("","satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
  $temp = "";
   
  if($x < 12){
   $temp = " ".$angka[$x];
  }else if($x<20){
   $temp = konversi($x - 10)." belas";
  }else if ($x<100){
   $temp = konversi($x/10)." puluh". konversi($x%10);
  }else if($x<200){
   $temp = " seratus".konversi($x-100);
  }else if($x<1000){
   $temp = konversi($x/100)." ratus".konversi($x%100);  
  }else if($x<2000){
   $temp = " seribu".konversi($x-1000);
  }else if($x<1000000){
   $temp = konversi($x/1000)." ribu".konversi($x%1000);  
  }else if($x<1000000000){
   $temp = konversi($x/1000000)." juta".konversi($x%1000000);
  }else if($x<1000000000000){
   $temp = konversi($x/1000000000)." milyar".konversi($x%1000000000);
  }
   
  return $temp;
 }
   
 function tkoma($x){
  $str = stristr($x,",");
  $ex = explode(',',$x);
   
  if(($ex[1]/10) >= 1){
   $a = abs($ex[1]);
  }
  $string = array("nol", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan",   "sembilan","sepuluh", "sebelas");
  $temp = "";
  
  $a2 = $ex[1]/10;
  $pjg = strlen($str);
  $i =1;
     
   
  if($a>=1 && $a< 12){  
   $temp .= " ".$string[$a];
  }else if($a>12 && $a < 20){  
   $temp .= konversi($a - 10)." belas";
  }else if ($a>20 && $a<100){  
   $temp .= konversi($a / 10)." puluh". konversi($a % 10);
  }else{
   if($a2<1){
     
    while ($i<$pjg){    
     $char = substr($str,$i,1);    
     $i++;
     $temp .= " ".$string[$char];
    }
   }
  } 
  return $temp;
 }
  
 function terbilang($x){
  if($x<0){
   $hasil = "minus ".trim(konversi(x));
  }else{
   $poin = trim(tkoma($x));
   $hasil = trim(konversi($x));
  }
   
  if($poin){
   $hasil = $hasil." koma ".$poin;
  }else{
   $hasil = $hasil;
  }
  return $hasil; 
}
 
$moduleid = "report.invoice";

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT inv.*, agen.vnmagent, agen.valamat, DATE_FORMAT(dtglinv,'%d-%m-%Y') AS tglinv FROM tr_invoice inv ";
$sql .= "LEFT JOIN tm_agent agen ON agen.ckdagent = inv.ckdagent ";
$sql .= "WHERE inv.cinv = '$_GET[key]' ";
$rs = $conn->Execute($sql);
$vnmagent = $rs->fields["vnmagent"];
$valamat = $rs->fields["valamat"];
$total = $rs->fields["vtotalinv"];
$vtax = (10/100)*$total;
$vgrandtotal = $total+$vtax;
$gt = str_replace(".","_",$vgrandtotal);
$gt = str_replace(",","",$gt);
$gt = str_replace("_",",",$gt);
$terbilang = ucwords(terbilang($gt));

$noinv = $rs->fields["cnoinv"];
$tgl = $rs->fields["tglinv"];
$tgl = explode("-",$tgl);
$tglinv = $tgl[0]." ".$arr_bulan[intval($tgl[1])]." ".$tgl[2];

$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->custSQL = $sql;
$content = $admGrdTpl->Show(false);

?>