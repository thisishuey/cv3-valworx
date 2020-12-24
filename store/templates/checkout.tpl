{include file="_top.tpl"}

{include file="checkout_progress.tpl" step="1"}

<h1>Begin Checkout</h1>

{if $password_error}
  <div class="alert alert-danger">{$password_error}</div>
{/if}
{if $error && $valid.return}
  <div class="alert alert-danger">{$error}</div>
{/if}

<script type='text/javascript'>
{literal}

function checkForLogin() {
  var f = document.checkout; /* form object */
  if (!f.email.value.length) return;
  if (f.confirm.value.length && f.fpassword.value.length) {    /* New */
    f.cr_password_confirm.value = f.confirm.value;
    f.cr_password.value = f.fpassword.value;
    f.contact_email.value = f.email.value;
/*    f.contact_email.value = f.username.value;*/
  } else if (f.fpassword.value.length) {    /* Login */
    f.password.value = f.fpassword.value;
    f.username.value = f.email.value;
  } else {                                /* Guest */
    f.contact_email.value = f.email.value;
  }
/*  f.contact_phone.value = f.phone.value;*/
}
$(document).ready(function() {
$(function(){
  $('#confirm_box').hide();
  $('input[name=create_account]').click(function(){
    if ($(this).prop('checked')) $('#confirm_box').show();
    else $('#confirm_box').hide();
  });
});
});
{/literal}
</script>

<div class="login">
{if $is_member == 'y'}
  <form method="post" name="checkout" action="index.php" onsubmit='checkForLogin();'>
  <input type="hidden" name="source_code" value="{$source_code}" />
  <input type="hidden" name="action" value="Checkout" />
  <input type='hidden' name='cr_password' value='' />
  <input type='hidden' name='cr_password_confirm' value='' />
  <input type='hidden' name='username' value='' />
  <input type='hidden' name='password' value='' />
  <input type='hidden' name='contact_phone' value='' />
  {*<input type='hidden' name='contact_email' value='' />*}
   <div class="welcome-back nopad">Welcome back! You are logged in as: {$member.first_name} {$member.last_name}
    <div><a href="/member_login/1">Not {$member.first_name}?</a></div>
   </div>
  {* if they need to choose how many shiptos *}
  {if $product_mapping == 'add_cart'}<input type="hidden" name="ship_num" value="{$ship_num}">
  {elseif $totals.qty > 1 && $checkout_type == 1}
   <div class="clearfix">
    <fieldset>
      <legend>Choose Number of Shipping Addresses</legend>
      {* Set the selected item in the shiptos drop down menu to One *}
      {if $valid.ship_num != ''}{assign var="ship_num" value=$valid.ship_num}
      {elseif $ship_num == '' || $ship_num < 1}{assign var="ship_num" value="1"}
      {/if}
      <div class="form-inline">
        <label for="ship_num">I'm shipping to:</label>
        <select class="form-control" id="ship_num" name="ship_num">{html_options options=$options.ship_num selected=$ship_num}</select> Address(es)
      </div>
    </fieldset>
   </div>
  {else}<input type="hidden" name="ship_num" value="1" />
  {/if}
  <input type="hidden" name="totalqty" value="{$totals.qty}" />
   <div class="buttonrow">
    <input type="submit" name="checkout_submit" value="Continue to Shipping &gt;" class="btn btn-primary" />
   </div>
  </form>

