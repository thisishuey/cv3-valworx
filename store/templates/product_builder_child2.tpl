{* Display Child Products *}

<br/>
<div align="center" class="normaltext">
<table border="0" cellspacing="1" cellpadding="5" style="border: 1px solid black;">
   <tr>
      <th align="left">Description</th>
      <th>Item #</th>
      <th>Price</th>
      <th>Weight</th>
      {if ($product.text_field == 'y' || $product.has_child_attributes == 'y') && $product.outseason != 'y'}
         <th>Customize</th>
      {/if}
      <th>Qty</th>
   </tr>
{foreach from=$product.children item=child}
   <tr>
      <td class="normaltext">
         {if $child.child_image != ''}
            <table border="0" width="100%" cellpadding="2" cellspacing="0">
               <tr>
                  <td class="normaltext">
                     {$child.prod_name}
                  </td>
                  <td align="right">
                     <img src="{$child.child_image|img_prefix}" height="90">
                  </td>
               </tr>
            </table>
         {else}
         {$child.prod_name}
      {/if}
      </td>
      <td class="normaltext" align="center">
         {$child.sku}
      </td>
      <td class="normaltext" align="center">
        {if $settings.interactive_pricing == 'y'}
         <input type="text" class="dynamic_qty" id="price_{$child.prod_id}" value="{$currency_type}{$child.price|commify}" readonly="true" style="font-size:12px;font-family:arial,helvetica,sans-serif;text-align:center;">
        {else}
{if $child.special == 'y' && $child.standard_price != $child.price}

      <font class="strike" style="text-align:center;">{$currency_type}{$child.standard_price|commify}</font>

{/if}
         {$currency_type}{$child.price|commify}
        {/if}
      </td>
      <td class="smalltext" align="center">
         {if $child.shipping_weight == ''}&nbsp;{else}{$child.shipping_weight} {$child.unit}{/if}
      </td>
   {* print add to cart if product is available *}
   {if ($child.stock_status == 'In Stock' || ($child.stock_status == 'Backordered' && $child.backordered_date != '')) && $product.outseason != 'y' && $child.outseason != 'y'}
    {if $settings.inventory_control != 'y' || ($settings.inventory_control == 'y' && ($child.inventory_control > $child.out_of_stock_point || $child.on_order > 0 || ($child.stock_status == 'Backordered' && $child.backordered_date != '')))}
      {if $product.text_field == 'y' && $child.has_attributes == 'y'}
         <td class="xsmalltext" align="center">
            <select name="option1_{$child.prod_id}">
               {html_options values=$child.child_attributes output=$child.child_attributes}
            </select>
            <input type="hidden" name="num_attributes{$child.prod_id}" value="1">
            <input type="text" name="note{$child.prod_id}" value="" size="25">
         </td>
      {elseif $product.text_field == 'y'}
         <td class="xsmalltext" align="center">
            <input type="text" name="note{$child.prod_id}" value="" size="25">
         </td>
      {elseif $product.has_child_attributes == 'y'}
         <td class="xsmalltext" align="center">
            {if $child.has_attributes == 'y'}
               <select name="option1_{$child.prod_id}">
                  {html_options values=$child.child_attributes output=$child.child_attributes}
               </select>
               <input type="hidden" name="num_attributes{$child.prod_id}" value="1">
            {else}
               &nbsp;
            {/if}
         </td>
      {/if}
      <td align="center" class="normaltext">
        {if $child.stock_status=='Backordered' && $child.backordered_date!= ''}
          <font color="#ff0000;">Backordered: {$child.backordered_date}</font><br />
        {/if} 
         <input type="text" name="qty{$child.prod_id}" id="qty_{$child.prod_id}" value="" size="3" maxlength="3" class="formtext"{if $settings.interactive_pricing == 'y'} onKeyUp="javascript: priceChange('{$child.prod_id}','dynamic','{$child.price}');"{/if}>{if $settings.interactive_pricing == 'y'} <img src="{$img_prefix}/images/plus.gif" class="inline" alt="Increase Quantity" onClick="javascript: priceChange('{$child.prod_id}','add','{$child.price}');" style="cursor: pointer;"> <img src="{$img_prefix}/images/minus.gif" class="inline" alt="Decrease Quantity" onClick="javascript: priceChange('{$child.prod_id}','sub','{$child.price}');" style="cursor: pointer;">{/if}
         <input type="hidden" name="sku{$child.prod_id}" value="{$child.sku}">
         <input type="hidden" name="bp_id{$child.prod_id}" value="{$bp_id}">
         <input type="hidden" name="st_id{$child.prod_id}" value="{$st_id}">
         <input type="hidden" name="cat_id" value="{$child.cid}" />
      </td>
   </tr>
     {else}
        <td class="smalltext">
           Out of Stock
        </td>
      </tr>
     {/if}
   {elseif $product.outseason == 'y' || $child.outseason == 'y'}
        <td class="smalltext">
           Out of Season
        </td>
      </tr>
   {else}
         <td class="smalltext">
            {$child.stock_status}
         </td>
      </tr>
   {/if}
{/foreach}
</table>
{if $settings.inventory_control == 'y' && $settings.product_notify == 'y' && $product.notify == 'y'}
  <div align="center"><a href="/product_notify/{if $view == 'product'}{$var1}/{$var2}{else}{$prod_id}/{$var1}{/if}">Notify me when this item is in stock</a></div>
{/if}
<br />
         <div align="center">
         <input type="hidden" name="process_type" value="2">
         <input type="submit" name="submit" value="Add to Product" class="addtocart_btn btnstyle1">
         {include file="wishlist_add.tpl"}
         {include file="reorder_add.tpl"}
         </div>
</div>

