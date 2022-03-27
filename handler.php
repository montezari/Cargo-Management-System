<?php
  require_once "includes/global.inc.php";
  /* load param */
  $sql = "SELECT * FROM tm_param ";
  $rs = $conn->Execute($sql);
  $param["max_deposit"] = $rs->fields["cmaxdeposit"];
  $param["min_deposit"] = $rs->fields["cmindeposit"];
  $param["lbl_level1"] = $rs->fields["clevel1"];
  $param["lbl_level2"] = $rs->fields["clevel2"];
  $param["lbl_level3"] = $rs->fields["clevel3"];
  $param["lbl_level4"] = $rs->fields["clevel4"];

  $mainTpl = new TMainPage();
  $mm = new TMainMenu();
  $mainTpl->mainmenu = $mm->Build($_SESSION["Logged"]);
  $content = "Modul tidak diketemukan...!!!";
  $namamodul = "";
  $notrans_form = "";
  $qrbarc_form = "";
  $css_js  = setcss_js();
  if(isset($_REQUEST["m"]) && $_REQUEST["m"] != ""){
	list($m,$f) = explode(".",$_REQUEST["m"]);
    $modpath = "modules/$m/$f.php";
	switch ($m) {
		case "master":
		  $namamodul = "Master Data";	
		break;
		case "trans":
		  $namamodul = "Transaction";	
		break;
		case "report":
		  $namamodul = "Reports";	
		break;
	}
	if($m!="admin"){
	  //if(isset($_SESSION["Logged"])){
      if(isset($_SESSION["Logged"]) && $mm->isakses($_SESSION["Logged"],$_REQUEST["m"])){
		if($_GET["mode"] != "form"){
		  /*
		  $button["A"] = $sm->Modules[$modId[0]][$modId[1]]->Write  == "1" ? "valid" : "";
		  $button["E"] = $sm->Modules[$modId[0]][$modId[1]]->Change == "1" ? "valid" : "";
		  $button["D"] = $sm->Modules[$modId[0]][$modId[1]]->Delete == "1" ? "valid" : "";
	      */
		  $button["A"] = "valid";
		  $button["E"] = "valid";
		  $button["D"] = "valid";
		}	
	  }else{  
		echo "<script>alert('Anda tidak mendapatkan akses modul ini.');</script>";
        echo "<script>window.location = 'index.php'</script>";
	  }
	}
    $modpath = "modules/$m/$f.php"; 
    if(file_exists($modpath)){
	  include($modpath);
    }
  }elseif(isset($_SESSION["Logged"])){
	$fpageTpl = new TTemplate("index.content");
	$content = $fpageTpl->Show(false);

  }

if(!isset($_SESSION["Logged"])){
  $fpageTpl = new TTemplate("sm.frmlogin");
  $content = $fpageTpl->Show(false);
}

$mainTpl->content = $content;

?>