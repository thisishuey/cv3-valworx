{get_global var="parent_skus"}
{if $product.is_parent == 'y'}
  <tr>
    <td colspan="5" class="wholesaleProdParentRow">
      {$product.prod_name}
    </td>
  </tr>
  {foreach from=$product.children key=childkey item=child}
    {include file="wholesale_child.tpl"}
  {/foreach}
{else}
  <tr>
    <td width="60%" align="left" class="wholesaleProdParentRow">
      {$product.prod_name}
    </td>
    <td align="center" class="wholesaleProdParentRow">
      {$product.sku} 
    </td>
    <td align="center" class="wholesaleProdParentRow">
      {assign var='quantity' value=''}
      {foreach from=$cart item=item}
         {if isset($item.0.sku) && $item.0.sku == $product.sku && isset($item.0.qty)}
           {assign var='quantity' value=$item.0.qty}
         {/if}
      {/foreach}
      {assign var="tmp1" value=$product.prod_id}
      {assign var="tmp2" value="_$tmp1"}
      {assign var="tmp3" value="qty$cid"}
      {assign var="tmp" value="$tmp3$tmp2"}
      {assign var="arProdSkus" value=$parent_skus|array}
      <input type="text" name="{$tmp}" value="{if !in_array($product.sku,$arProdSkus) && $quantity != ''}{$quantity}{assign_global var="parent_skus" value=$parent_skus|cat:$product.sku|cat:","}{/if}" size="3" maxsize="4">
    </td>
    <td align="center" class="wholesaleProdParentRow">
      {$product.wholesale_qty} 
    </td>
    <td align="center" class="wholesaleProdParentRow">
      {$currency_type}{$product.wholesale_price|commify} 
    </td>
  </tr>
  {include file="wholesale_prodpak.tpl"}
{/if}
