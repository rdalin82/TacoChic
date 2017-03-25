$(document).on( 'turbolinks:load', function(){
  $(".menu-item").on("click", function(event) {
    event.preventDefault();
    const item_id = $(this).data("item-id");
    $.post('orders/' + item_id + '/add', function(data){
    })
    .done(function(data){
      var itemCount = $(".shopping-cart").text().trim();
      $(".shopping-cart").text(parseInt(itemCount)+1);
      $(".flash").html("Item added")
      setTimeout(function(){
        $(".flash").html("")
      }, 2000)
    })
    .fail(function(data){
      console.log("error adding item ", data);
      $(".flash").html("There was an error adding your item" )
      setTimeout(function(){
        $(".flash").html("")
      }, 2000)
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
        $(".flash").html("Item removed")
        setTimeout(function(){
          $(".flash").html("")
        }, 2000)
      }
    })
    .fail(function(data){
      console.log("error removing item ", data);
      $(".flash").html("Item was notremoved")
      setTimeout(function(){
        $(".flash").html("")
      }, 2000)
    })
  })
  $(".order-submit").on("click", function(event){
    $.post("/menus/orders/show/submit")
    .done(function(data){
      $(".flash").html("Submitting....")
      setTimeout(function(){
        $(".flash").html("")
      }, 2000)
    })
    .fail(function(){
      $(".flash").html("Order failed...")
      setTimeout(function(){
        $(".flash").html("")
      }, 2000)
    })
  })
});
