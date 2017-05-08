console.log("Hola desde stock.js")

//funcion para tomar los datos del form stock-lookup-form
var init_stock_lookup = function(){

	console.log($("#stock-lookup-form"))

	$("#stock-lookup-form").on('ajax:success',function(event, data, status){

		//dentro del div del formulario se hace:
		$("#stock-lookup").html(data);

		//se vuelven a crear los listeners
		init_stock_lookup();

		//console.log(data)
	})

	$("#stock-lookup-form").on('ajax:error',function(event, xhr, status, error){

		$("#stock-lookup-results").remove("");

		$("#stock-lookup-errors").html('<div class="alert alert-danger">'+
				' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> '+
				'<strong>Error</strong> '+error+
			' </div>');

		console.log(event)
		console.log(xhr)
		console.log(status)
		console.log(error)

		init_stock_lookup();		
	})
}

$(document).ready(function(){
	init_stock_lookup();
})