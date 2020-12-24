{include file="_top.tpl"}

<h1>Subscriptions</h1>

  {if $valid.return == '1'}
  <div class="errors">
    <p><em>There was an error.</em></p>
    <p>Please double-check any highlighted fields.</p>
    <p><em>{$error}</em></p>
  </div>
  {/if}

<div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
<form method="post" action="index.php" role="form"> 
<input type="hidden" name="action" value="SubscriptionsStatus" />

<div class="row lead">
  <div class="col-xs-3">Order #</div>
  <div class="col-xs-4 col-sm-5">Subscription</div>
  <div class="col-xs-2 col-sm-1" >&nbsp;</div>
  <div class="col-xs-3">Status</div>
</div>

{if $list|@count < 1}
 <div class="messages"><p><em>There are no subscriptions for your account.</em></p></div>
{else}
 {foreach from=$list key=key item=subscription}
  <div class="row"> 
    <div class="col-xs-3">{$subscription.order_id}</div>
    <div class="col-xs-4 col-sm-5">{$subscription.prod_name}</div>
    <div class="col-xs-2 col-sm-1"><a href="/subscriptions_edit/{$type}/{$subscription.id}">Edit</a></div>
    <div class="col-xs-3">
      <select name="status_{$subscription.id}" class="formtext">
        <option label="active" value="n" {if $subscription.inactive != 'y'}selected="selected"{/if}>Active</option>
        <option label="inactive" value="y" {if $subscription.inactive == 'y'}selected="selected"{/if}>Inactive</option>
      </select>
    </div>
  </div>
 {/foreach}
{/if}
<div class="row">
   <div class="col-xs-12 mar_top10 mar_btm"> 
      <input type="submit" name="submit" value="Submit" class="btn btn-default" />
   </div>
</div>

</form>
</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
{if $type == 'm'}
 {include file="member_links.tpl"}
{/if}
</div>
{include file="_bottom.tpl"}