{* Display Child Products *}
<br />
<div align="center" class="normaltext">
<table border="0" cellspacing="1" cellpadding="5">

  <form method="post" action="index.php">
  <input type="hidden" name="action" value="AddCart">

{counter assign=childnums start=0}
{foreach from=$product.children item=child}

  <tr>
    <td class="normaltext" align="center">
      {$child.sku} {$child.prod_name}
     {if $settings.interactive_pricing == 'y'}
      <input type="text" class="dynamic_qty" id="price_{$child.prod_id}" value="{$currency_type}{$child.price}" readonly="true" style="font-size:12px;font-family:arial,helvetica,sans-serif;text-align:center;">
     {else}
      {if $child.special == 'y' && $child.standard_price != $child.price}
      <font class="strike" style="text-align:center;">{$currency_type}{$child.standard_price}</font>
      {/if}
      {$currency_type}{$child.price}
     {/if}
    </td>
{$child.inventory_control}
  {if (($child.stock_status == 'In Stock' && $child.inventory_control > 0) || ($child.stock_status == 'Backordered' && $child.backordered_date != '')) && $product.outseason != 'y' && $child.outseason != 'y'}
    {*if $settings.inventory_control != 'y' || ($settings.inventory_control == 'y' && ($child.inventory_control >0 || $child.on_order > 0 || ($child.stock_status == 'Backordered' && $child.backordered_date != '')))*}
    {if $product.text_field == 'y' && $child.has_attributes == 'y'}

    <td class="xsmalltext" align="center">
      <select name="option1">
        {html_options values=$child.child_attributes output=$child.child_attributes}
      </select>
      <input type="hidden" name="num_attributes" value="1">
      <input type="text" name="note" value="" size="25">
    </td>

    {elseif $product.text_field == 'y'}

    <td class="xsmalltext" align="center">
      <input type="text" name="note" value="" size="25">
    </td>

    {elseif $product.has_child_attributes == 'y'}

    <td class="xsmalltext" align="center">

      {if $child.has_attributes == 'y'}
      <select name="option1">
        {html_options values=$child.child_attributes output=$child.child_attributes}
      </select>
      <input type="hidden" name="num_attributes" value="1">
      {/if}

    </td>

    {/if}

    <td align="center" class="normaltext">
      {if $child.stock_status=='Backordered' && $child.backordered_date != ''}
        <font color="#ff000">Backordered:</font><br />
      {/if} 
      <input type="text" name="qty" id="qty_{$child.prod_id}" value="1" size="1" maxlength="3" class="formtext"{if $settings.interactive_pricing == 'y'} onKeyUp="javscript: priceChange('{$child.prod_id}','dynamic','{$child.price}');"{/if}>{if $settings.interactive_pricing == 'y'} <img src="{$img_prefix}/images/plus.gif" class="inline" alt="Increase Quantity" onClick="javascript: priceChange('{$child.prod_id}','add','{$child.price}');" style="cursor: pointer;"> <img src="{$img_prefix}/images/minus.gif" class="inline" alt="Decrease Quantity" onClick="javascript: priceChange('{$child.prod_id}','sub','{$child.price}');" style="cursor: pointer;">{/if}
    </td>
    <td class="normaltext">
      {if $child.stock_status=='Backordered' && $child.backordered_date != ''}
        <font color="#ff000">{$child.backordered_date}</font><br />
      {/if} 
      <input type="hidden" name="prod_id" value="{$child.prod_id}" >
      <input type="hidden" name="cat_id" value="{if $child.cid > 0}{$child.cid}{else}{$cid}{/if}" >
      <input type="hidden" name="sku" value="{$child.sku}" >
    </td>
  </tr>

    {*else}
        <td colspan="3" class="smalltext">
          Out of Stock
        </td>
      </tr>
    {/if*}
  {elseif $product.outseason == 'y' || $child.outseason == 'y'}

    <td colspan="2" class="smalltext">
      Out of Season
    </td>
  </tr>

  {else}

    <td colspan="2" class="smalltext">
      {$child.stock_status}
    </td>
  </tr>

  {/if}

{counter assign=childnums}
{/foreach}

  <tr>
    <td colspan="6" align="right">
  <input type="image" name="submit" value="Add to Cart" src="{$img_prefix}/images/btn_addtocart.gif">
    {include file="wishlist_add.tpl"}
<a href="#" onclick="javascript:window.open('/tellfriend/{$prod_id}/{$cid}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');"><img src="{$img_prefix}/images/btn_tellafriend.gif"></a>
  </form>
    </td>
  </tr>

</table>
</div>
{*if $settings.inventory_control == 'y' && $settings.product_notify == 'y' && $product.notify == 'y'*}
{if $settings.product_notify == 'y' && $product.inventory_control == 0}
  <div align="center"><a href="/product_notify/{if $view == 'product'}{$var1}/{$var2}{else}{$prod_id}/{$var1}{/if}">Notify me when this item is in stock</a></div>
{/if}

