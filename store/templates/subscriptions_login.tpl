{include file="_top.tpl"}

<h1>Subscriptions</h1>

<form method="post" action="index.php" name="checkout" role="form"> 
<input type="hidden" name="action" value="SubscriptionsLogin" />
  <div class="lead">
    <b>Authentication Required</b>
  </div>

{if $error != ''}

  <div>
      <b>**{$error}**</b>
    </div>

{/if}
  <div class="row">
  <div class="form-group col-sm-3">
    <label for="order_id">Original Order ID: </label>
      <input class="form-control" type="text" name="order_id" id="order_id" value="" />
  </div>
  <div class="form-group col-sm-5 col-lg-6">
    <label for="">Subscription Email Address:</label>
    <input class="form-control" type="text" name="email" value=""/>
  </div>

{* NOTE: if you do not wish to require the zip code for validation you may comment out the following row *}
  <div class="form-group col-sm-4 col-lg-3">
    <label>Subscription Billing Zip Code:</label>
    <input class="form-control" type="text" name="zip" value=""/>
  </div>
  </div>
  <div class="row">
    <div class="col-xs-12 mar_btm">
      <input type="submit" name="submit" value="Log In" class="btn btn-default" />
    </div>
  </div>
</form>

{include file="_bottom.tpl"}