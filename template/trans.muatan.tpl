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
                            <th>[var.LABEL.NO_MUATAN;noerr;]</th>
                            <th>[var.LABEL.TGL_MUATAN;noerr;]</th>
                            <th>[var.LABEL.KOTA_TUJUAN;noerr;]</th>
                            <th>[var.LABEL.NAMA_AGENT;noerr;]</th>
                            <th>[var.LABEL.KODE_PENERBANGAN;noerr;]</th>
                            <th>[var.LABEL.TANGGAL_PENERBANGAN;noerr;]</th>
                            <th colspan="3">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.cnomuatan;noerr;block=tr]</td>
                            <td>[grid_blk.dtglmuatan;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.kotatuj;noerr;block=tr]</td>
                            <td>[grid_blk.vnmagent;noerr;block=tr]</td>
                            <td>[grid_blk.cnopenerbangan;noerr;block=tr]</td>
                            <td>[grid_blk.dtglterbang;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=report.awb&key=[grid_blk.cinv;noerr]'"><span class="fa fa-print"></span></a>;else <span class="fa fa-print"></span>]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cidmuatan;noerr]'"><span class="fa fa-eject"></span></a>;else <span class="fa fa-eject"></span>]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.cidmuatan;noerr]')"><span class="fa fa-trash-o"></span></a>;else <span class="fa fa-trash-o"></span>]</td>
                        </tr>
                        <tr>
                          <td colspan="6">&nbsp;</td>
                          <td colspan="3" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form'"><span class="fa fa-plus"></span></a>;else <span class="fa fa-plus"></span>]</td>
                        </tr>
                    </tbody>
                    <input type="hidden" name="FormAction" value="CANCEL">
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
                <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cidmuatan;noerr;]' size=/>
                    <div class="form-body bg-blue">
						<div class="row">
                       		<div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.NO_MUATAN;noerr;]</label>
                                    <input type="text" name="kdmuatan" id="kdmuatan" class="form-control" value="[grid_blk.cnomuatan;noerr;]" disabled>
                                </div>
                            </div>     
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.TGL_MUATAN;noerr;]</label>
                                    <input type="text" name="tglmuatan" id="tglmuatan" class="form-control date-picker" value="[grid_blk.dtglmuatan;frm='dd/mm/yyyy';noerr;]">
                                </div>
                    		</div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.NAMA_AGENT;noerr;] / Balance : <span style="color:#e02222;"><strong>[grid_blk.vsaldoagent;frm='0,000.00';noerr;]</strong></span></label>
                                    <input type="hidden" name="saldoagent" id="saldoagent" value="[grid_blk.vsaldoagent;noerr;]" class="form-control input-sm">
                                    <input type="hidden" name="kdagent" id="kdagent" value="[grid_blk.ckdagent;noerr;]" class="form-control input-sm"/>
                                    <input type="hidden" name="kdkotaasal" id="kdkotaasal" value="[grid_blk.ckdkotaasal;noerr;]" class="form-control input-sm"/>
                                    <input type="text" name="nmagent" id="nmagent" class="form-control" value="[grid_blk.vnmagent;noerr;]">
                                </div>
                            </div>
                       		<div class="col-md-2">
                                <div class="form-group">
                                    <label>[var.LABEL.MATA_UANG;noerr;]</label><select class="form-control" id="kdcurr" name="kdcurr" onchange="getsaldo();getbiayaadd();gettarif();">
                                        <option value=''></option>
                                        <option value='[blk_curr.ckdcurrency;noerr;block=option]' [onshow; if [grid_blk.ckdcurrency;noerr]==[blk_curr.ckdcurrency;noerr];then 'selected';else '']>[blk_curr.vnmcurrency;noerr;block=option]</option>
                                    </select>
                                    
                                </div>
                            </div>     
                        </div>
						<div class="row">
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label>[var.LABEL.NEGARA_TUJUAN;noerr;]</label>
                                    <select class="form-control" id="kdnegaratuj" name="kdnegaratuj">
                                        <option value=''></option>
                                        <option value='[blk_tuj.ckdnegara;noerr;block=option]' [onshow; if [grid_blk.ckdnegaratujuan;noerr]==[blk_tuj.ckdnegara;noerr];then 'selected';else '']>[blk_tuj.vnmnegara;noerr;block=option]</option>
                                    </select>
                                </div>
                    		</div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KOTA_TUJUAN;noerr;]</label>
                                    <input type="hidden" name="kdkotatuj" id="kdkotatuj" value="[grid_blk.ckdkotatujuan;noerr;]" class="form-control input-sm"/>
                                    <input type="text" name="nmkotatuj" id="nmkotatuj" class="form-control" value="[grid_blk.kotatuj;noerr;]">
                                </div>
                            </div>
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KODE_PENERBANGAN;noerr;]</label>
                                    <input type="text" name="kdterbang" id="kdterbang" class="form-control" value="[grid_blk.cnopenerbangan;noerr;]">
                                </div>
                    		</div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.TANGGAL_PENERBANGAN;noerr;]</label>
                                    <input type="text" name="tglterbang" id="tglterbang" class="form-control date-picker" value="[grid_blk.dtglterbang;frm='dd/mm/yyyy';noerr;]" onchange="getsisaquota();">
                                </div>
                            </div>
                            <!--
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.SALDO_AGENT;noerr;]</label>
                                    <input type="text" name="saldoagent__" id="saldoagent__" class="form-control" value="[grid_blk.vsaldoagent;noerr;]" readonly>
                                </div>
                    		</div>
                            -->
                        </div>    
						<div class="row">
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label>[var.LABEL.NEGARA_TRANSIT;noerr;]</label>
                                    <select class="form-control" id="kdnegaratrans" name="kdnegaratrans">
                                        <option value=''></option>
                                        <option value='[blk_trans.ckdnegara;noerr;block=option]' [onshow; if [grid_blk.ckdnegaratransit;noerr]==[blk_trans.ckdnegara;noerr];then 'selected';else '']>[blk_trans.vnmnegara;noerr;block=option]</option>
                                    </select>
                                </div>
                    		</div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KOTA_TRANSIT;noerr;]</label>
                                    <input type="hidden" name="kdkotatrans" id="kdkotatrans" value="[grid_blk.ckdkotatransit;noerr;]" class="form-control input-sm"/>
                                    <input type="text" name="nmkotatrans" id="nmkotatrans" class="form-control" value="[grid_blk.kotatrans;noerr;]">
                                </div>
                            </div>
                        </div>    
						<div class="row">
                       		<div class="col-md-2">
                                <div class="form-group">
                                    <label>[var.LABEL.KOMODITI;noerr;]</label><select class="form-control" id="kdkomoditi" name="kdkomoditi">
                                        <option value=''></option>
                                        <option value='[blk_komo.ckdkomoditi;noerr;block=option]' [onshow; if [grid_blk.ckdkomoditi;noerr]==[blk_komo.ckdkomoditi;noerr];then 'selected';else '']>[blk_komo.vnmkomoditi;noerr;block=option]</option>
                                    </select>
                                    
                                </div>
                            </div>     
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.JUMLAH_BARANG;noerr;]</label>
                                    <input type="text" name="jmlbrg" id="jmlbrg" class="form-control" value="[grid_blk.cjmlcargo;noerr;]">
                                </div>
                    		</div>
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.SISA_KUOTA_KG;noerr;]</label>
                                    <input type="text" name="sisakg" id="sisakg" class="form-control" value="[grid_blk.csisakg;noerr;]" readonly>
                                </div>
                    		</div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.SISA_KUOTA_KOLI;noerr;]</label>
                                    <input type="text" name="sisakoli" id="sisakoli" class="form-control" value="[grid_blk.csisakoli;noerr;]" readonly>
                                </div>
                            </div>
                        </div>    
						<div class="row">
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.QTY;noerr;] (KG)</label>
                                    <input type="text" name="jmlkg" id="jmlkg" class="form-control" value="[grid_blk.cjmlberat;noerr;]" onchange="gettarif();dohitung();">
                                </div>
                    		</div>
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.HARGA;noerr;] (KG)</label>
                                    <input type="text" name="hrgkg" id="hrgkg" class="form-control" value="[grid_blk.vtarifperkg;noerr;]" onchange="gettarif();dohitung();">
                                </div>
                    		</div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.QTY;noerr;] (KOLI)</label>
                                    <input type="text" name="jmlkoli" id="jmlkoli" class="form-control" value="[grid_blk.cjmlkoli;noerr;]" onchange="gettarif();dohitung();">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.HARGA;noerr;] (KOLI)</label>
                                    <input type="text" name="hrgkoli" id="hrgkoli" class="form-control" value="[grid_blk.vtarifperkoli;noerr;]" onchange="gettarif();dohitung();">
                                </div>
                            </div>
                        </div>    
						<div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.HARGA_BAHAN_BAKAR;noerr;]</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <input type="hidden" name="valbiayafuel" id="valbiayafuel" value="[grid_blk.vfuelsurcharge;noerr;]" class="form-control input-sm"/>
                                            <input type="checkbox" name="chkbiayafuel" id="chkbiayafuel" onclick="setbiayafuel();" >
                                        </span>
                                    	<input type="text" name="biayafuel" id="biayafuel" class="form-control" value="[grid_blk.vfuelsurcharge;noerr;]" onchange="dohitung();">
                                    </div>
                                </div>
                            </div>
                        	<div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.BIAYA_ADMIN_SMU;noerr;]</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <input type="hidden" name="valbiayaadm" id="valbiayaadm" value="[grid_blk.vbiayaadmsmu;noerr;]" class="form-control input-sm"/>
                                            <input type="checkbox" name="chkbiayasmu" id="chkbiayasmu" onclick="setbiayasmu();">
                                        </span>
                                        <input type="text" name="biayaadm" id="biayaadm" class="form-control" value="[grid_blk.vbiayaadmsmu;noerr;]" onchange="dohitung();">
                                    </div>
                                </div>
                    		</div>
                        	<div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.BIAYA_TAMBAHAN_LAIN;noerr;]</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <input type="hidden" name="valbiayalain" id="valbiayalain" value="[grid_blk.vbiayalain;noerr;]" class="form-control input-sm"/>
                                            <input type="checkbox" name="chkbiayalain" id="chkbiayalain" onclick="setbiayalain();">
                                        </span>
                                    	<input type="text" name="biayalain" id="biayalain" class="form-control" value="[grid_blk.vbiayalain;noerr;]" onchange="dohitung();">
                                    </div>
                                </div>
                    		</div>
                        </div>    
						<div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.PPN;noerr;]</label>
                                    <div class="col-md">
                                        <div class="form-group row">
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <input type="hidden" name="valppn" id="valppn" value="[grid_blk.ppnpers;noerr;]" class="form-control input-sm"/>
                                                        <input type="checkbox" name="chkppn" id="chkppn" onclick="setppn();">
                                                    </span>
                                                    <input type="text" name="ppnpers" id="ppnpers" class="form-control" value="[grid_blk.vppnpers;noerr;]" onchange="dohitung();">
                                                </div>
                                            </div>	
                                            <div class="col-md-6">
                                                    <input type="text" name="ppn" id="ppn" class="form-control" value="[grid_blk.vppn;noerr;]" onchange="dohitung();">
                                            </div>
                                        </div>
                                    </div>	
                                </div>
                            </div>
                        </div>    
						<div class="row">
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.TOTAL;noerr;]</label>
                                    <input type="text" name="total" id="total" class="form-control" value="[grid_blk.vgrandtotal;noerr;]" readonly>
                                </div>
                    		</div>
                        </div>    
                    </div>

                    <div class="nobg fluid" style="margin-top: 10px;">
                        <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn red">[var.LABEL.SIMPAN;noerr;]</button>
                        <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.~moduleid;noerr][var.~page_url;noerr]';" value="Batal" class="btn default">[var.LABEL.BATAL;noerr;]</button>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>
      
</div>