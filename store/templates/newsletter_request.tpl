{include file="_top.tpl"}

<header><h1>Sign up for our Email Newsletter</h1></header>

  {if $newsletter_error != ''}
  <div class="row">
    <div class="errors col-sm-6 nopad">
      <p><em>There was an error.</em></p>
      <p>Please double-check any highlighted fields.</p>
      <div class="alert alert-danger"><em>Please provide a valid email. {$error}</em></div>
    </div>
  </div>
  {/if}

<div>
 <form method="post" action="index.php" name="newsletter" role="form"> 
  <input type="hidden" name="action" value="NewsletterRequest" />
  <input type="hidden" name="to_email" value="{#form_newsletter_to#}" />
  <input type="hidden" name="from_email" value="{#form_newsletter_from#}" />
  <div class="row">
    <div class="col-sm-6">
      <div class="form-group {if $newsletter_error != ''}has-error has-feedback bg-danger{/if}">
        <label for="add_email">Email Address:</label>{if $newsletter_error != ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        <input class="form-control" type="email" name="add_email" value="" />
      </div>
    </div>
  </div>
  <input type='hidden' name='marketing_cat' value='Newsletter Requests' />

{*  Use this to allow user to select which Customer Groups to be added to (for multiple newsletters)
 <div class="row clearfix">
    <div class="form-group">
      <div class="col-sm-6">
        <label><input type="checkbox" name="cgroups[]" value="Newsletter Requests" /> Newsletter</label> 
        <label><input type="checkbox" name="cgroups[]" value="New Product Notify" /> New Product Notification</label>
      </div>
    </div>
  </div>
*}

{if $newsletter_captcha}
  <div class="row">
    {if $captcha_method == '1'}
      <div class="form-group">
        <div class="col-sm-6">
          <label><span class="req">*</span> Type image characters:</label>
          <input class="form-control" type="text" name="captcha_test"/>
          {if $valid.return} <font color="#ff0000"><b>X</b></font> {/if}
          <div>
            <img src="/get_captcha_image" />
          </div>
        </div>
      </div>
    {else}
    <div class="col-sm-6">
      <script type="text/javascript" src="//www.google.com/recaptcha/api/challenge?k={$recaptcha_key}"></script>
      <noscript>
        <iframe src="//www.google.com/recaptcha/api/noscript?k={$recaptcha_key}" height="300" width="500" frameborder="0"></iframe>
        <br />
        <textarea class="form-control" name="recaptcha_challenge_field"></textarea>
        <input type="hidden" name="recaptcha_response_field" value="manual_challenge" />
      </noscript>
      {if $valid.return} <font color="#ff0000"><b>X</b></font> {/if}
    </div>
    {/if}
  </div>
{/if}
  <div class="mar_btm mar_top10">
    <input type="submit" name="submit" value="Join" class="btn btn-primary" />
  </div>
 </form>
</div>

{include file="_bottom.tpl"}
