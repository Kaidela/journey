// A $( document ).ready() block.
$( document ).ready(function() {
    $('.day-card').click(function() {
        $('.day-card').addClass('collapsed');
        $('.day-card').removeClass('expanded');
        $(this).addClass('expanded');
    });
});
