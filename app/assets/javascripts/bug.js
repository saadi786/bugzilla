$(document).ready(function(){
	$('#assign').click(function(e){
		e.preventDefault();
		url  = $(this).attr('href')
		$.ajax({
          url: url,
          type: 'PATCH',
          dataType: 'JSON',
          success: function(data){}

		});
	});

});




$(document).on('change','#bug_bug_type', (function(){

var bug=this.value
if(bug=='BUG'){
	var  status_select=$('#bug_status');
    var bug_options=['new','started','resolved'];
    status_select.html('');

     bug_options.forEach(function(option,index){
      	   status_select.append(`<option value='${option}'>${option} </option>`)
      })

 }else{
    var  status_select=$('#bug_status');
    var bug_options=['new','started','completed'];
    status_select.html('');

     bug_options.forEach(function(option,index){
      	   status_select.append(`<option value='${option}'>${option} </option>`)
      })



    }


  })
)





