{include file="_top.tpl"}
{get_global var='ca_provinces'}

<h1><img src="{$img_prefix}/images/cs_contact_us_100.png" alt="Contact Us" height="40" style="margin-bottom:-13px;display:inline-block !important;">Contact Us</h1>
<div class="col-xs-12 contactblockwrapper">
  <div class="contact_block">
   <b>Phone</b><br /><br />
   800-511-0100<br />
   704-987-9803<br />
  </div>
  <div class="contact_block">
   <b>Fax</b><br /><br />
   704-987-9685<br />
  </div>
  <div class="contact_block">
   <b>Email</b><br /><br />
   sales@valworx.com<br />
  </div>
  <div class="contact_block">
   <b>Web Site</b><br /><br />
   valworx.com<br />
  </div>
  <div class="contact_block">
   <b>Address</b><br /><br />
   Valworx, Inc.<br />
   18636 Northline Drive<br />
   Cornelius, NC 28031 USA
  </div>
  <div class="contact_block"> </div>
  <div class="contact_block">
   <b>Business Hours</b><br /><br />
   8:30 AM – 5:00 PM EST<br />
   Monday - Friday<br />
  </div>
  <div class="contact_block"> </div>
</div>


<br /><br /><br />

<div class="col-xs-12 form-container">
  
  {if $valid.return == '1'}
  <div class="errors">
    <p><em>There was an error.</em></p>
    <p>Please double-check any highlighted fields.</p>
    <p><em>{$error}</em></p>
  </div>
  {/if}


<br /><br />
  <p ><strong>Online Contact Request</strong></p>
