{include file="_top.tpl"}

<h1>Past Orders</h1>

<div class="past-orders-wrapper col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">

<div class="row lead hidden-xs">
  <div class="col-sm-4 col-md-4 col-lg-3">Date Ordered</div>
  <div class="col-sm-3">Order #</div>
  <div class="col-sm-3">Total Price</div>
  <div class="col-sm-2 col-md-2 col-lg-3">&nbsp;</div>
</div>

{foreach from=$orders key=key item=order}
  {cycle values="#ffffff,#f0ecd1" assign=bgcol}
<div class="row mar_btm">
  <div class="col-sm-4 col-md-4 col-lg-3"><strong class="visible-xs">Order Date: </strong>{$order.date}</div>
  <div class="col-sm-3"><a  href="/member_orderdetail/{$key}">Order #{if $order.external == 'n'}{$key}{else}{$key|substr:1}{/if}</a></div>
  <div class="col-sm-3"><strong class="visible-xs">Total Price: </strong>{if $order.recipient_order != 'y'}{$currency_type}{$order.price|commify}{else}&nbsp;{/if}</div>
  <div class="col-sm-2 col-md-2 col-lg-3"><a href="/member_reorder/{$key}">Reorder</a></div>
</div>
{/foreach}

</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
   {include file="member_links.tpl"}
</div>
{include file="_bottom.tpl"}