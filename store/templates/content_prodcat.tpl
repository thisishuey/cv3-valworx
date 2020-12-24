<div class="prod_links"><a href="/{if $prod.build_product != 'y'}product{else}product_builder{/if}/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}{$url_split_char}{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$prodcid}{/if}">{$prod.prod_name}</a></div>

{if $prod.desc_header!= ''}{$prod.desc_header}<br>{/if}

<a href="/{if $prod.build_product != 'y'}product{else}product_builder{/if}/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}{$url_split_char}{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$prodcid}{/if}">more details &raquo;</a><br><br>
