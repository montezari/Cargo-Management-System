<div class="row">
    <div class="col-md-12">
        <div class="portlet box">
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr][var.~page_url;noerr]">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.NAMA_BANDARA;noerr;]</label>
                                    <input type="hidden" name="kdbandara" id="kdbandara" value="[var._POST.kdbandara;noerr;]" class="form-control input-sm"/>
                                    <input type="text" name="nmbandara" id="nmbandara" class="form-control" value="[var._POST.nmbandara;noerr;]">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KOTA;noerr;]</label>
                                    <input type="hidden" name="kdkota" id="kdkota" value="[var._POST.kdkota;noerr;]" class="form-control input-sm"/>
                                    <input type="text" name="nmkota" id="nmkota" class="form-control" value="[var._POST.nmkota;noerr;]" readonly>
                                </div>
                            </div>
                        </div>
						<div class="row">
                       		<div class="col-md-2">
                                <div class="form-group">
                                    <label>[var.LABEL.MATA_UANG;noerr;]</label><select class="form-control" id="kdcurr" name="kdcurr">
                                        <option value=''></option>
                                        <option value='[blk_curr.ckdcurrency;noerr;block=option]' [onshow; if [var._POST.kdcurr;noerr;]==[blk_curr.ckdcurrency;noerr];then 'selected';else '']>[blk_curr.vnmcurrency;noerr;block=option]</option>
                                    </select>
                                    
                                </div>
                            </div>  
                       		<div class="col-md-2">
                                <div class="form-group">
                                    <label>[var.LABEL.BULAN;noerr;]</label><select class="form-control" id="cmbbln" name="cmbbln">
                                        <option value=''></option>
                                        <option value='[blk_bln.cbulanstr;noerr;block=option]' [onshow; if [var.val.bulan;noerr;]==[blk_bln.cbulanstr;noerr];then 'selected';else '']>[blk_bln.vnmbulan;noerr;block=option]</option>
                                    </select>
                                    
                                </div>
                            </div>     
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.TAHUN;noerr;]</label>
                                    <input type="text" name="cmbtahun" id="cmbtahun" class="form-control" value="[var.val.tahun;noerr;]">
                                </div>
                    		</div>
                        </div>    
						<div class="row">
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label>[var.LABEL.NEGARA_TUJUAN;noerr;]</label>
                                    <select class="form-control" id="kdnegaratuj" name="kdnegaratuj">
                                        <option value=''></option>
                                        <option value='[blk_tuj.ckdnegara;noerr;block=option]' [onshow; if [var._POST.kdnegaratuj;noerr;]==[blk_tuj.ckdnegara;noerr];then 'selected';else '']>[blk_tuj.vnmnegara;noerr;block=option]</option>
                                    </select>
                                </div>
                    		</div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KOTA_TUJUAN;noerr;]</label>
                                    <input type="hidden" name="kdkotatuj" id="kdkotatuj" value="[var._POST.kdkotatuj;noerr;]" class="form-control input-sm"/>
                                    <input type="text" name="nmkotatuj" id="nmkotatuj" class="form-control" value="[var._POST.nmkotatuj;noerr;]">
                                </div>
                            </div>
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KODE_PENERBANGAN;noerr;]</label>
                                    <input type="text" name="kdterbang" id="kdterbang" class="form-control" value="[var._POST.kdterbang;noerr;]">
                                </div>
                    		</div>
                        </div>    
                    </div>

                    <div class="portlet-body flip-scroll hidden-print">
                    [onload_1; when [var.mode;noerr]==1; block=div]
                        <table class="table table-bordered table-striped table-condensed flip-content">
                        <thead class="flip-content">
                        <tr>
                            <th width="8%">[var.LABEL.RPT_TANGGAL;noerr;]</th>
                            <th>[var.LABEL.RPT_AGENT;noerr;]</th>
                            <th width="14%">[var.LABEL.RPT_NO_SMU;noerr;]</th>
                            <th>[var.LABEL.RPT_FLIGHT_NO;noerr;]</th>
                            <th>[var.LABEL.RPT_FROM;noerr;]</th>
                            <th>[var.LABEL.RPT_DESTINATION;noerr;]</th>
                            <th>[var.LABEL.RPT_TARIF_KG;noerr;]</th>
                            <th>[var.LABEL.RPT_TOTAL_KG;noerr;]</th>
                            <th>[var.LABEL.RPT_TOTAL_KOLI;noerr;]</th>
                            <th>[var.LABEL.RPT_AS_AGREED;noerr;]</th>
                            <th>[var.LABEL.RPT_PPN;noerr;]</th>
                            <th>[var.LABEL.RPT_ADM;noerr;]</th>
                            <th>[var.LABEL.RPT_TOTAL_TARIF;noerr;]</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>[grid_blk.dtglmuatan;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.vnmagent;noerr;block=tr]</td>
                            <td>[grid_blk.cnomuatan;noerr;block=tr]</td>
                            <td>[grid_blk.cnopenerbangan;noerr;block=tr]</td>
                            <td>[grid_blk.vnmkotaasal;noerr;block=tr]</td>
                            <td>[grid_blk.vnmkotatuj;noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.vtarif;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.cjmlberat;noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.cjmlkoli;noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.vasagreed;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.vppn;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.vbiayaadmsmu;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.vgrandtotal;frm='0,000.00';noerr;block=tr]</td>
                        </tr>
                        </tbody>
                        <tfoot>
                            <td colspan="12" class="text-right">TOTAL</td>
                            <td class="text-right">[var.vsumtotal;frm='0,000.00';noerr;block=tr]</td>
                        </tfoot>  
                        </table>
                    </div>
                    
                   <div style="display:none;" id="panel" class="progress progress-striped active">
                   	  <div class="progress-bar progress-bar-success" id="progressBar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                   </div>
                   <div class="nobg fluid">
                        <button type="submit" id="FormAction" name="FormAction" value="ViewData" class="btn blue">[var.LABEL.TAMPILKAN_DATA;noerr;]</button>
                        <button type="button" id="FormExcel" name="FormExcel" onclick="doexpexcel();" value="Export Excel" class="btn green">[var.LABEL.EXPORT_EXCEL;noerr;]</button>
                        <button type="button" id="FormCetak" name="FormCetak" onclick="docetak();" value="Cetak" class="btn default hidden-print">[var.LABEL.CETAK;noerr;]</button>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>

</div>