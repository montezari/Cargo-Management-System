function ConfirmDelete(val){
  var key = document.grid.fkey;
  
  if(confirm('anda yakin ingin membatalkan data ini...?')){
     key.value = val; 
	 document.grid.submit();
  }  
}

/********* set check box ****/
function setbiayafuel(){
  var nilai = $('#valbiayafuel').val();
  if($('#chkbiayafuel').is(':checked')){
    $('#biayafuel').val(nilai);   
  }else{
    $('#biayafuel').val("0");   
  }
  dohitung();
}

function setbiayasmu(){
  var nilai = $('#valbiayaadm').val(); 
  if($('#chkbiayasmu').is(':checked')){
    $('#biayaadm').val(nilai);   
  }else{
    $('#biayaadm').val("0");   
  }
  dohitung();
}

function setbiayalain(){
  var nilai = $('#valbiayalain').val(); 
  if($('#chkbiayalain').is(':checked')){
    $('#biayalain').val(nilai);   
  }else{
    $('#biayalain').val("0");   
  }
  dohitung();
}

function setppn(){
  var nilai = $('#valppn').val(); 
  if($('#chkppn').is(':checked')){
    $('#ppnpers').val(nilai);   
  }else{
    $('#ppnpers').val("0");   
  }
  dohitung();
}

/********* get nilai2 ****/
function getsaldo(){
  var kode = $('#kdagent').val();
  var curr = $('#kdcurr').val();
	
    $.ajax({ 
	  url: 'ajax/get.saldo.php', 
	  data: 'kd='+kode+'&cr='+curr, 
	  dataType: 'json', 
	  success: function(data){
	    $('#saldoagent').val(data.rows[0]["saldo"]);  
	  }
    });
}

function getsisaquota(){
  var kode = $('#kdterbang').val();
  var tgl = $('#tglterbang').val();
	
    $.ajax({ 
	  url: 'ajax/get.quota.php', 
	  data: 'kd='+kode+'&tgl='+tgl, 
	  dataType: 'json', 
	  success: function(data){
	    $('#sisakg').val(data.rows[0]["sisakg"]);  
	    $('#sisakoli').val(data.rows[0]["sisakoli"]);  
	  }
    });
}
/*===========================================*/
function gettarif(){
  var agent = $('#kdagent').val();
  var curr = $('#kdcurr').val();
  var kotaasal = $('#kdkotaasal').val();
  var kotatuj = $('#kdkotatuj').val();
  var jml = 0;

  if($('#jmlkg').val()>0){
    jml = $('#jmlkg').val();
  }else{
    jml = $('#hrgkg').val();
  }
  
  $.ajax({ 
	  url: 'ajax/get.tarif.php', 
	  data: 'ag='+agent+'&cr='+curr+'&asal='+kotaasal+'&tuj='+kotatuj+'&jml='+jml, 
	  dataType: 'json', 
	  success: function(data){
		$('#valbiayafuel').val(data.rows[0]["tariffuel"]);  
		$('#hrgkg').val(data.rows[0]["tarifkg"]);  
		$('#hrgkoli').val(data.rows[0]["tarifkoli"]);  
	  }
  });
}

function getbiayaadd(){
  var curr = $('#kdcurr').val();
	
    $.ajax({ 
	  url: 'ajax/get.biaya.php', 
	  data: 'cr='+curr, 
	  dataType: 'json', 
	  success: function(data){
	    $('#valbiayaadm').val(data.rows[0]["biayasmu"]);  
		if($('#chkbiayasmu').is(':checked')){
		  $('#biayaadm').val(data.rows[0]["biayasmu"]);   
		}
		$('#valbiayalain').val(data.rows[0]["biayalain"]);  
		if($('#chkbiayalain').is(':checked')){
		  $('#biayalain').val(data.rows[0]["biayalain"]);   
		}
	    $('#valppn').val(data.rows[0]["ppn"]); 
		if($('#chkppn').is(':checked')){
		  $('#ppnpers').val(data.rows[0]["ppn"]);   
		}
	  }
    });
}

