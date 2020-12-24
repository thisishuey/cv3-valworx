<div id="cart_info">

{*if $view == 'checkout_shippingaddress'}
 {assign_global var='cart_mapping' value=$recipient_mappings}
{elseif $view == 'checkout_billing'}
 {get_global var='cart_mapping'}
{/if*}

{assign var=ordertotal value=0}
{*foreach from=$cart_mapping key=key item=mapit*}
{foreach from=$smarty.session.recipient_mappings key=key item=mapit}
<fieldset>

<legend><!-- Recipient: {$mapit} --> Cart Summary</legend>

<div>
 {counter start=0 assign=total_price}
 {counter start=0 assign=total_qty}
 {foreach from=$cart key=key item=prod}
  {if $prod.recipient_mapping == $mapit}
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
   <div class='mini-product clearfix'>
    {*<img src="{$prod.web_image}" style="width:50px;float:left;">*}
    <div style="margin-left:0px; margin-bottom:5px; padding-left:0px">
     <span class='mini-name'><a href="/product/{$prod.prod_id}{$url_split_char}{$prod.cat}">{$prod.name}</a></span><br />
     {*<span class='mini-price'></span>*}
     <span class='mini-qty'>{$prod.price|commify} each x {$prod.qty} = {$currency_type}{$total|replace:",":""|commify}</span>
    </div>
 
   {math equation="x+y" x=$total_price y=$total|replace:",":"" assign=total_price format="%.2f"}
   {math equation="x+y" x=$total_qty y=$prod.qty assign=total_qty}
  
   {if $prod.gift_wrap == 'y' && $prod.gift_wrap_info != ''}
     {$prod.gift_wrap_info.gift_wrap_name}
     [{$prod.qty}]
     {$currency_type}{$prod.gift_wrap_info.total|replace:",":""|commify}

     {math equation="x+y" x=$total_price y=$prod.gift_wrap_info.total|replace:",":"" assign=total_price format="%.2f"}
     {math equation="x+y" x=$total_qty y=$prod.qty assign=total_qty}
   {/if}
   </div>
  {/if}
  {/if}
 {/foreach}

 {if $total_qty > 0}
  <div class='mini-total'>Total for {$mapit}: {$currency_type}{$total_price|commify}</div>
 {else}
  <div>0 Items in Cart</div>
 {/if}
</div>

</fieldset>
{math equation="x+y" x=$total_price y=$ordertotal assign=ordertotal format="%.2f"}
{/foreach}

 <div>
  {if $total_qty > 0}
   {if $settings.hide_viewcart_discounts == 'n' && $totals.price > $totals.discount_price}
   <div class="subtotal">
     Sub-Total: {$currency_type}{$totals.price|commify}<br />
     Promo: {$currency_type}{$totals.discount_amount|commify}<br />
   </div>
   {elseif $view == 'checkout_billing' && $order.totalordpromo.0.deduction != ''}
   <div class="subtotal">
{*
     {math equation="x-y" x=$ordertotal y=$order.totalordpromo.0.deduction assign=predisctotal format="%.2f"}
     Sub-Total: {$currency_type}{$predisctotal|commify}<br />
     Promo: {$currency_type}-{$order.totalordpromo.0.deduction|commify}<br />
*}
     Sub-Total: {$currency_type}{$ordertotal|commify}<br />
     Promo: {$currency_type}-{$order.totalordpromo.0.deduction|commify}<br />

   </div>   
   {/if}
     {if $view == 'checkout_billing' && isset($order.totalordpromo.0.deduction)}
       {math equation="x-y" x=$ordertotal y=$order.totalordpromo.0.deduction assign='grandtotal' format="%.2f"}
     {elseif $view == 'checkout_shippingaddress' && isset($totals.discount_amount)}
       {math equation="x+y" x=$ordertotal y=$totals.discount_amount assign='grandtotal' format="%.2f"} {* Adding a negative amount *}
     {else}
       {assign var='grandtotal' value=$ordertotal}
     {/if}
     <h4>Sub-Total: {$currency_type}{$grandtotal|commify}</h4>
{*   <h2>Sub-Total: 
{if $settings.hide_viewcart_discounts == 'n' && $totals.price > $totals.discount_price}
   {$totals.discount_price|commify}
{else}
   {$totals.price|commify}
{/if}</h2>*}

  {else}
   <h4>0 Items in Cart</h4>
  {/if}
 </div>

</div>