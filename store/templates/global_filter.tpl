{if $global_filters.filters|@count}
<section id="global_filter">
<header><h2 class="text_upper hed_font">Product Filter Options</h2></header>

<div>
 <form name="product_filter" method="post" action="index.php">
  <input type="hidden" name="action" value="GlobalFilter" />
  {foreach from=$global_filters.filters item=global_filter key=filter_option_id}
   <div class="form-group">
    <label for="category_filter_{$filter_option_id}"><span class="filter-label">{$global_filter.label}:</span></label>
    <select name="category_filter_{$filter_option_id}" id="category_filter_{$filter_option_id}" class="formtext form-control">
     <option label="Any" value="">Any</option>
     <option disabled>------------</option>
     {foreach from=$global_filter.values item=value key=value_id}
      <option label="{$value} ({$global_filter.counts.$value_id})" value="{$filter_option_id}_{$value}"{if $global_filter.selected == $value} selected="{$global_filter.selected}"{/if}>{$value}</option>
     {/foreach}
     </select>
    </div>
   {/foreach}
   <input type="submit" value="Submit" class="button medium style2 btn btn-default" />
  </form>
</div>
</section>
{/if}