{include file="_wholesaletop.tpl"}
<h1>Order Details</h1><br>

<div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
<section>
   <h2>Order #{$order.order_id}</h2>
   <div class="nopad">
      <p><b>Buyer: </b>{$order_info.0.buyer}</p>
      <p><b>Total: </b>{$currency_type}{$order_info.0.total_price}</p>
      <p><b>Date Ordered: </b>{$order_info.0.date_ordered}</p>
      <p><b>PO Number: </b>{$order_info.0.po_number}</p>
      <p><b>Shipping Address Alias: </b>{$order_info.0.shipping_alias}</p>
   </div>
</section>
  <table class="table table-striped">
   <tr>
      <th>Item #</th>
      <th>Description</th>
      <th>Qty</th>
      <th>{if $order.recipient_order != 'y'}Price{else}&nbsp;{/if}</th>
  </tr>
  {foreach from=$order_info key=key item=product}
  <tr>
     <td>{$product.sku}</td>
     <td>{$product.prod_name}{if $prod.gift_items != ''}{$prod.gift_items}{/if}</td>
     <td>{$product.quantity}</td>
     <td>{if $product.build_parent != 'y' && $order.recipient_order != 'y'}{$currency_type}{$product.unit_price}{/if}</td>
  </tr>
  {/foreach}
  </table>
<a href="/wholesale_history">< View All Orders</a><br>
</div>

{include file="_wholesalebottom.tpl"}
