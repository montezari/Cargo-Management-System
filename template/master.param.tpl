<div class="row">
    <div class="col-md-4">
        <div class="portlet box">
            <div class="portlet-body form">
                <!-- BEGIN FORM-->
                <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr][var.~page_url;noerr]">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label">Minimum Deposit Agent</label>
                            <input type="text" name="mixdeposit" id="mixdeposit" class="form-control" value="[grid_blk.cmindeposit;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">Maksimum Deposit Agent</label>
                            <input type="text" name="maxdeposit" id="maxdeposit" class="form-control" value="[grid_blk.cmaxdeposit;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">Alert Deposit Agent</label>
                            <input type="text" name="alertdeposit" id="alertdeposit" class="form-control" value="[grid_blk.calertdeposit;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">Label Level 1</label>
                            <input type="text" name="level1" id="level1" class="form-control" value="[grid_blk.clevel1;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">Label Level 2</label>
                            <input type="text" name="level2" id="level2" class="form-control" value="[grid_blk.clevel2;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">Label Level 3</label>
                            <input type="text" name="level3" id="level3" class="form-control" value="[grid_blk.clevel3;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">Label Level 4</label>
                            <input type="text" name="level4" id="level4" class="form-control" value="[grid_blk.clevel4;noerr;]">
                        </div>
                        <div class="form-group">
                            <label class="control-label">Label</label>
                            <textarea class="form-control" name="label" id="label" rows="6" cols="6">[grid_blk.clabel;noerr;]</textarea>
                        </div>
                    </div>

                    <div class="nobg fluid">
                        <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn blue">Simpan</button>
                    </div>
                </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>

</div>