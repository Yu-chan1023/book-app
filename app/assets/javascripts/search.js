
$(function() {

  function appendBook(book) {
    var html = `
                <div class="books__a">
                  <div class="content__header">
                    <span>
                      <img src="${book.user_image}" class = "content__img">
                      <a href="/users/${book.user_id}">
                        ${book.user_name}
                      </a>
                    </span>
                  </div>   
                  <div class="content__main">
                    <div class="content__main__book">
                      <div class="content__main__book--image">
                        <img class="book__image" src="${book.image}">
                      </div>
                    </div>
                    <span class="content__main__message">
                      <div class="content__main__message__title">
                        <a href="/books/${book.id}">
                          ${book.title}
                        </a>
                      </div>
                      <div class="content__main__message__content">
                        <h3>感想</h3>
                        <p></p><p>${book.content}</p><p></p>
                      </div>
                    </span>
                  </div>
                </div>
                `
    $(".books").append(html);
  }
  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`

    $(".books").append(html);
  }

      
  $("#search__input").on("keyup", function() {
    var input = $("#search__input").val();
    $.ajax({
      type: 'GET',
      url: '/books/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(books) {
      $(".books").empty();
      if (books.length !== 0) {
        books.forEach(function(book){
          appendBook(book);
        });
      }
      else {
        appendErrMsgToHTML("一致するツイートがありません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});