{include file="_top.tpl"}
<h1>Past Orders - Details</h1>
<div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
<section>
   <h2>Order #{$order.order_id}</h2>
   <div class="nopad">
      <p><a href="/member_reorder/{if $order.external == 'y'}h{/if}{$order.order_id}">Reorder</a></p>
      <p><b>Date Ordered: </b>{$order.date_ordered}</p>

        {if $order.payment_method != 'bongo_checkout'}
          <p><b>Total:</b>&nbsp;{$currency_type}{$order.total_price|commify}<br />
          <p><b>Tax:</b>&nbsp;{$currency_type}{$order.total_tax}<br />
        {else}
         <p> <b>Tax:</b>&nbsp;{$currency_type}{$order.bongo_price_details.tax}</p>
          <p><b>Duty:</b>&nbsp;{$currency_type}{$order.bongo_price_details.duty}</p>
          <p><b>Shipping:</b>&nbsp;{$currency_type}{math equation="x + y" x=$order.bongo_price_details.shipping y=$order.bongo_price_details.domestic}</p>
          <p><b>Insurance:</b>&nbsp;{$currency_type}{$order.bongo_price_details.insurance}</p>
          <p><b>Total:</b>&nbsp;{$currency_type}{$order.total_price|commify}</p>
        {/if}

      {if $order.recipient_order != 'y'}
        <p><b>Total:</b>&nbsp;{$currency_type}{$order.total_price|commify}</p>
        <p><b>Tax:</b>&nbsp;{$currency_type}{$order.total_tax}</p>
      {/if}
   </div>
</section>
{include file="amazon_checkout.tpl" order_ids=$order.amazon_order_ids}
<h3><b>Products by Address Shipped-To</b></h3>

{foreach from=$order.order key=key item=recip}
   <section class="nopad">
   <p>{$recip.ship_name} {$recip.ship_lastname}</p>
   <p>{$recip.address1}</p>

   {if $recip.address2 != ''}
      <p>{$recip.address2}</p>
   {/if}
      <p>{$recip.city}, {$recip.state} {$recip.zip}</p>
   </section>

   <table class="table table-striped">
   <tr>
      <th>Item #</th>
      <th>Description</th>
      <th>Qty</th>
      <th>{if $order.recipient_order != 'y'}Price{else}&nbsp;{/if}</th>
  </tr>
{foreach from=$recip.product key=key item=product}
  {if $product.build_prod == 0 || $product.build_prod == '' || $product.build_parent == 'y'} 
  <tr>
     <td>{$product.sku}</td>
     <td>{$product.name}{if $product.recurring_shipment}<br/> Re-order every {$product.recurring_shipment} days{/if}</td>
     <td>{$product.quantity}</td>
     <td>{if $product.build_parent != 'y' && $order.recipient_order != 'y'}{$currency_type}{$product.price}{/if}</td>
  </tr>
    {if $product.build_parent == 'y' && $product.build_prod_link > 0}
      {foreach from=$recip.product key=bp_key item=bp_prod}
        {if $bp_prod.build_prod_link == $product.build_prod_link && $bp_prod.build_parent != 'y'}
  <tr>
    <td>&nbsp; - &nbsp;{$bp_prod.sku}</td>
    <td>{$bp_prod.name}</td>
    <td>{$bp_prod.quantity}</td>
    <td>{if $bp_prod.build_parent != 'y' && $order.recipient_order != 'y'}{$currency_type}{$bp_prod.price}{/if}</td>
  </tr>
        {/if}
      {/foreach}
    {/if}
  {/if}
{/foreach}

  </table>
{/foreach}
  <div>
      <p><a href="/member_orders">< Back to All Orders</a></p>
   </div>
</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
   {include file="member_links.tpl"}
</div>
{include file="_bottom.tpl"}
