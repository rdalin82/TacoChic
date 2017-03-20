$(document).on( 'turbolinks:load', function(){
  $(".menu-item").on("click", function(event) {
    event.preventDefault();
    const item_id = $(this).data("item-id");
    $.post('orders/' + item_id + '/add', function(data){
    })
    .done(function(data){
      var itemCount = $(".shopping-cart").text().trim();
      $(".shopping-cart").text(parseInt(itemCount)+1);
    })
    .fail(function(data){
      console.log("error adding item ", data)
    })
  });

  $(".menu-item-remove").on("click", function(event){
    event.preventDefault();
    const item_id = $(this).data("item-id");
    $.post(item_id + '/remove', function(data, target){})
    .done(function(data, target){
      var itemCount = $(".shopping-cart").text().trim();
      if (parseInt(itemCount) > 0) {
        $(".shopping-cart").text(parseInt(itemCount)-1);
      }
    })
    .fail(function(data){
      console.log("error removing item ", data);
    })
  })
});
