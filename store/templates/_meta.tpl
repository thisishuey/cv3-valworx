{* Dynamic Meta Tags *}

{assign var="title" value=$meta.Title}
{assign var="keywords" value=$meta.Keywords}
{assign var="description" value=$meta.Description}
{assign var="classification" value=$meta.Classification}
{if $meta.dynamic == 'y'}
    {if $categories.$cid.name != ''}
        {assign var="title" value=$categories.$cid.name|cat:": "|cat:#store_name#}
        {assign var="classification" value=$categories.$cid.name}
        {assign var="keywords" value=$categories.$cid.name|cat:","}
        {foreach from=$products.data item=prod}
            {assign var="keywords" value=$keywords|cat:$prod.prod_name|cat:","}
        {/foreach}
    {/if}
    {if $categories.$cid.cat_description != ''}
        {assign var="description" value=$categories.$cid.cat_description}
    {/if}
    {if $categories.$cid.description != ''}
        {assign var="description" value=$categories.$cid.description}
    {/if}
    {if $categories.$cid.meta_title != ''}
        {assign var="title" value=$categories.$cid.meta_title}
    {/if}
    {if $categories.$cid.meta_keywords != ''}
        {assign var="keywords" value=$categories.$cid.meta_keywords}
    {/if}
    {if $product.prod_name != ''}
        {assign var="title" value=$product.prod_name|cat:", "|cat:$categories.$cid.name|cat:": "|cat:#store_name#}
        {assign var="classification" value=$product.prod_name}
    {/if}
    {if $product.prod_description != ''}
        {assign var="description" value=$product.prod_description}
    {/if}
    {if $product.meta_keywords != ''}
        {assign var="keywords" value=$product.meta_keywords}
    {/if}
    {if $product.meta_title != ''}
        {assign var="title" value=$product.meta_title}
    {/if}
    {if $product.meta_description != ''}
        {assign var="description" value=$product.meta_description}
    {/if}
    {if $view == 'site_map' && $var1}
        {assign var="bigvar" value=$var1|capitalize:true}
        {assign var="title" value="Site Map - $bigvar"}
    {/if}
{/if}

<head>
    <title>{if $view == 'create_review'}Create Review {elseif $view == 'view_reviews'}View Reviews {/if}{$title|replace:'"':'&#8243;'|replace:'& ':'&amp; '|strip_quotes|strip_tags:false}</title>

    {* CSS LINKS *}
{***** swap out with above for live site
    <link href="/bootstrap-min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="{#stylesheet#|cdn_styles}">
*****}
    <link rel="stylesheet" href="{$cdn_path.prefix}/bootstrap-min{$cdn_path.css_postfix}" type="text/css" />
    <link rel="stylesheet" type="text/css" href="{$cdn_path.prefix}/styles{$cdn_path.css_postfix}?new=20200909">

        {* CONDITIONAL CSS TARGETING IE *}
        <!--[if lt IE 8]>
        {literal}<style type="text/css">
         html div.iefix, html ul li.iefix, html li[style] { *display: inline !important; }
         input[type=submit],
         input[type=reset],
         input[type=button] { filter:chroma(color=#000000); }
         fieldset { position: relative; margin: 0 0 1em 0; }
         legend { position: absolute; top: -.5em; left: .2em; }
         input.button, input.medium, input.large, input.style1, input.style2 { zoom: 1; min-height: 1px; }
         #progress li div:before {display:none;}
         #progress li div { padding: 10px 25px; }
        </style>{/literal}
       <![endif]-->

      <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,700,700i" rel="stylesheet">

                {* META TAGS *}
                {if !$live || $force_robots}
                    <meta name="robots" content="noindex,nofollow" />
                {/if}
                <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width"/>
            <meta name="keywords" content="{$keywords|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" />
            <meta name="description" content="{$description|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" />
            {*<meta name="classification" content="{$classification|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" />*}
            <!--[if IE]>
             <meta http-equiv="ImageToolbar" content="false" />
             <meta http-equiv="ClearType" content="true" />
             <meta name="MSSmartTagsPreventParsing" content="true" />
             <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
            <![endif]-->


{* CANONICAL LINKS *}
{if $view == 'category' || $view == 'prod_detail_list'}
  <link rel="canonical" href="{$protocol}://{$smarty.server.HTTP_HOST}/{$view}/{if $categories.$cid.linked_to_url_name != ''}{$categories.$cid.linked_to_url_name}{elseif $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}" />
 {elseif $view == 'product' || $view =='product_builder' || ($meta.review_qanda == 'y' && ($view == 'product_qanda' || $view == 'create_review'))}
  <link rel="canonical" href="{$protocol}://{$smarty.server.HTTP_HOST}/{$view}/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}/{if $canon_cat.url_name != ''}{$canon_cat.url_name}{else}{$canon_cat.cat_id}{/if}" />
{elseif $view=='index'}
   <link rel="canonical" href="{$protocol}://{$smarty.server.SERVER_NAME}" />
{else}
   <link rel="canonical" href="{$protocol}://{$smarty.server.SERVER_NAME}{$smarty.server.SCRIPT_URL}" />
{/if}

        {* THIS LOADS THE JQUERY LIBRARY VIA CDN - latest version as of 12/11/2017 *}
	<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-migrate-3.0.1.min.js" integrity="sha256-F0O1TmEa4I8N24nY0bya59eP6svWcshqX1uzwaWC4F4="crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />

		{* TABS COLLAPSE https://github.com/flatlogic/bootstrap-tabcollapse *}
        <script type="text/javascript" src="/bootstrap-tabcollapse.js"></script>

        {* MAGIC ZOOM *}
        <script type="text/javascript" src="/magicscroll.js"></script>
        <script type="text/javascript" src="/magiczoomplus.js"></script>
        <link rel="stylesheet" type="text/css" href="/magicscroll.css">
        <link rel="stylesheet" type="text/css" href="/magiczoomplus.css">

        {* USED FOR LIST/GRID TOGGLE*} 
{***** swap out with above for live site
        <script type="text/javascript" src="/cookie.js"></script>
        <script type="text/javascript" src="/all.js"></script>
        <script type="text/javascript" src="/aj.js"></script>
        {if $custom_form_num > 0 || $generic_form}
            <script type="text/javascript" src="/uploadS3.js"></script>
        {/if}
*****}
        <script type="text/javascript" src="{$cdn_path.prefix}/cookie{$cdn_path.js_postfix}"></script>
        <script type="text/javascript" src="{$cdn_path.prefix}/all{$cdn_path.js_postfix}"></script>
        <script type="text/javascript" src="{$cdn_path.prefix}/aj{$cdn_path.js_postfix}"></script>
        {if $custom_form_num > 0 || $generic_form}
            <script type="text/javascript" src="{$cdn_path.prefix}/uploadS3{$cdn_path.js_postfix}"></script>
        {/if}


        {if preg_match('/^(checkout|wholesale|member|subscriptions|contact|viewcart|quickbuy|catalog|member_wishlist)(.*)?$/',$view)}
            <script src="{$cdn_path.prefix}/cart{$cdn_path.js_postfix}" type="text/javascript"></script>
            {assign_global var="wishlist" value=$wishlist}
            {assign_global var="options" value=$options}
            {assign_global var="alias" value=$alias}
            {assign_global var="billing_alias" value=$billing_alias}
        {/if}
        {if $bongo_js=='y'}
            <script src="{$cdn_path.prefix}/bongo{$cdn_path.js_postfix}" type="text/javascript"></script>
        {/if}
        {if $print_att == '' || !isset($print_att)}
            {assign var="print_att" value="n"}
        {/if}

        {if $view == 'product' || $view == 'product_builder' || $view == 'checkout_fpinfo' || $view == 'prod_detail_list' || $view == 'express_info'}
         {if $view == 'express_info'}
           {assign_global var="parprice" value=$product.price}
           {if $parprice == ''}
             {assign_global var="parprice" value=0}
           {/if}
           {if $product.price != $product.standard_price}
             {assign_global var="sparprice" value=$product.standard_price}
           {else}
             {assign_global var="sparprice" value=$parprice}
           {/if}
         {/if}
         {assign_global var="attys" value=$attys}
        {/if}

        {if $view != 'site_maintenance'}
        {if $use_all_js == 'y' || $print_att == 'y'}
        <script type="text/javascript" src="/all_js/{$view}/{$print_att}"></script>
        {/if}
        {/if}

        {* GOOGLE MERCHANT CENTER *}
        <meta name="google-site-verification" content="zHQL6Qw4UeSaqrrB-wRR-YtbKgQK6vlwFfYmpsaom2U" />

        {* GOOGLE ANALYTICS *}
        {include file="google_analytics_inc.tpl"}
        {*include file="google_gtag_analytics.tpl*"}

        {* GOOGLE ADWORDS *}
        {include file="google_adwords.tpl"}

        {* GOOGLE RICH SNIPPETS STRUCTURED DATA *}
        {include file="structured_data.tpl"}

        {* BING WEBMASTER TOOLS *}
        <meta name="msvalidate.01" content="06330198AD97098CBC07213E8453E3EC" />

        {* TWITTER CARD *}
        {include file="twitter_card.tpl"}

        {* FACEBOOK OG and PINTEREST *}
        {include file="facebook_pinterest.tpl"}
        
        {* BING AdCENTER UET *}
        {include file="bing_ads_uet.tpl"}

        {* CREATE HTML5 ELEMENTS IN IE *}
{***** swap out with above for live site
        <!--[if lt IE 9]>
         <script src="/html5shim.js"></script>
         <script src="/IE9.js"></script>
        <![endif]-->
*****}
        <!--[if lt IE 9]>
         <script src="{$cdn_path.prefix}/html5shim{$cdn_path.js_postfix}"></script>
         <script src="{$cdn_path.prefix}/IE9{$cdn_path.js_postfix}"></script>
        <![endif]-->

<script type="text/javascript"> //<![CDATA[ 
var tlJsHost = ((window.location.protocol == "https:") ? "https://secure.comodo.com/" : "http://www.trustlogo.com/");
document.write(unescape("%3Cscript src='" + tlJsHost + "trustlogo/javascript/trustlogo.js' type='text/javascript'%3E%3C/script%3E"));
//]]>
</script>

    </head>
    <!--{$meta.pre_comment}-->