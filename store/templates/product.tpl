{* print correct product template for this product *}

{assign_global var="parprice" value=$product.price}

{if $parprice == ''}
  {assign_global var="parprice" value=0}
{/if}

{if $product.price != $product.standard_price}
  {assign_global var="sparprice" value=$product.standard_price}
{else}
  {assign_global var="sparprice" value=$parprice}
{/if}

{if $product.template != ''}
  {include file=$product.template}
{else}
  {include file="default_product.tpl"}
{/if}
