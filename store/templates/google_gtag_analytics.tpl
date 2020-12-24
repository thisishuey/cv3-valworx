{** LAST EDIT DATE 06-04-18**}

<!-- BEN GTAG1 -->

{if $use_google_analytics == 'y' && $view != 'product_qanda'}
<!-- BEN GTAG 2 -->
{*array_debug*}

{assign var='gawid' value='GET_FROM_ADWORDS'}

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id={*$google_analytics_acct*}UA-116179564-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){ldelim}dataLayer.push(arguments);{rdelim}
  gtag('js', new Date());

  gtag('config', '{*$google_analytics_acct*}UA-116179564-2');

  // gtag('config', '{$gawid}'); {* uncomment for Adwords tracking *}

</script>


{** PRODUCT **}
    {if $view == 'product'}
<!-- BEN GTAG 3 -->
    <script>
        gtag('event', 'view_item', {ldelim}
          "items": [
            {ldelim}
              "id": "{$product.sku}",
              "name": "{$product.name}",
              "category": "{$product.cat}",
              "quantity": 1,
              "price": '{$product.price}'
            {rdelim}
          ]
        {rdelim});
    </script>
    {/if}

{** Loop through our checkout cart to assemble the data for Google **}
        {if $view == 'viewcart' || $view == 'checkout' || $view == 'checkout_shippingdetail' || $view == 'checkout_display' || $view == 'checkout_shipping' || $view == 'checkout_shippingaddress' || $view == 'checkout_billing' || $view == 'checkout_confirmation'}
<!-- BEN GTAG 4 -->
            {set var=$gtag_cart}
             {foreach from=$cart key=key item=prod}
                {assign var='sku' value=$prod.sku}
                {assign var='qty' value=$prod.qty}
                {if !$sku|array_key_exists:$gtag_cart} {* Set up an entry for $gtag_cart *}
<!-- BEN GTAG 5 -->
                 {assign var='name' value=$prod.name}
                 {assign var='cat' value=$prod.cat}
                 {assign var='price' value=$prod.price}
                 {assign var='atty' value=$prod.attributes.attribute1}
                 {set var=$gtag_cart.$sku.name value=$name}
                 {set var=$gtag_cart.$sku.cat value=$cat}
                 {set var=$gtag_cart.$sku.price value=$price}
                 {set var=$gtag_cart.$sku.atty value=$atty}
                 {set var=$gtag_cart.$sku.qty value=$qty}
                {else} {* SKU already exists in $gtag_cart so just update the qty *}
                 {assign var='curr_qty' value=$gtag_cart.$sku.qty}
                 {math equation='x+y' x=$curr_qty y=$qty assign='new_qty'}
                 {set var=$gtag_cart.$sku.qty value=$new_qty}
                {/if}
             {/foreach}
        {/if}    

{** BEGIN CHECKOUT **}
    {if $view == 'viewcart'}
<!-- BEN GTAG 6 -->
    <script>
    gtag('event', 'add_to_cart', {ldelim}
      "items": [
            {foreach from=$gtag_cart key=sku item=item}
            {ldelim}
              "id": "{$sku|strip_tags|escape:'htmlall'}",
              "name": "{$item.name|strip_tags|escape:'htmlall'}",
              "category": "{$item.cat|strip_tags|escape:'htmlall'}",
              "variant": "{$item.atty|strip_tags|escape:'htmlall'}",
              "quantity": {$item.qty},
              "price": '{$item.price|commify:2}'
            {rdelim},
        {/foreach}
      ],
      {if $promo.set == 'y'}"coupon": "{$promo.code|strip_tags|escape:'htmlall'}"{/if}
    });
    </script>
    {/if}
    
{** CHECKOUT STEPS**}
    {if $view == 'checkout' || $view == 'checkout_shippingdetail' || $view == 'checkout_display' || $view == 'checkout_shipping' || $view == 'checkout_shippingaddress' || $view == 'checkout_billing' || $view == 'checkout_confirmation'}
