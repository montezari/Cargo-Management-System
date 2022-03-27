function docetak(){
	var options = { mode : "iframe", popClose : close, extraCss : "", retainAttr : "class,id,style,on", extraHead : "<h3>Laporan Manifest Penerbangan</h3>" };
	$("div.hidden-print").printArea( options );
}

function print_qrbarcode(){
	var rec = $('#rec').val() || 0;
	if(rec>0){
	  var options = { mode : "iframe", popClose : close, extraCss : "", retainAttr : "class,id,style,on", extraHead : "<h4>Barcode Manifest Penerbangan</h4>" };
	  $("div.barcode-print").printArea( options );
	}else{
	  alert("Mohon tampilkan data dahulu / data tidak di ketemukan");
	}
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
	kdterbang = $('#kdterbang').val();
	tglawal = $('#tglawal').val();
	var _url = "excel.php?export=xlsx&id=report.manifest&kdterbang="+kdterbang+"&tglawal="+tglawal;
	$('#panel').css('display', 'block');
	progbar(_url);
	window.location = _url;
	//alert(_url);
}

$(document).ready(function() {

	jQuery(document).ready(function(){
	  /* no pesawat */
	  var colsps = [{'columnName':'cnopenerbangan','width':'30','label':'No Terbang'}, 
				    {'columnName':'csisakg','width':'30','label':'KG'},
				    {'columnName':'csisakoli','width':'30','label':'Koli'}
				   ];	
					
	  $( "#kdterbang" ).bind('keyup', function(){
		  if($( "#kdterbang" ).val().length==0){
			  $('#kdterbang').val("");
		  }
	  });
	  
	  $( "#kdterbang" ).combogrid({
		  debug:true,
		  colModel: colsps,
		  url: 'ajax/pesawat.php',
		  select: function( event, ui ) {
			  $( "#kdterbang" ).val( ui.item.cnopenerbangan );
			  $('#form').bootstrapValidator('revalidateField', 'kdterbang');
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
            kdterbang: {
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
                        message: 'Inputan ini harus di pilih'
                    },
					date: {
                        format: 'DD/MM/YYYY',
                        message: 'Tanggal tidak valid'
                    }
                }
            }
		}
    });

    $('#tglawal').on('changeDate', function (ev) {
       $('#form').bootstrapValidator('revalidateField', 'tglawal');
    });

});
