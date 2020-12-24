{if $use_google_analytics == 'y'}
{* Google Analytics code *}

<script>
  (function(i,s,o,g,r,a,m){ldelim}i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){ldelim}
  (i[r].q=i[r].q||[]).push(arguments){rdelim},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  {rdelim})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', '{$google_analytics_acct}', 'auto');
  ga('require', 'displayfeatures');
  ga('send', 'pageview');

{if $view == 'checkout_thanks' && isset($placed.order.id) && isset($placed.totals.grandtotal)}

ga('require', 'ecommerce', 'ecommerce.js');

ga('ecommerce:addTransaction', {ldelim}
 'id': '{$placed.order.id}',                     // Transaction ID. Required.
 'affiliation': '{#store_name#|strip_tags|escape:'htmlall'}',   // Affiliation or store name.
 'revenue': '{$placed.totals.grandtotal}',       // Grand Total.
 'shipping': '{$placed.totals.shiptotal}',       // Shipping.
 'tax': '{$placed.totals.taxtotal}',             // Tax.
 'currency': 'USD'              // Currency.
{rdelim});

{* Set up an "array" to assemble the data needed in the format to make Google Analytics happy *}
 {set var=$ga_cart}

 {* Loop through our cart to assemble the data for Google *}
 {foreach from=$placed.cart key=key item=prod}
    {assign var='sku' value=$prod.sku}
    {assign var='qty' value=$prod.qty}

    {if !$sku|array_key_exists:$ga_cart} {* Set up an entry for $ga_cart *}
     {assign var='name' value=$prod.name}
     {assign var='cat' value=$prod.cat}
     {assign var='price' value=$prod.price}
     {set var=$ga_cart.$sku.name value=$name}
     {set var=$ga_cart.$sku.cat value=$cat}
     {set var=$ga_cart.$sku.price value=$price}
     {set var=$ga_cart.$sku.qty value=$qty}
    {else} {* SKU already exists in $ga_cart so just update the qty *}
     {assign var='curr_qty' value=$ga_cart.$sku.qty}
     {math equation='x+y' x=$curr_qty y=$qty assign='new_qty'}
     {set var=$ga_cart.$sku.qty value=$new_qty}
    {/if}
 {/foreach}

 {foreach from=$ga_cart key=sku item=item}
   ga('ecommerce:addItem', {ldelim}
    'id': '{$placed.order.id}',           // Transaction ID. Required.
    'name': '{$item.name|strip_tags|escape:'htmlall'}',            // Product name. Required.
    'sku': '{$sku|strip_tags|escape:'htmlall'}',                       // SKU/code.
    'category': '{$item.cat|strip_tags|escape:'htmlall'}',           // Category or variation.
    'price': '{$item.price}',              // Unit price.
    'quantity': '{$item.qty}'              // Quantity.
   {rdelim});
 {/foreach}

ga('ecommerce:send');
{/if}


</script>
{* End Google Analytics code *}
{/if}

