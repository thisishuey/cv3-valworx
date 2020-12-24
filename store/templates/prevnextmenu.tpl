{if $page == '' || str_replace($page, $range) == ''}
  {if $range != '' && !preg_match('/\|$/',$range)}
    {assign var=page value=$page|replace:$range:""}
  {else}
    {assign var=page value=1}
    {if $page < $var2 && $cid != 'f'}
      {assign var=page value=$var2}
    {/if}
  {/if}
{/if}

{if $products.total > #category_num_displayed# || $products.nav.prev != 'n' || $products.nav.next != 'n'}
  {* get start page *}
  {* moved outside of the if due to issues with the next 10 link *}
  {math equation="floor((x-1)/5)*5" x=$page assign=start_cnt}
  {if $products.nav.prev != 'n' || $products.nav.next != 'n'}
    {if $start_cnt > 0}
      <span class="arrow"><a href="/{$prod_display_type}/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}/{$range}{$products.nav.prev}">&laquo; prev 10</a></span>
    {elseif $products.nav.prev != 'n'}
      <span class="arrow"><a href="/{$prod_display_type}/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}/{$range}{$products.nav.prev}"><</a></span>
    {/if}
    <span class="page">Viewing Page</span>
    {counter assign=num start=0 step=1}
    {foreach from=$products.count item=cnt}
      {if $cnt > $start_cnt}
        {counter assign=num}
        {if $num <= 5}
          {if $cnt == $page}
            <span class="active">{$cnt}</span>
          {else}
            <span class="pagenumber"><a href="/{$prod_display_type}/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}/{$range}{$cnt}">{$cnt}</a></span>
          {/if}
        {/if}
      {/if}
    {/foreach}
    {math equation="x+6" x=$start_cnt assign=end_cnt}
    {if $num >= $end_cnt}
      <span class="arrow"><a href="/{$prod_display_type}/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}/{$range}{$end_cnt}">next 10 &raquo;</a></span>
    {elseif $products.nav.next != 'n'}
      <span class="arrow"><a href="/{$view}/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}/{$range}{$products.nav.next}">></a></span>
    {/if}
    {*<a href="/{$prod_display_type}/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}/{$range}a">View All</a>*}
  {/if}
{/if}