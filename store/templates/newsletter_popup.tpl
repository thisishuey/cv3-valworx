{if $SCRIPT_NAME == '/category/technical-support' || $view == 'how_does_it_work' || $view == 'product_faq' || $view == 'technical_resources' || $view == 'product_comparison' || $view == 'installation_instructions' || $view == 'troubleshooting' || $view == 'cad_drawings' || $view == 'product_safety' || $view == 'data_sheets' }
{if !smarty.session.mobile && !$smarty.cookies.supress_ad && $cgroup_code != 'NL'}
<div id='ad_overlay_wrapper' style='display: none;'>
	<div id='ad_fade' style='display: none;'></div>
		<div id='ad_overlay3' style='display: none;'>
			<input type='image' src='{$img_prefix}/images/newsletter-popup-close.png' name='no_thanks' style="float:right;margin:-5px -5px 0 0 !important" />
			<div id="signup">

			<h2>Do you want our latest product and technical info?</h2>
			<br><b>Here's some of what you can expect to see:</b>
			<br><br>
			<ul>
				<li>Product Highlights - new products, specs, prices</li>
				<li>Technical Bulletins - product FAQ's, selection guides</li>
				<li>Company News - the latest from Valworx</li>
			</ul>
			<br>

			<div class="form-container">
				<form action="//valworx.us1.list-manage.com/subscribe/post?u=c303bbf8f80d9b0078e73abdf&amp;id=7a4a488edc" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>

					<input type="hidden" name="action" value="NewsletterRequest" />
					<input type="hidden" name="redirect" value="/newsletter_thanks">
					<input type='hidden' name='marketing_cat' value='Newsletter Requests' />

					<input type="email" size="24" class="newstext" value="Email Address" name="EMAIL" class="required email" id="mce-EMAIL" onfocus="if (this.value=='Email Address') this.value='';" onblur="if (this.value=='') this.value='Email Address';" style="font-size:14px" />

					<input type="submit" name="submit" id="submit" value="Submit" class="button large green" style="margin:0 5px !important;padding:7px 10px !important" />
					<br><br>
					<input type='button' name='no_thanks' value='No Thanks' class="button medium white" style="margin:15px 0 5px 0 !important" />
				</form>
			</div>

		</div>
	</div>
</div>

{literal}
<script type='text/javascript'>
$(function(){
 $('#ad_overlay_wrapper').fadeIn(1000);
 $('#ad_fade').click(closeOverlay).show();
 $('input[name=no_thanks]').click(closeOverlay);
 $('#ad_overlay3').fadeIn(1000);

 set_cookie('supress_ad', 1, 183);
});

function closeOverlay() {
 $('#ad_overlay3').fadeOut(1000, function(){
    $('#ad_fade').hide();
    $('#ad_overlay_wrapper').hide();
 });
}

function set_cookie(c_name,value,exdays) {
 var exdate=new Date();
 exdate.setDate(exdate.getDate() + exdays);
 var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
 document.cookie=c_name + "=" + c_value;
}

</script>
{/literal}

{/if}
{/if}

{***** Code for submitting the form via ajax  - NOT IN USE DUE TO MAILCHIMP
{literal}
<script type="text/javascript">
$('form[name="newsletter_popup"]').submit(function() {
  // Get email text field and make sure it doesn't contain "Enter email address" before submitting
  var email = $('form[name="newsletter_popup"] input[name="add_email"]').val();
  if (email == 'Enter email address') {
    $('form[name="newsletter_popup"] input[name="add_email"]').val('');
  }

  // Once it is submitted, update the display on the submit button so customer will know it is processing
  $('form[name="newsletter_popup"] input[name="submit"]').val('Processing...');

  // Post the form information and load the newsletter_thanks_body to the modal window
  $.post('/', $(this).serialize(),
    function(data) {
      $('#SignUp').load('/newsletter_thanks_body');
    }
  );

  // Always return false so regular post submission doesn't take place
  return false;
});
</script>
{/literal}
*****}