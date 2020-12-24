{include file="_top.tpl"}

<h1>Site Map</h1>

{foreach from=$sitemap key=cid item=cat}
  <a href="{if $display == 'multi' && $display_cat != $cat.cat_id}/site_map/{$cat.cat_id}{else}/{$prod_display_type}/{$cat.cat_id}{/if}" class="parentcat">{$cat.name|replace:"&":"&amp;"}</a><br />
  {include file="site_map_recur.tpl" map=$cat.subcat prefix=""}
  {foreach from=$cat.products item=product}
    <img class="inline catimg" src="{$img_prefix}/images/fldr_c.gif" alt="{$product.prod_name|replace:"&":"&amp;"}" />&nbsp;<a href="/product/{$product.prod_id}{$url_split_char}{$cat.cat_id}" class="siteprod">{$product.prod_name|replace:"&":"&amp;"}</a><br />
  {/foreach}
{/foreach}
<br />

{include file="_bottom.tpl"}
