{include file="_top.tpl"}

<h1>Corporate Order Form</h1>

<div class="mar_btm">
  <span class="req">*</span> Indicates a required field
</div>

{if $valid.return == "1"}
<div class="mar_btm">
  <b>There has been an error. Please double check any fields that show an <span class="glyphicon glyphicon-remove req"></span></b>
</div>
{/if}
{if $gateway_response != ""}
<div class="alert alert-danger">There was an error processing your card: {$gateway_response}</div>
{elseif $error != ""}
<div class="alert alert-danger">Your file contained errors: {$error}</div>
{/if}

<form method="post" action="index.php" name="ship_form" enctype="multipart/form-data" role="form"> 
  <input type="hidden" name="action" value="CheckoutCorporate">

  <div>
    <h2>Create Order File</h2>
    <div class="mar_btm">
      Use this form to import a multiple ship-to order with a simple text file.  This file will describe the shipping information as well as the products to be shipped and should be formatted according to the specification linked below.  You will be able to review your order before it is confirmed.
    </div>
    <div class="row">
      <div class="col-sm-6">
        <div class="form-group {if $valid.return} has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> Order File:</label>
          <div class="input-group">
            <span class="input-group-btn">
              <label class="btn btn-primary btn-file"><input type="file" name="order_file" onchange="showFileName(this.value)"*}/>Choose File</label>

            </span>
            <input class="form-control" id="fileDisplay" type="text" readonly/>{if $valid.return} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
      </div>
    </div>
    <div class="mar_btm">
      <a href="/checkout_corporate_format">View File Format</a>&nbsp;&nbsp;&nbsp;<a href="checkout_corporate_example">View Sample File</a>
    </div>
  </div>
  <div id="billing_info" style="display: {if $valid.payment_method == 'paypal'}none{else}block{/if};">
    <div id="checkoutPanel">
      <h3>Enter Billing Information</h3>
      {if $is_member != 'y'}
      <div class="mar_btm"> Have a member account?  Please <a href="/member_login">login</a>.
      </div>
      {/if}
      <div class="row">
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and  $valid.first_name == ''} has-error has-feedback bg-danger{/if}">
            <label><span class="req">*</span> First Name:</label>
            <input class="form-control" type="text" name="first_name" value="{$valid.first_name}" maxlength="50"/>{if $valid.return and  $valid.first_name == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and  $valid.last_name == ''} has-error has-feedback bg-danger{/if}">
            <label><span class="req">*</span> Last Name:</label>
            <input class="form-control" type="text" name="last_name" value="{$valid.last_name}" maxlength="50" />{if $valid.return and  $valid.last_name == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label>Title:</label>
            <input class="form-control" type="text" name="title" value="{$valid.title}" maxlength="50" />
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label>Company:</label>
            <input  class="form-control" type="text" name="company" value="{$valid.company}" maxlength="50"/>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and  $valid.billing_address1 == ''} has-error has-feedback bg-danger{/if}">
            <label><span class="req">*</span> Billing Address:</label>
            <input class="form-control" type="text" name="billing_address1" value="{$valid.billing_address1}" maxlength="50"/>{if $valid.return and  $valid.billing_address1 == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and $valid.is_valid.billing_address2 == 'n'} has-error has-feedback bg-danger {/if}">
            <label>Billing Address Line 2:</label>
            <input class="form-control" type="text" name="billing_address2" value="{$valid.billing_address2}" maxlength="50" />{if $valid.return and $valid.is_valid.billing_address2 == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and  $valid.billing_city == ''} has-error has-feedback bg-danger {/if}">
            <label><span class="req">*</span> City:</label>
            <input class="form-control"type="text" name="billing_city" value="{$valid.billing_city}" maxlength="50" />{if $valid.return and  $valid.billing_city == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        {if $uk != 'y'}
        <div class="col-sm-6">
          <div class="form-group">
            <label><span class="req">*</span> State/Province:</label>
            <select class="form-control" name="billing_state">
              {html_options options=$options.state selected=$valid.billing_state}
            </select>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and $valid.billing_zip == ''} has-error has-feedback bg-danger {/if}">
            <label><span class="req">*</span> Postal Code:</label>
            <input class="form-control" type="text" name="billing_zip" value="{$valid.billing_zip}" maxlength="30"/>{if $valid.return and $valid.billing_zip == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label><span class="req">*</span> Country:</label>
            <select class="form-control" name="billing_country">
              {html_options options=$options.country selected=$valid.billing_country}
            </select>
          </div>
        </div>
        {else}
        {* for uk *}
        <div class="col-sm-6">
          <div class="form-group">
            <label><span class="req">*</span> Address Type:</label>
            <div class="radio"><label><input type="radio" name="shipping_type1" id="shipType1d" value="dom" onMouseUp="javascript: setShipType(this,'billing','1'), addFormControls(), condHideFormDiv();" /> Domestic (U.S.A.)</label></div>
            <div class="radio"><label><input type="radio" name="shipping_type1" id="shipType1i" value="int" onMouseUp="javascript: setShipType(this,'billing','1'), addFormControls(), condHideFormDiv();" /> International</label></div>
          </div>
        </div>
        <div id="cond_hide1">
        <div class="col-sm-6" >
          <div class="form-group">
            <label id="stateCaption1"></label>
            <div id="stateField1"></div>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label id="zipCaption1"></label>
            <div id="zipField1"></div>
          </div>
        </div>
      </div>
        <div class="col-sm-6" id="cond_hide2">  
          <div class="form-group">
            <label id="countryCaption1"></label>
            <div id="countryField1"></div>
          </div>
        </div>
        {if $valid.billing_country == 'United States'}
        <script type="text/javascript">
        var item = document.getElementById('shipType1d');
        setShipType(item,'billing','1','{$valid.billing_country}','{$valid.billing_state}','{$valid.billing_zip}');
        </script>
        {elseif $valid.return || $valid.billing_country != ''}
        <script type="text/javascript">
        var item = document.getElementById('shipType1i');
        setShipType(item,'billing','1','{$valid.billing_country}','{$valid.billing_state}','{$valid.billing_zip}');
        </script>
        {/if}
        {/if}
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and  $valid.phone == ''} has-error has-feedback bg-danger {/if}">
            <label><span class="req">*</span> Phone Number:</label>
            <input class="form-control" type="text" name="phone" value="{$valid.phone}" maxlength="50"/>{if $valid.return and  $valid.phone == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and $valid.email == ''} has-error has-feedback bg-danger{/if}">
            <label><span class="req">*</span> Email Address:</label>
            <input class="form-control" type="text" name="email" value="{$valid.email}" maxlength="50"/>{if $valid.return and $valid.email == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
          <div class="checkbox">
            <label><input type="checkbox" name="optin" value="y"{if $valid.optin == "y"} checked{/if}/>Please do not send me more information.</label>
          </div>
        </div>
        <div class="clearfix"></div>
        <div class="col-sm-6">
          <div class="form-group">
            <label>Comments or Special Instructions:</label>
            <textarea class="form-control" name="s_comments" cols="25" rows="5" wrap="virtual">{$valid.s_comments}</textarea>
          </div>
        </div>
      </div>
    </div>
  </div>
  {include file="payment_block.tpl"}
  <div>
    <div class="mar_btm">
      *Note: This form may take a few moments to process depending on the size of your file.  Please do not click the continue button more than once.
    </div>
    <div class="mar_btm">
      <input type="submit" name="submit" value="Continue >"  class="btn btn-primary">
    </div>
  </div>
</form>

{include file="_bottom.tpl"}
