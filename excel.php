<?php

require_once "includes/global.inc.php";
require_once "modules/xls/repo.inc.php";

ini_set('max_execution_time',1200);

if(isset($_SESSION["Logged"])){

  $today = date("Ymd_His");
  if($_REQUEST["id"]=="report.jualsmu"){
    $xlsrpt = new TExcelRptJualSMU();
    $xlsrpt->doExportXls();
  }elseif($_REQUEST["id"]=="report.saldoagent"){
    $xlsrpt = new TExcelRptSaldoAgent();
    $xlsrpt->doExportXls();
  }elseif($_REQUEST["id"]=="report.rekapsmu"){
    $xlsrpt = new TExcelRptRekapSMU();
    $xlsrpt->doExportXls();
  }elseif($_REQUEST["id"]=="report.sales"){
    $xlsrpt = new TExcelRptSales();
    $xlsrpt->doExportXls();
  }elseif($_REQUEST["id"]=="report.salessum"){
    $xlsrpt = new TExcelRptSalesSummary();
    $xlsrpt->doExportXls();
  }elseif($_REQUEST["id"]=="report.manifest"){
    $xlsrpt = new TExcelRptManifest();
    $xlsrpt->doExportXls();
  }elseif($_REQUEST["id"]=="report.invoicelist"){
    $xlsrpt = new TExcelRptInvoiceList();
    $xlsrpt->doExportXls();
  }


}

?>