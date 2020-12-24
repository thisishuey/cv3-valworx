{if $filter_options.filters|@count}
<section id="category_filter">
<div class="catfilter">
 <div class="filter-list">
  <form name="category_filter" action="">
   {foreach from=$filter_options.filters item=filter_option key=filter_option_id}
     <div class="individual_filter">
      <header><h2>{$filter_option.label}</h2></header>
      <div class="filter_container">
       <ul>
       {foreach from=$filter_option.values item=value key=value_id}
        <li><input type="checkbox" name="{$value}" value="{$filter_option_id}_{$value}" onclick={if $filter_option.selected == $value}"location.href='/category_filter/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}/{$filter_option_id}_';"{else}"location.href='/category_filter/{$cid}/{$filter_option_id}_{$value}';"{/if} {if $filter_option.selected == $value}checked="checked"{/if} /> {$value}</li>
       {/foreach}
       </ul>
      </div>
     </div>
   {/foreach}
    <div class="individual_filter">
      <header><h2>Clear All</h2></header>
      <div class="filter_container">
       <ul>
        <li><input type="checkbox" name="Clear all" value="_" onclick="location.href='/category_filter/{$cid}/all';" /> Clear All</li>
       </ul>
      </div>
    </div>
  </form>
 </div>
</div>
</section>
{/if}