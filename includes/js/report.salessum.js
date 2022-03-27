function docetak(){
	var options = { mode : "iframe", popClose : close, extraCss : "", retainAttr : "class,id,style,on", extraHead : "<h3>Laporan Rekapitulasi Penjualan Summary</h3>" };
	$("div.hidden-print").printArea( options );
}

function updateProgress(nilai){
	if(nilai > 100) nilai = 100;
	$('#panel').css('display','none');
	if(nilai>0){
	  $('#panel').css('display','block');
	} 
    $('#progressBar').css('width', nilai+'%');
    /*$('#progressBar').html(nilai+'%');*/
    $('#progressBar').html('Mohon tunggu, data sedang di proses...');
}

function progbar(_url) {
    $.ajax({
      url: _url,
      timeout: 50000,
	  complete: function(xhr, textStatus){
		if (textStatus != "success") {
	  	  updateProgress(100);
		  progbar();
	    }else{
	  	  updateProgress(0);
	    }		
	  }
    });
}

function doexpexcel(){ 
	kdcurr = $('#kdcurr').val();
	tglawal = $('#tglawal').val();
	tglakhir = $('#tglakhir').val();
	var _url = "excel.php?export=xlsx&id=report.salessum&kdcurr="+kdcurr+"&tglawal="+tglawal+"&tglakhir="+tglakhir;
	$('#panel').css('display', 'block');
	progbar(_url);
	window.location = _url;
	//alert(_url);
}

$(document).ready(function() {

	$('#form').bootstrapValidator({
        message: 'Nilai tidak valid',
        feedbackIcons: {
            valid: 'fa fa-check',
            invalid: 'fa fa-times',
            validating: 'fa fa-refresh'
        },
        fields: {
            kdcurr: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan ini harus di pilih'
                    }
                }
            },
            cmbbln: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            },
            cmbtahun: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            }
		}
    });
});
