<script language="javascript">
function ConfirmDelete(val){
  var key = document.grid.fkey;
  
  if(confirm('anda yakin ingin menghapus data ini...?')){
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
                            <th>[var.LABEL.NO_SETORAN;noerr;]</th>
                            <th>[var.LABEL.TGL_SETORAN;noerr;]</th>
                            <th>[var.LABEL.NAMA_AGENT;noerr;]</th>
                            <th>[var.LABEL.MATA_UANG;noerr;]</th>
                            <th>[var.LABEL.JUMLAH;noerr;]</th>
                            <th colspan="3">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.cnosetoran;noerr;block=tr]</td>
                            <td>[grid_blk.dtglsetoran;frm='dd/mm/yyyy';noerr;block=tr]</td>
                            <td>[grid_blk.vnmagent;noerr;block=tr]</td>
                            <td>[grid_blk.vnmcurrency;noerr;block=tr]</td>
                            <td>[grid_blk.vjmlsetoran;frm='0,000.00';noerr;block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cnosetoran;noerr]'"><span class="fa fa-eject"></span></a>;else <span class="fa fa-eject"></span>]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.cnosetoran;noerr]')"><span class="fa fa-trash-o"></span></a>;else <span class="fa fa-trash-o"></span>]</td>
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
          
    <div class="col-md-4">
    [onload_1; when [var.mode;noerr]==1; block=div]
        <div class="portlet box">
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr][var.~page_url;noerr]">
                <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cnosetoran;noerr;]' size=/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.NO_SETORAN;noerr;]</label>
                            <input type="text" name="cnosetor" id="cnosetor" class="form-control" value="[grid_blk.cnosetoran;noerr;]" disabled>
                        </div>
                        <div class="form-group">	
                            <label class="control-label">[var.LABEL.TGL_SETORAN;noerr;]</label>
                            <input type="text" name="tglsetor" id="tglsetor" class="form-control date-picker" value="[grid_blk.dtglsetoran;frm='dd/mm/yyyy';noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.NAMA_AGENT;noerr;]</label>
                            <input type="hidden" name="kdagent" id="kdagent" value="[grid_blk.ckdagent;noerr;]" class="form-control input-sm"/>
                            <input type="text" name="nmagent" id="nmagent" class="form-control" value="[grid_blk.vnmagent;noerr;]">
                        </div>
                        <div class="form-group">
                            <label>[var.LABEL.MATA_UANG;noerr;]</label>
                            <select class="form-control" id="kdcurr" name="kdcurr">
                                <option value=''></option>
                                <option value='[blk_curr.ckdcurrency;noerr;block=option]' [onshow; if [grid_blk.ckdcurrency;noerr]==[blk_curr.ckdcurrency;noerr];then 'selected';else '']>[blk_curr.vnmcurrency;noerr;block=option]</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.JUMLAH;noerr;]</label>
                            <input type="text" name="jmlsetor" id="jmlsetor" class="form-control" value="[grid_blk.vjmlsetoran;noerr;]">
                        </div>
                        <div class="form-group">
                            <label>[var.LABEL.NAMA_SETORAN;noerr;]</label>
                            <select class="form-control" id="kdjenissetor" name="kdjenissetor">
                                <option value=''></option>
                                <option value='[blk_setor.ckdjenissetor;noerr;block=option]' [onshow; if [grid_blk.ckdjenissetor;noerr]==[blk_setor.ckdjenissetor;noerr];then 'selected';else '']>[blk_setor.vnmjenissetor;noerr;block=option]</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.KETERANGAN;noerr;]</label>
                            <textarea class="form-control" name="ket" id="ket" rows="3">[grid_blk.vketerangan;noerr;]</textarea>
                        </div>
                    </div>

                    <div class="nobg fluid">
                        <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn blue">[var.LABEL.SIMPAN;noerr;]</button>
                        <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.~moduleid;noerr][var.~page_url;noerr]';" value="Batal" class="btn default">Batal</button>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>
      
</div><!-- /.row -->
