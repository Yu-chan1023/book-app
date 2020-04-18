$(function(){
  function buildHTML(comment){
    var html = `<div class="comments__a">
                  <div class="comments__img">
                    <img class="img" src="${comment.user_image}">
                  </div>
                  <div class="comments__content">
                    <strong>
                      <a href="/users/${comment.user_id}">
                        ${comment.user_name}
                      </a>
                    </strong>
                    <h3>
                      ${comment.text}
                    </h3>
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(comment){
      var html = buildHTML(comment);
      $('.comments__list').append(html);
      $('.textbox').val('');
      $('#form__submit').prop('disabled', false);
    })
  })
});