<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
<link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/plugins/validation/css/bootstrapValidator.css" type="text/css" rel="stylesheet">
<link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.css" rel="stylesheet"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css"/>
<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datetimepicker/css/datetimepicker.css"/>
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/pages/tasks.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="assets/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
<link href="assets/plugins/jquerycombogrid/css/smoothness/jquery.ui.combogrid.css" type="text/css" rel="stylesheet" media="screen"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<body class="page-header-fixed">
<!-- BEGIN HEADER -->
<div class="header navbar navbar-fixed-top">
	<!-- BEGIN TOP NAVIGATION BAR -->
	<div class="header-inner">
		<!-- BEGIN LOGO -->
		<a class="navbar-brand" href="index.html">
			<!--<img src="assets/img/logo.png" alt="logo" class="img-responsive"/>-->
		</a>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<img src="assets/img/menu-toggler.png" alt=""/>
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN TOP NAVIGATION MENU -->
		<ul class="nav navbar-nav pull-right">
			<!-- BEGIN USER LOGIN DROPDOWN -->
			<li class="dropdown user">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<img alt="" src="assets/img/no-person.jpg"/>
					<span class="username">
						 [var._SESSION.cLoggedName;noerr;]
					</span>
					<i class="fa fa-angle-down"></i>
				</a>
				<ul class="dropdown-menu">
					<li>
						<a href="?m=admin.chpass">
							<i class="fa fa-key"></i> [var.LABEL.GANTI_PASS_MENU;noerr;]
						</a>
					</li>
					<li>
						<a href="?m=admin.auth&logout=1">
							<i class="fa fa-sign-out"></i> [var.LABEL.LOGOUT_MENU;noerr;]
						</a>
					</li>
				</ul>
			</li>
			<!-- END USER LOGIN DROPDOWN -->
		</ul>
		<!-- END TOP NAVIGATION MENU -->
	</div>
	<!-- END TOP NAVIGATION BAR -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		<div class="page-sidebar navbar-collapse collapse">
			<!-- add "navbar-no-scroll" class to disable the scrolling of the sidebar menu -->
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
				<li class="sidebar-toggler-wrapper">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler hidden-phone">
					</div>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li class="sidebar-search-wrapper">
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					<form class="sidebar-search" action="extra_search.html" method="POST">
						<div class="form-container">
							<div class="input-box">
								<a href="javascript:;" class="remove">
								</a>
								<input type="text" placeholder="Search..."/>
								<input type="button" class="submit" value=" "/>
							</div>
						</div>
					</form>
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class="start active ">
					<a href="index.php">
						<i class="fa fa-home"></i>
						<span class="title">
							Home
						</span>
						<span class="selected">
						</span>
					</a>
				</li>
				<li>
					<a href="javascript:;">
						<i class="fa fa-puzzle-piece"></i>
						<span class="title">
							Master Data
						</span>
						<span class="arrow ">
						</span>
					</a>
					<ul class="sub-menu">
						<li><a href="?m=master.param">[var.LABEL.PARAMETER_SISTEM_MENU;noerr;]</a></li>
						<li><a href="?m=master.negara">[var.LABEL.NEGARA_MENU;noerr;]</a></li>
						<li><a href="?m=master.kota">[var.LABEL.KOTA_MENU;noerr;]</a></li>
						<li><a href="?m=master.bandara">[var.LABEL.BANDAR_UDARA_MENU;noerr;]</a></li>
						<li><a href="?m=master.penerbangan">[var.LABEL.DATA_PENERBANGAN_MENU;noerr;]</a></li>
						<li><a href="?m=master.currency">[var.LABEL.MATA_UANG_MENU;noerr;]</a></li>
						<li><a href="?m=master.tarif">[var.LABEL.TARIF_DAN_BIAYA_MENU;noerr;]</a></li>
						<li><a href="?m=master.biayaadd">[var.LABEL.BIAYA_TAMBAHAN_MENU;noerr;]</a></li>
						<li><a href="?m=master.komoditi">[var.LABEL.KOMODITI_MENU;noerr;]</a></li>
						<li><a href="?m=master.jenissetor">[var.LABEL.JENIS_SETORAN_MENU;noerr;]</a></li>
						<li><a href="?m=master.agent">[var.LABEL.DATA_PELANGGAN_MENU;noerr;]</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:;">
						<i class="fa fa-table"></i>
						<span class="title">
							Transaction
						</span>
						<span class="arrow ">
						</span>
					</a>
					<ul class="sub-menu">
						<li><a href="?m=trans.setoran">[var.LABEL.SETORAN_PELANGGAN_MENU;noerr;]</a></li>
						<li><a href="?m=trans.muatan">[var.LABEL.SURAT_MUATAN_UDARA_MENU;noerr;]</a></li>
						<li><a href="?m=trans.invoice">[var.LABEL.GENERATE_INVOICE_MENU;noerr;]</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:;">
						<i class="fa fa-envelope-o"></i>
						<span class="title">
							Reports
						</span>
						<span class="arrow ">
						</span>
					</a>
					<ul class="sub-menu">
						<li><a href="?m=report.manifest">[var.LABEL.MANIFEST_PENERBANGAN_MENU;noerr;]</a></li>
						<li><a href="?m=report.invoicelist">[var.LABEL.INVOICE_REPORT_MENU;noerr;]</a></li>
						<li><a href="?m=report.saldoagent">[var.LABEL.SALDO_PELANGGAN_MENU;noerr;]</a></li>
						<li><a href="?m=report.jualsmu">[var.LABEL.RINCIAN_PENJUALAN_SMU_MENU;noerr;]</a></li>
						<li><a href="?m=report.rekapsmu">[var.LABEL.REKAP_PEMAKAIAN_SMU_MENU;noerr;]</a></li>
						<li><a href="?m=report.sales">[var.LABEL.REKAP_PENJUALAN_DETAIL_MENU;noerr;]</a></li>
						<li><a href="?m=report.salessum">[var.LABEL.REKAP_PENJUALAN_SUMMARY_MENU;noerr;]</a></li>
					</ul>
				</li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
	</div>
	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content bg-grey">
          [var.~content;noerr]    
        </div>
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="footer">
	<div class="footer-inner">
		 2014 &copy; DutaSOFT Ver. 1.0
	</div>
	<div class="footer-tools">
		<span class="go-top">
			<i class="fa fa-angle-up"></i>
		</span>
	</div>
</div>
<!--[if lt IE 9]>
<script src="assets/plugins/respond.min.js"></script>
<script src="assets/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/plugins/validation/js/bootstrapValidator.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="assets/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
<script src="assets/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-number/jquery.number.js" type="text/javascript"></script>
<script src="assets/plugins/jquerycombogrid/plugin/jquery.ui.combogrid-1.6.3.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/plugins/printarea/jquery.PrintArea.js" type="text/JavaScript" language="javascript"></script>
<script src="assets/scripts/core/app.js" type="text/javascript"></script>
<script src="assets/scripts/custom/index.js" type="text/javascript"></script>
<script src="assets/scripts/custom/tasks.js" type="text/javascript"></script>
<script src="assets/scripts/custom/components-pickers.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script src="js.php?src=[var.moduleid;noerr]" type="text/javascript"></script>
<script>
jQuery(document).ready(function() {    
   App.init(); // initlayout and core plugins
   Index.init();
   ComponentsPickers.init();
});
</script>
<!-- END JAVASCRIPTS -->