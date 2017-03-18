$(document).on( 'turbolinks:load', function(){
  $(".menu-item").on("click", function(event) {
    const id = $(this).data("item-id");
    var itemCount = $(".shopping-cart").text().trim();
    $(".shopping-cart").text(parseInt(itemCount)+1);
    event.preventDefault();
  })
});
