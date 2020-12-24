{if $settings.sub_category_display == 'y'}

{foreach from=$subcats item=scat key=sckey}

<h2>{$scat.name}</h2>

  {foreach from=$scat.products item=product}
   {include file="display_product.tpl" product=$product}
  {/foreach}

{/foreach}

{/if}
