{if $view == 'newsletter'}{include file="_top.tpl"}{/if}

<section id="newsletter">
    {if $view == 'newsletter'}
        <h1>Newsletter</h1>
    {/if}

    <div>

<form action="//valworx.us1.list-manage.com/subscribe/post?u=c303bbf8f80d9b0078e73abdf&amp;id=7a4a488edc" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
            <div class="form-group">
            {if !$smarty.session.mobile}
<input type="email" size="16" class="newstext" value="Email Address" name="EMAIL" class="required email" id="mce-EMAIL" onfocus="if (this.value=='Email Address') this.value='';" onblur="if (this.value=='') this.value='Email Address';"{* placeholder="Email Signup"*}/>
  {else}
<input type="email" size="16" class="newstext" value="Email Address" name="EMAIL" class="required email" id="mce-EMAIL" onfocus="if (this.value=='Email Address') this.value='';" onblur="if (this.value=='') this.value='Email Address';" style="font-size:12px" />
  {/if}
  <input type='hidden' name='marketing_cat' value='Newsletter Requests' />
    
    
      
{** REPLACED WITH MAILCHIMP    
        <form method="post" class="form-inline" action="index.php" name="newsletter">
            <input type="hidden" name="action" value="NewsletterRequest" />
            <input type="hidden" name="to_email" value="{#form_newsletter_to#}" />
            <input type="hidden" name="from_email" value="{#form_newsletter_from#}" />
            <div class="form-group">
                <label for="email" class="sr-only">Email:</label>
                <input type="email" class="form-control" name="add_email" value="" placeholder="Enter email address" />{if $newsletter_error != ''} <font color="#ff0000"><b>X</b></font> {/if}
            
                 <input type='hidden' name='marketing_cat' value='Newsletter Requests' />
**}
            {*
            <input type="checkbox" name="cgroups[]" value="Newsletter Requests" /> Newsletter<br /> 
            <input type="checkbox" name="cgroups[]" value="New Product Notify" /> New Product Notification<br /><br />
            *}

            {*  Use this to allow user to select which Customer Groups to be added to (for multiple newsletters)
            <input type="checkbox" name="cgroups[]" value="Newsletter Requests" /> Newsletter<br /> 
            <input type="checkbox" name="cgroups[]" value="New Product Notify" /> New Product Notification<br /><br />
            *}

            {if $newsletter_captcha}
                <div>
                    {if $captcha_method == '1'}
                    {if !$smarty.session.mobile}<span class="smalltext"><font color="#ff0000">*</font> Type image characters:</span>{/if}
                    <input type="text" name="captcha_test" class="formtext" />{if $valid.return} <font color="#ff0000"><b>X</b></font> {/if}
                    <img src="/get_captcha_image" />
                {else}
                    <script type="text/javascript" src="//www.google.com/recaptcha/api/challenge?k={$recaptcha_key}"></script>
                    <noscript>
                    <iframe src="//www.google.com/recaptcha/api/noscript?k={$recaptcha_key}" height="300" width="500" frameborder="0"></iframe>
                    <br />
                    <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
      <input type="hidden" name="recaptcha_response_field" value="manual_challenge" />
     </noscript>
                    {if $valid.return} <font color="#ff0000"><b>X</b></font> {/if}
                {/if}
   </div>
    {/if}

  <input type="submit" name="submit" value="Sign Up" class="btn btn-default btn-newsletter" />
  </div>
 </form>
</div>
</section>
{if $view == 'newsletter'}{include file="_bottom.tpl"}{/if}