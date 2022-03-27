			<link href="assets/css/pages/invoice.css" rel="stylesheet" type="text/css"/>
			<!-- BEGIN PAGE HEADER-->
			<div class="row hidden-print">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
					Invoice <small>&nbsp;</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="index.php">
								Home
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								Invoice
							</a>
						</li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="invoice">
				<div class="row invoice-logo">
					<div class="col-xs-6 invoice-logo-space">
						<img src="assets/img/invoice/logo.png" alt=""/>
					</div>
					<div class="col-xs-6">
						<p>
							 INVOICE
							<span class="muted">
								 &nbsp;
							</span>
						</p>
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-xs-4">
						<h5>Kepada Yth,</h5>
						<ul class="list-unstyled">
							<li>
								 [var.vnmagent;noerr;]
							</li>
							<li>
								 [var.valamat;noerr;]
							</li>
						</ul>
					</div>
				</div>
				<div class="row">
                  <div class="col-xs-10">
                  <br>
                  <strong>No Invoice  :</strong> [var.noinv;noerr;]<br>
                  <strong>Tgl Invoice :</strong> [var.tglinv;noerr;]
                  </div>  	
                </div>
				<div class="row">
					<div class="col-xs-12">
						<table class="table">
						<thead>
						<tr>
							<th>
								 JML SMU
							</th>
							<th class="hidden-480">
								 URAIAN
							</th>
							<th>
								 HARGA
							</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td width="10%" class="text-center">
								 [grid_blk.cjmlsmu;noerr;block=tr]
							</td>
							<td class="hidden-480">
								 [grid_blk.vketerangan;noerr;block=tr]
							</td>
							<td width="15%" class="text-right">
								 [grid_blk.vtotalinv;frm='0,000.00';noerr;block=tr]
							</td>
						</tr>
						</tbody>
                        <tfoot>
                          <tr>  
                            <td colspan="2" class="text-right">PPN (Value Added Tax) 10%</td>
                            <td class="text-right" width="15%">[var.vtax;frm='0,000.00';noerr;block=tr]</td>
                          </tr>
                          <tr>  
                            <td colspan="2" class="text-right">TOTAL</td>
                            <td class="text-right" width="15%">[var.vgrandtotal;frm='0,000.00';noerr;block=tr]</td>
                          </tr>
                        </tfoot>  
						</table>
					</div>
				</div>
                <div class="row">
                  <div class="col-xs-10">
                  <strong>TERBILANG :</strong> <i>[var.terbilang;noerr;]</i> 
                  </div>  	
                </div>
				<div class="row">
					<div class="col-xs-4">
						<div class="well">
							<strong>KETERANGAN:</strong><br/>
							PEMBAYARAN MELALUI TRANSFER, CEK/GIRO DINYATAKAN SAH APABILA DANA SUDAH EFEKTIF<br/>
							TRANSFER DITUJUKAN KE REKENING<br/>
							A/N :<br/>
							Acc No :<br/>
						</div>
					</div>
                    <div class="col-xs-4">
                    </div> 
					<div class="col-xs-4 invoice-block">
						<div class="well" style="text-align:center">
							JAKARTA, [var.tglinv;noerr;]<br/>
                            <strong>PT Duta CARGO</strong><br/>
							<br/>
							<br/>
							<br/>
							NAMA PENANDATANGAN<br/>
							KEPALA CABANG<br/>
						</div>
						<br/>
						<a class="btn btn-lg blue hidden-print" onclick="javascript:window.print();">
							 Cetak Invoice <i class="fa fa-print"></i>
						</a>
					</div>
				</div>
			</div>
			<!-- END PAGE CONTENT-->
		</div>