<!-- BEN GTAG 7 -->
    <script>
    gtag('event', {if $view == 'checkout'}'begin_checkout'{else}'checkout_progress'{/if}, {ldelim}
      "items": [
            {foreach from=$gtag_cart key=sku item=item}
             {ldelim}
              "id": "{$sku|strip_tags|escape:'htmlall'}",
              "name": "{$item.name|strip_tags|escape:'htmlall'}",
              "category": "{$item.cat|strip_tags|escape:'htmlall'}",
              "variant": "{$item.atty|strip_tags|escape:'htmlall'}",
              "quantity": {$item.qty},
              "price": '{$item.price|commify:2}'
            {rdelim},
        {/foreach}
      ],
      {if $promo.set == 'y' || $promo.used == 'y'}"coupon": "{$promo.code|strip_tags|escape:'htmlall'}"{/if}
      {rdelim});
    </script>
    <script>
    gtag('event', 'set_checkout_option', {ldelim}
  "checkout_step": {if $view == 'checkout'}1{elseif $view == 'checkout_shipping'}2{elseif $view == 'checkout_confirmation'}3{/if}
{rdelim});
    </script>
    {/if}


{** PURCHASE **}
    {*if $view == 'checkout_thanks' && isset($placed.order.id) && isset($placed.totals.grandtotal)*}
<!-- BEN GTAG 8 -->
    {if $view == 'checkout_thanks'}
    {set var=$gtag_purchase}
     {* Loop through our cart to assemble the data for Google *}
     {foreach from=$placed.cart key=key item=prod}
        {assign var='sku' value=$prod.sku}
        {assign var='qty' value=$prod.qty}
        {if !$sku|array_key_exists:$gtag_purchase} {* Set up an entry for $gtag_purchase *}
         {assign var='name' value=$prod.name}
         {assign var='cat' value=$prod.cat}
         {assign var='price' value=$prod.price}
         {assign var='atty' value=$prod.attributes.attribute1}
         {set var=$gtag_purchase.$sku.name value=$name}
         {set var=$gtag_purchase.$sku.cat value=$cat}
         {set var=$gtag_purchase.$sku.price value=$price}
         {set var=$gtag_purchase.$sku.atty value=$atty}
         {set var=$gtag_purchase.$sku.qty value=$qty}
        {else} {* SKU already exists in $gtag_purchase so just update the qty *}
         {assign var='curr_qty' value=$gtag_purchase.$sku.qty}
         {math equation='x+y' x=$curr_qty y=$qty assign='new_qty'}
         {set var=$gtag_purchase.$sku.qty value=$new_qty}
        {/if}
     {/foreach}

    <script>
    gtag('event', 'purchase', {ldelim}
      "transaction_id": "{$placed.order.id}",
      "affiliation": "{#store_name#|strip_tags|escape:'htmlall'}",
      "value": {if isset($placed.totals.grandtotal)}{$placed.totals.grandtotal|commify:2}{else}0{/if},
      "currency": "USD",
      "tax": {if isset($placed.totals.taxtotal)}{$placed.totals.taxtotal|commify:2}{else}0{/if},
      "shipping": {if isset($placed.totals.shiptotal)}{$placed.totals.shiptotal|commify:2}{else}0{/if},
      "items": [
     {foreach from=$gtag_purchase key=sku item=item}
        {ldelim}
          "id": "{$sku|strip_tags|escape:'htmlall'}",
          "name": "{$item.name|strip_tags|escape:'htmlall'}",
          "category": "{$item.cat|strip_tags|escape:'htmlall'}",
          "variant": "{$item.atty|strip_tags|escape:'htmlall'}",
          "quantity": {$item.qty},
          "price": '{$item.price|commify:2}'
        {rdelim},
        {/foreach}
      ]
    {rdelim});
    </script>
    <script>
    gtag('event', 'set_checkout_option', {ldelim}
  "checkout_step": 4
{rdelim});
    </script>
    {* End Google Analytics Ecommerce code *}
    {/if}
    
{* End Google Analytics code *}
{/if}
