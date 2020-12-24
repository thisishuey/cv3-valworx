{include file="_top.tpl"}

<h3>Print Catalog</h3>
{if $bc_cat != ''}
  <a href="/print_catalog">Print Catalog</a>{if $categories.$bc_cat.all_parents.0 != ''}{include file="print_catalog_breadcrumb_recur.tpl" cat_id=$categories.$bc_cat.all_parents.0}{/if}<br />
{else}
<a href="/print_catalog/all">View All Products</a>
<br />
{/if}
<br />
<table width="100%" cellspacing="0" cellpadding="3" border="1" style="border-collapse:collapse;">
{foreach from=$sitemap key=cid item=cat}
 <tr>
  <td colspan="3">
   <a href="/print_catalog/{$cat.cat_id}" id="parentcat">{$cat.name}</a>
  </td>
 </tr>
  {foreach from=$cat.products item=product}
 <tr>
  <td class="normaltext">{if $product.web_image != ''}<img src="{$product.web_image|img_prefix}">{/if}<div>{$product.sku}</div></td>
  <td class="normaltext"><a href="/product/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{$cat.cat_id}" id="siteprod">{$product.prod_name}</a></td>
  <td class="normaltext">{$product.prod_description}</td>
 </tr>
  {/foreach}
  {include file="print_catalog_recur.tpl" map=$cat.subcat prefix="&nbsp;"}

{/foreach}
</table>
<br />

{include file="_bottom.tpl"}
