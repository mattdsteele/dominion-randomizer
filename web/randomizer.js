$('div').live('pageshow', function(e, ui) {
    $('#lists').children().remove();
    $('#lists').append('<li>lskdfjaksldfj</li>');
    $('#lists').listview('refresh');
});
$('div').live('pagehide', function(e, ui) {
});
