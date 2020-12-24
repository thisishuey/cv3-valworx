{* print correct product template for this product builder *}

{if $product.template != ''}
  {include file=$product.template}
{else}
  {include file="default_product_builder.tpl"}
{/if}
