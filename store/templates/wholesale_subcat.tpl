{get_global var="has_printed"}
{if $parent > 0}
  {assign var="pcount" value=$wholesale_info.$parent.subcats.$scat_id.prod_count}
  {assign var="prods" value=$wholesale_info.$parent.subcats.$scat_id.prods}
{else}
  {assign var="pcount" value=$wholesale_info.$scat_id.prods_count}
  {assign var="prods" value=$wholesale_info.$scat_id.prods}
{/if}

{if $pcount > 0}
  <tr>
    <td colspan="5" align="left" class="wholesaleSubcategoryRow">
      {include file="wholesale_categories_recur.tpl" cat_id=$categories.$scat_id.all_parents.0}
      {$categories.$scat_id.name}
    </td>
  </tr>
  <tr class="wholesaleProductTitleRow">
    <td align="left">
      Product 
    </td>
    <td align="center">
      Item Code 
    </td>
    <td align="center">
      Qty (cases) 
    </td>
    <td align="center">
      Unit 
    </td>
    <td align="center">
      Case 
  </td>
</tr>
{foreach from=$prods key=key item=product}
  {include file="wholesale_product.tpl"}
{/foreach}
{/if}
{foreach from=$wholesale_info.$scat_id.subcats key=sscat_key item=sscat}
  {get_global var="has_printed"}
  {if !preg_match("/\|$sscat_key\|/",$has_printed)}
    {assign_global var="has_printed" value=$has_printed|cat:"|$sscat_key|"}
    {include file="wholesale_subcat.tpl" scat_id=$sscat_key parent=$scat_id}
  {/if}
{/foreach}
