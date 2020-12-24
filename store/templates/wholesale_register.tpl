{include file="_top.tpl"}

<h1>Wholesale Application</h1>

<p>Please remember the email address and password you enter, as that information will be required to login as a wholesaler if your application is accepted.</p>

<div class="form-container">

{if $valid.return == '1'}
 <div class="errors">
  <p><em>There was an error.</em></p>
  <p>Please double-check any highlighted fields.</p>
  <p><em>{$error}</em></p>
 </div>
{/if}

<p class="legend"><strong>Note:</strong> * Indicates a required field</p>

<form class="form-horizontal" method="post" name="ws_register" action="index.php"> 
<input type="hidden" name="action" value="WholesaleRegister">

<fieldset><legend>Contact Information</legend>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='prefix'> Prefix:</label>
  <div class="col-xs-8 col-md-10">
        <input class="form-control" type="text" id='prefix' name="prefix" value="{$valid.prefix}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.contact_first_name} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='contact_first_name'><span class="req">*</span> First Name:</label>
  <div class="col-xs-8 col-md-10">
        <input class="form-control" type="text" id='contact_first_name' name="contact_first_name" value="{$valid.contact_first_name}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.contact_last_name} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='contact_last_name'><span class="req">*</span> Last Name:</label>
  <div class="col-xs-8 col-md-10">
        <input class="form-control" type="text" id='contact_last_name' name="contact_last_name" value="{$valid.contact_last_name}" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='company_name'>Company:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="company_name" id="company_name" value="{$valid.company_name}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.billing_address1} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='billing_address1'><span class="req">*</span> Billing Address:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" id="billing_address1" name="billing_address1" value="{$valid.billing_address1}" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2"><span class="label">&nbsp;</span></label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="billing_address2" value="{$valid.billing_address2}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.billing_city} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='billing_city'><span class="req">*</span> City:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="billing_city" id="billing_city" value="{$valid.billing_city}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.billing_country}error{/if}">
  <label class="control-label col-xs-4 col-md-2" for="billing_country"><span class="req">*</span> Country:</label>
  <div class="col-xs-8 col-md-10">
  <select class="form-control" name="billing_country" id="billing_country">
   {html_options options=$options.country selected=$valid.billing_country}
  </select>
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.billing_state} error{/if}">
  <label class="control-label col-xs-4 col-md-2"><span class="req">*</span> State/ Province:</label>
  <div class="col-xs-8 col-md-10">
  <select class="form-control" name="billing_state" id="billing_state">
   {html_options options=$options.state selected=$valid.billing_state}
  </select>
  </div>
  <div class="col-xs-8 col-md-10">
  <select class="form-control" id='ca_province'>
    {html_options options=$ca_provinces selected=$valid.billing_state}
  </select>
  </div>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type='text' id="billing_province" value="{$valid.billing_state}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.billing_zip} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for="billing_zip"><span class="req">*</span> Postal Code:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="billing_zip" id="billing_zip" value="{$valid.billing_zip}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.email} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='email'><span class="req">*</span> Email Address:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="email" id="email" name="email" value="{$valid.email}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.phone} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='phone'><span class="req">*</span> Phone Number:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="tel" name="phone" id="phone" value="{$valid.phone}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.fax} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='fax'><span class="req">*</span> Fax:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="tel" name="fax" id="fax" value="{$valid.fax}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.password} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='password'><span class="req">*</span> Password:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="password" id="password" name="pw1" />
 <span class="help-block">Passwords must be at least 6 characters</span>
 </div>
</div>

</fieldset>

