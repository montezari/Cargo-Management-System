function ConfirmDelete(val){
  if(confirm('anda yakin ingin menghapus data ini...?')){
     $('#fkey').val(val); 
	 $("form[name='grid']").submit();
  }  
}

$(document).ready(function() {
	jQuery(document).ready(function(){
	  var cols = [{'columnName':'ckdkota','width':'20','label':'Kode Kota'}, 
				  {'columnName':'vnmkota','width':'30','label':'Nama Kota'},
				  {'columnName':'vnmprovisi','width':'30','label':'Propinsi'}
				 ];	
					
	  $( "#nmkota" ).bind('keyup', function(){
		  if($( "#nmkota" ).val().length==0){
			  $('#kdkota').val("");
		  }
	  });
	  
	  $( "#nmkota" ).combogrid({
		  debug:true,
		  colModel: cols,
		  param : 'kdnegara',
		  url: 'ajax/kota.param.php',
		  select: function( event, ui ) {
			  $( "#kdkota" ).val( ui.item.ckdkota );
			  $( "#nmkota" ).val( ui.item.vnmkota );
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
            kdnegara: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan ini harus di pilih'
                    }
                }
            },
            nmkota: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            },
            kdbandara: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    },
                    stringLength: {
                        min: 1,
                        max: 5,
                        message: 'Inputan maksimal 5 karakter'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'Inputan tidak valid'
                    },
                    remote: {
                        url: 'validate.php?m=master.bandara',
                        message: 'Inputan sudah ada'
                    }
                }
            }
		}
    });
});
