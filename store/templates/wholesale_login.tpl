{include file="_top.tpl"}

<h1>Authorized Wholesalers</h1>

<form method="post" action="index.php" name="checkout"> 
<input type="hidden" name="action" value="WholesaleLogin">

{if $password_error}
 <div class='errors'><p>{$password_error}</p></div>
{/if}

<p><a href="/member_register">Wholesale Application</a></p>

<fieldset class="login-box"><legend>Authentication Required</legend>
<div class="form-inline">
<div class="form-group">
  <label for='username'><span class="req">*</span> Email Address:</label>
  <input class="form-control" type="email" id='username' name="username" value="{$valid.username}" />
</div>

<div class="form-group">
  <label for='password'><span class="req">*</span> Password:</label>
  <input class="form-control" type="password" id='password' name="password" value="{$valid.password}" />
</div>
</div>
<div class="controlset checkbox">
  <label><input name="keep_login" type="checkbox" value="1" />Keep my login information</label>
</div>

<p><a href="/member_forgot">Forgot your password?</a></p>

</fieldset>

<div class="buttonrow mar_btm">
  <input type="submit" name="login_submit" value="Log In" class="button medium style1 btn btn-default" />
</div>

</form>
{include file="_bottom.tpl"}

