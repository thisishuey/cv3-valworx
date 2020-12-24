{* Parent Product Display *}
<br>
<div align="center" class="normaltext">
{if $product.stock_status=='Backordered' && $product.backordered_date != ''}
  <font color="#ff0000">*Backordered: {$product.backordered_date}</font>
{/if}
<table border="0" cellspacing="1" cellpadding="5" style="border: 1px solid black;">
  <tr>
    <th align="left">Description</th>
    <th>Item #</th>
    <th>Price</th>
    <th>Weight</th>
{if ($product.text_field == 'y' || ($product.gift_certificate == 'y' && $product.gift_certificate_value < '1')) && $product.outseason != 'y'}

    <th>Customize</th>

{/if}
{if $product.has_attributes == 'y' && $product.outseason != 'y'}

    <th>Options</th>

{/if}

    <th>Qty</th>
    <th>&nbsp;</th>
  </tr>
  <tr valign="middle">
    <td class="normaltext">
      {* Product Description *}
      {$product.prod_name}
    </td>
    <td class="normaltext" align="center">
      {* Product SKU *}
      {$product.sku}
    </td>
    <td class="normaltext" align="center">     
      {* Product Price Display *}

{if $product.special == 'y'}

      <font class="strike" style="text-align:center;">{$currency_type}{$product.standard_price|commify}</font>

{/if}
      <font class="productprice"><input type="text" class="dynamic_qty" id="price_{$prod_id}" value="{$currency_type}{$product.price|commify}" readonly="true" style="font-size:12px;font-family:arial,helvetica,sans-serif;text-align:center;"></font>
    </td>
    <td align="center">
      {* Product Weight *}
      {if $product.shipping_weight == ''}&nbsp;{else}<font class="prodshipweight">{$product.shipping_weight} {$product.unit}</font>{/if}
    </td>
{if $product.outseason != 'y'}
  {if ($settings.inventory_control != 'y' || ($product.has_attributes == 'y' && $attributes.count > 1) || ($settings.inventory_control == 'y' && ($product.inventory_control > $product.out_of_stock_point || $product.on_order > 0 || ($product.stock_status == 'Backordered' && $product.backordered_date != '')))) && $product.stock_status != 'Out of Stock'}
  {if $product.text_field == 'y' || ($product.gift_certificate == 'y' && $product.gift_certificate_value < '1')}

    <td class="normaltext" align="center" rowspan="1" valign="top">
      {* Add Product Box *}
      {if $product.text_field == 'y'}
        <input type="text" name="note" value="" size="25">
      {/if}
      {* Add Gift Certificate Value *}
      {if $product.gift_certificate == 'y' && $product.gift_certificate_value < '1'} 
        Value: <input type="text" name="gift_certificate_value" value="" size="4">
      {/if}
    </td>

  {/if}
  {*  if it has attributes print drop downs *}
  {if $product.has_attributes == 'y'}

    <td class="xsmalltext" align="center">
      {include file="attributes.tpl"}
    </td>

  {/if}

    <td class="xsmalltext" align="center" rowspan="1" valign="top">
      {* Product Qty Box *}
      <input type="text" name="qty" id="qty_{$prod_id}" value="1" maxlength="3" class="formtext" style="width: 30px;"{if $settings.interactive_pricing == 'y'} onKeyUp="javscript: priceChange('{$prod_id}','dynamic','');"{/if}>{if $settings.interactive_pricing == 'y'} <img src="{$img_prefix}/images/plus.gif" class="inline" alt="Increase Quantity" onClick="javascript: priceChange('{$prod_id}','add','');" style="cursor: pointer;"> <img src="{$img_prefix}/images/minus.gif" class="inline" alt="Decrease Quantity" onClick="javascript: priceChange('{$prod_id}','sub','');" style="cursor: pointer;">{/if}
    </td>
    <td align="center" valign="top">
      <input type="hidden" name="prod_name" value="{$product.prod_name}">
      <input type="hidden" name="prod_id" value="{$prod_id}" >
      <input type="hidden" name="bp_id" value="{$bp_id}" >
      <input type="hidden" name="st_id" value="{$st_id}" >
      <input type="hidden" name="cat_id" value="{$product.cid}" >
      <input type="hidden" name="sku" value="{$product.sku}" >
      <input type="hidden" name="price" id="hidden_price_{$prod_id}" value="{$product.price}" >
      <input type="submit" name="submit" value="Add to Product" class="addtocart_btn btnstyle1">
    </td>
  {else}
    <td colspan="2" align="left" class="normaltext">
      Out of Stock
    </td>
  {/if}
{else}
 
    <td colspan="2" align="left" class="normaltext">
      Out of Season
    </td>

{/if}

  </tr>
</table>
</div>
{if $settings.inventory_control == 'y' && $settings.product_notify == 'y' && $product.notify == 'y'}
  <div align="center"><a href="/product_notify/{if $view == 'product'}{$var1}/{$var2}{else}{$prod_id}/{$var1}{/if}">Notify me when this item is in stock</a></div>
{/if}

