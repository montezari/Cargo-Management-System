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
                            <th>[var.LABEL.NAMA_MATA_UANG;noerr;]</th>
                            <th>[var.LABEL.BIAYA_ADMIN_SMU;noerr;]</th>
                            <th>[var.LABEL.BIAYA_TAMBAHAN_LAIN;noerr;]</th>
                            <th>[var.LABEL.PPN;noerr;] (%)</th>
                            <th colspan="3">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.vnmcurrency;noerr;block=tr]</td>
                            <td>[grid_blk.vbiayaadmsmu;frm='0,000.00';noerr;block=tr]</td>
                            <td>[grid_blk.vbiayalain;frm='0,000.00';noerr;block=tr]</td>
                            <td>[grid_blk.vppn;noerr;frm='0,000.00';block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.kdcurr;noerr]'"><span class="fa fa-eject"></span></a>;else <span class="fa fa-eject"></span>]</td>
                        </tr>
                    </tbody>
  					</form>
                </table>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
    </div><!-- /.col -->    
      
    <div class="col-md-4">
    [onload_1; when [var.mode;noerr]==1; block=div]
        <div class="portlet box">
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr][var.~page_url;noerr]">
                <input name='fkey' id='fkey' type='hidden' value='[grid_blk.ckdcurrency;noerr;]' size=/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.NAMA_MATA_UANG;noerr;]</label>
                            <input type="hidden" name="kdcurr" id="kdcurr" value="[grid_blk.kdcurr;noerr;]" class="form-control input-sm"/>
                            <input type="text" name="nmcurr" id="nmcurr" class="form-control" value="[grid_blk.vnmcurrency;noerr;]" disabled>
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.BIAYA_ADMIN_SMU;noerr;]</label>
                            <input type="text" name="biayasmu" id="biayasmu" class="form-control" value="[grid_blk.vbiayaadmsmu;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.BIAYA_TAMBAHAN_LAIN;noerr;]</label>
                            <input type="text" name="biayalain" id="biayalain" class="form-control" value="[grid_blk.vbiayalain;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.PPN;noerr;] (%)</label>
                            <input type="text" name="ppn" id="ppn" class="form-control" value="[grid_blk.vppn;noerr;]">
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