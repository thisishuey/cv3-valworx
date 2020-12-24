{if $view == 'checkout_thanks' && isset($placed.order.id)}
  {foreach from=$placed.cart key=key item=prod}
      {assign var='sku' value=$prod.sku}
      {assign var='qty' value=$prod.qty}
      {if !$sku|array_key_exists:$ga_cart}
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

<script type="text/javascript">
window.dataLayer = window.dataLayer || []
dataLayer.push({ldelim}
   'event':'OrderConfirm',
        'transactionId': '{$placed.order.id}',
        'transactionAffiliation': '{#store_name#|strip_tags|escape:'html'}',
        'transactionTotal': {$placed.totals.grandtotal},
        'transactionTax': {$placed.totals.taxtotal},
        'transactionShipping': {$placed.totals.shiptotal},
        'transactionProducts': [
        {foreach from=$ga_cart key=sku item=item}
            {ldelim}
             'name': '{$item.name|strip_tags|escape:'html'}',
             'sku': '{$sku}',
             'price': {$item.price|commify:2|replace:",":""},
             'brand': '{if $product.brand != ''}{$product.brand|strip_tags|escape:'html'}{else}{#store_name#|strip_tags|escape:'html'}{/if}',
             'category': '{$item.cat}',
             'quantity': {$item.qty},
             'coupon': '{if $placed.info.promo.code != ''}{$placed.info.promo.code}{/if}'
           {rdelim},
          {foreachelse}
           {rdelim}
          {/foreach}
         ]
{rdelim});
</script>

{/if}
