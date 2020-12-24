{counter start=1 assign=tnum}
{assign var="tcnt" value=$map|@count}
{foreach from=$map item=m}
  {$prefix}{if $tnum < $tcnt}<img class="inline catimg" src="{$img_prefix}/images/fldr.gif" alt="{$m.name|replace:"&":"&amp;"}" />{else}<img class="inline catimg" src="{$img_prefix}/images/fldr_end.gif" alt="{$m.name|replace:"&":"&amp;"}" />{/if}&nbsp;<a href="{if $display == 'multi' && $display_cat != $m.cat_id}/site_map/{$m.cat_id}{else}/{$prod_display_type}/{$m.cat_id}{/if}" class="subcat">{$m.name|replace:"&":"&amp;"}</a><br />
  {if $m.subcat|@count > 0}
    {if $tnum < $tcnt}
      {include file="site_map_recur.tpl" map=$m.subcat prefix=$prefix|cat:"<img class=\"inline catimg\" src=\"/images/fldr_line.gif\" alt=\"\" />"}
    {else}
      {include file="site_map_recur.tpl" map=$m.subcat prefix=$prefix|cat:"<img class=\"inline catimg\" src=\"/images/spacer.gif\" width=\"25\" height=\"19\" alt=\"\" />"}
    {/if}
  {/if}
  {foreach from=$m.products item=product}
    {$prefix}{if $tnum < $tcnt}<img class="inline catimg" src="{$img_prefix}/images/fldr_line.gif" alt="{$product.prod_name|replace:"&":"&amp;"}" />{else}<img class="inline catimg" src="{$img_prefix}/images/spacer.gif" width="25" height="19" alt="{$product.prod_name|replace:"&":"&amp;"} />{/if}<img class="inline catimg" src="{$img_prefix}/images/fldr_c.gif" alt="{$product.prod_name|replace:"&":"&amp;"} />&nbsp;<a href="/product/{$product.prod_id}{$url_split_char}{$m.cat_id}" class="siteprod">{$product.prod_name|replace:"&":"&amp;"}</a><br />
  {/foreach}
  {counter assign=tnum}
{/foreach}
