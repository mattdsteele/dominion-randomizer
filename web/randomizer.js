var data = {
  cards : [
    {name: "Gold", cost: 6},
    {name: "Silver", cost: 3}
  ]
}

populateData = function(data) {
  $('#lists').children().remove();
  $.each(data.cards, function() {
    $('#lists').append('<li>' + stringize(this) + '</li>');
  });
  $('#lists').listview('refresh');
}

stringize = function(entry) {
  return entry.name + ' (' + entry.cost + ')';
}

$(document).ready(function() {
  $('#ib').click(function() {
    populateData(data);
    $.mobile.changePage('cards');
  });

  $('#refresh').click(function() {
    $.mobile.pageLoading();
    populateData(data);
    $.mobile.pageLoading(true);
  });
});
