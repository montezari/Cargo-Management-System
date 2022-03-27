<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.negara";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fkey"] != ""){
    $sql  = "update tm_negara set vnmnegara='$_POST[nmnegara]', cuseredit = '$_SESSION[Logged]', cdateedit = CURRENT_TIMESTAMP ";
    $sql .= "where ckdnegara = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_negara (ckdnegara,vnmnegara, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[kdnegara]','$_POST[nmnegara]', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "select count(*) as jml from tm_kota WHERE ckdnegara = '$_POST[fkey]' ";
  $rs = $conn->Execute($sql); 	
  if($rs->fields["jml"]==0){
    $sql = "delete from tm_negara WHERE ckdnegara = '$_POST[fkey]' ";
    $conn->Execute($sql); 
    header("Location: $config[http]$_SERVER[REQUEST_URI]");
    exit;
  }else{
	echo "<script>alert('Anda tidak mendapatkan menghapus data ini karena data sudah di pakai.');</script>";
	echo "<script>window.location = 'index.php?m=$moduleid'</script>";
  }
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT * FROM tm_negara  ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE ckdnegara = '$_GET[key]' ";
}
$sql .= " ORDER BY ckdnegara ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[NEGARA_HDR];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>