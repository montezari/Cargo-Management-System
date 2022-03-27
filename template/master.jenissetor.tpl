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
                            <th>[var.LABEL.KODE_SETORAN;noerr;]</th>
                            <th>[var.LABEL.NAMA_SETORAN;noerr;]</th>
                            <th colspan="3">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.ckdjenissetor;noerr;block=tr]</td>
                            <td>[grid_blk.vnmjenissetor;noerr;block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.ckdjenissetor;noerr]'"><span class="fa fa-eject"></span></a>;else <span class="fa fa-eject"></span>]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.ckdjenissetor;noerr]')"><span class="fa fa-trash-o"></span></a>;else <span class="fa fa-trash-o"></span>]</td>
                        </tr>
                        <tr>
                          <td colspan="2">&nbsp;</td>
                          <td colspan="2" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form'"><span class="fa fa-plus"></span></a>;else <span class="fa fa-plus"></span>]</td>
                        </tr>
                    </tbody>
                    <input type="hidden" name="FormAction" value="HAPUS">
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
                <input name='fkey' id='fkey' type='hidden' value='[grid_blk.ckdjenissetor;noerr;]' size=/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.KODE_SETORAN;noerr;]</label>
                            <input type="text" name="kdsetoran" id="kdsetoran" class="form-control" value="[grid_blk.ckdjenissetor;noerr;]" [onshow; if [grid_blk.ckdjenissetor;noerr;]!='';then 'disabled';else '']>
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.NAMA_SETORAN;noerr;]</label>
                            <input type="text" name="nmsetoran" id="nmsetoran" class="form-control" value="[grid_blk.vnmjenissetor;noerr;]">
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