<fieldset><legend>Shipping Information</legend>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='shipping_address_type'><span class="req">*</span> Shipping Address Type:</label>
  <div class="col-xs-8 col-md-10">
  <input type="radio" name="shipping_address_type" value="residential" {if $valid.shipping_address_type == 'residential'}checked{/if}>Residential&nbsp;
  <input type="radio" name="shipping_address_type" value="commercial" {if $valid.shipping_address_type == 'commercial'}checked{/if}>Commercial&nbsp;
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='same_ship'></label>
  <div class="col-xs-8 col-md-10">
  <input type="checkbox" name="same_ship" value="1" onclick="javascript:wholesaleCopy();">Check here if Shipping Address is the same as Company Address above.
{*
  <span class="help-block">Check here if Shipping Address is the same as Company Address above.</span>
*}
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='shipping_attention'> Company:</label>
  <div class="col-xs-8 col-md-10">
  <input type="text" name="shipping_attention" value="{$valid.shipping_attention}" size="30" maxlength="50" class="formtext">
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='billing_address1'> Address:</label>
  <div class="col-xs-8 col-md-10">
   <input type="text" name="billing_address1" value="{$valid.billing_address1}" size="30" maxlength="50" class="formtext">
   <br><input type="text" name="billing_address2" value="{$valid.billing_address2}" size="30" maxlength="50" class="formtext">
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='shipping_city'> City:</label>
  <div class="col-xs-8 col-md-10">
  <input type="text" name="shipping_city" value="{$valid.shipping_city}" size="30" maxlength="50" class="formtext">
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='shipping_state'> State:</label>
  <div class="col-xs-8 col-md-10">
  <select class="formtext" name="shipping_state" >
    {html_options options=$options.state selected=$valid.shipping_state}
  </select>
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='shipping_zip'> Zip:</label>
  <div class="col-xs-8 col-md-10">
  <input type="text" name="shipping_zip" value="{$valid.shipping_zip}" size="15" maxlength="30" class="formtext">
 </div>
</div>

</fieldset>

<fieldset><legend>Business Information</legend>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='business_class'> Business Class:</label>
  <div class="col-xs-8 col-md-10">
  <input type="radio" name="business_class" value="proprietorship" {if $valid.business_class=='proprietorship'}checked{/if}>Proprietorship&nbsp;
  <input type="radio" name="business_class" value="partnership" {if $valid.business_class=='partnership'}checked{/if}>Partnership&nbsp;
  <input type="radio" name="business_class" value="corporation" {if $valid.business_class=='corporation'}checked{/if}>Corporation&nbsp;
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='corp_name'> Corporation Name:</label>
  <div class="col-xs-8 col-md-10">
  <input type="text" name="corp_name" value="{$valid.corp_name}" size="30" maxlength="50" class="formtext">
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='fed_tax_id'>State Resale Tax Number:</label>
  <div class="col-xs-8 col-md-10">
  <input type="text" name="fed_tax_id" value="{$valid.fed_tax_id}" size="15" maxlength="50" class="formtext">
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='new_owner'>New Owner:</label>
  <div class="col-xs-8 col-md-10">
  <input type="checkbox" name="new_owner" value="1" {if $valid.new_owner == '1'}checked{/if}>&nbsp;Check if yes.
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='purchase_date'>Purchase Date:</label>
  <div class="col-xs-8 col-md-10">
  <input type="text" name="purchase_date" value="{$valid.purchase_date}" size="15" maxlength="50" class="formtext">
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='business_length'>Length of Time in Business:</label>
  <div class="col-xs-8 col-md-10">
  <input type="text" name="business_length" value="{$valid.business_length}" size="3" maxlength="5" class="formtext">
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='business_year'></label>
  <div class="col-xs-8 col-md-10">
  <input type="radio" name="business_year" value="seasonal" {if $valid.business_year=='seasonal'}checked{/if}>Seasonal&nbsp;
  <input type="radio" name="business_year" value="year round" {if $valid.business_year=='year round'}checked{/if}>Year round&nbsp;
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='business_type'></label>
  <div class="col-xs-8 col-md-10">
 {if $valid.return}
   {foreach from=$valid.business_type item=type}
     {if $type == 'Gourmet Food Store'}{assign var="gourmet" value="1"}{/if}
     {if $type == 'Department Store'}{assign var="department" value="1"}{/if}
     {if $type == 'Baskets'}{assign var="basket" value="1"}{/if}
     {if $type == 'Restaurant/Caterer'}{assign var="restaurant" value="1"}{/if}
     {if $type == 'Gift Shop'}{assign var="giftshop" value="1"}{/if}
   {/foreach}
 {/if}
 <font class="smalltext"><font color="#FF0000">*</font> Type of Business:&nbsp;<br></font>
 <input type="checkbox" name="business_type[]" value="Gourmet Food Store" {if $gourmet}checked{/if}>Gourmet Food Store&nbsp;<br>
 <input type="checkbox" name="business_type[]" value="Department Store" {if $department}checked{/if}>Department Store&nbsp;<br>
 <input type="checkbox" name="business_type[]" value="Baskets" {if $basket}checked{/if}>Baskets&nbsp;<br>
 <input type="checkbox" name="business_type[]" value="Restaurant/Caterer" {if $restaurant}checked{/if}>Restaurant/Caterer&nbsp;<br>
 <input type="checkbox" name="business_type[]" value="Gift Shop" {if $giftshop}checked{/if}>Gift Shop&nbsp;<br>
  Other:&nbsp;<input type="text" name="business_type_other" value="{$valid.business_type_other}" size="10" maxlength="50" class="formtext">
 </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='comments'> Comments:</label>
  <div class="col-xs-8 col-md-10">
  <textarea name="comments" cols="50" rows="8" wrap="virtual">{$valid.comments}</textarea>
 </div>
