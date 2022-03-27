function ConfirmDelete(val){
  if(confirm('anda yakin ingin menghapus data ini...?')){
     $('#fkey').val(val); 
	 $("form[name='grid']").submit();
  }  
}

$(document).ready(function() {
	$('#hrgbhnbakar').number(true, 2 );
	$('#hrgdasarkg').number(true, 2 );
	$('#hrgdasarkoli').number(true, 2 );
	
	$('#vtariflev1kg').number(true, 2 );
	$('#vqtylevlrag1kg').number(true, 2 );
	$('#vhrglev1rag1kg').number(true, 2 );
	$('#vqtylevlrag2kg').number(true, 2 );
	$('#vhrglev1rag2kg').number(true, 2 );
	$('#vqtylevlrag3kg').number(true, 2 );
	$('#vhrglev1rag3kg').number(true, 2 );
	$('#vtariflev1koli').number(true, 2 );
	$('#vqtylevlrag1koli').number(true, 2 );
	$('#vhrglev1rag1koli').number(true, 2 );
	$('#vqtylevlrag2koli').number(true, 2 );
	$('#vhrglev1rag2koli').number(true, 2 );
	$('#vqtylevlrag3koli').number(true, 2 );
	$('#vhrglev1rag3koli').number(true, 2 );
	$('#vtariflev2kg').number(true, 2 );
	$('#vqtylev2rag1kg').number(true, 2 );
	$('#vhrglev2rag1kg').number(true, 2 );
	$('#vqtylev2rag2kg').number(true, 2 );
	$('#vhrglev2rag2kg').number(true, 2 );
	$('#vqtylev2rag3kg').number(true, 2 );
	$('#vhrglev2rag3kg').number(true, 2 );
	$('#vtariflev2koli').number(true, 2 );
	$('#vqtylev2rag1koli').number(true, 2 );
	$('#vhrglev2rag1koli').number(true, 2 );
	$('#vqtylev2rag2koli').number(true, 2 );
	$('#vhrglev2rag2koli').number(true, 2 );
	$('#vqtylev2rag3koli').number(true, 2 );
	$('#vhrglev2rag3koli').number(true, 2 );
	$('#vtariflev3kg').number(true, 2 );
	$('#vqtylev3rag1kg').number(true, 2 );
	$('#vhrglev3rag1kg').number(true, 2 );
	$('#vqtylev3rag2kg').number(true, 2 );
	$('#vhrglev3rag2kg').number(true, 2 );
	$('#vqtylev3rag3kg').number(true, 2 );
	$('#vhrglev3rag3kg').number(true, 2 );
	$('#vtariflev3koli').number(true, 2 );
	$('#vqtylev3rag1koli').number(true, 2 );
	$('#vhrglev3rag1koli').number(true, 2 );
	$('#vqtylev3rag2koli').number(true, 2 );
	$('#vhrglev3rag2koli').number(true, 2 );
	$('#vqtylev3rag3koli').number(true, 2 );
	$('#vhrglev3rag3koli').number(true, 2 );
	$('#vtariflev4kg').number(true, 2 );
	$('#vqtylev4rag1kg').number(true, 2 );
	$('#vhrglev4rag1kg').number(true, 2 );
	$('#vqtylev4rag2kg').number(true, 2 );
	$('#vhrglev4rag2kg').number(true, 2 );
	$('#vqtylev4rag3kg').number(true, 2 );
	$('#vhrglev4rag3kg').number(true, 2 );
	$('#vtariflev4koli').number(true, 2 );
	$('#vqtylev4rag1koli').number(true, 2 );
	$('#vhrglev4rag1koli').number(true, 2 );
	$('#vqtylev4rag2koli').number(true, 2 );
	$('#vhrglev4rag2koli').number(true, 2 );
	$('#vqtylev4rag3koli').number(true, 2 );
	$('#vhrglev4rag3koli').number(true, 2 );


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
            kdcurr: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            },
            hrgdasarkg: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            },
            hrgdasarkoli: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            },
            kdtarif: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    },
                    stringLength: {
                        min: 1,
                        max: 15,
                        message: 'Inputan maksimal 15 karakter'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'Inputan tidak valid'
                    },
                    remote: {
                        url: 'validate.php?m=master.tarif',
                        message: 'Inputan sudah ada'
                    }
                }
            }
		}
    });
});
