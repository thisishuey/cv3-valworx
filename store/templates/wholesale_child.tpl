{get_global var="child_skus"}
<tr class="wholesaleProdChildRow">
  <td width="60%" align="left">
    &nbsp;&nbsp;&nbsp;&bull;&nbsp;{$child.prod_name}
  </td>
  <td align="center">
    {$child.sku} 
  </td>
  <td align="center">
    {assign var="tmp1" value=$child.prod_id}
    {assign var="tmp2" value="_$tmp1"}
    {assign var="tmp3" value="qty$cid"}
    {assign var="tmp" value="$tmp3$tmp2"}

    {assign var='quantity' value=''}
    {foreach from=$cart item=item}
      {if isset($item.0.sku) && $item.0.sku == $child.sku && isset($item.0.qty)}
        {assign var='quantity' value=$item.0.qty}
      {/if}
    {/foreach}
    {assign var="arChildSkus" value=$child_skus|array}
    <input type="text" name="qty{$cid}_{$child.prod_id}" value="{if !in_array($child.sku,$arChildSkus) && $quantity != ''}{$quantity}{assign_global var="child_skus" value=$child_skus|cat:$child.sku|cat:","}{/if}" size="3" maxsize="4">
  </td>
  <td align="center">
    {$child.wholesale_qty} 
  </td>
  <td align="center">
    {$currency_type}{$child.wholesale_price} 
  </td>
</tr>