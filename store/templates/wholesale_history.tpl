{include file="_wholesaletop.tpl"}

<h1>Order History</h1><br>

<div class="past-orders-wrapper {*col-sm-8 col-sm-push-4 col-md-9 col-md-push-3*}">

<div class="row{* lead hidden-xs*}">
  <div class="col-sm-4 col-md-4 col-lg-3">Date Ordered</div>
  <div class="col-sm-2">Buyer</div>
  <div class="col-sm-2">Shipping Alias</div>
  <div class="col-sm-2">Total</div>
  <div class="col-sm-2">Status</div>
  <div class="col-sm-1 col-md-2 col-lg-3">&nbsp;</div>
</div>

{foreach from=$history key=key item=order}
  {cycle values="#ffffff,#f0ecd1" assign=bgcol}
<div class="row {*mar_btm*}">
  <div class="col-sm-4 col-md-4 col-lg-3"><strong class="visible-xs">Date Ordered: </strong>{$order.date_ordered}</div>
  <div class="col-sm-2">{$order.buyer}</div>
  <div class="col-sm-2">{$order.shipping_alias}</div>
  <div class="col-sm-2">{$currency_type}{$order.total_price|commify}</div>
  <div class="col-sm-2"><a href="/wholesale_order/{$order.wsorder_id}">{$order.status}</a></div>
</div>
{/foreach}

</div>

<p>
</p>

{include file="_wholesalebottom.tpl"}
