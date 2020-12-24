{* print correct category template for this prod_detail_list *}

{if $categories.$cid.template != ''}
  {include file=$categories.$cid.template}
{else}
  {include file="default_category.tpl"}
{/if}
