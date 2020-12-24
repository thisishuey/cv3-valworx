{assign var='gawid' value='AW-1072733288'}
{assign var='gawconvid' value='qDJ4CIGcvIQBEOi4wv8D'}


<!— Global site tag (gtag.js) - Google AdWords: {$gawid} -->
<script async src="https://www.googletagmanager.com/gtag/js?id={$gawid}"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){ldelim}dataLayer.push(arguments);{rdelim}
  gtag('js', new Date());

  gtag('config', '{$gawid}');
</script>

{if $view != 'product_qanda'}
{if $view == 'checkout_thanks' && isset($placed.order.id) && isset($placed.totals.grandtotal)}
	<!-- Event snippet for Purchase conversion page -->
	<script>
	  gtag('event', 'conversion', {ldelim}
		  'send_to': '{$gawid}/{$gawconvid}',
		  'value': {$placed.totals.grandtotal},
		  'currency': 'USD',
		  'transaction_id': '{$placed.order.id}'
	  {rdelim});
	</script>
{/if}



<!-- Google Code for Remarketing Tag -->
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

{if $view == 'product'}
<script>
  gtag('event', 'view_item', {ldelim}
    'ecomm_prodid': {if !$product.children}'{$product.sku}'{else}[{$prodskus}]{/if},
    'ecomm_totalvalue': {if !$product.children}{$product.standard_price}{else}[{$prodprice}]{/if}, 
    'ecomm_pagetype': 'product'
{rdelim});
</script>
{/if}

{if $view == 'viewcart'}
<script>
  gtag('event', 'add_to_cart', {ldelim}
    'ecomm_prodid': {if $cart|@count > 1}[{/if}{$cartskus}{if $cart|@count > 1}]{/if},
    'ecomm_totalvalue': {$totals.price}, 
    'ecomm_pagetype': 'cart'
{rdelim});
</script>
{/if}

{if $view == 'checkout'}
<script>
  gtag('event', 'begin_checkout', {ldelim}
    'ecomm_prodid': {if $cart|@count > 1}[{/if}{$cartskus}{if $cart|@count > 1}]{/if},
    'ecomm_totalvalue': {$totals.price}, 
    'ecomm_pagetype': 'cart'
{rdelim});
</script>
{/if}

{if $view == 'checkout_shippingdetail' || $view == 'checkout_display' || $view == 'checkout_shipping' || $view == 'checkout_shippingaddress' || $view == 'checkout_billing'}
<script>
  gtag('event', 'checkout_progress', {ldelim}
    'ecomm_prodid': {if $cart|@count > 1}[{/if}{$cartskus}{if $cart|@count > 1}]{/if},
    'ecomm_totalvalue': {$totals.price}, 
    'ecomm_pagetype': 'cart'
{rdelim});
</script>
{/if}

{if $view == 'checkout_confirmation'}
<script>
  gtag('event', 'add_payment_info', {ldelim}
    'ecomm_prodid': {if $cart|@count > 1}[{/if}{$cartskus}{if $cart|@count > 1}]{/if},
    'ecomm_totalvalue': {$order.grandtotal}, 
    'ecomm_pagetype': 'cart'
{rdelim});
</script>
{/if}

{/if}{* end qanda dupe exclude *}