function ConfirmDelete(val){
  if(confirm('anda yakin ingin menghapus data ini...?')){
     $('#fkey').val(val); 
	 $("form[name='grid']").submit();
  }  
}

$(document).ready(function() {
	$('#kuotakg').number(true, 2 );
	$('#kuotakoli').number(true, 2 );

	jQuery(document).ready(function(){
	  /* kota asal */
	  var colsasal = [{'columnName':'ckdkota','width':'20','label':'Kode Kota'}, 
					  {'columnName':'vnmkota','width':'30','label':'Nama Kota'},
				      {'columnName':'vnmprovisi','width':'30','label':'Propinsi'}
				     ];	
					
	  $( "#nmkotaasal" ).bind('keyup', function(){
		  if($( "#nmkotaasal" ).val().length==0){
			  $('#kdkotaasal').val("");
		  }
	  });
	  
	  $( "#nmkotaasal" ).combogrid({
		  debug:true,
		  colModel: colsasal,
		  param : 'kdnegaraasal',
		  url: 'ajax/kota.param.php',
		  select: function( event, ui ) {
			  $( "#kdkotaasal" ).val( ui.item.ckdkota );
			  $( "#nmkotaasal" ).val( ui.item.vnmkota );
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
            kdnegaraasal: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan ini harus di pilih'
                    }
                }
            },
            nmkotaasal: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            },
            kdnegaratuj: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan ini harus di pilih'
                    }
                }
            },
            nmkotatuj: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            },
            kdterbang: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    },
                    stringLength: {
                        min: 1,
                        max: 10,
                        message: 'Inputan maksimal 10 karakter'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'Inputan tidak valid'
                    },
                    remote: {
                        url: 'validate.php?m=master.penerbangan',
                        message: 'Inputan sudah ada'
                    }
                }
            }
		}
    });
});
