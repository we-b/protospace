$(document).on('ready', function() {
  function creatLikeAjax() {
    $.ajax({
      url: "/comments",
      type: "POST",
      dataType: "json",
      success: function(data){
        addComment(data)
      },
      error: function(data){
        alert(xhr.status, status, error.toString());
      }
    })
  }

  function addComment(data) {
    debugger
    $('#comments-number').text(data.commentNum);
    $('#comment-field').val('');
  }

  $('#js-comment').on('click', function(){
    creatLikeAjax();
  })
})
