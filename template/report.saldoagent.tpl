<div class="row">
    <div class="col-md-12">
        <div class="portlet box">
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr][var.~page_url;noerr]">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.NAMA_AGENT;noerr;]</label>
                                    <input type="hidden" name="kdagent" id="kdagent" value="[var._POST.kdagent;noerr;]" class="form-control input-sm"/>
                                    <input type="text" name="nmagent" id="nmagent" class="form-control" value="[var._POST.nmagent;noerr;]">
                                </div>
                            </div>
                       		<div class="col-md-2">
                                <div class="form-group">
                                    <label>[var.LABEL.MATA_UANG;noerr;]</label><select class="form-control" id="kdcurr" name="kdcurr">
                                        <option value=''></option>
                                        <option value='[blk_curr.ckdcurrency;noerr;block=option]' [onshow; if [var._POST.kdcurr;noerr;]==[blk_curr.ckdcurrency;noerr];then 'selected';else '']>[blk_curr.vnmcurrency;noerr;block=option]</option>
                                    </select>
                                    
                                </div>
                            </div>     
                        </div>
						<div class="row">
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
                    </div>

                    <div class="portlet-body flip-scroll hidden-print">
                    [onload_1; when [var.mode;noerr]==1; block=div]
                        <table class="table table-bordered table-striped table-condensed flip-content">
                        <thead class="flip-content">
                        <tr>
                            <th width="8%">Date</th>
                            <th width="14%">No. SMU</th>
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
                            <th>[var.LABEL.RPT_DEPOSIT;noerr;]</th>
                            <th>[var.LABEL.RPT_SALDO;noerr;]</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>[grid_blk.dtgltrans;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.cnotrans;noerr;block=tr]</td>
                            <td>[grid_blk.cnopenerbangan;noerr;block=tr]</td>
                            <td>[grid_blk.vnmkotaasal;noerr;block=tr]</td>
                            <td>[grid_blk.vnmkotatuj;noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.vtarif;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.cjmlberat;noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.cjmlkoli;noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.vasagreed;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.vppn;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.vbiayaadmsmu;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.vout;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.vin;frm='0,000.00';noerr;block=tr]</td>
                            <td class="text-right">[grid_blk.vsaldo;frm='0,000.00';noerr;block=tr]</td>
                        </tr>
                        </tbody>
                        </table>
                    </div>

                   <div style="display:none;" id="panel" class="progress progress-striped active">
                   	  <div class="progress-bar progress-bar-success" id="progressBar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                   </div>
                    <div class="nobg fluid">
                        <button type="submit" id="FormAction" name="FormAction" value="ViewData" class="btn blue">[var.LABEL.TAMPILKAN_DATA;noerr;]</button>
                        <button type="button" id="FormExcel" name="FormExcel" onclick="doexpexcel();" value="Export Excel" class="btn green">[var.LABEL.EXPORT_EXCEL;noerr;]</button>
                        <button type="button" id="FormCetak" name="FormCetak" value="Cetak" onclick="docetak();" class="btn default hidden-print">[var.LABEL.CETAK;noerr;]</button>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>

</div>