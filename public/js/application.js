$(document).ready(function() {
	$('#working').hide();
	$('#success').hide();
	$('#error').hide();
  $('#tweet_button').click(function(event){
    event.preventDefault();
    $('#tweet_text').attr( "disabled", true );
    $('p#working').show();
    var data = {tweet_text : $('#tweet_text').val()}
    $.post('/tweet',data,function(response){
      $('#working').hide();
	  $('#success').show();
	  $('#tweet_text').removeAttr('disabled');
      
    });
  });

});




