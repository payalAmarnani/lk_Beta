
var shipping_address_div = document.getElementById('shipping_addresses');
var shipping_div = document.getElementById('shipping_form');
  var address_btn = document.getElementByClass('select_address');
  address_btn.onclick = function() {
   
       shipping_div.style['display'] = 'none';
       shipping_address_div.style['display']:'none';
       $("#style-modal").html("<%= escape_javascript(render 'create_style') %>")

  };
