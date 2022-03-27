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
                            <th>[var.LABEL.KODE_TARIF;noerr;]</th>
                            <th>[var.LABEL.KOTA_ASAL;noerr;]</th>
                            <th>[var.LABEL.KOTA_TUJUAN;noerr;]</th>
                            <th colspan="3">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.ckdtarif;noerr;block=tr]</td>
                            <td>[grid_blk.kotaasal;noerr;block=tr]</td>
                            <td>[grid_blk.kotatuj;noerr;block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.ckdtarif;noerr]'"><span class="fa fa-eject"></span></a>;else <span class="fa fa-eject"></span>]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" class="back" onClick="ConfirmDelete('[grid_blk.ckdtarif;noerr]')"><span class="fa fa-trash-o"></span></a>;else <span class="fa fa-trash-o"></span>]</td>
                        </tr>
                        <tr>
                          <td colspan="3">&nbsp;</td>
                          <td colspan="2" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form'"><span class="fa fa-plus"></span></a>;else <span class="fa fa-plus"></span>]</td>
                        </tr>
                    </tbody>
                    <input type="hidden" name="FormAction" value="HAPUS">
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
                <input name='fkey' id='fkey' type='hidden' value='[grid_blk.ckdtarif;noerr;]' size=/>
                    <div class="form-body">
						<div class="row">
                       		<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KODE_TARIF;noerr;]</label>
                                    <input type="text" name="kdtarif" id="kdtarif" class="form-control" value="[grid_blk.ckdtarif;noerr;]" [onshow; if [grid_blk.ckdtarif;noerr;]!='';then 'disabled';else '']>
                                </div>
                            </div>     
                        </div>
						<div class="row">
                       		<div class="col-md-2">
                                <div class="form-group">
                                    <label>[var.LABEL.NAMA_MATA_UANG;noerr;]</label>
                                    <select class="form-control" id="kdcurr" name="kdcurr">
                                        <option value=''></option>
                                        <option value='[blk_curr.ckdcurrency;noerr;block=option]' [onshow; if [grid_blk.ckdcurrency;noerr]==[blk_curr.ckdcurrency;noerr];then 'selected';else '']>[blk_curr.vnmcurrency;noerr;block=option]</option>
                                    </select>
                                </div>
                            </div>     
                        </div>
						<div class="row">
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label>[var.LABEL.NEGARA_ASAL;noerr;]</label>
                                    <select class="form-control" id="kdnegaraasal" name="kdnegaraasal">
                                        <option value=''></option>
                                        <option value='[blk_asal.ckdnegara;noerr;block=option]' [onshow; if [grid_blk.ckdnegaraasal;noerr]==[blk_asal.ckdnegara;noerr];then 'selected';else '']>[blk_asal.vnmnegara;noerr;block=option]</option>
                                    </select>
                                </div>
                    		</div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.KOTA_ASAL;noerr;]</label>
                                    <input type="hidden" name="kdkotaasal" id="kdkotaasal" value="[grid_blk.ckdkotaasal;noerr;]" class="form-control input-sm"/>
                                    <input type="text" name="nmkotaasal" id="nmkotaasal" class="form-control" value="[grid_blk.kotaasal;noerr;]">
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
                        </div>    
 						<div class="row">
                       		<div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.HARGA_BAHAN_BAKAR;noerr;]</label>
                                    <input type="text" name="hrgbhnbakar" id="hrgbhnbakar" class="form-control" value="[grid_blk.vfuelsurcharge;noerr;]" >
                                </div>
                            </div>     
                        </div>                        
						<div class="row">
                        	<div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.HARGA_DASAR_KG;noerr;]</label>
                                    <input type="text" name="hrgdasarkg" id="hrgdasarkg" class="form-control" value="[grid_blk.vtarifdasarkg;noerr;]">
                                </div>
                    		</div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label class="control-label">[var.LABEL.HARGA_DASAR_KOLI;noerr;]</label>
                                    <input type="text" name="hrgdasarkoli" id="hrgdasarkoli" class="form-control" value="[grid_blk.vtarifdasarkoli;noerr;]">
                                </div>
                            </div>
                        </div>    
                    </div>
					
                    <!-- level 1 -->
					<div class="portlet box blue ">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-reorder"></i> [var.param.lbl_level1;noerr]
							</div>
						</div>
						<div class="portlet-body form">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_DASAR_KG;noerr;]</label>
                                            <input type="text" name="vtariflev1kg" id="vtariflev1kg" class="form-control" value="[grid_blk.vtariflev1kg;noerr;]">
                                        </div>
                                    </div>
                                </div>    
                                <!-- row 2 -->
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_1_KG;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylevlrag1kg" id="vqtylevlrag1kg" class="form-control" value="[grid_blk.vqtylevlrag1kg;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev1rag1kg" id="vhrglev1rag1kg" class="form-control" value="[grid_blk.vhrglev1rag1kg;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_2_KG;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylevlrag2kg" id="vqtylevlrag2kg" class="form-control" value="[grid_blk.vqtylevlrag2kg;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev1rag2kg" id="vhrglev1rag2kg" class="form-control" value="[grid_blk.vhrglev1rag2kg;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_3_KG;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylevlrag3kg" id="vqtylevlrag3kg" class="form-control" value="[grid_blk.vqtylevlrag3kg;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev1rag3kg" id="vhrglev1rag3kg" class="form-control" value="[grid_blk.vhrglev1rag3kg;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                </div>    
                                <!-- end row 2 -->
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_DASAR_KOLI;noerr;]</label>
                                            <input type="text" name="vtariflev1koli" id="vtariflev1koli" class="form-control" value="[grid_blk.vtariflev1koli;noerr;]">
                                        </div>
                                    </div>
                                </div>    
                                <!-- row 4 -->
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_1_KOLI;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylevlrag1koli" id="vqtylevlrag1koli" class="form-control" value="[grid_blk.vqtylevlrag1koli;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev1rag1koli" id="vhrglev1rag1koli" class="form-control" value="[grid_blk.vhrglev1rag1koli;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_2_KOLI;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylevlrag2koli" id="vqtylevlrag2koli" class="form-control" value="[grid_blk.vqtylevlrag2koli;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev1rag2koli" id="vhrglev1rag2koli" class="form-control" value="[grid_blk.vhrglev1rag2koli;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_3_KOLI;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylevlrag3koli" id="vqtylevlrag3koli" class="form-control" value="[grid_blk.vqtylevlrag3koli;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev1rag3koli" id="vhrglev1rag3koli" class="form-control" value="[grid_blk.vhrglev1rag3koli;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                </div>    
								<!-- end row 4 -->
                            </div>
						</div>
					</div>
					<!-- end level 1 -->
                    <!-- level 2 -->
					<div class="portlet box green ">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-reorder"></i> [var.param.lbl_level2;noerr]
							</div>
						</div>
						<div class="portlet-body form">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_DASAR_KG;noerr;]</label>
                                            <input type="text" name="vtariflev2kg" id="vtariflev2kg" class="form-control" value="[grid_blk.vtariflev2kg;noerr;]">
                                        </div>
                                    </div>
                                </div>    
                                <!-- row 2 -->
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_1_KG;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev2rag1kg" id="vqtylev2rag1kg" class="form-control" value="[grid_blk.vqtylev2rag1kg;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev2rag1kg" id="vhrglev2rag1kg" class="form-control" value="[grid_blk.vhrglev2rag1kg;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_2_KG;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev2rag2kg" id="vqtylev2rag2kg" class="form-control" value="[grid_blk.vqtylev2rag2kg;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev2rag2kg" id="vhrglev2rag2kg" class="form-control" value="[grid_blk.vhrglev2rag2kg;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_3_KG;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev2rag3kg" id="vqtylev2rag3kg" class="form-control" value="[grid_blk.vqtylev2rag3kg;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev2rag3kg" id="vhrglev2rag3kg" class="form-control" value="[grid_blk.vhrglev2rag3kg;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                </div>    
                                <!-- end row 2 -->
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_DASAR_KOLI;noerr;]</label>
                                            <input type="text" name="vtariflev2koli" id="vtariflev2koli" class="form-control" value="[grid_blk.vtariflev2koli;noerr;]">
                                        </div>
                                    </div>
                                </div>    
                                <!-- row 4 -->
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_1_KOLI;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev2rag1koli" id="vqtylev2rag1koli" class="form-control" value="[grid_blk.vqtylev2rag1koli;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev2rag1koli" id="vhrglev2rag1koli" class="form-control" value="[grid_blk.vhrglev2rag1koli;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_2_KOLI;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev2rag2koli" id="vqtylev2rag2koli" class="form-control" value="[grid_blk.vqtylev2rag2koli;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev2rag2koli" id="vhrglev2rag2koli" class="form-control" value="[grid_blk.vhrglev2rag2koli;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_3_KOLI;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev2rag3koli" id="vqtylev2rag3koli" class="form-control" value="[grid_blk.vqtylev2rag3koli;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev2rag3koli" id="vhrglev2rag3koli" class="form-control" value="[grid_blk.vhrglev2rag3koli;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                </div>    
								<!-- end row 4 -->
                            </div>
						</div>
					</div>
					<!-- end level 2 -->
                    <!-- level 3 -->
					<div class="portlet box yellow ">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-reorder"></i> [var.param.lbl_level3;noerr]
							</div>
						</div>
						<div class="portlet-body form">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_DASAR_KG;noerr;]</label>
                                            <input type="text" name="vtariflev3kg" id="vtariflev3kg" class="form-control" value="[grid_blk.vtariflev3kg;noerr;]">
                                        </div>
                                    </div>
                                </div>    
                                <!-- row 2 -->
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_1_KG;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev3rag1kg" id="vqtylev3rag1kg" class="form-control" value="[grid_blk.vqtylev3rag1kg;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev3rag1kg" id="vhrglev3rag1kg" class="form-control" value="[grid_blk.vhrglev3rag1kg;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_2_KG;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev3rag2kg" id="vqtylev3rag2kg" class="form-control" value="[grid_blk.vqtylev3rag2kg;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev3rag2kg" id="vhrglev3rag2kg" class="form-control" value="[grid_blk.vhrglev3rag2kg;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_3_KG;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev3rag3kg" id="vqtylev3rag3kg" class="form-control" value="[grid_blk.vqtylev3rag3kg;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev3rag3kg" id="vhrglev3rag3kg" class="form-control" value="[grid_blk.vhrglev3rag3kg;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                </div>    
                                <!-- end row 2 -->
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_DASAR_KOLI;noerr;]</label>
                                            <input type="text" name="vtariflev3koli" id="vtariflev3koli" class="form-control" value="[grid_blk.vtariflev3koli;noerr;]">
                                        </div>
                                    </div>
                                </div>    
                                <!-- row 4 -->
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_1_KOLI;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev3rag1koli" id="vqtylev3rag1koli" class="form-control" value="[grid_blk.vqtylev3rag1koli;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev3rag1koli" id="vhrglev3rag1koli" class="form-control" value="[grid_blk.vhrglev3rag1koli;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_2_KOLI;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev3rag2koli" id="vqtylev3rag2koli" class="form-control" value="[grid_blk.vqtylev3rag2koli;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev3rag2koli" id="vhrglev3rag2koli" class="form-control" value="[grid_blk.vhrglev3rag2koli;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_3_KOLI;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev3rag3koli" id="vqtylev3rag3koli" class="form-control" value="[grid_blk.vqtylev3rag3koli;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev3rag3koli" id="vhrglev3rag3koli" class="form-control" value="[grid_blk.vhrglev3rag3koli;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                </div>    
								<!-- end row 4 -->
                            </div>
						</div>
					</div>
					<!-- end level 3 -->
                    <!-- level 4 -->
					<div class="portlet box red ">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-reorder"></i> [var.param.lbl_level4;noerr]
							</div>
						</div>
						<div class="portlet-body form">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_DASAR_KG;noerr;]</label>
                                            <input type="text" name="vtariflev4kg" id="vtariflev4kg" class="form-control" value="[grid_blk.vtariflev4kg;noerr;]">
                                        </div>
                                    </div>
                                </div>    
                                <!-- row 2 -->
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_1_KG;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev4rag1kg" id="vqtylev4rag1kg" class="form-control" value="[grid_blk.vqtylev4rag1kg;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev4rag1kg" id="vhrglev4rag1kg" class="form-control" value="[grid_blk.vhrglev4rag1kg;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_2_KG;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev4rag2kg" id="vqtylev4rag2kg" class="form-control" value="[grid_blk.vqtylev4rag2kg;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev4rag2kg" id="vhrglev4rag2kg" class="form-control" value="[grid_blk.vhrglev4rag2kg;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_3_KG;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev4rag3kg" id="vqtylev4rag3kg" class="form-control" value="[grid_blk.vqtylev4rag3kg;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev4rag3kg" id="vhrglev4rag3kg" class="form-control" value="[grid_blk.vhrglev4rag3kg;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                </div>    
                                <!-- end row 2 -->
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_DASAR_KOLI;noerr;]</label>
                                            <input type="text" name="vtariflev4koli" id="vtariflev4koli" class="form-control" value="[grid_blk.vtariflev4koli;noerr;]">
                                        </div>
                                    </div>
                                </div>    
                                <!-- row 4 -->
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_1_KOLI;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev4rag1koli" id="vqtylev4rag1koli" class="form-control" value="[grid_blk.vqtylev4rag1koli;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev4rag1koli" id="vhrglev4rag1koli" class="form-control" value="[grid_blk.vhrglev4rag1koli;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_2_KOLI;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev4rag2koli" id="vqtylev4rag2koli" class="form-control" value="[grid_blk.vqtylev4rag2koli;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev4rag2koli" id="vhrglev4rag2koli" class="form-control" value="[grid_blk.vhrglev4rag2koli;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">[var.LABEL.HARGA_RANGE_3_KOLI;noerr;]</label>
                                            <div class="col-md">
                                                <div class="form-group row">
                                                	<label for="inputKey" class="col-md-1 control-label">[var.LABEL.QTY;noerr;]</label>
                                                    <div class="col-md-3">
                                                        <input type="text" name="vqtylev4rag3koli" id="vqtylev4rag3koli" class="form-control" value="[grid_blk.vqtylev4rag3koli;noerr;]">
                                                    </div>	
                                                    <label for="inputKey" class="col-md-2 control-label">[var.LABEL.HARGA;noerr;]</label>
                                                    <div class="col-md-6">
                                                        <input type="text" name="vhrglev4rag3koli" id="vhrglev4rag3koli" class="form-control" value="[grid_blk.vhrglev4rag3koli;noerr;]">
                                                    </div>
                                                </div>
                                            </div>	
                                        </div>
                                    </div>
                                </div>    
								<!-- end row 4 -->
                            </div>
						</div>
					</div>
					<!-- end level 4 -->

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