<p class="legend"><strong>Note:</strong><span class="req"> * </span>Indicates a required field</p>

  <form method="post" action="index.php" name="checkout" role="form"> 
  <input type="hidden" name="action" value="Contact" />

  <fieldset><legend>Contact Information</legend>
    <div class="row">
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and $valid.first_name == ''}has-error has-feedback bg-danger{/if}">
          <label for="first_name"><span class="req">*</span> First Name:</label>
          <input type="hidden" name="req_first_name" value="y" />
          <input class="form-control" type="text" name="first_name" id="first_name" value="{$valid.first_name}"/>{if $valid.return and $valid.first_name == ''}
          <span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and $valid.last_name == ''}has-error has-feedback bg-danger{/if}">
          <label for="last_name"><span class="req">*</span> Last Name:</label>
          <input type="hidden" name="req_last_name" value="y" />
          <input class="form-control" type="text" name="last_name" id="last_name" value="{$valid.last_name}"/>
          {if $valid.return and $valid.last_name == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {*if $valid.return and $valid.address1 == ''}has-error has-feedback bg-danger{/if*}">
          <label for="address1">{*<span class="req">*</span> *}Address 1:</label>
          <input class="form-control" type="text" name="address1" id="address1" value="{$valid.address1}"/>
          {*if $valid.return and $valid.address1 == ''<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {*if $valid.return and $valid.address2 == ''}has-error has-feedback bg-danger{/if*}">
          <label for="address2">{*<span class="req">*</span> *}Address 2:</label>
          <input class="form-control" type="text" name="address2" id="address2" value="{$valid.address2}"/>
          {*if $valid.return and $valid.address2 == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {*if $valid.return and $valid.city == ''}has-error has-feedback bg-danger{/if*}">
          <label for="city">{*<span class="req">*</span> *}City:</label>
          <input class="form-control" type="text" name="city" id="city" value="{$valid.city}"/>
          {*if $valid.return and $valid.city == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {*if $valid.return and !$valid.country}has-error has-feedback bg-danger{/if*}">
          <label for="country">{*<span class="req">*</span> *}Country:</label>
          <select class="form-control" name="country" id="country">
           {html_options options=$options.country selected=$valid.country}
          </select>
          {*if $valid.return and !$valid.country}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {*if $valid.return and !$valid.state}has-error has-feedback bg-danger{/if*}">
          <label for="state">{*<span class="req">*</span> *}State/Province:</label>
          <select class="form-control" name="state" id="state">
          {html_options options=$options.usstate selected=$valid.state}
          </select>
          {*if $valid.return and !$valid.state}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
          <select class="form-control" id='ca_province'>
          {html_options options=$ca_provinces selected=$valid.state}
          </select>
          {*if $valid.return and !$valid.state}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
          <input class="form-control" type='text' id="province" name="state" value="{$valid.state}"/>
          {*if $valid.return and !$valid.state}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {*if $valid.return and !$valid.zip}has-error has-feedback bg-danger{/if*}">
          <label for="zip">{*<span class="req">*</span> *}Postal Code:</label>
          <input class="form-control" type="text" name="zip" id="zip" value="{$valid.zip}"/>
          {*if $valid.return and !$valid.zip}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and $valid.email == ''}has-error has-feedback bg-danger{/if}">
          <label for="email"><span class="req">*</span> Email Address:</label>
          <input type="hidden" name="req_email" value="y" />
          <input class="form-control" type="email" name="email" id="email" value="{$valid.email}"/>
          {if $valid.return and $valid.email == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {*if $valid.return and $valid.phone == ''}has-error has-feedback bg-danger{/if*}">
          <label for="phone">{*<span class="req">*</span> *}Phone Number:</label>
          <input class="form-control" type="tel" name="phone" id="phone" value="{$valid.phone}"/>
          {*if $valid.return and $valid.phone == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {*if $valid.return and $valid.fax == ''}has-error has-feedback bg-danger{/if*}">
          <label for="fax">{*<span class="req">*</span> *}Fax:</label>
          <input class="form-control" type="tel" name="fax" id="fax" value="{$valid.fax}"/>
          {*if $valid.return and $valid.fax == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {*if $valid.return and $valid.url == ''}has-error has-feedback bg-danger{/if*}">
          <label for="url">{*<span class="req">*</span> *}Website:</label>
          <input class="form-control" type="url" name="url" id="url" value="{$valid.url}"/>
          {*if $valid.return and $valid.url == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {*if $valid.return and $valid.company == ''}has-error has-feedback bg-danger{/if*}">
          <label for="company">{*<span class="req">*</span> *}Company:</label>
          <input class="form-control" type="text" name="company" id="company" value="{$valid.company}"/>
          {*if $valid.return and $valid.company == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {*if $valid.return and $valid.position == ''}has-error has-feedback bg-danger{/if*}">
          <label for="position">{*<span class="req">*</span> *}Position:</label>
          <input class="form-control" type="text" name="position" id="position" value="{$valid.position}"/>
          {*if $valid.return and $valid.position == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {*if $valid.return and $valid.comments == ''}has-error has-feedback bg-danger{/if*}">
          <label for="comments">{*<span class="req">*</span> *}Comments:</label>
          <textarea class="form-control" name="comments" id="comments">{$valid.comments}</textarea>
          {*if $valid.return and $valid.comments == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
        </div>
      </div>
    </div>
  </fieldset>

  {if $use_captcha}
  <fieldset><legend>CAPTCHA Verification</legend>
    <div class="form-group {if $valid.return}has-error has-feedback bg-danger{/if}">
     {if !$smarty.session.mobile}
      {if $captcha_method == '2'}
       <label for="recaptcha_response_field"><span class="req">*</span> Verification:</label>
      {else}
       <label for="captcha_test"><span class="req">*</span> Type characters:</label>
      {/if}
     {/if}
     {if $captcha_method == '2'}
      <script type="text/javascript" src="//www.google.com/recaptcha/api/challenge?k={$recaptcha_key}"></script>
      <noscript>
       <iframe src="//www.google.com/recaptcha/api/noscript?k={$recaptcha_key}" height="300" width="500" frameborder="0"></iframe>
       <textarea class="form-control" name="recaptcha_challenge_field" id="recaptcha_challenge_field"></textarea>{if $valid.return}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
       <input type="hidden" name="recaptcha_response_field" id="recaptcha_response_field" value="manual_challenge" />
      </noscript>
     {else}
      <input class="form-control" type="text" name="captcha_test" id="captcha_test" />{if $valid.return}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
     {/if}
     {if $captcha_method == '1'}
      <img src="/get_captcha_image" alt="Captcha authorization" />
     {/if}
    </div>
  </fieldset>
  {/if}

  <fieldset><legend>Preferences</legend>
    <div class="controlset checkbox">
      <label><input type="checkbox" name="opt_out" id="opt_out" value="y" {if $valid.opt_out == 'checked'} checked="checked"{/if} /> Please do not send me additional info</label>
    </div>
  </fieldset>

  <div class="buttonrow">
    <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-primary" />
  </div>

  </form>


</div>

{include file="_bottom.tpl"}