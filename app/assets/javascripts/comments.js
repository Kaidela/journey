$(document).ready(
	function() {
		$('.CreateComment').submit(function() {
			$.post($(this).attr('action'), $(this).serialize(), function(data){
				console.log(data);
			});
			return false;
		});	
	}
);