{include file="_top.tpl"}

<h1>E-Party - {$affiliate.name}</h1>
<div class="mar_btm"><a href="eparty_plan">Plan New E-Party</a>&nbsp;|&nbsp;<a href="eparty_create_gc">Create Gift Certificate</a>&nbsp;|&nbsp;<a href="eparty_history">Track Gift Certificates</a>&nbsp;|&nbsp;<a href="eparty_information">Edit Account Information</a>&nbsp;|&nbsp;<a href="eparty_login/1">Log Out</a></div>

{if $expired == 'y'}
<div class="mar_btm"><b>*Your account has expired.</b></div>
{/if}
{if $error}<div class="alert alert-danger">{$error}</div>{/if}

{if $eparties|@count < 1}
<div class="mar_btm">You do not have any E-Parties scheduled</div>
{else}
<div class="row hidden-xs">
  <div class="col-sm-2"><b>E-Party</b></div>
  <div class="col-sm-1"><b>Catalog<br>Req.</b></div>
  <div class="col-sm-1"><b>Visits</b></div>
  <div class="col-sm-1"><b>Orders</b></div>
  <div class="col-sm-1"><b>Sales</b></div>
  <div class="col-sm-1"><b>Avg. {$currency_type}<br>per Visit</b></div>
  <div class="col-sm-1"><b>Avg. {$currency_type}<br>per Order</b></div>
  <div class="col-sm-2"><b>Commission</b></div>
  <div class="col-sm-2"><b>Destination</b></div>
</div>
{assign var="total_catalogs" value=0}
{assign var="total_orders" value=0}
{assign var="total_visits" value=0}
{assign var="total_sales" value=0}
{assign var="total_commission" value=0}

{foreach from=$eparties item=eparty key=code}
{assign var=list value=$report.$code}
<div class="col-sm-12 {cycle values="bg-info,"}">
 <div class="row">
  <div class="row">
   <div class="col-sm-2">
    {$code} - {$eparty.eparty_date}
  </div>
  <div class="col-xs-2 col-sm-1">
    <strong class="visible-xs">Catalog Req.</strong>
    {if $list.num_catreq != ''}
    {$list.num_catreq}
    {math equation="x+y" x=$total_catalogs y=$list.num_catreq assign=total_catalogs}
    {else}
    -
    {/if}
  </div>
  <div class="col-xs-2 col-sm-1">
    <strong class="visible-xs">Visits</strong>
    {if $list.num_visits != ''}
    {$list.num_visits}
    {math equation="x+y" x=$total_visits y=$list.num_visits assign=total_visits}
    {else}
    -
    {/if}
  </div>
  <div class="col-xs-2 col-sm-1">
    <strong class="visible-xs">Orders</strong>
    {if $list.num_orders != ''}
    {$list.num_orders}&nbsp;
    <a href="#" onclick="javascript:window.open('/affiliate_prods/products/{$list.order_ids}','','height=400,width=600,statusbar=no,toolbars=no,location=no,scrollbars=yes'); return false;">[products]</a>
    {math equation="x+y" x=$total_orders y=$list.num_orders assign=total_orders}
    {else}
    -
    {/if}
  </div>
  <div class="col-xs-2 col-sm-1">
    <strong class="visible-xs">Sales</strong>
    {if $list.value != ''}
    {$currency_type}{$list.value}
    {math equation="x+y" x=$total_sales y=$list.value assign=total_sales}
    {else}
    -
    {/if}
  </div>
  <div class="col-xs-4 col-sm-1">
    <strong class="visible-xs">Avg. {$currency_type} per Visit</strong>
    {if $list.avg_visit != ''}
    {$currency_type}{$list.avg_visit}
    {else}
    -
    {/if}
  </div>
  <div class="clearfix visible-xs"></div>
  <div class="col-xs-4 col-sm-1">
    <strong class="visible-xs">Avg. {$currency_type} per Order</strong>
    {if $list.avg_order != ''}
    {$currency_type}{$list.avg_order}
    {else}
    -
    {/if}
  </div>
  <div class="col-xs-4 col-sm-2">
    <strong class="visible-xs">Commission</strong>
    {if $list.commission != ''}
    {$currency_type}{$list.commission}
    {math equation="x+y" x=$total_commission y=$list.commission assign=total_commission} 
    {else}
    -
    {/if}
  </div>

  <div class="col-xs-2 col-sm-2">
   {if $list.num_visits > 0}
   <a href="#" onclick="javascript:window.open('/affiliate_prods/destinations/{$list.affiliate}|{$list.start}|{$list.end}','','height=400,width=600,statusbar=no,toolbars=no,location=no,scrollbars=yes'); return false;">[destinations]</a>
   {else}
   &nbsp;
   {/if}
 </div>
</div>
</div>
</div>
{/foreach}
<div class="col-sm-12 bg-info mar_btm">
  <div class="row">
    <div class="row">
     <div class="col-sm-2">
      <b>Totals:</b>
    </div>
    <div class="col-xs-2 col-sm-1">
      <strong class="visible-xs">Catalog Req.</strong>
      {$total_catalogs}
    </div>
    <div class="col-xs-2 col-sm-1">
      <strong class="visible-xs">Visits</strong>
      {$total_visits}
    </div>
    <div class="col-xs-2 col-sm-1">
      <strong class="visible-xs">Orders</strong>
      {$total_orders}
    </div>
    <div class="col-xs-2 col-sm-1">
      <strong class="visible-xs">Sales</strong>
      {$currency_type}{$total_sales|string_format:"%.2f"}
    </div>
    <div class="col-xs-4 col-sm-1">
      <strong class="visible-xs">Avg. {$currency_type} per Visit</strong>
      {if $total_visits > 0}{math equation="x/y" x=$total_sales y=$total_visits assign=salespervis}{else}{assign var="salespervis" value="0"}{/if}
      {$currency_type}{$salespervis|string_format:"%.2f"}
    </div>
    <div class="clearfix visible-xs"></div>
    <div class="col-xs-4 col-sm-1">
      <strong class="visible-xs">Avg. {$currency_type} per Order</strong>
      {if $total_orders > 0}{math equation="x/y" x=$total_sales y=$total_orders assign=salesperord}{else}{assign var="salesperord" value="0"}{/if}
      {$currency_type}{$salesperord|string_format:"%.2f"}
    </div>
    <div class="col-xs-4 col-sm-2">
      <strong class="visible-xs">Commission</strong>
      {$currency_type}{$total_commission|string_format:"%.2f"}
    </div>
  </div>
</div>
</div>

<div class="mar_btm"><b>Total Commission Due:</b>&nbsp;{$currency_type}{$commission_due}</div>
{/if}

{include file="_bottom.tpl"}
