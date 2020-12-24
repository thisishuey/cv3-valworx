{include file="_top.tpl"}

<h1>Payment History - {$result.0.name}</h2>
<div class="mar_btm"><a href="referafriend">Refer-a-Friend Report</a>&nbsp;|&nbsp;<a href="referafriend_create_gc">Create Gift Certificate</a>&nbsp;|&nbsp;<a href="referafriend_information">Edit Account Information</a>&nbsp;|&nbsp;<a href="referafriend_login/1">Log Out</a></div>

{if $error}<div class="alert alert-danger"><b>{$error}</b></div>{/if}

<div class="mar_btm">
{if $result|@count < 1}
  <div class="mar_btm">
    There are no results to display
  </div>
{else}
  <div class="row">
    <div class="col-xs-2"><b>Date Created</b></div>
    <div class="col-xs-2"><b>Total Amount</b></div>
    <div class="col-xs-2"><b>Remaining Amount</b></div>
    <div class="col-xs-3"><b>Gift Certifcate Code</b></div>
    <div class="col-xs-3"><b>Gift Certifcate History</b></div>
  </div>
  {assign var="total_amount" value=0} 
  {assign var="total_remaining" value=0} 
  {foreach from=$result item=payment}
    <div class="col-xs-12 {cycle values="bg-info,"}">
      <div class="row">
        <div class="row">
      <div class="col-xs-2">
        {$payment.payment_date}
      </div>
      <div class="col-xs-2">
        {$currency_type}{$payment.payment_amount}
        {math equation="x+y" x=$payment.payment_amount y=$total_amount assign=total_amount}
      </div>
      <div class="col-xs-2">
        {$currency_type}{$payment.remaining_amount}
        {math equation="x+y" x=$payment.remaining_amount y=$total_remaining assign=total_remaining}
      </div>
      <div class="col-xs-3">
        {$payment.gift_certificate_code}
      </div>
      <div class="col-xs-3" >
        <a href="" onclick="javascript:window.open('/gc_history/{$payment.gift_certificate_code}','','height=400,width=600,statusbar=no,toolbars=no,location=no,scrollbars=yes'); return false;">View History</a>
      </div>
    </div>
  </div>
</div>
  {/foreach}
  <div class="row">
    <div class="col-xs-2">
      <b>Totals:</b>
    </div>
    <div class="col-xs-2">
      {$currency_type}{$total_amount}
    </div>
    <div class="col-xs-2">
      {$currency_type}{$total_remaining}
    </div>
  </div>
{/if}
</div>
{include file="_bottom.tpl"}
