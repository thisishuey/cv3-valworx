{if $product.is_kit == 'y'}
    <p class="padd_0">Included Products:</p>
    {foreach from=$product.kit_prods item=kit_prod}
        {assign var="prodcid" value=$kit_prod.categories.0}
        <p class="padd_0">
            <a href="/product/{if $kit_prod.url_name != ''}{$kit_prod.url_name}{else}{$kit_prod.prod_id}{/if}{$url_split_char}{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$prodcid}{/if}">{if $kit_prod.parent_prod_name != ''}{$kit_prod.parent_prod_name} - {/if}{$kit_prod.prod_name}</a>
        </p>
    {/foreach}
{/if}