{include file="_top.tpl"}

{include file="checkout_progress.tpl" step="3"}

<h1>Billing Information</h1>

<div class="quick-checkout">

  {if $valid.return == '1' || $error}
  <div class="errors">
    <p><em>There was an error.</em></p>
    <p>Please double-check any highlighted fields.</p>
    <div class="alert alert-danger"><em>{$error}</em></div>
  </div>
  {/if}

  {if $gateway_response}<div class='errors'><p>There was an error processing your card: {$gateway_response}</p></div>{/if}

  <p class="legend"><strong>Note:</strong> * Indicates a required field</p>

  {if $change_shipper}<div>{$change_shipper}</div>{/if}

  <form method="post" action="index.php" name="billing_form" id='billing_form'> 
    <input type="hidden" name="action" value="CheckoutBilling" />

    {if $paypal || $settings.amazon_checkout == 'y'}{include file="payment_block.tpl"}{/if}

    <div id="billing_info" style="display: {if ($paypal && $valid.payment_method == 'paypal') || $settings.amazon_checkout == 'y'}none{else}block{/if};">

      <fieldset><legend>Billing Information</legend>
        <div class="row">
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and !$valid.first_name} has-error has-feedback bg-danger{/if}">
            <label for='first_name'><span class="req">*</span> First Name:</label>
            <input class="form-control" type="text" id='first_name' name="first_name" value="{$valid.first_name}" maxlength="50" />{if $valid.return and !$valid.first_name}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and !$valid.last_name} has-error has-feedback bg-danger{/if}">
            <label for='last_name'><span class="req">*</span> Last Name:</label>
            <input class="form-control" type="text" id='last_name' name="last_name" value="{$valid.last_name}" maxlength="50" />{if $valid.return and !$valid.last_name}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label for='title'>Title:</label>
            <input class="form-control" type="text" id='title' name="title" value="{$valid.title}" maxlength="50" />
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label for='company'>Company:</label>
            <input class="form-control" type="text" id='company' name="company" value="{$valid.company}" maxlength="100" />
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and !$valid.billing_address1} has-error has-feedback bg-danger{/if}">
            <label for='billing_address1'><span class="req">*</span> Billing Address:</label>
            <input class="form-control" type="text" id='billing_address1' name="billing_address1" value="{$valid.billing_address1}" maxlength="100" />{if $valid.return and !$valid.billing_address1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label for="billing_address2">Address 2:</label> 
            <input class="form-control" type="text" id='billing_address2' name="billing_address2" value="{$valid.billing_address2}" maxlength="100" />
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and !$valid.billing_city} has-error has-feedback bg-danger{/if}">
            <label for='billing_city'><span class="req">*</span> City:</label>
            <input class="form-control" type="text" name="billing_city" id="billing_city" value="{$valid.billing_city}" maxlength="50" />{if $valid.return and !$valid.billing_city}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and !$valid.billing_country} has-error has-feedback bg-danger{/if}">
            <label for="billing_country"><span class="req">*</span> Country:</label>
            <select class="form-control" name="billing_country" id="billing_country">
             {html_options options=$options.country selected=$valid.billing_country}
            </select>{if $valid.return and !$valid.billing_country}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and !$valid.billing_state} has-error has-feedback bg-danger{/if}">
            <label><span class="req">*</span> State/Province:</label>
            <select class="form-control" name="billing_state" id="billing_state">
              {html_options options=$options.usstate selected=$valid.billing_state}
            </select>{if $valid.return and !$valid.billing_state}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            <select class="form-control" id='ca_province'>
              {html_options options=$ca_provinces selected=$valid.billing_state}
            </select>{if $valid.return and !$valid.billing_state}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            <input class="form-control" type='text' id="billing_province" value="{$valid.billing_state}" />{if $valid.return and !$valid.billing_state}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and !$valid.billing_zip} has-error has-feedback bg-danger{/if}">
            <label for="billing_zip"><span class="req">*</span> Postal Code:</label>
            <input class="form-control" type="text" name="billing_zip" id="billing_zip" value="{$valid.billing_zip}" size="15" maxlength="30" />{if $valid.return and !$valid.billing_zip}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and !$valid.phone} has-error has-feedback bg-danger{/if}">
            <label for='phone'><span class="req">*</span> Phone Number:</label>
            <input class="form-control" type="tel" id='phone' name="phone" value="{$valid.phone}" maxlength="50" />{if $valid.return and !$valid.phone}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="controlset checkbox">
            <label><input type="checkbox" id="cat_opt_out" name="cat_opt_out" value="y"{if $valid.cat_opt_out == 'y'} checked{/if} />Please do not mail me information</label>
          </div>
        </div>
      </div>
  </fieldset>

</div>

{if !$paypal && $settings.amazon_checkout != 'y'}
{include file="payment_block.tpl"}
{/if}

<div class="buttonrow mar_btm">
  <input type="submit" id="continue_btn" name="continue_submit" value="Continue to Confirmation &gt;" {if $settings.amazon_checkout == 'y' && isset($smarty.session.amazon_id)} disabled{/if} class="btn btn-primary" />
</div>

</form>

</div>

{include file="bronto_signup.tpl"}
{include file="_bottom.tpl"}
