{counter start=0 assign=total_price}
{counter start=0 assign=total_qty}
{foreach from=$cart key=key item=prod}
 {if $prod.qty > 0 && $prod.build_prod_id == ''}
  {if $prod.build_parent == 'y'}
   {assign var=total value=0}
   {foreach from=$cart key=key item=pr}
    {if $pr.build_prod_id == $prod.prod_id && $pr.build_link == $prod.build_link}
     {math equation="x+(y*z)" x=$total y=$pr.price z=$pr.qty assign="total"}
    {/if}
   {/foreach}
  {else}
   {assign var=total value=$prod.total}
  {/if}

  {math equation="x+y" x=$total_price y=$total|replace:",":"" assign=total_price format="%.2f"}
  {math equation="x+y" x=$total_qty y=$prod.qty assign=total_qty}
  
  {if $prod.gift_wrap == 'y' && $prod.gift_wrap_info != ''}
   {math equation="x+y" x=$total_price y=$prod.gift_wrap_info.total|replace:",":"" assign=total_price format="%.2f"}
   {math equation="x+y" x=$total_qty y=$prod.qty assign=total_qty}
  {/if}
 {/if}
{/foreach}

<section id="cartitems">
     <a href="/viewcart"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a>
    {*{$currency_type}<span class='minicart_total_price'>{$total_price|commify}</span>*}
    <span><span class="minicart_total_qty">{$total_qty}</span> Items</span> | 
    <a id="vcart" href="/viewcart">View cart</a>
</section>