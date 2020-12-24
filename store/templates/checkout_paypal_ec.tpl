{include file="_top.tpl"}

<h3>Confirm Order Information</h3>

{if $valid.return == "1"}
<div class="normaltext">
  <b>There has been an error. Please double check any fields that show an '<span class="glyphicon glyphicon-remove has-error"></span>'</b>
</div>
{/if}

{if $error}
<div class="alert alert-danger">{$error}</div>
{/if}

{if $gateway_response != ''}
 <div class="normaltext"><b>{$gateway_response}</b></div>
{/if}

<div id="checkoutPanel">
  <form method="post" action="index.php" role="form"> 
    <input type="hidden" name="action" value="PayPalExpressCheckout" />
    <input type="hidden" name="type" value="edit_billing" />
    <div id="checkoutPanelBar"> 
        <h4>Customer Information</h4>
        <input class="btn btn-default" type="submit" name="submit" value="Edit"/> 
    </div>
  </form>
  {if $settings.paypal_exp_billing == 'y'}
  <div class="normaltext">
      {$info.billing.first_name} {$info.billing.last_name}
    </div>
  <div class="normaltext">
      {$info.billing.billing_address1}
    </div>
  {if $info.billing.billing_address2 != ''}
    <div class="normaltext">
      {$info.billing.billing_address2}
    </div>
  {/if}
    <div class="normaltext">
      {$info.billing.billing_city}, {$info.billing.billing_state} {$info.billing.billing_zip}
    </div>
    <div class="normaltext">
      {$info.billing.billing_country}
    </div>
  {/if}
    <div class="normaltext">
      Payment Method: PayPal Account
    </div>
    <div class="normaltext">
      {$info.billing.email}
    </div>
  </div>

  <form method="post" action="index.php" role="form"> 
    <input type="hidden" name="action" value="PayPalExpressCheckout" />
    <input type="hidden" name="type" value="edit_shipping" />
    <div id="checkoutPanelBar"> 
      <h4>Shipping Information</h4>
      <input class="btn btn-default" type="submit" name="submit" value="Edit"/> 
    </div>
  </form>
    <div class="normaltext">
      {$info.shipping.0.s_firstname} {$info.shipping.0.s_lastname}
    </div>
    <div class="normaltext">
      {$info.shipping.0.s_address1}
    </div>
  {if $info.shipping.0.s_address2 != ''}
    <div class="normaltext">
      {$info.shipping.0.s_address2}
    </div>
  {/if}
    <div class="normaltext">
      {$info.shipping.0.s_city}, {$info.shipping.0.s_state} {$info.shipping.0.s_zip}
    </div>
    <div class="normaltext">
      {$info.shipping.0.s_country}
    </div>
  <form method="post" action="index.php" name="ship_form" role="form"> 
    <input type="hidden" name="action" value="CheckoutPayPalEC" />
    <input type="hidden" name="type" value="place_order" />
    <div class="row">
    <div class="col-sm-6">
      <div class="form-group {if $valid.return == "1" && $valid.is_valid.s_method.1 == 'n'}has-error has-feedback bg-danger{/if}">
        <label>Shipping Method:</label>
        <select name="s_method1" class="formtext">
          {html_options options=$options.shipping.method selected=$valid.s_method.1}
        </select>
        {if $valid.return == "1" && $valid.is_valid.s_method.1 == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
    <div class="col-sm-6">
      <div class="form-group {if $valid.return == "1" && $valid.is_valid.s_shipon.1 == 'n'}has-error has-feedback bg-danger{/if}">
        <label>Requested Ship Date:</label>
        <input class="form-control" type="text" name="s_shipon1" value="{$valid.s_shipon.1}">{if $valid.return == "1" && $valid.is_valid.s_shipon.1 == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        <select class="form-control" name="choose1" onChange="javascript:changeDate('s_shipon1','choose1');">
          {html_options options=$options.shipon}
        </select>
        {if $valid.return == "1" && $valid.is_valid.s_shipon.1 == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
    <div class="col-sm-6">
      <div class="form-group {if $valid.return == "1" && $valid.is_valid.gift_message.1 == 'n'}has-error has-feedback bg-danger{/if}">
        <label>Gift Message:</label>
        <input class="formtext form-control" type="text" name="gift_message1" value="{$valid.gift_message.1}" maxlength="100" >
        {if $valid.return == "1" && $valid.is_valid.gift_message.1 == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
    <div class="col-sm-6" id="checkoutPanelBar">
      <div class="form-group {if $valid.return == "1" && $valid.is_valid.s_comments == 'n'}has-error has-feedback bg-danger{/if}"> 
        <label>Comments / Special Instructions</label>
        <textarea class="formtext form-control" name="s_comments" cols="50" rows="5" wrap="virtual">{$valid.s_comments}</textarea>
        {if $valid.return == "1" && $valid.is_valid.s_comments == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
    <div class="col-sm-6">
      <div class="checkbox">
        <input type="checkbox" name="optin" value="y"{if $valid.optin == "y"} checked{/if}/> Please do not send me more information.
      </div>
    </div>
    <div class="col-sm-12">
      <div class="row">
        <div class="col-sm-6">
          <input type="submit" name="submit_cancel" value="Cancel" tabindex="1" class="btn btn-default" />
        </div>
        <div class="col-sm-6">
          <input type="submit" name="submit_continue" value="Continue >" tabindex="1" class="btn btn-primary pull-right" />
        </div>
      </div>
    </div>
  </div>
</form>
</div>
{include file="_bottom.tpl"}
