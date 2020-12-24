{include file="_top.tpl"}

<h1>Affiliate Application</h1>

<div class="mar_btm">
  <div class="mar_btm">Please remember the email address and password you enter, as that information will be required to login as an affiliate if your application is accepted.</div>

  <div><span class="req">*</span> Indicates a required field.</div>
</div>

{if $valid.return == "1"}
<div class="normaltext">
  <b>There has been an error. Please double check any fields that show an '<span class="glyphicon glyphicon-remove"></span>'
    <div class="alert alert-danger">{$error}</div>
  </div>
  {/if}

  <form method="post" action="index.php" role="form"> 
    <input type="hidden" name="action" value="AffiliateRegister" />
    <div>
      <div class="row">
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and  $valid.name == ''}has-error has-feedback bg-danger{/if}">
            <label><span class="req">*</span> Affiliate or Program Name:</label>
            <input class="form-control" type="text" name="name" value="{$valid.name}" maxlength="50"/>
            {if $valid.return and  $valid.name == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
          </div>
        </div>
        <div class="clearfix"></div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.web_address and  $valid.web_address == ''}has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> Web Address:</label>
          <input class="form-control" type="text" name="web_address" value="{$valid.web_address}" maxlength="50" />
          {if $valid.web_address and  $valid.web_address == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.payable and  $valid.payable == ''}has-error has-feedback bg-danger{/if}" >
          <label><span class="req">*</span> Checks Payable To:</label>
          <input class="form-control" type="text" name="payable" value="{$valid.payable}" maxlength="50"/>
          {if $valid.payable and  $valid.payable == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and  $valid.address1 == ''}has-error has-feedback bg-danger{/if}" >
          <label><span class="req">*</span> Address:</label>
          <input class="form-control" type="text" name="address1" value="{$valid.address1}" maxlength="50"/>{if $valid.return and  $valid.address1 == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group">
          <label>Address Line 2:</label>
          <input class="form-control" type="text" name="address2" value="{$valid.address2}" maxlength="50"/>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and  $valid.city == ''}has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> City:</label>
          <input class="form-control" type="text" name="city" value="{$valid.city}" maxlength="50"/>{if $valid.return and  $valid.city == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      {if $uk != 'y'}
      <div class="col-sm-6">
        <div class="form-group {if $valid.return && $valid.state == ''}has-error has-feedback bg-danger{/if}" >
          <label><span class="req">*</span> State/Province:</label>
          <select class="form-control" name="state">
            {html_options options=$options.state selected=$valid.state}
          </select> {if $valid.return && $valid.state == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      {else}
      {* for uk *}
      <div class="col-sm-6">
        <div class="form-group {if $valid.return && $valid.state == ''}has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> County/State:</label>
          <input class="form-control" type="text" name="state" value="{$valid.state}" /> {if $valid.return && $valid.state == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          <input type="hidden" name="uk" value="y" />
        </div>
      </div>
      {/if}
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and  $valid.zip == ''}has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> Postal Code:</label>
          <input class="form-control" type="text" name="zip" value="{$valid.zip}" maxlength="30"/>{if $valid.return and  $valid.zip == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group">
          <label><span class="req">*</span> Country:</label>
          <select class="form-control" name="country" >
            {html_options options=$options.country selected=$valid.country}
          </select>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and  $valid.email == ''}has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> Email Address:</label>
          <input class="form-control" type="text" name="email" value="{$valid.email}" maxlength="50"/>{if $valid.return and  $valid.email == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      
        <div class="checkbox">
          <label><input type="checkbox" name="opt_out" value="y" />Please do not send me monthly activity reports.</label>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and  $valid.phone == ''}has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> Phone Number:</label>
          <input class="form-control" type="text" name="phone" value="{$valid.phone}" maxlength="50"/>{if $valid.return and  $valid.phone == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="clearfix"></div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and  $pw1 == ''}has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> Password:</label>
          <input class="form-control" type="password" name="pw1" maxlength="50"/>{if $valid.return and  $pw1 == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          <div class="help-block"><i>Password must be at least 6 characters</i></div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and  $pw2 == ''}has-error has-feedback bg-danger{/if}" >
          <label><span class="req">*</span> Confirm Password:</label>
          <input class="form-control" type="password" name="pw2" maxlength="50"/>{if $valid.return and  $pw2 == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>

      {if $use_captcha}
      <div class="clearfix"></div>
      <div class="col-sm-6 mar_btm">
        <div class="form-group {if $valid.return}has-error has-feedback bg-danger{/if}">
          <label>
           {if !$smarty.session.mobile}
           {if $captcha_method == '2'}
           <span class="req">*</span> Verification:
           {else}
           <span class="req">*</span> Type image characters:
           {/if}
           {/if}
         </label>
         <div>
          {if $captcha_method == '2'}
          <script type="text/javascript" src="//www.google.com/recaptcha/api/challenge?k={$recaptcha_key}"></script>
          <noscript>
            <iframe src="//www.google.com/recaptcha/api/noscript?k={$recaptcha_key}" height="300" width="500" frameborder="0"></iframe>
            <br />
            <textarea class="form-control" name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
              <input type="hidden" name="recaptcha_response_field" value="manual_challenge" />
            </noscript>
            {else}
            <input class="form-control" type="text" name="captcha_test"/>
            {/if}
            {if $valid.return}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
      
        {if $captcha_method == '1'}
        <div>
          <img src="/get_captcha_image"/>
        </div>
        {/if}
        </div>
      {/if}
      </div>
      <div class="">
        <input type="submit" name="submit" value="Apply" class="addtocart_btn btn btn-primary pull-right mar_btm" />
      </div>
   </div>
 </form>

 {include file="_bottom.tpl"}
