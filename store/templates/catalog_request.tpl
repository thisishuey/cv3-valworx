  {include file="_top.tpl"}

  <h1>Catalog Request</h1>

  <div class="form-container">

    {if $valid.return == '1'}
    <div class="errors">
      <p><em>There was an error.</em></p>
      <p>Please double-check any highlighted fields.</p>
      <div class="alert alert-danger"><em>{$error}</em></div>
    </div>
    {/if}

    <p class="legend"><strong>Note:</strong><span class="req"> *</span> Indicates a required field.</p>

    <form method="post" action="index.php" name="checkout" role="form"> 
      <input type="hidden" name="action" value="CatalogRequest" />

      <fieldset><legend>Contact Information</legend>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and $valid.first_name == ''}has-error has-feedback bg-danger{/if}">
            <label for="first_name"><span class="req">*</span> First Name:</label>
            <input class="form-control" type="text" name="first_name" id="first_name" value="{$valid.first_name}"/>{if $valid.return and $valid.first_name == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and  $valid.last_name == ''}has-error has-feedback bg-danger{/if}">
            <label for="last_name"><span class="req">*</span> Last Name:</label>
            <input class="form-control" type="text" name="last_name" id="last_name" value="{$valid.last_name}"/>{if $valid.return and  $valid.last_name == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {*if $valid.return and $valid.title == ''}has-error has-feedback bg-danger{/if*}">
            <label for="title">{*<span class="req">*</span> *}Title:</label>
            <input class="form-control" type="text" name="title" id="title" value="{$valid.title}"/>{*if $valid.return and $valid.title == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
            <input type="hidden" name="req_title" value="n" />
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {*if $valid.return and $valid.company == ''}has-error has-feedback bg-danger{/if*}">
            <label for="company">{*<span class="req">*</span> *}Company:</label>
            <input class="form-control" type="text" name="company" id="company" value="{$valid.company}"/>{*if $valid.return and $valid.company == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if*}
            <input type="hidden" name="req_company" value="n" />
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and $valid.address1 == ''}has-error has-feedback bg-danger{/if}">
            <label for="address1"><span class="req">*</span> Address 1:</label>
            <input class="form-control" type="text" name="address1" id="address1" value="{$valid.address1}"/>{if $valid.return and $valid.address1 == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group" >
            <label for="address2">Address 2:</label>
            <input class="form-control" type="text" name="address2" id="address2" value="{$valid.address2}"/>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and $valid.city == ''}has-error has-feedback bg-danger{/if}">
            <label for="city"><span class="req">*</span> City:</label>
            <input class="form-control" type="text" name="city" id="city" value="{$valid.city}"/>{if $valid.return and $valid.city == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and !$valid.country}has-error has-feedback bg-danger{/if}">
            <label for="country"><span class="req">*</span> Country:</label>
            <select class="form-control" name="country" id="country">
             {html_options options=$options.country selected=$valid.country}
           </select>{if $valid.return and !$valid.country}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
         </div>
       </div>
       <div class="col-sm-6">
        <div class="form-group {if $valid.return and !$valid.state}has-error has-feedback bg-danger{/if}">
          <label for="state"><span class="req">*</span> State/Province:</label>
          <select class="form-control" name="state" id="state">
           {html_options options=$options.usstate selected=$valid.state}
         </select>{if $valid.return and !$valid.state}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
       </div>
     </div>
       <div class="col-sm-6">
         <select class="form-control" id='ca_province'>
          {html_options options=$ca_provinces selected=$valid.state}
        </select>
        <input class="form-control" type='text' id="province" value="{$valid.state}" />
      </div>
    <div class="col-sm-6">
      <div class="form-group {if $valid.return and !$valid.zip}has-error has-feedback bg-danger{/if}">
        <label for="zip"><span class="req">*</span> Postal Code:</label>
        <input class="form-control" type="text" name="zip" id="zip" value="{$valid.zip}"/>{if $valid.return and !$valid.zip}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
    <div class="col-sm-6">
      <div class="form-group {if $valid.return and $valid.email == ''}has-error has-feedback bg-danger{/if}">
        <label for="email"><span class="req">*</span> Email Address:</label>
        <input class="form-control" type="email" name="email" id="email" value="{$valid.email}"/>{if $valid.return and $valid.email == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
    <div class="col-sm-6">
      <div class="form-group {if $valid.return and $valid.phone == ''}has-error has-feedback bg-danger{/if}">
        <label for="phone"><span class="req">*</span> Phone Number:</label>
        <input class="form-control" type="tel" name="phone" id="phone" value="{$valid.phone}"/>{if $valid.return and $valid.phone == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
  </fieldset>

  <fieldset class="mar_btm"><legend>Catalog Options</legend>
    {*<div class="form-group {if $valid.return and $valid.category == ''}has-error has-feedback bg-danger{/if}">
    <label for="category"><span class="req">*</span> Type of Catalog:</label>
    <select class="form-control" name="category" id="category">
     {html_options options=$options.category selected=$valid.category}
   </select>{if $valid.return and $valid.category == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
  </div>*}
  {*<input type="hidden" name="category" value="Catalog" />*}

  <div class="col-xs-12 {if $valid.return && $valid.is_valid.category == 'n'}has-error bg-danger{/if}">
      <label><span class="req">*</span> Catalog(s) Requested:</label>
    <input type="hidden" name="process_type" value="2" />
    {counter assign="cat_counter" name="cat_counter" start=0 step=1}
    <div >
    {foreach from=$options.category item=cat}
      <label class="checkbox-inline" for="category[{$cat_counter}]">
        <input type="checkbox" name="category[{$cat_counter}]" id="category[{$cat_counter}]" value="{$cat}"{if isset($valid.category.$cat_counter) && $valid.category.$cat_counter == $cat} checked="checked"{/if} />{$cat}</label>
      {counter assign="cat_counter" name="cat_counter"}
      {/foreach}
    </div>
  </div>
  </fieldset>

  <fieldset><legend>Preferences</legend>
    <div class="col-xs-12">
    <div class="form-group {if $valid.return and $valid.hear == ''}has-error has-feedback bg-danger{/if}">
      <label for="hear"><span class="req">*</span> How did you hear about our store?</label>
        <input class="form-control" type="text" name="hear" id="hear" value="{$valid.hear}"/>{if $valid.return and $valid.hear == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>
    <div class="controlset form-group">
      <div class="checkbox">
        <label for="opt_out"><input type="checkbox" name="opt_out" id="opt_out" value="y" {if $valid.opt_out == 'checked'} checked="checked"{/if} /> Please do not send me additional info</label>
      </div>
    </div>
  </div>
  </fieldset>

  {if $use_captcha}
  <fieldset><legend>CAPTCHA Verification</legend>
    <div class="form-group {if $valid.return}has-error has-feedback bg-danger{/if}">
     {if $captcha_method == '2'}
     {if !$smarty.session.mobile}<label for="recaptcha_challenge_field"><span class="req">*</span> Verification:</label>{/if}
     <script type="text/javascript" src="//www.google.com/recaptcha/api/challenge?k={$recaptcha_key}"></script>
     <noscript>
       <iframe src="//www.google.com/recaptcha/api/noscript?k={$recaptcha_key}" height="300" width="500" frameborder="0"></iframe>
       <br />
       <textarea class="form-control" name="recaptcha_challenge_field" id="recaptcha_challenge_field"></textarea>{if $valid.return}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
       <input type="hidden" name="recaptcha_response_field" value="manual_challenge" />
     </noscript>
     {else}
     <label for="captcha_test"><span class="req">*</span> Type image characters:</label>
     <input class="form-control" type="text" name="captcha_test" id="captcha_test" />{if $valid.return}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
     {/if}
     {if $captcha_method == '1'}
     <img src="/get_captcha_image" alt="Captcha authorization" />
     {/if}
   </div>
  </fieldset>
  {/if}

  <div class="buttonrow">
    <input type="submit" name="submit" id="submit" value="Request Catalog" class="btn btn-primary" />
  </div>

  </form>

  </div>

  {include file="_bottom.tpl"}
