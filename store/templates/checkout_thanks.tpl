{include file="_top.tpl"}

{include file="checkout_progress.tpl" step="5"}

<h1>Order Complete</h1>

  {if isset($ebook_error)}
    There was an error processing your ebook purchases.
    <br/> Please contact support with this order number so this can be resolved
    <br/> {$ebook_error}
    <br/><br/>
  {/if}

{#order_thankyou_text#}

{if isset($placed.order.id) && !isset($placed.info.amazon_order_ids)}
  <h2>Your Order # is {$placed.order.id}</h2>
{elseif isset($placed.info.amazon_order_ids)}
    <h2>{#store_name#} Order # is {$placed.order.id}</h2>
    {include file="amazon_checkout.tpl" order_ids=$placed.info.amazon_order_ids}
{/if}

{if isset($placed.rewards_points_earned) && $placed.rewards_points_earned > 0}
  <h2>Rewards Points Earned: {$placed.rewards_points_earned}</h2>
  <br/>
{/if}

{if isset($placed.rewards_points_redeemed) && $placed.rewards_points_redeemed > 0}
  <h2>Rewards Points Used: {$placed.rewards_points_redeemed}</h2>
  <br/>
{/if}

{if $registered == 'y'}
  <p><strong>Welcome to our site!</strong></p>
  <p>Feel free to log in to our member area <a href="/member">here</a> with the email and password you used during checkout.  If you cannot log in using the information given during checkout, your account may be pending approval.</p>
{/if}

{*include file="display_product_group.tpl" label="Related Products" products=$rel_prods max=6*}

{*** Commonly used Tracking Pixel variables ******
Order ID = $placed.order.id
Order Total = $placed.totals.grandtotal
SubTotal = $placed.totals.subtotal
Shipping Total = $placed.totals.shiptotal
Tax Total = $placed.totals.taxtotal
Payment Type = $placed.info.billing.payment_method
Currency Type = $placed.info.currency_type
**************************************************}

{include file="_bottom.tpl"}
