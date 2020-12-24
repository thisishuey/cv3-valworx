{* Product Gift Set *}

<br />
<div align="center">
<form method="post" action="index.php">
<input type="hidden" name="action" value="AddCart">
<table border="1" cellspacing="0" cellpadding="5">
  <tr>
    <th>Description</th>
    <th>Item #</th>
    <th>Price</th>
    <th>Weight</th>

{if $product.text_field == 'y'}

    <th>Customize</th>

{/if}

  </tr>
  <tr>
    <td class="smalltext">
      {$product.prod_name}
    </td>
    <td class="smalltext">
      {$product.sku}
    </td>
    <td class="smalltext">

{if $product.special == 'y'}

      <font class="strike">{$currency_type}{$product.standard_price}</font>

{/if}

      {$currency_type}{$product.price}
    </td>
    <td class="prodshipweight">
      {$product.shipping_weight} {$product.unit}
    </td>

{if $product.text_field == 'y'}

    <td class="smalltext">
      <input type="text" name="note" value="" size="25">
    </td>

{/if}

  </tr>
</table>
<table border="0" width="90%" cellpadding="5">
  <tr>
    <td colspan="2">
      <hr> 
    </td>
  </tr>
  <tr>
    <td colspan="2" class="smalltext">
      On the left, you will find a list of products eligible for this product pack. On the right, please pick an eligible product for each product choice available.  These are the products that will be used to build your product pack.  Click on any of the eligible products to get a picture of that item.    
    </td> 
  </tr>
  <tr>
    <td colspan="2">
      &nbsp; 
    </td>
  </tr>
  <tr>
    <td class="smalltext" width="40%">
      <b>Eligible Products:</b>
    </td>
    <td class="smalltext">
      <b>Please choose the products for your product pack:</b>
    </td>
  </tr>
  <tr>
    <td class="smalltext" valign="top" rowspan="2">

{counter start=1 assign=num}
  {foreach from=$product.gift_options key=key item=gift_name}

      {$num}.&nbsp;<a href="#" onclick="javascript:window.open('/regsize/{$product.gift_pics.$key}','','height=250,width=225');" id="small_text">{$gift_name}</a><br>

  {counter assign=num} 
{/foreach}

    </td>
    <td class="smalltext" valign="top" align="center">

{section name="gift_num" loop=$product.num_gifts}

      Product {$smarty.section.gift_num.iteration}:&nbsp;
      <select name=choose_gift{$smarty.section.gift_num.iteration}>
        {html_options options=$product.gift_options}
      </select>
      <br />

{/section}

    </td>
  </tr>

{if $product.outseason != 'y'}
    {if $settings.inventory_control != 'y' || ($settings.inventory_control == 'y' && ($product.inventory_control >0 || $product.on_order > 0 || ($product.stock_status == 'Backordered' && $product.backordered_date != '')))}

  <tr>
    <td align="right">
      <input type="text" name="qty" value="1" size="3" maxlength="3" class="formtext"> 
      <input type="hidden" name="prod_name" value="{$product.prod_name}">
      <input type="hidden" name="prod_id" value="{$prod_id}" >
      <input type="hidden" name="cat_id" value="{$cid}" >
      <input type="hidden" name="sku" value="{$product.sku}" >
      <input type="hidden" name="price" value="{$product.price}" >
      <input type="hidden" name="num_gifts" value="{$product.num_gifts}" >
      <input type="submit" name="submit" value="Add to Cart"  class="addtocart_btn btnstyle1">&nbsp;&nbsp;&nbsp;</td>
      {include file="wishlist_add.tpl"}
      {include file="reorder_add.tpl"}
    </td>
   </tr>
   {else}
     <tr>
       <td class="smalltext" align="right">
         *Out of Stock&nbsp;&nbsp;&nbsp;
       </td>
     </tr>

   {/if}
{else}

  <tr>
    <td class="smalltext" align="right">
      *Out of Season&nbsp;&nbsp;&nbsp;
    </td>
  </tr>

{/if}

</form>
</table>
</div>
{if $settings.inventory_control == 'y' && $settings.product_notify == 'y' && $product.notify == 'y'}
  <div align="center"><a href="/product_notify/{if $view == 'product'}{$var1}/{$var2}{else}{$prod_id}/{$var1}{/if}">Notify me when this item is in stock</a></div>
{/if}

