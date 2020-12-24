{include file="_top.tpl"}

<h1>E-Party Account Login</h1>

{if $error}
<div class="alert alert-danger">
  {$error}
</div>
{/if}

<form method="post" action="index.php" name="checkout" role="form"> 
  <input type="hidden" name="action" value="EpartyLogin">
    <div>
      <div class="mar_btm">
        <a href="/eparty_register">E-Party Application</a>
      </div>
      <fieldset>
      <legend>Authentication Required - Please Log In</legend>
      <div class="mar_btm">
        <i>Please note: passwords are case-sensitive</i>
      </div>

      {if $password_error != ''}
      <div class="alert alert-danger">
        **{$password_error}**
      </div>
      {/if}
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

      <div class="mar_btm">
        <a href="/eparty_forgot">Forgot your password?</a>
      </div>
    </fieldset>
      <div class="mar_btm">
        <input type="submit" name="submit" value="Log In" class="addtocart_btn btn btn-primary">
      </div>
    </div>
</form>
{include file="_bottom.tpl"}
