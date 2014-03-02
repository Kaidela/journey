// A $( document ).ready() block.
$( document ).ready(function() {
    $('.day-card').click(function() {
    	if (!$(this).hasClass('expanded')) {
	        $('.day-card').addClass('collapsed');
	        $('.day-card').removeClass('expanded');
	        $(this).addClass('expanded');
	        var cardPosition = $(this).position();
	        $( document ).scrollTop(cardPosition.top);
    	}
    });
});
