{include file="_top.tpl"}

<h1>Forgot Your Password?</h1>

<div class="form-container">

<p>Because of security procedures, we cannot retrieve your password and send it to you. However, we can reset the password and send you the new one. Please note that the password is reset as soon as this is requested. The new password will be sent to the address specified when the account was setup.</p>

<form class="form-inline" method="post" action="index.php"> 
<input type="hidden" name="action" value="WholesaleForgot">

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

