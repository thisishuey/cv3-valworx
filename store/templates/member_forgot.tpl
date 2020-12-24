{include file="_top.tpl"}

<h1>Forgot Your Password?</h1>

<div class="form-container">

{if $password_error}
<div class="errors"><p>{$password_error}</p></div>
{/if}

{if $error}
 <div class="errors">
  <p><em>There was an error.</em></p>
  <p>Please double-check any highlighted fields.</p>
  <p><em>{$error}</em></p>
 </div>
{/if}

<p>Because of security procedures, we cannot retrieve your password and send it to you. However, we can reset the password and send you the new one. Please note that the password is reset as soon as this is requested. The new password will be sent to the address specified when the account was setup.</p>

<p class="legend"><strong>Note:</strong> * Indicates a required field</p>

<form class="form-inline" method="post" action="index.php" onsubmit="javascript: return validateForgotForm(this);">
<input type="hidden" name="action" value="MemberForgot" />

<fieldset>

<div class="form-group {if $valid.return and $valid.email == ''} error{/if}">
 <label for="email"><span class="req">*</span> Email Address:</label>
 <input class="form-control" type="email" name="email" value="{$valid.email}" />
</div>

</fieldset>

<div class="buttonrow">
 <input type="submit" name="submit" value="Reset Password" class="button medium style1 btn btn-default" />
</div>

</form>

</div>

{include file="_bottom.tpl"}