{counter start=1 assign=tnum}
{assign var="tcnt" value=$map|@count}
{foreach from=$map item=m}
 <tr>
  <td colspan="3">
   {$prefix}<a href="{if $display == 'multi' && $display_cat != $m.cat_id}/print_catalog/{$m.cat_id}{else}/category/{$m.cat_id}{/if}" id="subcat">{$m.name}</a>
  </td>
 </tr>
  {foreach from=$m.products item=product}
 <tr>
  <td class="normaltext">{if $product.web_image != ''}<img src="{$product.web_image|img_prefix}">{/if}<div>{$product.sku}</div></td>
  <td class="normaltext"><a href="/product/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{$cat.cat_id}" id="siteprod">{$product.prod_name}</a></td>
  <td class="normaltext">{$product.prod_description}</td>
 </tr>
  {/foreach}
    {if $tnum < $tcnt}
      {include file="print_catalog_recur.tpl" map=$m.subcat prefix=$prefix|cat:"<span>&nbsp;&nbsp;</span>"}
    {else}
      {include file="print_catalog_recur.tpl" map=$m.subcat prefix=$prefix|cat:"<span>&nbsp;&nbsp;</span>"}
    {/if}

  {counter assign=tnum}
{/foreach}
