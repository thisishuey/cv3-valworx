<div style="text-align:center;" class="normaltext">
<a href="/product_builder/{if $product.url_name != ''}{$product.url_name}{else}{$prod_id}{/if}{$url_split_char}step|c_{$cid}|s_{$product.next_build_step.step_id}|sc_{$product.build_group}|pr_{$prod.prod_id}"><img src="{if $prod.web_image != ''}{$prod.web_image|img_prefix}{else}{$img_prefix}/images/nopicture_tn.jpg{/if}" style="display:inline;"></a><br />

<a href="/product_builder/{if $product.url_name != ''}{$product.url_name}{else}{$prod_id}{/if}{$url_split_char}step|c_{$cid}|s_{$product.next_build_step.step_id}|sc_{$product.build_group}|pr_{$prod.prod_id}">{$prod.prod_name}</a>
</div>
