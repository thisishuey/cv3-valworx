{* print correct category template for this category *}

{if $categories.$cid.template != ''}
  {include file=$categories.$cid.template}
{else}
  {include file="default_category.tpl"}
{/if}
