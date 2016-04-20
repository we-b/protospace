$(document).on('ready', function() {
  function creatLikeAjax() {
    $.ajax({
      url: "/comments",
      type: "POST",
      done: function(data){
        console.log("成功")
      },
      fail: function(jqXHR, textStatus, errorThrown){
        alert(jqXHR, textStatus, errorThrown);
      }
    })
  }

  $('#js-comment').on('click', function(){
    creatLikeAjax();
  })
})
