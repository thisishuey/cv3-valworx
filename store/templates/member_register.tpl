{include file="_top.tpl"}

<h1>New Member Registration</h1>

<p>After completing this registration form, you will be redirected to a page where you can login and access the member features. Please remember the email address and password you enter, as that information will be required to login as a member.</p>

<div class="form-container">
  
{if $valid.return == '1'}
 <div class="errors">
  <p><em>There was an error.</em></p>
  <p>Please double-check any highlighted fields.</p>
  <p><em>{$error}</em></p>
 </div>
{/if}

<p class="legend"><strong>Note:</strong> * Indicates a required field</p>

<form class="form-horizontal" method="post" action="index.php" id='register_form' role="form"> 
<input type="hidden" name="action" value="MemberRegister" />

<fieldset><legend>Contact Information</legend>
<div class="form-group {if $valid.return and !$valid.first_name} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='first_name'><span class="req">*</span> First Name:</label>
  <div class="col-xs-8 col-md-10">
  	<input class="form-control" type="text" id='first_name' name="first_name" value="{$valid.first_name}" />
  </div>
</div>
  
<div class="form-group {if $valid.return and !$valid.last_name} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='last_name'><span class="req">*</span> Last Name:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="last_name" id="last_name" value="{$valid.last_name}" />
  </div>
</div>
  {* Comment this field out if you do not wish to use it. *}
<div class="form-group">
  <label class="control-label col-xs-4 col-md-2">Birthdate:</label>
  <div class="nowrap">
   <div class="col-xs-8 col-sm-3 col-md-4">
   <select name="birth_month" class="form-control {if $valid.return && $valid.is_valid.birthdate == 'n'}error{/if}">
    {html_options options=$options.birthdate.month selected=$valid.birth_month}
   </select>
   </div>
   <div class="col-xs-4 col-xs-offset-4 col-sm-offset-0 col-sm-2 col-md-2">
   <select name="birth_day" class="form-control {if $valid.return && $valid.is_valid.birthdate == 'n'}error{/if}">
    {html_options options=$options.birthdate.day selected=$valid.birth_day}
   </select>
   </div>
   <div class="col-xs-4 col-sm-3 col-md-4">
   <select name="birth_year" class="form-control {if $valid.return && $valid.is_valid.birthdate == 'n'}error{/if}">
    {html_options options=$options.birthdate.year selected=$valid.birth_year}
   </select>
   </div>
  </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='title'>Title:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="title" id="title" value="{$valid.title}" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='company'>Company:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="company" id="company" value="{$valid.company}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.billing_address1} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='billing_address1'><span class="req">*</span> Billing Address:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" id="billing_address1" name="billing_address1" value="{$valid.billing_address1}" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2"><span class="label">&nbsp;</span></label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="billing_address2" value="{$valid.billing_address2}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.billing_city} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='billing_city'><span class="req">*</span> City:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="billing_city" id="billing_city" value="{$valid.billing_city}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.billing_country}error{/if}">
  <label class="control-label col-xs-4 col-md-2" for="billing_country"><span class="req">*</span> Country:</label>
  <div class="col-xs-8 col-md-10">
  <select class="form-control" name="billing_country" id="billing_country">
   {html_options options=$options.country selected=$valid.billing_country}
  </select>
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.billing_state} error{/if}">
  <label class="control-label col-xs-4 col-md-2"><span class="req">*</span> State/ Province:</label>
  <div class="col-xs-8 col-md-10">
  <select class="form-control" name="billing_state" id="billing_state">
   {html_options options=$options.usstate selected=$valid.billing_state}
  </select>
  </div>
  <div class="col-xs-8 col-md-10">
  <select class="form-control" id='ca_province'>
    {html_options options=$ca_provinces selected=$valid.billing_state}
  </select>
  </div>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type='text' id="billing_province" value="{$valid.billing_state}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.billing_zip} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for="billing_zip"><span class="req">*</span> Postal Code:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="billing_zip" id="billing_zip" value="{$valid.billing_zip}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.email} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='email'><span class="req">*</span> Email Address:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="email" id="email" name="email" value="{$valid.email}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.phone} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='phone'><span class="req">*</span> Phone Number:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="tel" name="phone" id="phone" value="{$valid.phone}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$pw1} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='password'><span class="req">*</span> Password:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="password" id="password" name="pw1" />
 <span class="help-block">{#password_text#}</span>
 </div>
</div>

<div class="form-group {if $valid.return and !$pw2} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='password_confirm'><span class="req">*</span> Confirm Password:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="password" name="pw2" id="password_confirm" />
  </div>
</div>

{if $use_captcha}
<div class="form-group {if $valid.return} error{/if}">
  {if !$smarty.session.mobile}
   <label class="control-label"><span class="req">*</span>
   {if $settings.captcha_method == '2'}Verification:
   {else}Type image characters:
   {/if}
   </label>
  {/if}
 
  {if $settings.captcha_method == '2'}
    <script type="text/javascript" src="//www.google.com/recaptcha/api/challenge?k={$recaptcha_key}"></script>
    <noscript>
      <iframe src="//www.google.com/recaptcha/api/noscript?k={$recaptcha_key}" height="300" width="500" frameborder="0"></iframe>
      <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
      <input type="hidden" name="recaptcha_response_field" value="manual_challenge" />
    </noscript>
  {else}<input class="form-control" type="text" name="captcha_test" />
  {/if}
  {if $settings.captcha_method == '1'}<img src="/get_captcha_image"/>{/if}
  
</div>
{/if}


<div class="controlset form-group ">
  <div class="col-xs-8 col-xs-offset-4 col-md-10 col-md-offset-2">
     <div class="checkbox">
     <label><input type="checkbox" name="opt_out" value="y" {$valid.opt_out} />Please do not send me additional info</label>
     </div>
   </div>
</div>

</fieldset>

<div class="buttonrow">
   <div class="col-xs-4 col-md-2"></div>
<div class="col-xs-8 col-md-10 mar_btm ">
 <input type="submit" name="register_submit" value="Register" class="button medium style1 btn btn-default" />
</div>
</div>
  
</form>

</div>

{include file="_bottom.tpl"}
