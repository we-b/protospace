$(document).on("ready page:load", function(){
  const mainImageId = "#js-main-image"
  const subFirstImageId = "#js-sub-image-1"
  const subSecondImageId = "#js-sub-image-2"
  const subThirdImageId = "#js-sub-image-3"

  function uploadImage(idName){
    $(idName + ' input[type=file]').change(function(){
      let file = $(this).prop('files')[0];
      if(file.type.match('image.*')) {
        setImage(file, idName);
      } else {
        alert("Please upload image");
      }
    });
  }

  function setImage(file, idName) {
    var reader = new FileReader();
    reader.onload = function() {
      $(idName + ' img').attr('src', reader.result);
      $(idName + ' img').addClass("image-preview")
    }
    reader.readAsDataURL(file);
  }

  uploadImage(mainImageId);
  uploadImage(subFirstImageId);
  uploadImage(subSecondImageId);
  uploadImage(subThirdImageId);
})
