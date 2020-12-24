{*** $discount.label is available to be used also. ***}
<script>
var disclist = [];
</script>
{if $discounts|@count}
  {foreach from=$discounts item=discount}
    <script>disclist.push({ldelim}qty:{$discount.qty},type:'{$discount.type}',amount:{$discount.amount},additional:'{$discount.additional}'{rdelim});</script>
    {if $discount.type == 'amount_off'}
      {if $discount.additional == 'n'}
       <span class="discount-amount">Buy {$discount.qty} or more and save <strong>{$currency_type}{$discount.amount|commify}</strong> per item</span><br />
      {else}
        <span class="discount-amount">Save <strong>{$currency_type}{$discount.amount|commify}</strong> on additional products above {$discount.qty}</span><br />
      {/if}
    {elseif $discount.type == 'percent_off'}
      {if $discount.additional == 'n'}
        <span class="discount-amount">Buy {$discount.qty} or more and save <strong>{$discount.amount|string_format:"%d"}%</strong></span><br />
      {else}
        <span class="discount-amount">Save <strong>{$discount.amount|string_format:"%d"}%</strong> on additional products above {$discount.qty}</span><br />
      {/if}
    {elseif $discount.type == 'new_price'}
      {if $discount.additional == 'n'}
        <span class="discount-amount">Buy {$discount.qty} or more for <strong>{$currency_type}{$discount.amount|commify}</strong> each</span><br />
      {else}
        <span class="discount-amount">Additional products above {$discount.qty} are <strong>{$currency_type}{$discount.amount|commify}</strong> each</span><br />
      {/if}
    {elseif $discount.type == 'free_products'}
      <span class="discount-amount">Buy {$discount.qty} and get <strong>{$discount.amount|string_format:"%d"}</strong> free</span><br />
      {********************************************
        if they don't want to include the free prods in the number they have to purchase, use this code instead: 
        Buy {math equation="x-y" x=$discount.qty y=$discount.amount} and get {$discount.amount|string_format:"%d"} free<br />
       ********************************************}
    {/if}
  {/foreach}
{/if}
<script>
  disclist.reverse(); //reverse so that each loop below hits larger qtys first
  function discountQty(qty) {ldelim}
    var price = {if $product.special == 'y' && $product.standard_price > $product.special_price}{$product.special_price}{else}{$product.standard_price}{/if};
    $.each(disclist, function (index, value) {ldelim}
      if (qty >= value.qty && value.additional == 'n') {ldelim}
        switch(value.type) {ldelim}
          case 'amount_off':
            price = price - value.amount;
            break;
          case 'percent_off':
            price = price - (price * (value.amount/100));
            break;
          case 'new_price':
            price = value.amount;
            break;
        {rdelim}
        return false; //Found greatest qty that matches, get out of each
      {rdelim}
    {rdelim});
    $(".dynamic_qty").val('{$currency_type}' + price.toFixed(2)); //always set price to set back to standard once qty is below discounts
  {rdelim}
</script>
