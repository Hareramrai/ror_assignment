// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require turbolinks
//= require_tree .

$(document).on('ready page:load', function(event){
	$('#colleges').DataTable({
		"bLengthChange": false,
		"ajax": {
		   "url": "/colleges.json",
		   "dataSrc": ""
		 },
		"columns": [
			{ "data": "name" },
			{ "data": "rank" },
			{ "data": "tuition_fees" },
			{ "data": "total_enrollment" },
			{ "data": "acceptance_rate" },
			{ "data": "average_retention_rates"},
			{ "data": "graduation_rate"}
		],
		order: [ [1,'asc'] ],
		columnDefs: [
			{ type: 'num-html', targets: 1 }
	  ]
	});
});
