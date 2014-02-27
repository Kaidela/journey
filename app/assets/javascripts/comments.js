$(document).ready(
	function() {
		$('.CreateComment').submit(function() {
			$.post($(this).attr('action'), $(this).serialize(), function(data){
				$('.day-comments-list').append(data);
			});
			return false;
		});	
	}
);