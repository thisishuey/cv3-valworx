{include file="_top.tpl"}

<h1>Refer-a-Friend Account Login</h1>

{if $error != ''}<div class="alert alert-danger" id="errorMsg">{$error}</div>{/if}

<form method="post" action="index.php" name="checkout" role="form"> 
  <input type="hidden" name="action" value="ReferafriendLogin">
  <div>
    <div class="mar_btm">
      <a href="/referafriend_register">Refer-a-Friend Application</a>
    </div>
    {if $password_error != ''}

    <div class="alert alert-danger">**{$password_error}**</div>

    {/if}
    <fieldset>
      <legend>Authentication Required - Please Log In</legend>
      <div class="mar_btm"><i>Please note: passwords are case-sensitive</i></div>
      <div class="row">
        <div class="col-sm-6">
          <div class="form-group">
            <label>Email Address:</label>
            <input class="form-control" type="text" name="username" value="{$valid.username}"/>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label>Password:</label>
            <input class="form-control" type="password" name="password" value="{$valid.password}"/>
          </div>
        </div>
      </div>
      <div class="checkbox">
        <label><input name="keep_login" type="checkbox" value="1"> Keep my login information</label>
      </div>

      <div class="mar_btm"><a href="/referafriend_forgot">Forgot your password?</a></div>
    </fieldset>
    <div class="mar_btm">
      <input type="submit" name="submit" value="Log In" class="addtocart_btn btn btn-primary">
    </div>
    
  </div>
</form>
{include file="_bottom.tpl"}
