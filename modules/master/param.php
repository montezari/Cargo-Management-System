<?php

$moduleid = "master.param";

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $mixdeposit = str_replace(",","",$_POST["mixdeposit"]);
  $maxdeposit = str_replace(",","",$_POST["maxdeposit"]);
  $alertdeposit = str_replace(",","",$_POST["alertdeposit"]);
  $sql  = "update tm_param ";
  $sql .= "set cmindeposit='$mixdeposit', cmaxdeposit='$maxdeposit', calertdeposit='$alertdeposit', ";
  $sql .= "clevel1='$_POST[level1]',clevel2='$_POST[level2]',clevel3='$_POST[level3]',clevel4='$_POST[level4]',clabel='$_POST[label]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT * FROM tm_param  ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = $LABEL[PARAMETER_SISTEM]." ".$LABEL[FORMS];
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>