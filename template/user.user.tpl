<div class="row">
    <div class="col-xs-12">
        <div class="box">
        [onload_1; when [var.mode;noerr]==0; block=div]
        

            <div class="box-header">
              <div style="padding-top:5px;padding-left:10px;">
                <div>Jumlah Data : [var.~recordcount;noerr]</div>
                <div>Halaman : [var.~page_sequence;noerr]</div>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body table-responsive">
                <table id="example2" class="table table-bordered table-hover">
                <form action="index.php?m=[var.~moduleid;noerr][var.~page_url;noerr]" method="post" name='grid'>
                <input name='fkey' id='fkey' type='hidden' size=/>
                    <thead>
                        <tr>
                            <th width="25">#</th>
                            <th>Departemen</th>
                            <th>Nama Pegawai</th>
                            <th>User Name</th>
                            <th>Status</th>
                            <th colspan="3">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.#; block=tr;noerr]</td>
                            <td>[grid_blk.vNmDept;noerr;block=tr]</td>
                            <td>[grid_blk.cNamaLengkap;noerr;block=tr]</td>
                            <td>[grid_blk.cUserName;noerr;block=tr]</td>
                            <td>[grid_blk.cAktif;noerr;if [grid_blk.cAktif;noerr]=='1';then 'Aktif';else 'Tidak Aktif';block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=proyek&key=[grid_blk.cIdUser;noerr]'"><span class="fa fa-sitemap"></span></a>;else <span class="fa fa-sitemap"></span>]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cIdUser;noerr]'"><span class="fa fa-eject"></span></a>;else <span class="fa fa-eject"></span>]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.cIdUser;noerr]')"><span class="fa fa-trash-o"></span></a>;else <span class="fa fa-trash-o"></span>]</td>
                        </tr>
                        <tr>
                          <td colspan="5">&nbsp;</td>
                          <td colspan="3" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form'"><span class="fa fa-plus"></span></a>;else <span class="fa fa-plus"></span>]</td>
                        </tr>
                    </tbody>
                    <input type="hidden" name="FormAction" value="HAPUS">
  					</form>
                </table>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
        
		<div class="col-md">
        [onload_1; when [var.mode;noerr]==1; block=div]
            <!-- general form elements disabled -->
            <div class="box box-warning">
                <div class="box-body">
                    <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr][var.~page_url;noerr]">
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cIdUser;noerr;]' size=/>
                        <!-- text input -->
                        <div class="form-group">
                            <label>Departemen</label>
                            <select class="form-control" id="cmbdept" name="cmbdept" style="width:350px;">
                                <option value=''></option>
                                <option value='[blk_dept.cKdDept;noerr;block=option]' [onshow; if [grid_blk.cKdDept;noerr]==[blk_dept.cKdDept;noerr];then 'selected';else '']>[blk_dept.vNmDept;noerr;block=option]</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Nama Pegawai</label>
                            <input type="text" name="vNamaPegawai" id="vNamaPegawai" class="form-control" style="width:250px;" value="[grid_blk.cNamaLengkap;noerr;]"/>
                        </div>
                       <div class="form-group">
                            <label>User Name</label>
                            <input type="text" name="cUserName" id="cUserName" class="form-control" style="width:250px;" value="[grid_blk.cUserName;noerr;]"/>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="cPassword" id="cPassword" class="form-control" style="width:250px;" value="[var.cPassword;noerr;]"/>
                        </div>
                        <div class="form-group">
                            <label>User Group</label>
                            <select class="form-control" id="cmbgroup" name="cmbgroup" style="width:250px;">
                                <option value=''></option>
                                <option value='[blk_grp.cKdGroupUser;noerr;block=option]' [onshow; if [grid_blk.cKdGroupUser;noerr]==[blk_grp.cKdGroupUser;noerr];then 'selected';else '']>[blk_grp.vNmGroupUser;noerr;block=option]</option>
                            </select>
                        </div>
                        <div class="form-group"> 
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="1" id="cAktif" name="cAktif" [onshow; if [grid_blk.cAktif;noerr;]=='1';then 'checked'; else '']/>Aktif</label>                                                
                            </div>
                        </div>
                        <div class="form-group"> 
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="1" id="cSuper" name="cSuper" [onshow; if [grid_blk.cSuper;noerr;]=='1';then 'checked'; else '']/>Super Administrator</label>                                                
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn btn-primary">Simpan</button>
                            <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.~moduleid;noerr][var.~page_url;noerr]';" value="Batal" class="btn btn-primary">Batal</button>
                        </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
<script type="text/javascript">
$(document).ready(function() {
    $('#form').bootstrapValidator({
        message: 'Nilai tidak valid',
        feedbackIcons: {
            valid: 'fa fa-check',
            invalid: 'fa fa-times',
            validating: 'fa fa-refresh'
        },
        fields: {
            cUserName: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    },
                    stringLength: {
                        min: 1,
                        max: 30,
                        message: 'Inputan maksimal 30 karakter'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'Inputan tidak valid'
                    },
                    remote: {
                        url: 'validate.php?m=[var.~moduleid;noerr]',
                        message: 'Inputan sudah ada'
                    }
                }
            }
		}
    });
});
</script>
        </div>

<div class="col-md">
        [onload_1; when [var.mode;noerr]==2; block=div]
            <!-- general form elements disabled -->
            <div class="box box-warning">
                <div class="box-body">
                    <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr][var.~page_url;noerr]">
                    <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cIdUser;noerr;]' size=/>
                    <input name='fname' id='fname' type='hidden' value='[grid_blk.cUserName;noerr;]' size=/>
                        <div class="form-group">
                            <label>Nama Pegawai</label>
                            <input type="text" name="vNamaPegawai" id="vNamaPegawai" class="form-control" style="width:250px;" value="[grid_blk.cNamaLengkap;noerr;]" readonly/>
                        </div>
                       <div class="form-group">
                            <label>User Name</label>
                            <input type="text" name="cUserName" id="cUserName" class="form-control" style="width:250px;" value="[grid_blk.cUserName;noerr;]" readonly/>
                        </div>

<script type="text/javascript">
$(document).ready(function() {
    $('#selecctall').click(function(event) {  
        if(this.checked) { 
            $('.checkbox1').each(function() { 
                this.checked = true;              
            });
        }else{
            $('.checkbox1').each(function() { 
                this.checked = false;                       
            });        
        }
    });
});
</script>
                        <div class="box-body table-responsive">
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th width="25">#</th>
                                        <th>Proyek</th>
                                        <th width="25"><label><input type="checkbox" id="selecctall"/></label> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>[blk_dtl.#; block=tr;noerr]</td>
                                        <td>[blk_dtl.vNamaProyek;noerr;block=tr]</td>
                                        <td>
                                		<label><input class="checkbox1" type="checkbox" value="[blk_dtl.cIdProyek;noerr;]" id="cakses[]" name="cakses[]" [onshow; if [blk_dtl.cStatus;block=tr]=='1';then 'checked';else '']/></label>                                              
                                        </td>
                                    </tr>
                                </tbody>
                          </table>
                      </div>
                        
                        <div class="box-footer">
                            <button type="submit" id="FormAction" name="FormAction" value="UpdateProyek" class="btn btn-primary">Simpan</button>
                            <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.~moduleid;noerr][var.~page_url;noerr]';" value="Batal" class="btn btn-primary">Batal</button>
                        </div>
                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
        
    </div>
</div>



