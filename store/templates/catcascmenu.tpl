{if $cid != 's' && $cid != 'o' && $cid != 'p' && $cid != 'r'}

 {if $categories.$cid.sub_cats|@count != ''}
  <ul class="cat-thumbs">
  {counter assign=number name=number start=0}
  {foreach from=$categories key=key item=category}
   {if $category.parent == $cid && $category.inactive != 'y'}
    {cycle values="left,center,right" assign=cpos}
     <li class="{$cpos} iefix">
     {if $category.image != ''}
      <div class="image"><a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}"><img src="{$category.image|img_prefix}" alt="{$category.name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" /></a></div>
     {/if}
      <div class="info"><div class="content"><a href="/{$prod_display_type}/{if $category.url_name != ''}{$category.url_name}{else}{$key}{/if}" class="subcats"><h2>{$category.name|replace:"& ":"&amp; "}</h2></a></div></div>
     </li>
    {counter assign=number name=number}
   {/if}
  {/foreach}
  </ul>
 {/if}

{elseif $cid == 's'}
<section id="search_results">
 {if ($searchtype == 'cat' || $searchtype == 'prodcat') && $searchedcatstotal > 0}
  <div class="cat_results">
    <p>Showing <strong>1-{$searchedcatstotal}</strong> out of <strong>{$searchedcatstotal}</strong> category matches:</p>
    {foreach from=$searchedcats key=key item=category}
     {if $category.linked != 'y'}
      <div><a href="/{$prod_display_type}/{if $categories.$key.url_name != ''}{$categories.$key.url_name}{else}{$key}{/if}">{$category.name}</a></div>
     {/if}
    {/foreach}
  </div>
 {/if}

 {if $searchtype == 'prod' || $searchtype == 'prodcat'}
  {if $products.total != '0'}
   <div class="prod_results">
     <div>Showing <strong>{$products.viewable.from} - {$products.viewable.to}</strong> out of <strong>{$products.total}</strong> total matches:{if $products.nav.prev != 'n' || $products.nav.next != 'n'}<a href="/{$prod_display_type}/s/a">View All</a>{/if}</div>
   </div>
  {/if}
 {/if}
</section>
{/if}