<div class="spacer"></div>
<form method="post" action="index.php">
<table width="100%" border="0" cellspacing="1" cellpadding="5" class="bordered">
  <tr>
    <th><div align="left">Description</div></th>
    <th>Item #</th>
    <th>Price</th>
    <th>Weight</th>

{if $product.has_attributes == 'y' && $product.outseason != 'y'}

    <th>Options</th>

{/if}

    <th>Qty</th>
    <th>&nbsp;</th>
  </tr>
  <tr valign="middle">
    <td class="normaltext">
      {* Product Description *}
      {if $product.prod_id == $pr_id}{$product.prod_name}{else}{$product.children.$pr_id.prod_name}{/if}
    </td>
    <td class="normaltext" align="center">
      {* Product SKU *}
      {if $product.prod_id == $pr_id}{$product.sku}{else}{$product.children.$pr_id.sku}{/if}
    </td>
    <td class="normaltext" align="center">     
      {* Product Price Display *}
    {if $product.prod_id == $pr_id}
      <span class="productprice">
      {if $product.special == 'y'}<del>{$currency_type}{$product.standard_price|commify}</del></span><span class="saleprice">{/if}
      {$currency_type}{$product.price|commify}</span>
    {else}
      <span class="productprice">
      {if $product.children.$pr_id.special == 'y'}<del>{$currency_type}{$product.children.$pr_id.standard_price|commify}</del></span><span class="saleprice">{/if}
      {$currency_type}{$product.children.$pr_id.price|commify}</span>
    {/if}
    </td>
    <td align="center" class="normaltext">
      {* Product Weight *}
      {if $product.shipping_weight == ''}&nbsp;{else}{$product.shipping_weight} {$product.unit}{/if}
    </td>
{if $product.outseason != 'y'}
  {if ($settings.inventory_control != 'y' || ($product.has_attributes == 'y' && $attributes.count > 1) || ($settings.inventory_control == 'y' && ($product.inventory_control > 0 || $product.on_order > 0 || ($product.stock_status == 'Backordered' && $product.backordered_date != '')))) && $product.stock_status != 'Out of Stock'}
  {*  if it has attributes print drop downs *}
  {if $product.has_attributes == 'y'}
    <td class="normaltext" align="center">
      {$prod.attribute1} {$prod.attribute2} {$prod.attribute3} {$prod.attribute4}
    </td>
  {/if}
    <td class="normaltext" align="center">
      {* Product Qty Box *}
      <input type="text" name="qty" value="1" maxlength="3" class="formtext" size="1" />
    </td>
    <td align="center" valign="top">
      <input type="hidden" name="action" value="WishlistAddCart" />
      <input type="hidden" name="id" value="{$product.id}" />
      <input type="submit" name="submit" value="Add to Cart" class="addtocart_btn btnstyle1" />
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
</form>