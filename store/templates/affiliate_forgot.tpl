{include file="_top.tpl"}

<h1>Forgot Your Password?</h1>

<form method="post" action="index.php" onsubmit="javascript: return validateForgotForm(this);" role="form">
  <input type="hidden" name="action" value="AffiliateForgot" />
  <div>
    <div class="mar_btm">
      <div class="mar_btm">Because of security procedures, we cannot retrieve your password and send it to you. However, we can reset the password and send you the new one. Please note that the password is reset as soon as this is requested. The new password will be sent to the address specified when the account was setup.</div>
      {if $error != ''}
      <div class="alert alert-danger" id="errorMsg">{$error}</div>
      {/if}
    </div>
    <div class="row">
      <div class="col-sm-6">
        <div class="form-group">
          <label>Email Address:</label>
          <input class="form-control" type="text" name="email" value="{$valid.email}" maxlength="50"/>
        </div>
      </div>
    </div>
    <div class="mar_btm">
      <input type="submit" name="submit" value="Reset Password" class="addtocart_btn btn btn-primary" />
    </div>
  </div>
</form>

{include file="_bottom.tpl"}