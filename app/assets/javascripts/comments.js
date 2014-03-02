$(document).ready(
	function() {
		$('.CreateComment').submit(function() {
			$.post($(this).attr('action'), $(this).serialize(), function(data){
				$('.day-comments-list').prepend(data);
				$('#comment_name').val('');
				$('#comment_email').val('');
				$('#comment_body').val('');
			});
			return false;
		});	
	}
);