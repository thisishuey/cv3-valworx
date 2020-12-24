{if $categories.$cat_id.all_parents.0 != ''}
  {include file="wholesale_categories_recur.tpl" cat_id=$categories.$cat_id.all_parents.0}
{/if}

{$categories.$cat_id.name} >