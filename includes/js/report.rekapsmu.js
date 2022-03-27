function docetak(){
	var options = { mode : "iframe", popClose : close, extraCss : "", retainAttr : "class,id,style,on", extraHead : "<h3>Laporan Rekapitulasi Pemakaian SMU</h3>" };
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
	kdagent = $('#kdagent').val();
	kdcurr = $('#kdcurr').val();
	tglawal = $('#tglawal').val();
	tglakhir = $('#tglakhir').val();
	var _url = "excel.php?export=xlsx&id=report.rekapsmu&kdagent="+kdagent+"&kdcurr="+kdcurr+"&tglawal="+tglawal+"&tglakhir="+tglakhir;
	$('#panel').css('display', 'block');
	progbar(_url);
	window.location = _url;
	//alert(_url);
}

$(document).ready(function() {
	jQuery(document).ready(function(){
	  var cols = [{'columnName':'ckdagent','width':'30','label':'Kode Agent'}, 
				  {'columnName':'vnmagent','width':'50','label':'Nama Agent'}
				 ];	
					
	  $( "#nmagent" ).bind('keyup', function(){
		  if($( "#nmagent" ).val().length==0){
			  $('#kdagent').val("");
		  }
	  });
	  
	  $( "#nmagent" ).combogrid({
		  debug:true,
		  colModel: cols,
		  url: 'ajax/agent.php',
		  select: function( event, ui ) {
			  $( "#kdagent" ).val( ui.item.ckdagent );
			  $( "#nmagent" ).val( ui.item.vnmagent );
			  $('#form').bootstrapValidator('revalidateField', 'nmagent');
			  return false;
		  }
	  });
	
	});

	$('#form').bootstrapValidator({
        message: 'Nilai tidak valid',
        feedbackIcons: {
            valid: 'fa fa-check',
            invalid: 'fa fa-times',
            validating: 'fa fa-refresh'
        },
        fields: {
            nmagent: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan ini harus di pilih'
                    }
                }
            },
            kdcurr: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan ini harus di pilih'
                    }
                }
            },
            tglawal: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            },
            tglakhir: {
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
