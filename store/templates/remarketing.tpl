{assign var='prodskus' value=''}
{foreach from=$product.children item=item}
 {assign var='prodskus' value=$prodskus|cat:'\''|cat:$item.sku|cat:'\','}
{/foreach}
{assign var='prodskus' value=$prodskus|substr:0:-1}

{assign var='prodprice' value=''}
{foreach from=$product.children item=item}
 {assign var='prodprice' value=$prodprice|cat:'\''|cat:$item.standard_price|cat:'\','}
{/foreach}
{assign var='prodprice' value=$prodprice|substr:0:-1}

{assign var='cartskus' value=''}
{foreach from=$cart item=item}
 {assign var='cartskus' value=$cartskus|cat:'\''|cat:$item.sku|cat:'\','}
{/foreach}
{assign var='cartskus' value=$cartskus|substr:0:-1}



<!-- Google Code for Remarketing Tag -->
<!--------------------------------------------------
Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. See more information and instructions on how to setup the tag on: https://google.com/ads/remarketingsetup
--------------------------------------------------->
<script type="text/javascript">
var google_tag_params = {ldelim}
ecomm_prodid: {if $view != 'product' && $view != 'viewcart' && $view != 'checkout' && $view != 'checkout_shipping' && $view != 'checkout_confirmation'}''{elseif $view == 'product'}{if !$product.children}'{$product.sku}'{else}[{$prodskus}]{/if}{elseif $view == 'viewcart' || $view == 'checkout' || $view == 'checkout_shipping' || $view == 'checkout_confirmation'}{if $cart|@count > 1}[{/if}{$cartskus}{if $cart|@count > 1}]{/if}{/if},
ecomm_pagetype: {if $view == 'product'}'product'{elseif $view == 'category' && $SCRIPT_NAME != '/category/s'}'category'{elseif $view == 'index'}'home'{elseif $view == 'checkout_thanks'}'purchase'{elseif $cid == 's'}'searchresults'{elseif $view == 'viewcart' || $view == 'checkout' || $view == 'checkout_shipping' || $view == 'checkout_confirmation'}'cart'{elseif $view != 'index' && $view != 'product' && $view != 'category' && $view != 'index' && $cid != 's'}'other'{/if},
ecomm_totalvalue: {if $view != 'product' && $view != 'viewcart' && $view != 'checkout' && $view != 'checkout_shipping' && $view != 'checkout_confirmation'}{elseif $view == 'product'}{if !$product.children}{$product.standard_price|commify}{else}[{$prodprice}]{/if}{elseif $view == 'viewcart' || $view == 'checkout' || $view == 'checkout_shipping' || $view == 'checkout_confirmation'}{$totals.price|commify}{/if}
{rdelim};
</script>

<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1072733288;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1072733288/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