/********* perhitungan ****/
function hitung_total(){
  var jml = 0;  var hrg = 0;  var total = 0; var nilai_ppn = 0;
  var jmlbrg = parseFloat($('#jmlbrg').val()) || 0; 
  var jmlkg = parseFloat($('#jmlkg').val()) || 0;
  var jmlkoli = parseFloat($('#jmlkoli').val()) || 0;
  var hrgkg = parseFloat($('#hrgkg').val()) || 0;
  var hrgkoli = parseFloat($('#hrgkoli').val()) || 0;
  var biayaadm = parseFloat($('#biayaadm').val()) || 0;
  var biayafuel = parseFloat($('#biayafuel').val()) || 0;
  var biayalain = parseFloat($('#biayalain').val()) || 0;
  var ppnpers = parseFloat($('#ppnpers').val()) || 0;
  var ppn = parseFloat($('#ppn').val()) || 0;
  
  if((jmlkg>0) && (jmlkoli>0)){
    alert("Mohon pilih salah satu berdasarkan KG atau KOLI");
  }

  jml = jmlkg>0 ? jmlkg : jmlkoli;
  hrg = jmlkg>0 ? hrgkg : hrgkoli;

  if(ppnpers>0){
    nilai_ppn = (ppnpers/100)*((jml*hrg)+biayafuel+biayalain);
  }else{
    $('#ppnpers').val("0");
    nilai_ppn = 0;
  }
  $('#ppn').val(nilai_ppn);

  total = (jml*hrg)+biayaadm+biayafuel+biayalain+nilai_ppn;
  $('#total').val(total);

}

function dohitung(){
  
  hitung_total();  
}

$(document).ready(function() {
    
	if($('#biayafuel').val()>0){
	  $('#chkbiayafuel').attr("checked", "checked");
    }
	if($('#biayaadm').val()>0){
	  $('#chkbiayasmu').attr("checked", "checked");
    }
	if($('#biayalain').val()>0){
	  $('#chkbiayalain').attr("checked", "checked");
    }
	if($('#ppn').val()>0){
	  $('#chkppn').attr("checked", "checked");
    }

	$('#saldoagent').number(true, 2 );
	$('#sisakg').number(true, 2 );
	$('#sisakoli').number(true, 2 );
	$('#jmlbrg').number(true, 2 );
	$('#jmlkg').number(true, 2 );
	$('#jmlkoli').number(true, 2 );
	$('#hrgkg').number(true, 2 );
	$('#hrgkoli').number(true, 2 );
	$('#biayaadm').number(true, 2 );
	$('#biayafuel').number(true, 2 );
	$('#biayalain').number(true, 2 );
	$('#ppnpers').number(true, 2 );
	$('#ppn').number(true, 2 );
	$('#total').number(true, 2 );

	jQuery(document).ready(function(){
	  /* agent */
	  var cols = [{'columnName':'ckdagent','width':'30','label':'Kode Agent'}, 
				  {'columnName':'vnmagent','width':'50','label':'Nama Agent'},
				  {'columnName':'ckdkota','hide':true,'width':'10','label':'kota'}
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
			  $( "#kdkotaasal" ).val( ui.item.ckdkota );
			  getsaldo(); // ngambil data saldo akhir
			  gettarif(); // gambil data biaya/tarif
			  $('#form').bootstrapValidator('revalidateField', 'nmagent');
			  return false;
		  }
	  });

	  /* no pesawat */
	  var colsps = [{'columnName':'cnopenerbangan','width':'30','label':'No Terbang'}, 
				    {'columnName':'vnmkotaasal','width':'30','label':'Dari'},
				    {'columnName':'vnmkotatuj','width':'30','label':'Tujuan'}
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
			  getsisaquota();
			  $('#form').bootstrapValidator('revalidateField', 'kdterbang');
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
			  gettarif(); // gambil data biaya/tarif
			  $('#form').bootstrapValidator('revalidateField', 'nmkotatuj');
		  return false;
		  }
	  });

	  /* kota transit */
	  var colstrans = [{'columnName':'ckdkota','width':'20','label':'Kode Kota'}, 
					   {'columnName':'vnmkota','width':'30','label':'Nama Kota'},
					   {'columnName':'vnmprovisi','width':'30','label':'Propinsi'}
					  ];	
					
	  $( "#nmkotatrans" ).bind('keyup', function(){
		  if($( "#nmkotatrans" ).val().length==0){
			  $('#kdkotatrans').val("");
		  }
	  });
	  
	  $( "#nmkotatrans" ).combogrid({
		  debug:true,
		  colModel: colstrans,
		  param : 'kdnegaratrans',
		  url: 'ajax/kota.param.php',
		  select: function( event, ui ) {
			  $( "#kdkotatrans" ).val( ui.item.ckdkota );
			  $( "#nmkotatrans" ).val( ui.item.vnmkota );
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
            tglmuatan: {
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
            kdterbang: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            },
            tglterbang: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    },
					date: {
                        format: 'DD/MM/YYYY',
                        message: 'Tanggal tidak valid'
                    }
                }
            }
		}
    });

    $('#tglmuatan').on('changeDate', function (ev) {
       $('#form').bootstrapValidator('revalidateField', 'tglmuatan');
    });
    $('#tglterbang').on('changeDate', function (ev) {
       $('#form').bootstrapValidator('revalidateField', 'tglterbang');
    });


});
