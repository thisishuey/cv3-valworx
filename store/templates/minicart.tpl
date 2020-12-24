{if isset($smarty.get.pid)} {assign var="pid" value=$smarty.get.pid} {/if}
{if isset($smarty.get.show_output)} {assign var="show_output" value=1} {/if}
{if isset($smarty.get.show_addtocart)} {assign var="show_addtocart" value=1} {/if}

{config_load file="store.conf" scope="global"}
{assign var="template_section" value=$template_section|default:"default"}


{if $show_output} {*---- This is what appears in the normal minicart ----*}

{*include file="cart_count.tpl"*}

<a id="minicart_a"></a>

{elseif $show_addtocart} {*---- This is what appears in the cart overlay when an item is added ----*}
  {**code from mini cart to quantify total items and cart subtotal**}
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

  {if $prod.prod_id == $pid}
     {assign var=p value=$prod}
  {/if}
 {/foreach}

  <div id='minicart_overlay'>



<!-- main block   -->
<button id="btnExit" class="btn btn-default btn-sm pull-right">Close</button>
<div class="productname">Shopping Cart...
</div>

{$cart|@sort_array:krsort}
{counter name=minicart_count start=0 print=false}
{foreach from=$cart item=p key=key}
{if $smarty.session.mobile}
  {if $minicart_count > 1}{break}{/if}
{else}
  {if $minicart_count > 3}{break}{/if}
{/if}
<div style='padding-top: 15px; clear: both'>
  <img src='{$p.web_image}' width='65' border='0' align='left' />

  <div style='margin-left: 65px; margin-bottom: 5px; padding-left:10px' class='overlay_info'>
     <div><strong>{$p.name} {$p.att_list}</strong></div>
     <div>{$currency_type}{$p.price}</div>
     <div>Qty: {$p.qty}</div>
     <div>Stock #: {$p.sku}</div>
  </div>

</div>
{counter assign=minicart_count}
{/foreach}
<div class="normaltext" style="clear:both; padding:5px 0px 5px 0px; text-align:right">{$total_qty} Items  <strong>Subtotal: {$currency_type}{$total_price|commify}</strong></div>
<div class="col-xs-8 col-sm-6">
<button id="btnContShop" class="btn btn-default btn-sm mar_btm pull-left mar_rt10 minicart_exit">Continue Shopping</button>
  </div>
<div class="col-xs-4 col-sm-6">
<button id="btnViewCart" onclick='window.location="/viewcart/1"; return false;' class="btn btn-primary btn-sm mar_btm pull-right">Checkout »</button>
</div>
<div style="padding-top:8px;">
{if #slider_promo_text# != ''} 
<div class="normaltext" align="center" style="background-color:#85764f; font-weight:bold; font-size:13px; color:#ffffff; padding:3px 5px 7px 5px; border:solid 1px #BDA870;">
 {#slider_promo_text#}
</div>
{/if}

</div>
</div>

{else} {*---- This is the framework that is placed into the page for this to function properly ----*}
<div id='minicart_container'>
   <div id='minicart' class='minicart'>
      {include file="minicart.tpl" show_output=1}
   </div>
   <div id='minicart_overlay_box' style="display:none">
      <div id='minicart_overlay'>
         <!-- main block   -->
         <button id="btnExit" class="btn btn-default btn-sm pull-right minicart_exit">Close</button>
         <div class="productname">Shopping Cart</div>
         <div id="minicart_products"></div>
         <div class="minicart_total"><span class="minicart_total_qty">0</span> Items  - <strong>Subtotal: {$currency_type}<span class="minicart_total_price">0</span></strong></div>
         <div class="col-xs-8 col-sm-6">
            <button id="btnContShop" class="btn btn-default btn-sm pull-left mar_btm minicart_exit">Continue Shopping</button>
         </div>
         <div class="col-xs-4 col-sm-6">
            <button id="btnViewCart" onclick='window.location="/viewcart/1"; return false;' class="btn btn-primary btn-sm mar_btm pull-right">Checkout »</button>
         </div>
         <div style="padding-top:8px;">
            {if #slider_promo_text# != ''}
               <div class="normaltext" align="center" style="background-color:#85764f; font-weight:bold; font-size:13px; color:#ffffff;padding:3px 5px 7px 5px; border:solid 1px #BDA870;">
                  {#slider_promo_text#}
               </div>
            {/if}
         </div>
         <div class="realtedproductwrapper">
            {include file="display_product_group.tpl" label="Float Related Products" products=$product.rel_prods max=3 }
         </div>
      </div>

   </div>
   
</div>
{/if}