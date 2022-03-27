<script language="javascript">
function ConfirmDelete(val){
  var key = document.grid.fkey;
  
  if(confirm('anda yakin ingin pembatalan invoice ini...?')){
     key.value = val; 
	 document.grid.submit();
  }  
}
</script>
<div class="row">
	<div class="col-xs-12">
        <div class="box">
        [onload_1; when [var.mode;noerr]==0; block=div]
            <div class="box-header">
              <div style="padding-top:5px;padding-left:10px;">
                <div>[var.LABEL.JUMLAH_DATA;noerr;] : [var.~recordcount;noerr]</div>
                <div>[var.LABEL.HALAMAN;noerr;] : [var.~page_sequence;noerr]</div>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body table-responsive">
                <table id="example2" class="table table-bordered table-hover">
                <form action="index.php?m=[var.~moduleid;noerr][var.~page_url;noerr]" method="post" name='grid'>
                <input name='fkey' id='fkey' type='hidden' size=/>
                    <thead>
                        <tr>
                            <th>[var.LABEL.NO_INVOICE;noerr;]</th>
                            <th>[var.LABEL.TGL_INVOICE;noerr;]</th>
                            <th>[var.LABEL.NAMA_AGENT;noerr;]</th>
                            <th>[var.LABEL.JUMLAH_SMU;noerr;]</th>
                            <th>[var.LABEL.MATA_UANG;noerr;]</th>
                            <th>[var.LABEL.TOTAL_INVOICE;noerr;]</th>
                            <th colspan="3">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.cnoinv;noerr;block=tr]</td>
                            <td>[grid_blk.dtglinv;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.vnmagent;noerr;block=tr]</td>
                            <td>[grid_blk.cjmlsmu;noerr;block=tr]</td>
                            <td>[grid_blk.vnmcurrency;noerr;block=tr]</td>
                            <td>[grid_blk.vtotalinv;frm='0,000.00';noerr;block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=report.invoice&key=[grid_blk.cinv;noerr]'"><span class="fa fa-print"></span></a>;else <span class="fa fa-print"></span>]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cinv;noerr]'"><span class="fa fa-eject"></span></a>;else <span class="fa fa-eject"></span>]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.cinv;noerr]')"><span class="fa fa-trash-o"></span></a>;else <span class="fa fa-trash-o"></span>]</td>
                        </tr>
                        <tr>
                          <td colspan="6">&nbsp;</td>
                          <td colspan="3" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form'"><span class="fa fa-plus"></span></a>;else <span class="fa fa-plus"></span>]</td>
                        </tr>
                    </tbody>
                    <input type="hidden" name="FormAction" value="BATAL">
                    </form>
                </table>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
  	</div><!-- /.col -->
          
    <div class="col-md">
    [onload_1; when [var.mode;noerr]==1; block=div]
        <div class="portlet box">
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr][var.~page_url;noerr]">
                <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cinv;noerr;]' size=/>
                <input name='flag' id='flag' type='hidden' value='' size=/>
                <input name='flistinv' id='flistinv' type='hidden' value='[var.finv_list;noerr]'/>
                    <div class="form-body">
                    	<div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.NO_INVOICE;noerr;]</label>
                                    <input type="text" name="noinv" id="noinv" class="form-control" value="[grid_blk.cnoinv;noerr;]" readonly>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">	
                                    <label class="control-label">[var.LABEL.TGL_INVOICE;noerr;]</label>
                                    <input type="text" name="tglinv" id="tglinv" class="form-control date-picker" value="[grid_blk.dtglinv;frm='dd/mm/yyyy';noerr;]">
                                </div>
                            </div>
                        </div>
                    	<div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.NAMA_AGENT;noerr;]</label>
                                    <input type="hidden" name="kdagent" id="kdagent" value="[grid_blk.ckdagent;noerr;]" class="form-control input-sm"/>
                                    <input type="text" name="nmagent" id="nmagent" class="form-control" value="[grid_blk.vnmagent;noerr;]" [onshow; if [grid_blk.cinv;noerr;]!='';then 'readonly';else '']>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>[var.LABEL.MATA_UANG;noerr;]</label>
                                    <select class="form-control" id="kdcurr" name="kdcurr" [onshow; if [grid_blk.cinv;noerr;]!='';then 'readonly';else '']>
                                        <option value=''></option>
                                        <option value='[blk_curr.ckdcurrency;noerr;block=option]' [onshow; if [grid_blk.ckdcurrency;noerr]==[blk_curr.ckdcurrency;noerr];then 'selected';else '']>[blk_curr.vnmcurrency;noerr;block=option]</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    	<div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.TANGGAL_AWAL;noerr;]</label>
                                    <input type="text" name="tglawal" id="tglawal" class="form-control date-picker" value="[grid_blk.dtglawal;frm='dd/mm/yyyy';noerr;]">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">	
                                    <label class="control-label">[var.LABEL.TANGGAL_AKHIR;noerr;]</label>
                                    <input type="text" name="tglakhir" id="tglakhir" class="form-control date-picker" value="[grid_blk.dtglakhir;frm='dd/mm/yyyy';noerr;]">
                                </div>
                            </div>
                        </div>
                    	<div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.TOTAL_INVOICE;noerr;]</label>
                                    <input type="text" name="totalinv" id="totalinv" class="form-control" value="[grid_blk.vtotalinv;noerr;]" readonly>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.JUMLAH_SMU;noerr;]</label>
                                    <input type="text" name="jmlsmu" id="jmlsmu" class="form-control" value="[grid_blk.cjmlsmu;noerr;]" readonly>
                                </div>
                            </div>
                        </div>
                    	<div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KETERANGAN;noerr;]</label>
                                    <textarea class="form-control" name="ket" id="ket" rows="3">[grid_blk.vketerangan;noerr;]</textarea>
                                </div>
                            </div>
                        </div>
                    </div>

					<script language="javascript">
						function updateinv(){
						  var chkArray = [];
						  $("#checkboxlist input:checked").each(function() {
							chkArray.push($(this).val());
						  });
						  var selected;
						  selected = chkArray.join(',');
						  form.flistinv.value = selected;
						}
						function viewsmu(){
						  document.getElementById("flag").value = "0"; 
						  document.getElementById("form").action ="?m=[var.~moduleid;noerr][var.~page_url;noerr]&mode=form[var.keyupdate;noerr]";
						}
						function simpandata(){
						  $('#form').on('submit', function() {
							if(($("#jmlsmu").val()==0) || ($("#jmlsmu").val()=="")){
								alert('Mohon tampikan data terlebih dahulu dan pilih data yang akan di invoice.');
								return false;
							}
						  });
						  updateinv();
						  document.getElementById("flag").value = "1"; 	
						  document.getElementById("form").action ="?m=[var.~moduleid;noerr][var.~page_url;noerr]";
						}
						function hitungjml(id){
						  var smu = parseFloat($("#smu_"+id).val()) || 0;
						  var totsmu = parseFloat($("#jmlsmu").val()) || 0;
						  var jml = parseFloat($("#jml_"+id).val()) || 0;
						  var totjml = parseFloat($("#totalinv").val()) || 0;
						
						  if($(".chk_"+id).is(':checked')){
							totsmu = totsmu+smu;
							$("#jmlsmu").val(totsmu);
							totjml = totjml+jml;
							$("#totalinv").val(totjml);
						  }else{
							totsmu = totsmu-smu;
							$("#jmlsmu").val(totsmu);
							totjml = totjml-jml;
							$("#totalinv").val(totjml);
						  }
						}
                    </script>                    

                    <div class="portlet-body flip-scroll hidden-print" id="checkboxlist">
                    [onload_3; when [var.view;noerr]==1; block=div]
                        <table class="table table-bordered table-striped table-condensed flip-content">
                        <thead class="flip-content">
                        <tr>
                        	<th>#</th>
                            <th width="8%">Date</th>
                            <th width="14%">No. SMU</th>
                            <th>Flight No</th>
                            <th>From</th>
                            <th>Destination</th>
                            <th>Tarif Kg</th>
                            <th>Total Kg</th>
                            <th>Total Koli</th>
                            <th>As Agreed</th>
                            <th>PPN</th>
                            <th>ADM</th>
                            <th>Total Tarif</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                        	<td><input type="checkbox" value="[grid_inv.cidmuatan;noerr;]" id="cinv[]" name="cinv[]" class="chk_[grid_inv.#; block=tr;noerr]" onclick="hitungjml('[grid_inv.#; block=tr;noerr]');" [onshow; if [grid_inv.fcheck;noerr;block=tr]=='1';then 'checked';else ''] /></td>
                            <td><input type="hidden" name="smu_[grid_inv.#; block=tr;noerr]" id="smu_[grid_inv.#; block=tr;noerr]" value="1" class="form-control"/>[grid_inv.dtglmuatan;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_inv.cnomuatan;noerr;block=tr]</td>
                            <td>[grid_inv.cnopenerbangan;noerr;block=tr]</td>
                            <td>[grid_inv.vnmkotaasal;noerr;block=tr]</td>
                            <td>[grid_inv.vnmkotatuj;noerr;block=tr]</td>
                            <td class="text-right">[grid_inv.vtarif;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_inv.cjmlberat;noerr;block=tr]</td>
                            <td class="text-right">[grid_inv.cjmlkoli;noerr;block=tr]</td>
                            <td class="text-right">[grid_inv.vasagreed;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_inv.vtarif;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_inv.vbiayaadmsmu;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right"><input type="hidden" name="jml_[grid_inv.#; block=tr;noerr]" id="jml_[grid_inv.#; block=tr;noerr]" value="[grid_inv.vjumlah;noerr;block=tr]" class="form-control"/>[grid_inv.vjumlah;frm='0,000.00';noerr;block=tr]</td>
                        </tr>
                        </tbody>
                        </table>
                    </div>

					<div class="nobg fluid">
                    	<button type="submit" id="FormViewData" name="FormViewData" onclick="viewsmu();" value="ViewData" class="btn green">[var.LABEL.TAMPILKAN_DATA;noerr;]</button>
                        <button type="submit" id="FormAction" name="FormAction" onclick="simpandata();" value="Simpan" class="btn blue">[var.LABEL.PROSES_INVOICE;noerr;]</button>
                        <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.~moduleid;noerr][var.~page_url;noerr]';" value="Batal" class="btn default">[var.LABEL.BATAL;noerr;]</button>
                        <!--<button type="button" id="FormBatal" name="FormBatal" onclick="updateinv();" value="TEST" class="btn default">TEST</button>-->
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>
      
</div><!-- /.row -->
