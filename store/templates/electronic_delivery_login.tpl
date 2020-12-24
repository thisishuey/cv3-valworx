{include file="_top.tpl"}

<h1>Electronic Delivery</h1>

<div class="form-container">

{if $error != ''}
  <div class="errors">
    <p><em>There was an error.</em></p>
    <p>Please double-check any highlighted fields.</p>
    <p><em>{$error}</em></p>
  </div>
{/if}

<form method="post" action="index.php" name="checkout" role="form"> 
<input type="hidden" name="action" value="ElectronicDeliveryLogin">

  <fieldset class="login-box"><legend>Authentication Required</legend>
  <div class="row">
  <div class="col-sm-4">
  <div class="form-group">
    <label for="order_id">Order ID:</label>
    <input class="form-control" type="text" id="order_id" name="order_id" value="">
  </div>
  </div>
  <div class="col-sm-4">
  <div class="form-group">
    <label for="email">Email Address:</label>
    <input class="form-control" type="text" id="email" name="email" value="">
  </div>
  </div>

{* NOTE: if you do not wish to require the zip code for validation you may comment out the following row *}
  <div class="col-sm-4">
  <div class="form-group">
    <label for="zip">Billing Zip Code:</label>
    <input class="form-control" type="text" id="zip" name="zip" value="">
  </div>
  </div>
  </div>
  <div class="row mar_top10 mar_btm">
     <div class="col-xs-12"> 
        <input type="submit" name="submit" value="Log In" class="btn btn-default pull-right">
     </div>
  </div>
  </fieldset>
</form>
</div>

{include file="_bottom.tpl"}