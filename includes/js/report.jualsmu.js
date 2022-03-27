function docetak(){
	var options = { mode : "iframe", popClose : close, extraCss : "", retainAttr : "class,id,style,on", extraHead : "<h3>Laporan Rincian Penjualan SMU</h3>" };
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
	cmbtahun = $('#cmbtahun').val();
	cmbbln = $('#cmbbln').val();
	kdkota = $('#kdkota').val();
	kdkotatuj = $('#kdkotatuj').val();
	kdterbang = $('#kdterbang').val();
	var _url = "excel.php?export=xlsx&id=report.jualsmu&kdcurr="+kdcurr+"&cmbtahun="+cmbtahun+"&cmbbln="+cmbbln+"&kdkota="+kdkota+"&kdkotatuj="+kdkotatuj+"&kdterbang="+kdterbang;
	$('#panel').css('display', 'block');
	progbar(_url);
	window.location = _url;
	//alert(_url);
}

$(document).ready(function() {
	jQuery(document).ready(function(){
	  var cols = [{'columnName':'ckdbandara','width':'10','label':'Kode'}, 
				  {'columnName':'vnmbandara','width':'30','label':'Nama Bandara'},
				  {'columnName':'ckdkota','width':'10','label':'Kode'},
				  {'columnName':'vnmkota','width':'30','label':'Nama Kota'}
				 ];	
					
	  $( "#nmbandara" ).bind('keyup', function(){
		  if($( "#nmbandara" ).val().length==0){
			  $('#kdbandara').val("");
			  $( "#kdkota" ).val("");
			  $( "#nmkota" ).val("");
		  }
	  });
	  
	  $( "#nmbandara" ).combogrid({
		  debug:true,
		  colModel: cols,
		  url: 'ajax/bandara.php',
		  select: function( event, ui ) {
			  $( "#kdbandara" ).val( ui.item.ckdbandara );
			  $( "#nmbandara" ).val( ui.item.vnmbandara );
			  $( "#kdkota" ).val( ui.item.ckdkota );
			  $( "#nmkota" ).val( ui.item.vnmkota );
			  $('#form').bootstrapValidator('revalidateField', 'nmbandara');
			  return false;
		  }
	  });
	

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
			  return false;
		  }
	  });

	  /* kota tujuan */
	  var colstuj = [{'columnName':'ckdkota','width':'20','label':'Kode Kota'}, 
					 {'columnName':'vnmkota','width':'30','label':'Nama Kota'},
				     {'columnName':'vnmprovisi','width':'30','label':'Propinsi'}
				    ];	
					
	  $( "#nmkotatuj" ).bind('keyup', function(){
		  if($( "#nmkotatuj" ).val().length==0){
			  $('#kdkotatuj').val("");
		  }
	  });
	  
	  $( "#nmkotatuj" ).combogrid({
		  debug:true,
		  colModel: colstuj,
		  param : 'kdnegaratuj',
		  url: 'ajax/kota.param.php',
		  select: function( event, ui ) {
			  $( "#kdkotatuj" ).val( ui.item.ckdkota );
			  $( "#nmkotatuj" ).val( ui.item.vnmkota );
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
            nmbandara: {
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
