
function handleData(data) {
    

    $(".like-count[data-post=" + data.post + "]").text(data.likes);//do some stuff
};

$(document).ready(function(){
  $(document).on('click', '.like-btn', function(){
    $.ajax({
      url: "/likes",
      method: 'POST',
      dataType: 'json',
      data: {
        likes: {
          user_id: $(this).data('user'),
          post_id: $(this).data('post')
        }
      },
     success: handleData
    });
    });
  });
