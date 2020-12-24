{if $product.gift_set == 'y'}
  {counter start=1 name=count2 assign=num2}
  {section name=id loop=$product.num_gifts}
    <tr>
      <td colspan="5" class="wholesaleProdChildRow">
        {assign var="tmp1" value=$product.prod_id}
        {assign var="tmp2" value="_$tmp1"}
        {assign var="tmp3" value="prodpak$cid"}
        {assign var="tmp4" value="_$num2"}
        {assign var="tmp" value="$tmp3$tmp2$tmp4"}
        &nbsp;&nbsp;&nbsp;Product {$num2}:&nbsp;
        <select name="prodpak{$cid}_{$product.prod_id}_{$num2}">
          {html_options options=$product.gift_options selected=$ws_valid.$tmp}
        </select>
      </td>
    </tr>
    {counter assign=count2}
  {/section}
{/if}