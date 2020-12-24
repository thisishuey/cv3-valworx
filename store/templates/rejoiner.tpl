{* First we initiate Rejoiner *}
<script id="rejoiner_initiate" type="text/javascript">
  var order_id = "{$placed.order.id}";
  var _rejoiner = _rejoiner || [];
  _rejoiner.push(['setAccount','{$rejoiner.site_id}']);
  {preg_match pattern="/^([^\.]*\.[^\.]*\.)/" string=$smarty.server.HTTP_HOST|strrev assign="preg_match_result"}
  _rejoiner.push(['setDomain','{$preg_matches.1|strrev}']);
{if isset($smarty.session.email) && $smarty.session.email != ''}
  _rejoiner.push(['setCustomerEmail',{ldelim}'email': '{$smarty.session.email}'{rdelim}]);
{/if}
{if $rejoiner.convert == 'y'}
  var cart_data = {$rejoiner.cart_info}
  var cart_items = {$rejoiner.data}
  {literal}
  _rejoiner.push(['sendConversion',
    {
      'cart_data': cart_data,
      'cart_items': cart_items
    }
  ]);
  {/literal}
{elseif $rejoiner != ''}
  {* We need to update the data *}
  var data = "";
  {if ($rejoiner.data|@count) > 0}
    data = {$rejoiner.data};
  {/if}
  var del = "";
  {if ($rejoiner.delete|@count) > 0}
    del = {$rejoiner.delete};
  {/if}
  var cartData = "";
  {if ($rejoiner.cart|@count) > 0}
    cartData = {$rejoiner.cart};
  {/if}
  var prodData = "";
  {if ($rejoiner.product|@count) > 0}
    prodData = {$rejoiner.product};
  {/if}
  var custData = "";
  {if ($rejoiner.customer|@count) > 0}
    custData = {$rejoiner.customer};
  {/if}
  {literal}
    if(data !== ""){
      for(var i = 0; i < data.length; i++){
        _rejoiner.push(['setCartItem',data[i]]);
      }
    }
    if(del !== ""){
      for(var i = 0; i < del.length; i++){
        if(typeof del[i] !== 'undefined'){
          _rejoiner.push(['removeCartItem',del[i]]);
        }
      }
    }
    if(cartData !== "" && !isEmpty(cartData)){
      setTimeout(function(){
        _rejoiner.push(['setCartData',cartData]);
      },500);
    }
    if(prodData !== "" && !isEmpty(prodData)){
      for(var i = 0; i < prodData.length; i++){
        _rejoiner.push(['trackProductView',prodData[i]]);
      }
    }
    if(custData !== ""){
      _rejoiner.push(['setCustomerData',custData]);
    }
    function isEmpty(obj){
      for(prop in obj){
        if(obj.hasOwnProperty(prop)){
          return false;
        }
        return (true && JSON.stringify(obj) == JSON.stringify({}));
      }
    }
    function rejoinerSendCartData(data){
      _rejoiner.push(['setCartData', data.rejoiner.cart]);
    }
    function rejoinerSendCartItems(data){
      for(var i = 0; i < data.rejoiner.data.length; i++){
        _rejoiner.push(['setCartItem',data.rejoiner.data[i]]);
      }
    }
  {/literal}
{/if}
{literal}
  (function() {
    var s = document.createElement('script'); s.type = 'text/javascript';
    s.async = true;
    s.src = 'https://cdn.rejoiner.com/js/v4/rejoiner.lib.js';
    var x = document.getElementById('rejoiner_initiate');
    x.parentNode.insertBefore(s, x);
  })();
{/literal}
</script>
