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
                            <th>[var.LABEL.KODE_AGENT;noerr;]</th>
                            <th>[var.LABEL.NAMA_AGENT;noerr;]</th>
                            <th>[var.LABEL.NEGARA;noerr;]</th>
                            <th>[var.LABEL.KOTA;noerr;]</th>
                            <th colspan="3">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.ckdagent;noerr;block=tr]</td>
                            <td>[grid_blk.vnmagent;noerr;block=tr]</td>
                            <td>[grid_blk.vnmnegara;noerr;block=tr]</td>
                            <td>[grid_blk.vnmkota;noerr;block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.ckdagent;noerr]'"><span class="fa fa-eject"></span></a>;else <span class="fa fa-eject"></span>]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.ckdagent;noerr]')"><span class="fa fa-trash-o"></span></a>;else <span class="fa fa-trash-o"></span>]</td>
                        </tr>
                        <tr>
                          <td colspan="4">&nbsp;</td>
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
                <input name='fkey' id='fkey' type='hidden' value='[grid_blk.ckdagent;noerr;]' size=/>
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.KODE_AGENT;noerr;]</label>
                            <input type="text" name="kdagent" id="kdagent" class="form-control" value="[grid_blk.ckdagent;noerr;]" disabled>
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.NAMA_AGENT;noerr;]</label>
                            <input type="text" name="nmagent" id="nmagent" class="form-control" value="[grid_blk.vnmagent;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.ALAMAT;noerr;]</label>
                            <textarea class="form-control" name="alamat" id="alamat" rows="3">[grid_blk.valamat;noerr;]</textarea>
                        </div>
                        <div class="form-group">
                            <label>[var.LABEL.NEGARA;noerr;]</label>
                            <select class="form-control" id="kdnegara" name="kdnegara">
                                <option value=''></option>
                                <option value='[blk_ngr.ckdnegara;noerr;block=option]' [onshow; if [grid_blk.ckdnegara;noerr]==[blk_ngr.ckdnegara;noerr];then 'selected';else '']>[blk_ngr.vnmnegara;noerr;block=option]</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.KOTA;noerr;]</label>
                            <input type="hidden" name="kdkota" id="kdkota" value="[grid_blk.ckdkota;noerr;]" class="form-control input-sm"/>
                            <input type="text" name="nmkota" id="nmkota" class="form-control" value="[grid_blk.vnmkota;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.KODE_POS;noerr;]</label>
                            <input type="text" name="kdpos" id="kdpos" class="form-control" value="[grid_blk.ckodepos;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.TELEPON;noerr;]</label>
                            <input type="text" name="telp" id="telp" class="form-control" value="[grid_blk.ctelp;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.FAXIMILI;noerr;]</label>
                            <input type="text" name="fax" id="fax" class="form-control" value="[grid_blk.cfax;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.EMAIL;noerr;]</label>
                            <input type="text" name="email" id="email" class="form-control" value="[grid_blk.cemail;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.WEBSITE;noerr;]</label>
                            <input type="text" name="website" id="website" class="form-control" value="[grid_blk.cwebsite;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">[var.LABEL.NAMA_KONTAK;noerr;]</label>
                            <input type="text" name="kontak" id="kontak" class="form-control" value="[grid_blk.ckontak;noerr;]">
                        </div>
                        <div class="form-group">
                            <label>[var.LABEL.JENIS_TARIF;noerr;]</label>
                            <select class="form-control" id="kdlevel" name="kdlevel">
                                <option value='[blk_lvl.cid;noerr;block=option]' [onshow; if [grid_blk.cleveltarif;noerr]==[blk_lvl.cid;noerr];then 'selected';else '']>[blk_lvl.cinfo;noerr;block=option]</option>
                            </select>
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
      
</div><!-- /.row -->
