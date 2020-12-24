<div{if $valid.return} class="error"{/if}>
    {if $captcha_method == '2'}
      <label for="captcha"><span class="req">*</span>Verification:</label>
    {else}
      <label for="captcha"><span class="req">*</span>Type image characters:</label>
    {/if}
    <div class="row">
    
    {if $captcha_method == '2'}
    <div class="col-sm-12">
      <script type="text/javascript" src="//www.google.com/recaptcha/api/challenge?k={$recaptcha_key}"></script>
      <noscript>
        <iframe src="//www.google.com/recaptcha/api/noscript?k={$recaptcha_key}" height="300" width="500" frameborder="0"></iframe>
        <br />
        <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
        <input class="form-control" type="hidden" name="recaptcha_response_field" value="manual_challenge" />
      </noscript>
    {else}
      <div class="col-sm-4">
      <input type="text" name="captcha_test" class="form-control formtext"/>
    {/if}
</div>

{if $captcha_method == '1'}
<div class="col-sm-8">
  <span class="label"></span>
  <img src="/get_captcha_image"/>
</div>
{/if}
</div>
</div>
