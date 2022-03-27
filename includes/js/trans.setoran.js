$(document).ready(function() {

	$('#jmlsetor').number(true, 2 );

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
            tglsetor: {
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
            },
            nmagent: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            },
            kdjenissetor: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            }
		}
    });

    $('#tglsetor').on('changeDate', function (ev) {
       $('#form').bootstrapValidator('revalidateField', 'tglsetor');
    });

});