{else}
<div class="row">
  <form method="post" name="checkoutguest" action="index.php" onsubmit='checkForLogin();'>
  <input type="hidden" name="source_code" value="{$source_code}" />
  <input type="hidden" name="action" value="Checkout" />
  <input type='hidden' name='cr_password' value='' />
  <input type='hidden' name='cr_password_confirm' value='' />
  <input type='hidden' name='username' value='' />
  <input type='hidden' name='password' value='' />
  <input type='hidden' name='contact_phone' value='' />
  {*<input type='hidden' name='contact_email' value='' />*}
  <input type="hidden" id='cat_code_guest' name="cat_code" value="{$valid.cat_code}" />

  <div class="col-md-6" id="guest_checkout_container">
    <fieldset class="login-box"><legend>Guest Checkout</legend>
      <div class="nopad" id='guest_checkout'>
        <p>{#checkoutcontact_txt#}</p>
        <div class="form-group">
          <label for='contact_email'>E-mail:</label>
          <input class="form-control" type="text" name="contact_email" value="{$valid.contact_email}" />
        </div>
        {*<div class="form-group">
          <label for='contact_phone'>Phone:</label>
          <input type="text" name="contact_phone" value="{$valid.contact_phone}" />
        </div>*}
      </div>
      <div class="mar_btm">
        <input type="submit" name="submit" value="Continue as Guest" class="btn btn-primary" />
      </div>
    </fieldset>
  </div>

  {* if they need to choose how many shiptos *}
  {if $product_mapping == 'add_cart'}<input type="hidden" name="ship_num" value="{$ship_num}">
  {elseif $totals.qty > 1 && $checkout_type == 1}
   <div class="clearfix">
    <fieldset>
      <legend>Choose Number of Shipping Addresses</legend>
      {* Set the selected item in the shiptos drop down menu to One *}
      {if $valid.ship_num != ''}{assign var="ship_num" value=$valid.ship_num}
      {elseif $ship_num == '' || $ship_num < 1}{assign var="ship_num" value="1"}
      {/if}
      <div class="form-inline">
        <label for="ship_num">I'm shipping to:</label>
        <select class="form-control" id="ship_num" name="ship_num">{html_options options=$options.ship_num selected=$ship_num}</select> Address(es)
      </div>
    </fieldset>
   </div>
  {else}<input type="hidden" name="ship_num" value="1" />
  {/if}

  <input type="hidden" name="totalqty" value="{$totals.qty}" />
  </form>

  <form method="post" name="checkout" action="index.php" onsubmit='checkForLogin();'>
  <input type="hidden" name="source_code" value="{$source_code}" />
  <input type="hidden" name="action" value="Checkout" />
  <input type='hidden' name='cr_password' value='' />
  <input type='hidden' name='cr_password_confirm' value='' />
  <input type='hidden' name='username' value='' />
  <input type='hidden' name='password' value='' />
  <input type='hidden' name='contact_phone' value='' />
  {*<input type='hidden' name='contact_email' value='' />*}
  <input type="hidden" id='cat_code_member' name="cat_code" value="{$valid.cat_code}" />

  {if $valid.username}{assign var=username value=$valid.username}
  {*elseif $valid.contact_email}{assign var=username value=$valid.contact_email*}
  {/if}

  <div class="col-md-6" id="member_checkout_container">
    <fieldset class="login-box"><legend>Login or Register</legend>
      <div class="nopad" id='new_customer'>
        <p>{#checkoutlogin_text#}</p>
        <div class="form-group">
          <label for='email'>Email:</label>
          <input class="form-control" type="email" id="email" name="email" value="{$username}" />
        </div>
        <div class="form-group">
          <label for='fpassword'>Password:</label>
          <input class="form-control" type="password" name="fpassword" value=""  />
          <span class="help-block">{#password_text#}</span>
        </div>
        <div>
          <small><a href="/member_forgot">Forgot your password?</a></small>
        </div>
      </div>
      <div id='create_account_box'>
        <div class="controlset checkbox">
          <label><input type='checkbox' name='create_account' /> Create a new account</label>
        </div>
      </div>
      <div class="form-group" id="confirm_box">
        <label for='confirm'>Confirm Password:</label>
        <input class="form-control" type="password" id="confirm" name="confirm" value="" />
      </div>
      <div class="mar_btm">
        <input type="submit" name="checkout_submit" value="Log In" class="btn btn-primary" />
      </div>
    </fieldset>
  </div>

  {* if they need to choose how many shiptos *}
  {if $product_mapping == 'add_cart'}<input type="hidden" name="ship_num" value="{$ship_num}">
  {elseif $totals.qty > 1 && $checkout_type == 1}
   <div class="clearfix">
    <fieldset>
      <legend>Choose Number of Shipping Addresses</legend>
      {* Set the selected item in the shiptos drop down menu to One *}
      {if $valid.ship_num != ''}{assign var="ship_num" value=$valid.ship_num}
      {elseif $ship_num == '' || $ship_num < 1}{assign var="ship_num" value="1"}
      {/if}
      <div class="form-inline">
        <label for="ship_num">I'm shipping to:</label>
        <select class="form-control" id="ship_num" name="ship_num">{html_options options=$options.ship_num selected=$ship_num}</select> Address(es)
      </div>
    </fieldset>
   </div>
  {else}<input type="hidden" name="ship_num" value="1" />
  {/if}

  <input type="hidden" name="totalqty" value="{$totals.qty}" />
  </form>
</div>
{/if}

{*<!-- <div id="catalog_code_container" class="clearfix nopad">
 <fieldset><legend>Catalog Code</legend>
  <p>If you have one of our catalogs, please enter the catalog code found on the address label.</p>
  <div class="row">
    <div class="col-sm-6">
      <div class="form-group">
        <label for='cat_code'>Catalog Code:</label>
        <input type="text" id='cat_code' name="cat_code" value="{$valid.cat_code}" size="30" maxlength="50" />
      </div>
    </div>
  </div>
 </fieldset>
</div> -->*}

</div>

{include file="_bottom.tpl"}