</div>

{if $use_captcha}
<div class="form-group">

 {if !$smarty.session.mobile}
  {if $captcha_method == '2'}
   <font color="#ff0000">*</font> Verification:
  {else}
   <font color="#ff0000">*</font> Type image characters:
  {/if}
 {/if}

 {if $captcha_method == '2'}
   <script type="text/javascript" src="//www.google.com/recaptcha/api/challenge?k={$recaptcha_key}"></script>
     <noscript>
       <iframe src="//www.google.com/recaptcha/api/noscript?k={$recaptcha_key}" height="300" width="500" frameborder="0"></iframe>
       <br />
       <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
       <input type="hidden" name="recaptcha_response_field" value="manual_challenge" />
     </noscript>
 {else}
   <input type="text" name="captcha_test" class="formtext"/>
 {/if}

  {if $captcha_method == '1'}
        <img src="/get_captcha_image"/>
  {/if}
</div>
{/if}

<input type="submit" name="submit" value="Register" class="button medium style1 btn btn-default">

</fieldset>
</form>
</div>

{*
<table border="0" cellspacing="0" cellpadding="4" align="center" width="100%">
   <tr>
      <td colspan="2">
         <table border="0" cellspacing="0" cellpadding="4">
            <tr valign="top">
               <td>
                  <font class="smalltext">Prefix:&nbsp;<br></font>
				          <input type="text" name="prefix" value="{$valid.prefix}" size="5" maxlength="10" class="formtext">
		           </td>
               <td {if $valid.return and $valid.contact_first_name == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
                  <font class="smalltext"><font color="#FF0000">*</font> First Name:&nbsp;<br></font>
				          <input type="text" name="contact_first_name" value="{$valid.contact_first_name}" size="30" maxlength="50" class="formtext">
		           </td>
               <td {if $valid.return and $valid.contact_last_name == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
                  <font class="smalltext"><font color="#FF0000">*</font> Last Name:&nbsp;<br></font>
				          <input type="text" name="contact_last_name" value="{$valid.contact_last_name}" size="30" maxlength="50" class="formtext">
			         </td>
            </tr>
         </table>
      </td>
   </tr>
   <tr valign="top">
      <td width="233" {if $valid.return and $valid.company_name == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
         <font class="smalltext"><font color="#FF0000">*</font> Company:&nbsp;<br></font>
				 <input type="text" name="company_name" value="{$valid.company_name}" size="30" maxlength="50" class="formtext">
      </td>
      <td {if $valid.return and $valid.billing_address1 == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
         <font class="smalltext"><font color="#FF0000">*</font> Address:&nbsp;<br></font>
				 <input type="text" name="billing_address1" value="{$valid.billing_address1}" size="30" maxlength="50" class="formtext">
         <br><input type="text" name="billing_address2" value="{$valid.billing_address2}" size="30" maxlength="50" class="formtext">
      </td>
   </tr>
   <tr valign="top">
      <td {if $valid.return and $valid.billing_city == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
         <font class="smalltext"><font color="#FF0000">*</font> City:&nbsp;<br></font>
				 <input type="text" name="billing_city" value="{$valid.billing_city}" size="30" maxlength="50" class="formtext">
      </td>
      <td>
         <table border="0" cellspacing="0">
            <tr valign="top">
               <td {if $valid.return and $valid.billing_state == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
                  <font class="smalltext"><font color="#FF0000">*</font> State:&nbsp;<br></font>
									<select class="formtext" name="billing_state" >
                     {html_options options=$options.state selected=$valid.billing_state}
                  </select>
               </td></tr>
            <tr>
               <td {if $valid.return and $valid.billing_zip == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
                  <font class="smalltext"><font color="#FF0000">*</font> Postal Code:&nbsp;<br></font>
				<input type="text" name="billing_zip" value="{$valid.billing_zip}" size="15" maxlength="30" class="formtext">
               </td>
            </tr>
         </table>
      </td>
   </tr>
   <tr valign="top">
      <td {if $valid.return and $valid.email == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
         <font class="smalltext"><font color="#FF0000">*</font> Email Address:&nbsp;<br></font>
				 <input type="text" name="email" value="{$valid.email}" size="30" maxlength="50" class="formtext">
      </td>
      <td>
         <table border="0" cellspacing="0">
            <tr valign="top">
               <td {if $valid.return and $valid.phone == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
                  <font class="smalltext">*Phone:&nbsp;<br></font>
					<input type="text" name="phone" value="{$valid.phone}" size="15" maxlength="50" class="formtext">&nbsp;
               </td>
               <td {if $valid.return and $valid.fax == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
                  <font class="smalltext"><font color="#FF0000">*</font> Fax:&nbsp;<br></font>
					<input type="text" name="fax" value="{$valid.fax}" size="15" maxlength="50" class="formtext">
               </td>
            </tr>
         </table>
      </td>
   </tr>
   <tr>
      <td colspan="2" id="cartHelpText">
         We will be emailing your activation 
         notice to this email address.
	    </td>
   </tr>
	 <tr>
	<th colspan="2" align="left">
	Shipping Information
	</th>
   </tr>
	 <tr valign="top">
		  <td align="left" colspan="2" {if $valid.return and $valid.shipping_address_type == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if} class="smalltext">
		     <font class="smalltext"><font color="#FF0000">*</font> Shipping Address is:&nbsp;<br></font>
			   <input type="radio" name="shipping_address_type" value="residential" {if $valid.shipping_address_type == 'residential'}checked{/if}>Residential&nbsp;
			   <input type="radio" name="shipping_address_type" value="commercial" {if $valid.shipping_address_type == 'commercial'}checked{/if}>Commercial&nbsp;
		 </td>
	 </tr>
   <tr>
	  <td colspan="2" class="smalltext">
  		   <input type="checkbox" name="same_ship" value="1" onclick="javascript:wholesaleCopy();">
	 Check here if Shipping Address is the same as Company Address above.
  	  </td>
   </tr>
   <tr valign="top">
			<td {if $valid.return and $valid.shipping_attention == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
			<font class="smalltext"><font color="#FF0000">*</font> Company:&nbsp;<br></font>
			<input type="text" name="shipping_attention" value="{$valid.shipping_attention}" size="30" maxlength="50" class="formtext">
			</td>
			<td {if $valid.return and $valid.shipping_address1 == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
 			<font class="smalltext"><font color="#FF0000">*</font> Address:&nbsp;<br></font>
			<input type="text" name="shipping_address1" value="{$valid.shipping_address1}" size="30" maxlength="50" class="formtext">
			<br><input type="text" name="shipping_address2" value="{$valid.shipping_address2}" size="30" maxlength="50" class="formtext">
			</td>
   </tr>
	 <tr valign="top">
	    <td {if $valid.return and $valid.shipping_city == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
			   <font class="smalltext">*City:&nbsp;<br></font>
				 <input type="text" name="shipping_city" value="{$valid.shipping_city}" size="30" maxlength="50" class="formtext">
			</td>
  		<td>
		<table border="0" cellspacing="0">
	     	    <tr valign="top">
				<td {if $valid.return and $valid.shipping_state == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
				<font class="smalltext"><font color="#FF0000">*</font> State:&nbsp;<br></font>
				<select class="formtext" name="shipping_state" >
                     {html_options options=$options.state selected=$valid.shipping_state}
   				</select>
						   </td></tr>
                                <tr>
				<td {if $valid.return and $valid.shipping_zip == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
				<font class="smalltext"><font color="#FF0000">*</font> Postal Code:&nbsp;<br></font>
				<input type="text" name="shipping_zip" value="{$valid.shipping_zip}" size="15" maxlength="30" class="formtext">
				</td>
  			    </tr>
			   </table>
	    </td>
   </tr>
	 <tr>
	    <th colspan="2" align="left">
	    Business Information
	    </th>
	 </tr>
	 <tr>
	    <td colspan="2" {if $valid.return and $valid.business_class == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if} class="smalltext">
		<font class="smalltext"><font color="#FF0000">*</font> Class of Business:&nbsp;<br></font>
		<input type="radio" name="business_class" value="proprietorship" {if $valid.business_class=='proprietorship'}checked{/if}>Proprietorship&nbsp;
 		<input type="radio" name="business_class" value="partnership" {if $valid.business_class=='partnership'}checked{/if}>Partnership&nbsp;
		<input type="radio" name="business_class" value="corporation" {if $valid.business_class=='corporation'}checked{/if}>Corporation&nbsp;
			</td>
   </tr>
	 <tr valign="top">
	    <td {if $valid.return and $valid.corp_name == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
	 	<font class="smalltext"><font color="#FF0000">*</font> Corporation Name:&nbsp;<br></font>
		<input type="text" name="corp_name" value="{$valid.corp_name}" size="30" maxlength="50" class="formtext">
		</td>
		<td {if $valid.return and $valid.fed_tax_id == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
		<font class="smalltext"><font color="#FF0000">*</font> State Resale Tax Number:&nbsp;<br></font>
		<input type="text" name="fed_tax_id" value="{$valid.fed_tax_id}" size="15" maxlength="50" class="formtext">
  		</td>
   </tr>
	 <tr valign="top">
	    <td class="smalltext">
	        <font class="smalltext">New Owner:&nbsp;<br></font>
		<input type="checkbox" name="new_owner" value="1" {if $valid.new_owner == '1'}checked{/if}>&nbsp;Check if yes.
	    </td>
	    <td>
		<font class="smalltext">Purchase Date:&nbsp;<br></font>
		<input type="text" name="purchase_date" value="{$valid.purchase_date}" size="15" maxlength="50" class="formtext">
	    </td>
   </tr>
	 <tr>
	    <td colspan="2">
		<font class="smalltext">Length of Time in Business:&nbsp;</font>
		<input type="text" name="business_length" value="{$valid.business_length}" size="3" maxlength="5" class="formtext">
 		<font class="smalltext">&nbsp;year(s)</font>
	    </td>
   </tr>
	 <tr>
	        <td colspan="2" {if $valid.return and $valid.business_year == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if} class="smalltext">
		<font class="smalltext"><font color="#FF0000">*</font> Business Year:&nbsp;<br></font>
		<input type="radio" name="business_year" value="seasonal" {if $valid.business_year=='seasonal'}checked{/if}>Seasonal&nbsp;
		<input type="radio" name="business_year" value="year round" {if $valid.business_year=='year round'}checked{/if}>Year Round&nbsp;
      </td>
   </tr>
	 <tr>
	        <td {if $valid.return and $valid.business_type == '' and $valid.business_type_other == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if} class="smalltext">
                {if $valid.return}
                   {foreach from=$valid.business_type item=type}
                   {if $type == 'Gourmet Food Store'}{assign var="gourmet" value="1"}{/if}
                   {if $type == 'Department Store'}{assign var="department" value="1"}{/if}
                   {if $type == 'Baskets'}{assign var="basket" value="1"}{/if}
                   {if $type == 'Restaurant/Caterer'}{assign var="restaurant" value="1"}{/if}
                   {if $type == 'Gift Shop'}{assign var="giftshop" value="1"}{/if}
                   {/foreach}
                 {/if}
		<font class="smalltext"><font color="#FF0000">*</font> Type of Business:&nbsp;<br></font>
		<input type="checkbox" name="business_type[]" value="Gourmet Food Store" {if $gourmet}checked{/if}>Gourmet Food Store&nbsp;<br>
 		<input type="checkbox" name="business_type[]" value="Department Store" {if $department}checked{/if}>Department Store&nbsp;<br>
		<input type="checkbox" name="business_type[]" value="Baskets" {if $basket}checked{/if}>Baskets&nbsp;<br>
		</td>
		  <td {if $valid.return and $valid.business_type == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if} class="smalltext">
		<font class="smalltext">&nbsp;<br></font>
		<input type="checkbox" name="business_type[]" value="Restaurant/Caterer" {if $restaurant}checked{/if}>Restaurant/Caterer&nbsp;<br>
		<input type="checkbox" name="business_type[]" value="Gift Shop" {if $giftshop}checked{/if}>Gift Shop&nbsp;<br>
		Other:&nbsp;<input type="text" name="business_type_other" value="{$valid.business_type_other}" size="10" maxlength="50" class="formtext">
      </td>
   </tr>
	 <tr>
	<th colspan="2" align="left">
	 Comments
	</th>
   </tr>
	 <tr>
	<td colspan="2">
	 <textarea name="comments" cols="50" rows="8" wrap="virtual">{$valid.comments}</textarea>
	</td>
	 </tr>
	 <tr bgcolor="{#bgcolor_left_nav#}">
      <th colspan="2" align="left">
      Account Information
      </th>
	 </tr>
	 <tr>
	<td colspan="2" {if $valid.return and $valid.payment_type == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if} class="smalltext">
	 <font class="smalltext"><font color="#FF0000">*</font> Term Requested:&nbsp;<br></font>
	 <input type="radio" name="payment_type" value="credit_card" {if $valid.payment_type=='credit_card'}checked{/if}>Credit Card&nbsp;
  	<input type="radio" name="payment_type" value="po_number" {if $valid.payment_type=='po_number'}checked{/if}>Net 15&nbsp;
	</td>
   </tr>
	 <tr>
	    <td colspan="2" {if $valid.return and $valid.password == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
	 <font class="smalltext"><font color="#FF0000">*</font> Requested Password:&nbsp;<br></font>
	<input type="password" name="password" value="" size="10" maxlength="50" class="formtext">
      </td>
   </tr>

{if $use_captcha}
  <tr>
    <td class="normaltext" align="right" valign="top" {if $valid.return} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
     {if !$smarty.session.mobile}
      {if $captcha_method == '2'}
       <font color="#ff0000">*</font> Verification:
      {else}
       <font color="#ff0000">*</font> Type image characters:
      {/if}
     {/if}
    </td>
    <td align="left" class="normaltext" {if $valid.return} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      {if $captcha_method == '2'}
        <script type="text/javascript" src="//www.google.com/recaptcha/api/challenge?k={$recaptcha_key}"></script>
        <noscript>
          <iframe src="//www.google.com/recaptcha/api/noscript?k={$recaptcha_key}" height="300" width="500" frameborder="0"></iframe>
          <br />
          <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
          <input type="hidden" name="recaptcha_response_field" value="manual_challenge" />
        </noscript>
      {else}
        <input type="text" name="captcha_test" class="formtext"/>
      {/if}
    </td>
  </tr>
  {if $captcha_method == '1'}
    <tr>
      <td class="normaltext" align="right">
       
      </td>
      <td align="left" class="normaltext">
        <img src="/get_captcha_image"/>
      </td>
    </tr>
  {/if}
{/if}

	<tr valign="top">
	<td class="smalltext" colspan="2" style="padding-top:10px;">
	<input type="submit" name="submit" value="Register" class="addtocart_btn btnstyle1">
	 </td>
   </tr>
</table>
</form>
*}

{include file="_bottom.tpl"}
