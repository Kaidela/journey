$(document).ready(
	function() {
		$('.CreateComment').submit(function() {
			var form = $(this);
			var comments = form.closest('.day-card-comments');
			$.post($(this).attr('action'), $(this).serialize(), function(data){
				$('#comment_name', form).val('');
				$('#comment_email', form).val('');
				$('#comment_body', form).val('');

				$('.day-comments-list', comments).prepend(data);
			});
			return false;
		});
	}
);
