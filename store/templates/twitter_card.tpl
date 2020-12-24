{** LAST EDIT DATE 05-01-18 **}

<!-- twitter card -->

{assign var='twittername' value='valworxvalves'}
{assign var='logo_image' value='valworx-twitter.png'}

<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@{$twittername}">
<meta name="twitter:creator" content="@{$twittername}">

{if $view == 'product'}
	<meta name="twitter:title" content="{$product.prod_name|strip_tags|escape:'htmlall'}">
	<meta name="twitter:description" content="{$product.prod_description|strip_tags|escape:'htmlall'}">
	<meta name="twitter:image" content="{$protocol}://{$smarty.server.HTTP_HOST}{$product.large_image}">
	<meta name="twitter:image:alt" content="{$product.prod_name|strip_tags|escape:'htmlall'}">
	<meta name="twitter:label1" content="Price">
	{if $product.is_parent != 'y' && $product.has_attributes != 'y' && $product.price != '0.00'}
			<meta name="twitter:data1" content="{$currency_type}{$product.price|commify}">

	{elseif $product.is_parent == 'y'}
			{foreach from=$product.children key=key item=prod}
			<meta name="twitter:data1" content="{$currency_type}{$prod.price|commify}">
			{/foreach}

	{elseif $product.is_parent != 'y' && $product.has_attributes == 'y'}
			{foreach from=$attributes.attributes key=key item=attributes}
			<meta name="twitter:data1" content="{$currency_type}{$attributes.price|commify}">
			{/foreach}

	{elseif $product.is_parent == '' && $product.has_attributes == '' && $attributes == ''}
			{foreach from=$attys.attributes key=key item=attyprice}
			<meta name="twitter:data1" content="{$currency_type}{$attyprice.price|commify}">
			{/foreach}

	{elseif  $product.is_parent != 'y' && $product.additional_products != ''}
			{foreach from=$products.additional_prods key=key item=addprods}
			<meta name="twitter:data1" content="{$currency_type}{$addprods.price|commify}">
			{/foreach}
	{/if} 

	<meta name="twitter:label2" content="Category">
	<meta name="twitter:data2" content="{$canon_cat.name}">
{/if}

{** CATEGORY PAGES **}
{if $view == 'category' || $view == 'prod_detail_list'}
	<meta name="twitter:title" content="{$title|strip_tags|escape:'htmlall'}">
	<meta name="twitter:description" content="{$description|strip_tags|escape:'htmlall'}">
	<meta name="twitter:image" content="{$protocol}://{$smarty.server.HTTP_HOST}{$categories.$cid.image}">
	<meta name="twitter:image:alt" content="{$title|strip_tags|escape:'htmlall'}">
{/if}

{** INDEX AND STATIC PAGES **}
{if $view != 'product' && $view != 'category' && $view != 'prod_detail_list'}
	<meta name="twitter:title" content="{$title|strip_tags|escape:'htmlall'}">
	<meta name="twitter:description" content="{$description|strip_tags|escape:'htmlall'}">
	<meta name="twitter:image" content="{$protocol}://{$smarty.server.HTTP_HOST}/images/{$logo_image}">
	<meta name="twitter:image:alt" content="{$title|strip_tags|escape:'htmlall'}">
{/if}