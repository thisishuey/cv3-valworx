{include file="_top.tpl"}

{include file="checkout_progress.tpl" step="2"}

<h1>Shipping Information</h1>

<div class="quick-checkout nopad">

  <p class="legend">You have {$totals.qty} product(s) in your cart.</p>

  <p class="legend"><strong>Note:</strong> <span class="req">*</span> Indicates a required field</p>

  {if $valid.return == '1'}
  <div class="errors">
    <p><em>There was an error.</em></p>
    <p>Please double-check any highlighted fields.</p>
    <div class="alert alert-danger"><em>{$error}</em></div>
  </div>
  {/if}

  <form method="post" name="ship_form" id='ship_form' action="index.php" role="form">
    <input type="hidden" name="action" value="CheckoutShipping" />
    <input type="hidden" name="alias{$num}" value="{$valid.alias.$num}" />
    <input type="hidden" name="uship_id{$num}" value="" />
    <input type="hidden" name="req_verify_email" value="n" />

    {counter start=0 assign=num}
    {section name=ship loop=$ship_num}
    {counter}

    <fieldset id="shipping_info"><legend>Shipping Address{if $product_mapping != 'add_cart'}{*if $options.ship_num.$num != 'One'*}  {$options.ship_num.$num}{*/if*}{else} for {$recipient_mappings.$num}{/if}</legend>
      <div class="row">
     {if $settings.amazon_checkout != 'y' || !isset($smarty.session.amazon_id)}
     {if $num == 1 && $is_member != 'y'}
      <div class="col-sm-12">
        <div class="controlset checkbox">
          <label><input type="checkbox" id='billing_also' name="billing_also" value="y" {$valid.billing_also} /> This is also my billing address</label>
        </div>
      </div>
    {/if}

    {if $wishlist}
    <div class="col-sm-6">
      <div class="form-group">
        <label for='choose_wishlist{$num}'>Select Wishlist Recipient:</label>
        <select class="form-control" id='choose_wishlist{$num}' name="choose_wishlist{$num}" onchange="javascript:use_wishlist('{$num}','choose_wishlist{$num}');">
          <option value="">Choose Ship-to</option>
          {foreach from=$wishlist key=key item=wl}
          <option value="{$key}">{$wl.first_name|ucfirst} {$wl.last_name|ucfirst}</option>
          {/foreach}
        </select>
        <span>Or</span>
      </div>
    </div>
    {/if}

    {if $is_member == 'y' && $alias_options.count > 1 && $product_mapping != 'add_cart'}
    <div class="col-sm-6">
      <div class="form-group">
        <label for='choose_alias{$num}'>Select Address:</label>
        <select class="form-control" id='choose_alias{$num}' name="choose_alias{$num}" onchange="javascript:use_alias('{$num}','choose_alias{$num}');">
          {html_options options=$alias_options.options}
        </select>
      </div>
    </div>
    <div class="col-sm-6">
      <div class="form-group">
       <label for='new_alias{$num}'>Or Save Address as:</label>
       <input class="form-control" type="text" id='new_alias{$num}' name="new_alias{$num}" maxlength="50" />
     </div>
   </div>
   {elseif $is_member == 'y' && $product_mapping == 'add_cart'}
   {if $recipient_mappings.$num == 'me'}{assign var=rec_map value='Default'}
   {else}{assign var=rec_map value=$recipient_mappings.$num}
   {/if} 
   {array_search val=$rec_map arr=$alias_options.options}
   {if !$ret}
    <div class="col-sm-12">
      <div class="controlset checkbox">
        <label><input type="checkbox" id='new_alias{$num}' name="new_alias{$num}" value="{$recipient_mappings.$num}"{if isset($valid.new_alias.$num) && $valid.new_alias.$num == $recipient_mappings.$num} checked{/if} /> Save this address</label>
      </div>
    </div>
  {/if}
  {/if}
  <div class="col-sm-6">
    <div class="form-group {if $valid.return and !$valid.s_firstname.$num} has-error has-feedback bg-danger{/if}">
      <label for='shipping_firstname{$num}'><span class="req">*</span> First Name:</label>
      <input class="form-control" type="text" id='shipping_firstname{$num}' name="s_firstname{$num}" value="{$valid.s_firstname.$num}" maxlength="50" />{if $valid.return and !$valid.s_firstname.$num}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>
  </div>
  <div class="col-sm-6">
    <div class="form-group {if $valid.return and !$valid.s_lastname.$num} has-error has-feedback bg-danger{/if}">
      <label for='shipping_lastname{$num}'><span class="req">*</span> Last Name:</label>
      <input class="form-control" type="text" id='shipping_lastname{$num}' name="s_lastname{$num}" value="{$valid.s_lastname.$num}" maxlength="50" />{if $valid.return and !$valid.s_lastname.$num}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>
  </div>
  <div class="col-sm-6">
    <div class="form-group">
      <label for='shipping_title{$num}'>Title:</label>
      <input class="form-control" type="text" id="shipping_title{$num}" name="s_title{$num}" value="{$valid.s_title.$num}" maxlength="50" />
    </div>
  </div>
  <div class="col-sm-6">
    <div class="form-group">
      <label for='shipping_company{$num}'>Company:</label>
      <input class="form-control" type="text" id="shipping_company{$num}" name="s_company{$num}" value="{$valid.s_company.$num}" maxlength="50" />
    </div>
  </div>
  <div class="col-sm-6">  
    <div class="form-group {if $valid.return and !$valid.s_address1.$num} has-error has-feedback bg-danger{/if}">
      <label for='shipping_address{$num}'><span class="req">*</span> Shipping Address:</label>
      <input class="form-control" type="text" id='shipping_address1{$num}' name="s_address1{$num}" value="{$valid.s_address1.$num}" maxlength="50" />{if $valid.return and !$valid.s_address1.$num}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>
  </div>
  <div class="col-sm-6">
    <div class="form-group">
      <label for='shipping_address2{$num}'>Shipping Address Line 2:</label>
      <input class="form-control" type="text" id='shipping_address2{$num}'name="s_address2{$num}" value="{$valid.s_address2.$num}" maxlength="50" />
    </div>
  </div>
  <div class="col-sm-6">  
    <div class="form-group {if $valid.return and !$valid.s_city.$num} has-error has-feedback bg-danger{/if}">
      <label for='shipping_city{$num}'><span class="req">*</span> City:</label>
      <input class="form-control" type="text" id='shipping_city{$num}' name="s_city{$num}" value="{$valid.s_city.$num}" maxlength="50" />{if $valid.return and !$valid.s_city.$num}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>
  </div>
  <div class="col-sm-6">  
    <div class="form-group {if $valid.return and !$valid.s_country.$num} has-error has-feedback bg-danger{/if}">
      <label for="country{$num}"><span class="req">*</span> Country:</label>
      <select class="form-control country" name="s_country{$num}" id='s_country{$num}'>
      {html_options options=$options.country selected=$valid.s_country.$num}
      </select>{if $valid.return and !$valid.s_country.$num}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>
  </div>
  <div class="col-sm-6">
    <div class="form-group {if $valid.return and !$valid.s_state.$num} has-error has-feedback bg-danger{/if}">
      <label for="state{$num}"><span class="req">*</span> State/Province:</label>
      <select class="form-control" name="s_state{$num}" id='s_state{$num}' class='state'>
        {html_options options=$options.usstate selected=$valid.s_state.$num}
      </select>{if $valid.return and !$valid.s_state.$num}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      <select class="form-control" id='ca_province{$num}'>
        {html_options options=$ca_provinces selected=$valid.s_state.$num}
      </select>{if $valid.return and !$valid.s_state.$num}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      <input class="form-control" type='text' id="province{$num}" value="{$valid.s_state.$num}" />{if $valid.return and !$valid.s_state.$num}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>
  </div>
  <div class="col-sm-6">
    <div class="form-group {if $valid.return and !$valid.s_zip.$num} has-error has-feedback bg-danger{/if}">
      <label for="zip{$num}"><span class="req">*</span> Postal Code:</label>
      <input class="form-control" type="text" name="s_zip{$num}" class="zip" id='s_zip{$num}' value="{$valid.s_zip.$num}" maxlength="30" />{if $valid.return and !$valid.s_zip.$num}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>
  </div>
  {if $address_code.$num}
  <div class="col-sm-6">  
    <div class="controlset has-error bg-danger checkbox">
      <label><input type="checkbox" name="s_noconfirm{$num}" id='shipping_confirm{$num}' value="y" /> This address is valid</label>
    </div>
  </div>
  {/if}
  <div class="col-sm-6">
    <div class="form-group">
      <label for='shipping_phone{$num}'>Ship Phone:</label>
      <input type="hidden" name="req_s_phone" value="n" />
      <input class="form-control" type="tel" name="s_phone{$num}" id='shipping_phone{$num}' value="{$valid.s_phone.$num}" maxlength="50" />
    </div>
  </div>
  <div class="col-sm-6">
    <div class="form-group">
      <label for='shipping_email{$num}'>Ship Email:</label>
      <input class="form-control" type="email" name="s_email{$num}" id='shipping_email{$num}' value="{$valid.s_email.$num}" maxlength="50" />
    </div>
  </div>
{* set the hidden "req_verify_email" field to "y" and
uncomment the code below to require this field *}
{*<div class="col-sm-6">
    <div class="form-group {if $valid.return and $valid.s_email.$num == ''} has-error has-feedback bg-danger{/if}">
      <label for='email_verify'>Verify Ship Email:</label>
      <input class="form-control" type="text" id="email_verify_shipping{$num}" name="email_verify_shipping{$num}" value="{$valid.s_email.$num}" maxlength="50" />{if $valid.return and $valid.s_email.$num == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>
  </div>*}
  <div class="col-sm-6">
    <div class="controlset checkbox">
      <label><input type="checkbox" id="s_email_send{$num}" name="s_email_send{$num}" value="y"{if $valid.s_email_send.$num == 'y'} checked="checked"{/if} />
      Send notification to this email</label>
    </div>
  </div>
{else}
<script type="text/javascript" src="https://static-na.payments-amazon.com/cba/js/us/PaymentWidgets.js"></script>
  {if $product_mapping != 'add_cart'}
    {assign var="destination" value="Recipient_"|cat:$options.ship_num.$num}
  {else}
    {assign var="destination" value=$recipient_mappings.$num|replace:" ":"_"}
  {/if}
  {include file="amazon_checkout.tpl" destination=$destination num=$num}
{/if}
</div>
</fieldset>

<fieldset id="order_info"><legend>Order Information</legend>
<div class="row">
  {if $settings.gift_msg_separate == 'y'}
  {section name=gm_line start=1 loop=$settings.gift_msg_num_lines+1 step=1}
  {if $smarty.section.gm_line.index == 1}
  <div class="col-sm-6">
    <div class="form-group {if $valid.return and $valid.gift_message.$num[$smarty.section.gm_line.index] == 'n'} error{/if}">
      <label for='gift_message{$num}_line{$smarty.section.gm_line.index}'>Gift Message:<br><small>{$settings.gift_msg_num_chars} characters per line</small></label>
      <input class="form-control" type="text" id="gift_message{$num}_line{$smarty.section.gm_line.index}" name="gift_message{$num}_line{$smarty.section.gm_line.index}" value="{$valid.gift_message.$num[$smarty.section.gm_line.index]}" maxlength="{$settings.gift_msg_num_chars}" autocomplete="gift_message" />
    </div>
  </div>
{else}
  <div class="col-sm-6">
    <div class="form-group {if $valid.return and $valid.gift_message.$num.$smarty.section.gm_line.index == 'n'} error{/if}">
      <span class="label">&nbsp;</span>
      <input class="form-control" type="text" name="gift_message{$num}_line{$smarty.section.gm_line.index}" value="{$valid.gift_message.$num[$smarty.section.gm_line.index]}" maxlength="{$settings.gift_msg_num_chars}" />
    </div>
  </div>
{/if}
{/section}
{else}
  <div class="col-sm-6">
    <div class="form-group">
      <label for='gift_message{$num}'>Gift Message:</label>
      <input class="form-control" type="text" id="gift_message{$num}" name="gift_message{$num}" value="{$valid.gift_message.$num}" maxlength="100" autocomplete="gift_message{$num}" />
    </div>
  </div>
{/if}

{if $options.shipping.count > 1}
  <div class="col-sm-6">  
    <div class="form-group">
      <label for='s_method{$num}'>Shipping Method:</label>
      <select class="form-control" name="s_method{$num}" id="s_method{$num}">
        {html_options options=$options.shipping.method selected=$valid.s_method.$num}
      </select>
    </div>
  </div>
{else}
  <input type="hidden" name="s_method{$num}" value="{$options.shipping.name}" />
{/if}

{if $get_ship_type}
  <div class="col-sm-6">
    <div class="controlset">
      <span class="label">Type:</span>
      <div class="radio"> 
        <label><input type="radio" id="s_address_type{$num}r" name="s_address_type{$num}" value="r" {if $valid.s_address_type.$num != "c"}checked{/if} /> Residential</label>
      </div>
      <div class="radio">
        <label><input type="radio" id="s_address_type{$num}c" name="s_address_type{$num}" value="c" {if $valid.s_address_type.$num == "c"}checked{/if} />Commercial</label>
      </div>
    </div>
  </div>
{/if}
<div class="clearfix"></div>
<div class="col-sm-6">
  <div class="form-group">
    <label for='datepicker_{$num}'>Requested Ship Date: <small>(e.g. {$smarty.now|date_format:"%Y-%m-%d"})</small></label>
    {if $shipping_disclaimer}
      <div class="help-block">{$shipping_disclaimer}</div>
    {/if}
    <input class="form-control datepicker" type="text" name="s_shipon{$num}" value="{$valid.s_shipon.$num}" id='datepicker_{$num}' size="15" maxlength="15" />

    <script>
    $(".datepicker").datepicker({ldelim}
      dateFormat: 'yy-mm-dd',
      minDate: new Date('{$smarty.now|date_format:"%B %e, %Y %H:%M:%S"}'),
      beforeShowDay: disableDates{$num}
      {rdelim});

    function disableDates{$num}(date) {ldelim}

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
  </script>

  <label for='choose{$num}'></label>
  <select class="form-control" id="choose{$num}" name="choose{$num}" onChange="javascript:changeDate('s_shipon{$num}','choose{$num}');">
    {html_options options=$options.shipon}
  </select>
  </div>
</div>

{if $is_member == 'y' && $product_mapping == 'add_cart'}
{if $recipient_mappings.$num == 'me'}{assign var=rec_map value='Default'}
{else}{assign var=rec_map value=$recipient_mappings.$num}
{/if}
{array_search val=$rec_map arr=$alias_options.options}
{if ($ret != '') && !$valid.s_firstname.$num}
<input type="hidden" name="choose_alias{$num}" value="{$ret}" />
<script type="text/javascript">
use_alias('{$num}','choose_alias{$num}');
</script>
{/if}
{/if}
</div>
</fieldset>

{if isset($recurring_eligible.$num) && $settings.recurring_orders_by_product != 'y'}
<fieldset id="recurring_eligible"><legend>Shipping Interval</legend>
  <div class="controlset">
    <input type="radio" id="recurring_no" name="recurring_yesno{$num}" value="n" {if $valid.recurring_yesno.$num != 'y'}checked{/if}/> <label for="recurring_no">Only ship once</label><br/>
    <input type="radio" id="recurring_yes" name="recurring_yesno{$num}" value="y" {if $valid.recurring_yesno.$num == 'y'}checked{/if} /><label for="recurring_yes"> Ship Every
      <input type="text" id="recurring_interval_num{$num}" name="recurring_interval_num{$num}" value="{$valid.recurring_interval_num.$num}"/>
      <select name="recurring_interval{$num}">
        <option value="d" {if $valid.recurring_interval.$num != 'w'}selected{/if} > days</option>
        <option value="w" {if $valid.recurring_interval.$num == 'w'}selected{/if} > weeks</option>
      </select>
    </label>
  </div>
  <fieldset id="recurring_prods"><legend>Items eligible for recurring order</legend>
    <div>
      {foreach from=$recurring_eligible.$num item=prod key=prodkey}
        <span> - {$prod.prod_name}</span><br/>
      {/foreach}
    </div>
  </fieldset>
</fieldset>
{else}
  <input type="hidden" name="recurring_yesno" value="n"/>
{/if}

{/section}

<fieldset id="contact_info{if $num > 1}_full{/if}">
  <legend>Contact Information</legend>
  <div class="row">
  <div class="col-sm-6">
    <div class="form-group {if $valid.return and !$valid.email} has-error has-feedback bg-danger{/if}">
      <label for='email'><span class="req">*</span> Your Email:</label>
      <input class="form-control" type="email" id="email" name="email" value="{$valid.email}" maxlength="50" />{if $valid.return and !$valid.email}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>
{* set the hidden "req_verify_email" field to "y" and
uncomment the code below to require this field *}
{*<div class="form-group {if $valid.return and !$valid.email} has-error has-feedback bg-danger{/if}">
    <label for='email'><span class="req">*</span> Verify Email:</label>
    <input type="email" id="email_verify" name="email_verify" value="{$valid.email_verify}" maxlength="50" />{if $valid.return and !$valid.email}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>*}
    <div class="controlset checkbox">
      <label><input type="checkbox" name="optin" id="optin" value="y"{if $valid.optin == "y"} checked="checked"{/if}/> Please do not send me emails</label>
    </div>
  </div>
  <div class="col-sm-6">  
    <div class="form-group">
      <label for='shipping_comments'>Comments or Special Instructions:</label>
      <textarea class="form-control" id="shipping_comments" name="s_comments" rows="5" cols="{if $num > 1}30{else}18{/if}" autocomplete="comments">{$valid.s_comments}</textarea>
    </div>
  </div>
</div>
</fieldset>
<div class="buttonrow">
  <input type="submit" name="shipping_submit" value="Continue to Billing &gt;" class="btn btn-primary" id="continue_btn"{if $settings.amazon_checkout == 'y' && isset($smarty.session.amazon_id) && $settings.amazon_checkout_type == '1'} disabled{/if}/>
</div>
</form>
</div>

{if $bongo_js=='y'}
<script>
$('#continue_btn').click(function (e) {ldelim}
  if (bongoFormPopulate('checkout_shippingaddress',1,'{$settings.bongo_exclude_countries}') == 'true') {ldelim}
    e.preventDefault();
  {rdelim}
  {rdelim});
</script>
{/if}

{if $bongo_form != ''}
{$bongo_form}
{/if}

{include file="smartystreets.tpl"}
{include file="_bottom.tpl"}

{array_debug}
