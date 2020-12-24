<div class="spacer"></div>

<div class="normaltext">

{if $error != ''}
 <div align="center" class="normaltext" style="color:#ff0000;"><b>{$error}</b></div>
 <div class="spacer"></div>
{/if}

{if $product.stock_status=='Backordered' && $product.backordered_date != ''}
 <font color="#ff0000">*Backordered: {$product.backordered_date}</font>
 <div class="spacer"></div>
{/if}

<table border="0" width="100%" cellspacing="1" cellpadding="5" class="bordered">
 <tr>
  <th><div align="left">Description</div></th>
  <th>Item #</th>
  <th id="price_label_{$prod_id}">{if $product.is_donation == 'y'}Donation Amount{else}Price{/if}</th>
  {if $product.is_donation != 'y'}<th>Weight</th>{/if}
  {if ($product.text_field == 'y' || ($product.gift_certificate == 'y' && $product.gift_certificate_value < '1')) && $product.outseason != 'y'}
  <th>Customize</th>
  {/if}
  {if $product.has_attributes == 'y' && $product.outseason != 'y'}
  <th>Options</th>
  {/if}
  {if $product.is_donation != 'y'}<th>Qty</th>{/if}
  {if $settings.additional_prod_display_type == '1' || $view == 'prod_detail_list'}
    <th>&nbsp;</th>
  {/if}
 </tr>
 <tr valign="middle">
  <td class="normaltext">
   {$product.prod_name}
  </td>
  <td class="normaltext" align="center">
   {$product.sku}
  </td>
  <td class="normaltext" align="center" id="price_cell_{$prod_id}">
   {if $product.special == 'y' && $product.is_donation != 'y'}
    <del>{$currency_type}{$product.standard_price|commify}</del>
   {/if}
   {if $product.is_donation == 'y'}{$currency_type}{/if}<input type="text"{if $product.is_donation == 'y'} name="donation_amount{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}"{/if} class="dynamic_qty{if $product.special == 'y' && $product.is_donation != 'y'} saleprice{elseif $product.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" value="{if $product.is_donation != 'y'}{$currency_type}{if $product.min_qty > 1}{math equation="x*y" x=$product.price y=$product.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$product.price|commify}{/if}{else}0{/if}"{if $product.is_donation != 'y'} readonly="readonly"{/if} />
  </td>
  {if $product.is_donation != 'y'}
   <td class="normaltext" align="center">
     {if $product.shipping_weight == ''}&nbsp;{else}{$product.shipping_weight} {$product.unit}{/if}
    </td>
  {/if}

{if $product.outseason != 'y'}
 {if ($settings.inventory_control != 'y' || ($product.has_attributes == 'y' && $attributes.count > 1) || ($settings.inventory_control == 'y' && ($product.inventory_control > $product.out_of_stock_point || $product.on_order > 0 || ($product.stock_status == 'Backordered' && $product.backordered_date != '')))) && $product.stock_status != 'Out of Stock'}
  {if $product.text_field == 'y' || ($product.gift_certificate == 'y' && $product.gift_certificate_value < '1')}

    <td class="normaltext" align="center">
     {if $product.text_field == 'y'}
      <input type="text" name="note{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" value="" size="20" class="formtext" />
     {/if}
     {if $product.gift_certificate == 'y' && $product.gift_certificate_value < '1'} 
      Value: <input type="text" name="gift_certificate_value{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" value="" size="4" class="formtext" />
     {/if}
    </td>

  {/if}
  {if $product.has_attributes == 'y'}
    <td class="normaltext" align="center">
      {include file="attributes.tpl"}
    </td>
  {/if}

    {if $product.is_donation != 'y'}
      <td class="normaltext" align="center" id="qty_cell_{$prod_id}">
       <div id="qty_div_{$prod_id}">
       {if $product.qty_in_set > 1 && $product.num_sets_displayed > 1}
         <select name="qty{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" id="qty_{$prod_id}" onclick="javascript: priceChange('{$prod_id}','sub','','{$currency_type}');">
           <option label="{$product.min_qty}" value="{$product.min_qty}">{$product.min_qty}</option>
           {assign var="disp_qty" value=$product.min_qty}
           {section name="set" loop=$product.num_sets_displayed start=1}
             {math equation="x+y" x=$product.qty_in_set y=$disp_qty assign="disp_qty"}
             <option label="{$disp_qty}" value="{$disp_qty}">{$disp_qty}</option>
           {/section}
           </select>
       {else}
         <input type="text" name="qty{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" id="qty_{$prod_id}" value="{if $settings.additional_prod_display_type == '1' || $view == 'prod_detail_list'}{if $product.min_qty > 1}{$product.min_qty}{else}1{/if}{/if}" maxlength="3" class="formtext" size="1"{if $settings.interactive_pricing == 'y'} onkeyup="javscript: priceChange('{$prod_id}','dynamic','','{$currency_type}');"{/if} />{if $settings.interactive_pricing == 'y'} <img src="{$img_prefix}/images/plus.gif" class="inline" alt="Increase Quantity" onclick="javascript: priceChange('{$prod_id}','add','','{$currency_type}');" style="cursor: pointer;" id="qty_img1_{$prod_id}" /> <img src="{$img_prefix}/images/minus.gif" class="inline" alt="Decrease Quantity" onclick="javascript: if (checkMinQty('qty_{$prod_id}',{$product.min_qty},'interactive')) priceChange('{$prod_id}','sub','','{$currency_type}');" style="cursor: pointer;" id="qty_img2_{$prod_id}" />{/if}
        <input type="hidden" id="hidden_price_{$prod_id}" value="{if $product.is_donation != 'y'}{$product.price}{else}0{/if}" />
      {/if}
       </div>
      </td>
    {else}
      <input type="hidden" name="qty{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" value="1" />
    {/if}
    {if $settings.additional_prod_display_type == '1' || $view == 'prod_detail_list'}
      <td align="center" valign="top">
        <input type="submit" name="submit" id="addcart_submit" value="Add to Cart" class="addtocart_btn btnstyle1" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty},'');" />
        {include file="wishlist_add.tpl"}
        {include file="reorder_add.tpl"}
        <input type="hidden" name="prod_id" value="{$prod_id}" />
        <input type="hidden" name="cat_id" value="{if $product.cid > 0}{$product.cid}{else}{$cid}{/if}" />
        <input type="hidden" name="sku" value="{$product.sku}" />
      </td>
    {/if}
  {else}
    <td colspan="2" align="left" class="normaltext">
      <b>Out of Stock</b>
    </td>
  {/if}
{else}
    <td colspan="2" align="left" class="normaltext">
      <b>Out of Season</b>
    </td>
{/if}
  </tr>
</table>
</div>

{if $settings.inventory_control == 'y' && $settings.product_notify == 'y' && $product.notify == 'y'}
  <div align="center"><a href="/product_notify/{if $view == 'product'}{$var1}/{$var2}{else}{$prod_id}/{$var1}{/if}">Notify me when this item is in stock</a></div>
{/if}
