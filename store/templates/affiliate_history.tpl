{include file="_top.tpl"}

<h1>Payment History - {$result.0.name}</h1>

<div class="mar_btm">
  <a href="affiliate">Affiliate Report</a>&nbsp;|&nbsp;<a href="affiliate_information">Edit Account Information</a>&nbsp;|&nbsp;<a href="affiliate_login/1">Log Out</a>
</div>

<div>
  <div>
    {if $result|@count < 1}
      <div class="mar_btm">There are no results to display</div>
  </div>
 {else}
  <div class="row">
    <div class="col-xs-4"><b>Payment Date</b></div>
    <div class="col-xs-4"><b>Payment Amount</b></div>
    <div class="col-xs-4"><b>Check Number</b></div>
  </div>
{assign var="total_amount" value=0} 
{foreach from=$result item=payment}
<div class="col-xs-12 {cycle values="bg-info,"}">
  <div class="row">
    <div class="row">
      <div class="col-xs-4">
        {$payment.payment_date}
      </div>
      <div class="col-xs-4">
        {$currency_type}{$payment.payment_amount}
        {math equation="x+y" x=$payment.payment_amount y=$total_amount assign=total_amount}
      </div>
      <div class="col-xs-4">
        {$payment.check_number}
      </div>
    </div>
  </div>
</div>
{/foreach}
  <div class="">
    <b>Total Paid:</b>{$currency_type}{$total_amount}
  </div>
{/if}
</div>

{include file="_bottom.tpl"}