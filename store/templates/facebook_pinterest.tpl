{** LAST EDIT DATE 10-02-18 -- added OG support for product feed generation **}

<!-- Facebook OG and Pinterest Card tags for product -->

{*assign var='fbappid' value='682124888828167'*}

    {if $view == 'product'}
            <meta property="og:title" content="{$product.prod_name}"/>
            <meta property="og:type" content="product"/>
            <meta property="og:url" content="{$smarty.server.SCRIPT_URI}"/>
            <meta property="og:description" content="{$product.prod_description|strip_tags:true|strip_quotes}"/>

            <meta property="og:product:retailer_item_id" content="{$product.sku}" />
            <meta property="og:product:availability" content={if $product.stock_status == 'In Stock'}"in stock"{else}"out of stock"{/if} />
            <meta property="og:product:condition" content="new" />
            <meta property="og:product:brand" content="{#store_name#}" />

            {if $product.web_image != ''}<meta property="og:image" content="{$protocol}://{$smarty.server.HTTP_HOST}{$product.large_image}"/>{/if}
            <meta property="og:site_name" content="{#store_name#}" />
            <meta property="og:price:currency" content="USD" />
            <meta property="og:availability" content="instock" />
            {if $product.is_parent != 'y' && $product.has_attributes != 'y' && $product.price != '0.00'}
                <meta property="product:price:amount" content="{$currency_type}{$product.price|commify}">
            {elseif $product.is_parent == 'y'}
                {foreach from=$product.children key=key item=prod}
                    <meta property="product:price:amount" content="{$currency_type}{$prod.price|commify}">
                {/foreach}
            {elseif $product.is_parent != 'y' && $product.has_attributes == 'y'}
                {foreach from=$attributes.attributes key=key item=attributes}
                    <meta property="product:price:amount" content="{$currency_type}{$attributes.price|commify}">
                {/foreach}
            {elseif $product.is_parent == '' && $product.has_attributes == '' && $attributes == ''}
                {foreach from=$attys.attributes key=key item=attyprice}
                    <meta property="product:price:amount" content="{$currency_type}{$attyprice.price|commify}">
                {/foreach}
            {elseif  $product.is_parent != 'y' && $product.additional_products != ''}
                {foreach from=$products.additional_prods key=key item=addprods}
                    <meta property="product:price:amount" content="{$currency_type}{$addprods.price|commify}">
                {/foreach}
            {/if}
            <meta property="fb:app_id" content="{$fbappid}"/>
    {/if}
