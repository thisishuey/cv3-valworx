{include file="_top.tpl"}

{include file="checkout_progress.tpl" step="3"}

<h1>Checkout</h1>

<div class="quick-checkout nopad">

  <p class="legend">You have {$totals.qty} product(s) in your cart.</p>

  <p class="legend"><strong>Note:</strong><span class="req">* </span>Indicates a required field</p>

  {if $valid.return == '1'}
  <div class="errors nopad">
    <p><em>There was an error.</em></p>
    <p>Please double-check any highlighted fields.</p>
    <div class="alert alert-danger"><em>{$error}</em></div>
  </div>
  {/if}

  {if $gateway_response}<div class='errors'><p class="alert alert-danger">There was an error processing your card: {$gateway_response}</p></div>{/if}

  <form method="post" id="ship_form" name="ship_form" action="index.php" role="form">
    <input type="hidden" name="action" value="CheckoutTotal" />
    <input type="hidden" name="alias1" value="{$valid.alias.1}" />
    <input type="hidden" name="uship_id1" value="" />
    <input type="hidden" name="req_s_phone" value="n" />
    <input type="hidden" name="req_verify_email" value="n" />

    <div id='shipping_info'>
      <fieldset><legend>{if $settings.amazon_checkout_type == '2'}Additional {/if}Shipping Information</legend>
        <div class="row">
          {if $settings.amazon_checkout != 'y' || !isset($smarty.session.amazon_id)}

          {if $is_member == 'y' && $alias_options.count > 1}
          <div class="col-sm-6">
            <div class="form-group">
              <label for='choose_alias1'>Select Address:</label>
              <select class="form-control" id="choose_alias1" name="choose_alias1" onchange="javascript:use_alias('1','choose_alias1');{if $bongo_js=='y'}bongoFormPopulate('checkout_shipping','','{$settings.bongo_exclude_countries}');{/if}">
                {html_options options=$alias_options.options}
              </select>
            </div>
          </div>

          <div class="col-sm-6">
            <div class="form-group">
              <label for='new_alias1'>OR Save Address as:</label>
              <input class="form-control" type="text" id="new_alias1" name="new_alias1" />
            </div>
          </div>
          {/if}
          <div class="col-sm-6">
            <div class="form-group {if $valid.return and !$valid.s_firstname.1} has-error has-feedback bg-danger{/if}">
              <label for='s_firstname1'><span class="req">*</span> First Name:</label>
              <input class="form-control" type="text" id="s_firstname1" name="s_firstname1" value="{$valid.s_firstname.1}" />{if $valid.return and !$valid.s_firstname.1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group {if $valid.return and !$valid.s_lastname.1} has-error has-feedback bg-danger{/if}">
              <label for='s_lastname1'><span class="req">*</span> Last Name:</label>
              <input class="form-control" type="text" id="s_lastname1" name="s_lastname1" value="{$valid.s_lastname.1}" />{if $valid.return and !$valid.s_lastname.1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group">
              <label for='s_title1'>Title:</label>
              <input class="form-control" type="text" id="s_title1" name="s_title1" value="{$valid.s_title.1}" />
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group">
              <label for='s_company1'>Company:</label>
              <input class="form-control" type="text" id="s_company1" name="s_company1" value="{$valid.s_company.1}" />
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group {if $valid.return and !$valid.s_address1.1} has-error has-feedback bg-danger{/if}">
              <label for='s_address11'><span class="req">*</span> Shipping Address:</label>
              <input class="form-control" type="text" id="s_address11" name="s_address11" value="{$valid.s_address1.1}" />{if $valid.return and !$valid.s_address1.1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group">
              <label>Shipping Address Line 2:</label>
              <input class="form-control"type="text" id="s_address21" name="s_address21" value="{$valid.s_address2.1}" />
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group {if $valid.return and !$valid.s_city.1} has-error has-feedback bg-danger{/if}">
              <label for='s_city1'><span class="req">*</span> City:</label>
              <input class="form-control" type="text" id="s_city1" name="s_city1" value="{$valid.s_city.1}" />{if $valid.return and !$valid.s_city.1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group {if $valid.return and !$valid.s_country.1} has-error has-feedback bg-danger{/if}">
              <label for="s_country1"><span class="req">*</span> Country:</label>

              <select class="form-control" name="s_country1" id="s_country1"{if $bongo_js=='y'} onchange="bongoFormPopulate('checkout_shipping','','{$settings.bongo_exclude_countries}');{/if}">
                {*   <option value="">- Select Country -</option>*}
                {*  <select class="form-control" name="s_country1" id="shipping_country">*}
                {html_options options=$options.country selected=$valid.s_country.1}
              </select>{if $valid.return and !$valid.s_country.1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group {if $valid.return and !$valid.s_state.1} has-error has-feedback bg-danger{/if}">
              <label><span class="req">*</span> State/Province:</label>

              <select class="form-control" name="s_state1" id="s_state1">
               <option value="">- Select State -</option>
               {*  <select class="form-control" name="s_state1" id="shipping_state">*}
               {html_options options=$options.usstate selected=$valid.s_state.1}
             </select>{if $valid.return and !$valid.s_state.1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
             <select class="form-control" id="ca_province1">
              {html_options options=$ca_provinces selected=$valid.s_state.1}
            </select>{if $valid.return and !$valid.s_state.1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            <input class="form-control" type='text' id="province1" value="{$valid.s_state.1}" />{if $valid.return and !$valid.s_state.1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and !$valid.s_zip.1} has-error has-feedback bg-danger{/if}">
            <label for="zip"><span class="req"><span class="req">*</span></span> Postal Code:</label>
            <input class="form-control" type="text" name="s_zip1" id="zip" value="{$valid.s_zip.1}" size="15" maxlength="30" />{if $valid.return and !$valid.s_zip.1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        {if $address_code.1}
        <div class="col-sm-12">
          <div class="controlset checkbox has-error bg-danger">
            <label><input type="checkbox" id="s_noconfirm1" name="s_noconfirm1" value="y" />This address is valid</label><span class="glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
        {/if}
        
        {*<!-- <div class="col-sm-6">
          <div class="form-group">
            <label for='s_email1'>Ship Email:</label>
            <input class="form-control" type="text" id="s_email1" name="s_email1" value="{$valid.s_email.1}" />
          
        </div> -->*}
        {* <!-- set the hidden "req_verify_email" field to "y" and
        uncomment the code below to require this field --> *}
        {*</div><div class="col-sm-6"><div class="form-group {if $valid.return and $valid.s_email.1 == ''} has-error has-feedback bg-danger{/if}">
        <label for='s_email_verify1'>Verify Ship Email:</label>
        <input class="form-control" type="text" id="s_email_verify1" name="s_email_verify1" value="{$valid.s_email_verify.1}" />{if $valid.return and $valid.s_email.1 == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div></div><div class="col-sm-6">*}
        
       {*<!--  <div class="controlset checkbox">
          <label><input type="checkbox" id="s_email_send1" name="s_email_send1" value="y"{if $valid.s_email_send.1 == 'y'} checked="checked"{/if} />Send notification to this email</label>
        </div>
      </div> -->*}
      <div class="col-sm-6">
          <div class="form-group {*if $valid.return and !$valid.s_phone.1} has-error has-feedback bg-danger{/if*}">
            <label for='s_phone1'>Ship Phone:</label>
            <input class="form-control" type="tel" id="s_phone1" name="s_phone1" value="{$valid.s_phone.1}" />{*if $valid.return and !$valid.s_phone.1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
          </div>
        </div>
      {else}
      {if $settings.amazon_checkout_type == '1'}
      <script type="text/javascript" src="https://static-na.payments-amazon.com/cba/js/us/PaymentWidgets.js"></script>

      {if $product_mapping != 'add_cart'}{assign var="destination" value="Recipient_One"}
      {else}{assign var="destination" value=$recipient_mappings.1|replace:" ":"_"}
      {/if}

      {include file="amazon_checkout.tpl" destination=$destination num=1}
      {else}<input type="hidden" name="payment_method" value="amazon" />
      {/if}
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and !$valid.email} has-error has-feedback bg-danger{/if}">
          <label for='email'><span class="req">*</span> Email Address:</label>
          <input class="form-control" type="text" name="email" id="email" value="{$valid.email}" />{if $valid.return and !$valid.email}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      {* set the hidden "req_verify_email" field to "y" and
      uncomment the code below to require this field *}

      {*<div class="col-sm-6">
      <div class="form-group {if $valid.return and !$valid.s_email_verify.1} has-error has-feedback bg-danger{/if}">
        <label for='s_email_verify1'>Verify Email Address:</label>
        <input class="form-control" type="text" name="s_email_verify1" value="{$valid.s_email_verify.1}" />{if $valid.return and !$valid.s_email_verify.1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div></div>
      *}
      <div class="col-sm-6">
        <div class="checkbox">
          <label><input type="checkbox" name="optin" id="optin1" value="y"{if $valid.optin == "y"} checked="checked"{/if}/>Please do not send me emails</label>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="checkbox">
          <label><input type="checkbox" id="cat_opt_out1" name="cat_opt_out" value="y"{if $valid.cat_opt_out == 'y'} checked{/if}/>Please do not send me mail</label>
        </div>
      </div>
      {/if}
      {*
       {if $settings.gift_msg_separate == 'y'}
        {section name=gm_line start=1 loop=$settings.gift_msg_num_lines+1 step=1}
        
        {if $smarty.section.gm_line.index == 1}
        <div class="clearfix"></div>
        <div class="col-sm-6">
            <div class="form-group {if $valid.return and $valid.gift_message.$num[$smarty.section.gm_line.index] == 'n'} has-error has-feedback bg-danger{/if}">
            <label for='gift_message1_line{$smarty.section.gm_line.index}'>Gift Message: <small>{$settings.gift_msg_num_chars} characters per line</small></label>
            <input class="form-control" type="text" id="gift_message1_line{$smarty.section.gm_line.index}" name="gift_message1_line{$smarty.section.gm_line.index}" value="{$valid.gift_message.1[$smarty.section.gm_line.index]}" maxlength="{$settings.gift_msg_num_chars}" autocomplete="gift_message" />{if $valid.return and $valid.gift_message.$num[$smarty.section.gm_line.index] == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            </div>
        </div>
    {else}
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and $valid.gift_message.1.$smarty.section.gm_line.index == 'n'} has-error has-feedback bg-danger{/if}">
            <span class="label">&nbsp;</span>
            <input class="form-control" type="text" name="gift_message1_line{$smarty.section.gm_line.index}" value="{$valid.gift_message.1[$smarty.section.gm_line.index]}" maxlength="{$settings.gift_msg_num_chars}" autocomplete="gift_message" />{if $valid.return and $valid.gift_message.1.$smarty.section.gm_line.index == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
  {/if} 
  {/section}
  {else}
  <div class="col-sm-6">
   <div class="form-group">
    <label for='gift_message1'>Gift Message: <small>(100 char. max)</small></label>
    <input class="form-control" type="text" id="gift_message1" name="gift_message1" autocomplete="gift_message" value="{$valid.gift_message.1}" />
  </div>
</div>
{/if}
*}
{if $options.shipping.count > 1}
<div class="col-sm-6">
  <div class="form-group">
    <label for='s_method1'><font color="red"><em>Please select a state (above) to view all available shipping options</em></font> 
<br>Shipping Method: <font color="red">Free UPS Ground Shipping on orders over $99.</font> </label>
    <select class="form-control" name="s_method1" id="s_method1">
      {html_options options=$options.shipping.method selected=$valid.s_method.1}
    </select>
  </div>
</div>
{else}<input type="hidden" name="s_method1" value="{$options.shipping.name}" />
{/if}

{if $get_ship_type}
<div class="col-sm-6">
  <div class="form-group">
    {if $get_ship_type > 1}<label for='s_addresstyp1'>Type:</label>{/if}
    {include file="ship_address_type.tpl" num="1"}
  </div>
</div>
{/if}
<div class="col-sm-12">
  <div class="row">
{*<!--<div class="col-sm-6"><div class="form-group">
{if $shipping_disclaimer}<div class="mar_btm">{$shipping_disclaimer}</div>{/if}</div>

  <div class="form-group">
    <label for='datepicker_1'>Requested Ship Date: <small>(i.e. {$smarty.now|date_format:"%Y-%m-%d"})</small></label>
    
    <input class="datepicker form-control" type="text" name="s_shipon1" id='datepicker_1'  value="{$valid.s_shipon.1}" />
-->*}
    <script>
    $(document).ready(function() {ldelim}

      $(".datepicker").datepicker({ldelim}
       dateFormat: 'yy-mm-dd',
       minDate: new Date('{$smarty.now|date_format:"%B %e, %Y %H:%M:%S"}'),
       beforeShowDay: disableDates1
       {rdelim});

      function disableDates1(date) {ldelim}

      {* Blackout dates can be set under Settings -> Options -> Shipping Options -> Shipping Blackout Dates *}

// This code can be used to disable certain dates that a product would be on backorder
//  var d = new Date("{$backorder_dates.$name}");
//  {if $backorder_dates.$name}if (d > date) return [false, ''];{/if}

// This will set a cutoff for the current date after a certain time (24hr format, Eastern timezone)
//  var today = new Date('{$smarty.now|date_format:"%B %e, %Y %H:%M:%S"}');
//  if (date.getUTCMonth() == today.getMonth() && date.getUTCDate() == today.getDate() && today.getHours() >= 11) return [false, ''];

{foreach from=$options.blackout_dates item=bd key=bdk}
if((date.getUTCMonth()+1) == {$bdk|substr:5:2} && date.getUTCDate() == {$bdk|substr:8:2}) return[false, ''];
{/foreach}

return $.datepicker.noWeekends(date);
{rdelim}
{rdelim});
</script>
{*<!--
<label for='choose1'></label>
<select class="datepicker form-control" name="choose1" id="choose1" onchange="javascript:changeDate('s_shipon1','choose1');">
  {html_options options=$options.shipon}
</select>
</div>
</div>-->*}
<div class="col-sm-6">
  <div class="form-group">
    <label for='s_comments'>Comments or Instructions:</label>
    <textarea class="form-control" name="s_comments" id="s_comments" cols="17" rows="6" autocomplete="comments">{$valid.s_comments}</textarea>
  </div>
</div>
</div>
</div>
</div>
</fieldset>
</div>


{if $paypal || ($settings.amazon_checkout == 'y' && isset($smarty.session.amazon_id))}{include file="payment_block.tpl"}{/if}

<div id="billing_info" style="display: {if ($paypal && $valid.payment_method == 'paypal') || ($valid.payment_method == 'amazon' || ($settings.amazon_checkout == 'y' && isset($smarty.session.amazon_id)))}none{else}block{/if};">

  <fieldset><legend>Billing Information</legend>
    <div class="row">
      {if $is_member != 'y'}
      <div class="col-sm-12">
        <input type="button" name="same_as_shipping" value="Copy Shipping Address" onclick="addressCopy();" class="btn btn-default mar_btm" />
      </div>
      {/if}
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and !$valid.first_name} has-error has-feedback bg-danger{/if}">
          <label for='first_name'><span class="req">*</span> First Name:</label>
          <input class="form-control" type="text" name="first_name" id="first_name" value="{$valid.first_name}" />{if $valid.return and !$valid.first_name}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and !$valid.last_name} has-error has-feedback bg-danger{/if}">
          <label for='last_name'><span class="req">*</span> Last Name:</label>
          <input class="form-control" type="text" name="last_name" id="last_name" value="{$valid.last_name}" />{if $valid.return and !$valid.last_name}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group">
          <label for='title'>Title:</label>
          <input class="form-control" type="text" name="title" id="title" value="{$valid.title}" />
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group">
          <label for='company'>Company:</label>
          <input class="form-control" type="text" name="company" id="company" value="{$valid.company}" />
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and !$valid.billing_address1} has-error has-feedback bg-danger{/if}">
          <label for='billing_address1'><span class="req">*</span> Billing Address:</label>
          <input class="form-control" type="text" name="billing_address1" id="billing_address1" value="{$valid.billing_address1}" />{if $valid.return and !$valid.billing_address1}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group">
          <label>Billing Address Line 2:</label>
          <input class="form-control" type="text" name="billing_address2" id="billing_address2" value="{$valid.billing_address2}" />
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and !$valid.billing_city} has-error has-feedback bg-danger{/if}">
          <label for='billing_city'><span class="req">*</span> City:</label>
          <input class="form-control" type="text" name="billing_city" id="billing_city" value="{$valid.billing_city}" />{if $valid.return and !$valid.billing_city}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and !$valid.billing_country} has-error has-feedback bg-danger{/if}">
          <label for="billing_country"><span class="req">*</span> Country:</label>
          <select class="form-control" name="billing_country" id="billing_country">
           {html_options options=$options.billing_country selected=$valid.billing_country}
         </select>{if $valid.return and !$valid.billing_country}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
       </div>
     </div>
     <div class="col-sm-6">
      <div class="form-group {if $valid.return and !$valid.billing_state} has-error has-feedback bg-danger{/if}">
        <label><span class="req">*</span> State/Province:</label>
        <select class="form-control" name="billing_state" id="billing_state">
         {html_options options=$options.billing_usstate selected=$valid.billing_state}
       </select>{if $valid.return and !$valid.billing_state}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
       <select class="form-control" id='ca_billing_province'>
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
  {if $settings.amazon_checkout != 'y' || !isset($smarty.session.amazon_id)}
  <div class="col-sm-6">
    <div class="form-group {if $valid.return and !$valid.email} has-error has-feedback bg-danger{/if}">
      <label for='billing_email'><span class="req">*</span> Email Address:</label>
      <input class="form-control" type="text" id="billing_email" name="email" value="{$valid.email}" />{if $valid.return and !$valid.email}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>
  </div>
  {*<!-- <div class="col-sm-6">
   <div class="controlset checkbox">
    <label><input type="checkbox" name="optin" id="optin" value="y"{if $valid.optin == "y"} checked="checked"{/if}/>Please do not send me emails</label>
  </div>
</div>
<div class="col-sm-6">
 <div class="controlset checkbox">
  <label><input type="checkbox" name="cat_opt_out" id="cat_opt_out" value="y"{if $valid.cat_opt_out == 'y'} checked{/if}>Please do not send me mail</label>
</div>
</div> -->*}
{/if}
<div class="col-sm-6">
  <div class="form-group {if $valid.return and !$valid.phone} has-error has-feedback bg-danger{/if}">
    <label for='phone'><span class="req">*</span> Phone Number:</label>
    <input class="form-control" type="tel" name="phone" id="phone" value="{$valid.phone}" />{if $valid.return and !$valid.phone}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
  </div>
</div>
</div>
</fieldset>

</div>

{if !$paypal && ($settings.amazon_checkout != 'y' || !isset($smarty.session.amazon_id))}
{include file="payment_block.tpl"}
{/if}

{if $recurring_eligible=='y' && $settings.recurring_orders_by_product != 'y'}
<fieldset id="recurring_eligible{if $num>1}_full{/if}"><legend>Shipping Interval</legend>
  <div class="controlset">
    <input type="radio" id="recurring_no" name="recurring_yesno" value="n" checked/> <label for="recurring_no">Only ship once</label><br/>
    <input type="radio" id="recurring_yes" name="recurring_yesno" value="y" /><label for="recurring_yes"> Ship Every
      <input type="text" id="recurring_interval_num" name="recurring_interval_num"/>
      <select name="recurring_interval">
        <option value="d" > days</option>
        <option value="w" > weeks</option>
      </select>
    </label>
  </div>
  <fieldset id="recurring_prods"><legend>Items eligible for recurring order</legend>
    <div>
      {foreach from=$cart item=prod key=prodkey}
        {if $prod.recurring_eligible == 'y'}<span> - {$prod.name}</span><br/>{/if}
      {/foreach}
    </div>
  </fieldset>
</fieldset>
{else}
  <input type="hidden" name="recurring_yesno" value="n"/>
{/if}

<div class="buttonrow">
  <input type="submit" name="submit_button" value="Continue &gt;" id="continue_btn" {if $settings.amazon_checkout == 'y' && isset($smarty.session.amazon_id) && $settings.amazon_checkout_type == '1'} disabled{/if} class="btn btn-primary" {if $bongo_js=='y'}onclick="javascript:bongoFormPopulate('checkout_shipping','','{$settings.bongo_exclude_countries}');"{/if} />
</div>

</form>

{if $settings.amazon_checkout == 'y' && $smarty.session.amazon_id != '' && $settings.amazon_checkout_type == '2'}
<script type="text/javascript">
$(document).ready(function() {ldelim}
  getInfo('amazon','Amazon_Class','getAmazonShipInfo','{$smarty.session.amazon_id}');
  var button = (document.getElementById) ? document.getElementById('continue_btn') : document.all['continue_btn'];
  button.disabled = true;
  setTimeout(button.disabled=false,2500);
  {rdelim});
</script>
{/if}

</div>

{if $bongo_form != ''}
{$bongo_form}
{/if}
{include file="smartystreets.tpl"}
{include file="_bottom.tpl"}
