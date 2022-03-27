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
                            <th>[var.LABEL.KODE_PENERBANGAN;noerr;]</th>
                            <th>[var.LABEL.NEGARA_ASAL;noerr;]</th>
                            <th>[var.LABEL.KOTA_ASAL;noerr;]</th>
                            <th>[var.LABEL.NEGARA_TUJUAN;noerr;]</th>
                            <th>[var.LABEL.KOTA_TUJUAN;noerr;]</th>
                            <th colspan="3">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.cnopenerbangan;noerr;block=tr]</td>
                            <td>[grid_blk.vnmnegaraasal;noerr;block=tr]</td>
                            <td>[grid_blk.vnmkotaasal;noerr;block=tr]</td>
                            <td>[grid_blk.vnmnegaratuj;noerr;block=tr]</td>
                            <td>[grid_blk.vnmkotatuj;noerr;block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cnopenerbangan;noerr]'"><span class="fa fa-eject"></span></a>;else <span class="fa fa-eject"></span>]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.cnopenerbangan;noerr]')"><span class="fa fa-trash-o"></span></a>;else <span class="fa fa-trash-o"></span>]</td>
                        </tr>
                        <tr>
                          <td colspan="5">&nbsp;</td>
                          <td colspan="2" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form'"><span class="fa fa-plus"></span></a>;else <span class="fa fa-plus"></span>]</td>
                        </tr>
                    </tbody>
                    <input type="hidden" name="FormAction" value="HAPUS">
  					</form>
                </table>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
	</div><!-- /.col -->
        
    <div class="col-md-10">
    [onload_1; when [var.mode;noerr]==1; block=div]
        <div class="portlet box">
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr][var.~page_url;noerr]">
                <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cnopenerbangan;noerr;]' size=/>
                    <div class="form-body">
						<div class="row">
                       		<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KODE_PENERBANGAN;noerr;]</label>
                                    <input type="text" name="kdterbang" id="kdterbang" class="form-control" value="[grid_blk.cnopenerbangan;noerr;]" [onshow; if [grid_blk.cnopenerbangan;noerr;]!='';then 'disabled';else '']>
                                </div>
                            </div>     
                        </div>
						<div class="row">
                        	<div class="col-md-3">
                                <div class="form-group">
                                    <label>[var.LABEL.NEGARA_ASAL;noerr;]</label>
                                    <select class="form-control" id="kdnegaraasal" name="kdnegaraasal">
                                        <option value=''></option>
                                        <option value='[blk_asal.ckdnegara;noerr;block=option]' [onshow; if [grid_blk.ckdnegaraasal;noerr]==[blk_asal.ckdnegara;noerr];then 'selected';else '']>[blk_asal.vnmnegara;noerr;block=option]</option>
                                    </select>
                                </div>
                    		</div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KOTA_ASAL;noerr;]</label>
                                    <input type="hidden" name="kdkotaasal" id="kdkotaasal" value="[grid_blk.ckdkotaasal;noerr;]" class="form-control input-sm"/>
                                    <input type="text" name="nmkotaasal" id="nmkotaasal" class="form-control" value="[grid_blk.vnmkotaasal;noerr;]">
                                </div>
                            </div>
                        </div>    
						<div class="row">
                        	<div class="col-md-3">
                                <div class="form-group">
                                    <label>[var.LABEL.NEGARA_TUJUAN;noerr;]</label>
                                    <select class="form-control" id="kdnegaratuj" name="kdnegaratuj">
                                        <option value=''></option>
                                        <option value='[blk_tuj.ckdnegara;noerr;block=option]' [onshow; if [grid_blk.ckdnegaratujuan;noerr]==[blk_tuj.ckdnegara;noerr];then 'selected';else '']>[blk_tuj.vnmnegara;noerr;block=option]</option>
                                    </select>
                                </div>
                    		</div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KOTA_TUJUAN;noerr;]</label>
                                    <input type="hidden" name="kdkotatuj" id="kdkotatuj" value="[grid_blk.ckdkotatujuan;noerr;]" class="form-control input-sm"/>
                                    <input type="text" name="nmkotatuj" id="nmkotatuj" class="form-control" value="[grid_blk.vnmkotatuj;noerr;]">
                                </div>
                            </div>
                        </div>    
						<div class="row">
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.JAM_ETD;noerr;]</label>
                                    <input type="text" name="jametd" id="jametd" class="form-control timepicker timepicker-24" value="[grid_blk.cjametd;noerr;]">
                                </div>
                    		</div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.JAM_ETA;noerr;]</label>
                                    <input type="text" name="jameta" id="jameta" class="form-control timepicker timepicker-24" value="[grid_blk.cjameta;noerr;]">
                                </div>
                            </div>
                        </div>    
						<div class="row">
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KUOTA_KG;noerr;]</label>
                                    <input type="text" name="kuotakg" id="kuotakg" class="form-control" value="[grid_blk.ckuotakg;noerr;]">
                                </div>
                    		</div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KUOTA_KOLI;noerr;]</label>
                                    <input type="text" name="kuotakoli" id="kuotakoli" class="form-control" value="[grid_blk.ckuotakoli;noerr;]">
                                </div>
                            </div>
                        </div>    
                    </div>

                    <div class="nobg fluid">
                        <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn blue">[var.LABEL.SIMPAN;noerr;]</button>
                        <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.~moduleid;noerr][var.~page_url;noerr]';" value="Batal" class="btn default">[var.LABEL.BATAL;noerr;]</button>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>
      
</div>





