{include file="_top.tpl"}

<h3>Shipping Information</h3>
<br />
<span class="normaltext"><font color="#FF0000">You have {$totals.qty} product(s) in your cart.</font><br>

<font color="#FF0000">*</font> Indicates a required field</span>

{if $valid.return == "1"}
<br><div align="center" class="normaltext"><b>There has been an error. Please double check any fields that show an '<font color="#ff0000">X</font>'<br /><span style="color: red;">{$error}</span></b></div><br>
{/if}

<form method="post" name="ship_form" action="index.php" name="checkout">
<input type="hidden" name="action" value="CheckoutShippingInfo">
<input type="hidden" name="req_s_phone" value="n">

<table width="100%" border="0" cellspacing="0" cellpadding="3" id="checkoutPanel">

  <tr>
    <td colspan="2" align="center" class="largetext">
      <b>Customer Information:</b>
    </td>
  </tr>
{if $settings.amazon_checkout != 'y' || !isset($smarty.session.amazon_id)}
  <tr>
    <td class="normaltext" align="right" width="40%">
      <font color="#FF0000">*</font> First Name:
    </td>
    <td>
      <input type="text" name="first_name" value="{$valid.first_name}" size="20" maxlength="50" class="formtext">{if $valid.return and $valid.first_name == ''} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>
  <tr>
    <td align="right" class="normaltext" >
      <font color="#FF0000">*</font> Last Name:
    </td>
    <td>
      <input type="text" name="last_name" value="{$valid.last_name}" size="20" maxlength="50" class="formtext">{if $valid.return and $valid.last_name == ''} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>
  <tr>
    <td class="normaltext" align="right" width="40%">
      Title:
    </td>
    <td>
      <input type="text" name="title" value="{$valid.title}" size="20" maxlength="50" class="formtext">
    </td>
  </tr>
  <tr>
    <td class="normaltext" align="right" width="40%">
      Company:
    </td>
    <td>
      <input type="text" name="company" value="{$valid.company}" size="20" maxlength="50" class="formtext">
    </td>
  </tr>
{/if}
  <tr>
    <td align="right" class="normaltext">
      <font color="#FF0000">*</font> Your Email:
    </td>
    <td>
      <input type="text" name="email" value="{$valid.email}" size="30" maxlength="50" class="formtext">{if $valid.return and  $valid.email == ''} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>
{if $settings.amazon_checkout != 'y' || !isset($smarty.session.amazon_id)}
  <tr>
    <td align="right" class="normaltext" >
      <font color="#FF0000">*</font> Phone Number:
    </td>
    <td>
      <input type="text" name="phone" value="{$valid.phone}" size="20" maxlength="50" class="formtext">{if $valid.return and $valid.phone == ''} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>
{/if}
  <tr>
    <td align="right" class="normaltext">
      <input type="checkbox" name="optin" value="y"{if $valid.optin == "y"} checked{/if}/>
    </td>
    <td class="normaltext">
      Please do not e-mail me information.
    </td>
  </tr>
  <tr>
    <td align="right">
      <input type="checkbox" name="cat_opt_out" value="y"{if $valid.cat_opt_out == 'y'} checked{/if}>
    </td>
    <td class="normaltext">
      Please do not mail me information.
    </td>
  </tr>
  <tr>
    <td align="right">
      &nbsp;
    </td>
    <td>
      &nbsp;
    </td>
  </tr>


{counter start=0 assign=num}
  {section name=ship loop=$ship_num}
    {counter}
{if $settings.amazon_checkout != 'y' || !isset($smarty.session.amazon_id)}
{if $num > 1}<tr><td colspan="2"><hr noShade size="1" width="75%"></td></tr>{/if}

  <tr>
    <td colspan="2" align="center" class="largetext">
      <b>Shipping Information:</b>
    </td>
  </tr>
 {if $wishlist != ''}
  <tr>
    <td align="right" class="normaltext">
      Select Wishlist Recipient:
    </td>
    <td>
      <select name="choose_wishlist{$num}" class="formtext" onChange="javascript:use_wishlist('{$num}','choose_wishlist{$num}');">
          <option label="Choose Ship-to" value="--">Choose Ship-to</option>
        {foreach from=$wishlist key=key item=wl}
          <option label="{$wl.first_name|ucfirst} {$wl.last_name|ucfirst}" value="{$key}">{$wl.first_name|ucfirst} {$wl.last_name|ucfirst}</option>
        {/foreach}
      </select>
      <span class="normaltext">OR</span>
    </td>
  </tr>
  {/if}

 {if $is_member == 'y' && $alias_options.count > 1}

  <tr>
    <td align="right" class="normaltext">
      Select Address:
    </td>
    <td>
      <select name="choose_alias{$num}" class="formtext" onChange="javascript:use_alias('{$num}','choose_alias{$num}');">
        {html_options options=$alias_options.options}
      </select>
      <span class="normaltext">OR</span>
    </td>
  </tr>
  <tr>
    <td align="right" class="normaltext">
      Save Address as:
    </td>
    <td>
      <input type="text" name="new_alias{$num}" class="formtext" size="20">
    </td>
  </tr>

    {/if}

  <tr>
    <td width="40%" align="right" class="normaltext">
      <font color="#FF0000">*</font> First Name:
    </td>
    <td width="60%">
      <input type="hidden" name="alias{$num}" value="{$valid.alias.$num}">
      <input type="text" name="s_firstname{$num}" value="{$valid.s_firstname.$num}" size="30" maxlength="50" class="formtext">{if $valid.return and  $valid.s_firstname.$num == ''} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>
  <tr>
    <td align="right" class="normaltext">
      <font color="#FF0000">*</font> Last Name:
    </td>
    <td>
      <input type="text" name="s_lastname{$num}" value="{$valid.s_lastname.$num}" size="30" maxlength="50" class="formtext">{if $valid.return and  $valid.s_lastname.$num == ''} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>


  <tr>
    <td align="right" class="normaltext">
      Title:
    </td>
    <td>
      <input type="text" name="s_title{$num}" value="{$valid.s_title.$num}" size="30" maxlength="50" class="formtext">
    </td>
  </tr>
  <tr>
    <td align="right" class="normaltext">
      Company:
    </td>
    <td>
      <input type="text" name="s_company{$num}" value="{$valid.s_company.$num}" size="30" maxlength="50" class="formtext">
    </td>
  </tr>
  <tr>
    <td align="right" class="normaltext">
      <font color="#FF0000">*</font> Shipping Address:
      <input type="hidden" name="uship_id{$num}" value="">
    </td>
    <td>
      <input type="text" name="s_address1{$num}" value="{$valid.s_address1.$num}" size="30" maxlength="50" class="formtext">{if $valid.return and  $valid.s_address1.$num == ''} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>
  <tr>
    <td align="right">
      &nbsp;
    </td>
    <td>
      <input type="text" name="s_address2{$num}" value="{$valid.s_address2.$num}" size="30" maxlength="50" class="formtext">
    </td>
  </tr>
  <tr>
    <td align="right" class="normaltext">
      <font color="#FF0000">*</font> City:
    </td>
    <td>
      <input type="text" name="s_city{$num}" value="{$valid.s_city.$num}" size="30" maxlength="50" class="formtext">{if $valid.return and  $valid.s_city.$num == ''} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>

    {if $uk != 'y'}

  <tr {if  $valid.return and $valid.s_state.$num == ''} id="checkoutPanelWarning" {/if}>
    <td align="right" class="normaltext">
      <font color="#FF0000">*</font> State/Province:
    </td>
    <td>
      <select name="s_state{$num}" class="formtext">
        {html_options options=$options.state selected=$valid.s_state.$num}
      </select>
    </td>
  </tr>
  <tr>
    <td align="right" class="normaltext">
      <font color="#FF0000">*</font> Postal Code:
    </td>
    <td>
      <input type="text" name="s_zip{$num}" value="{$valid.s_zip.$num}" size="15" maxlength="15" class="formtext">{if $valid.return and  $valid.s_zip.$num == ''} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>
  <tr {if  $valid.return and $valid.s_country.$num == ''} id="checkoutPanelWarning" {/if}>
    <td align="right" class="normaltext">
      <font color="#FF0000">*</font> Country:
    </td>
    <td>
      <select name="s_country{$num}" class="formtext">
        {html_options options=$options.country selected=$valid.s_country.$num}
      </select>
    </td>
  </tr>

{else}
{* for uk *}
  <tr>
    <td align="right" class="normaltext" valign="top">
      <font color="#CC0000">*</font> Shipping Type:
    </td>
    <td align="left" class="formtext">
      <input type="radio" name="shipping_type{$num}" id="shipType{$num}d" value="dom" onMouseUp="javascript: setShipType(this,'shipping','{$num}');" /> Domestic (U.S.A.)<br />
      <input type="radio" name="shipping_type{$num}" id="shipType{$num}i" value="int" onMouseUp="javascript: setShipType(this,'shipping','{$num}');" /> International
    </td>
  </tr>
  <tr valign="top">
    <td align="right" class="normaltext" id="stateCaption{$num}"></td>
    <td align="left" id="stateField{$num}"></td>
  </tr>
  <tr valign="top">
    <td align="right" class="normaltext" id="countryCaption{$num}"></td>
    <td id="countryField{$num}"></td>
  </tr>
  <tr valign="top">
    <td align="right" class="normaltext" id="zipCaption{$num}"></td>
    <td id="zipField{$num}"></td>
  </tr>
  {if $valid.s_country.$num == 'United States'}
   <script type="text/javascript">
     var item = document.getElementById('shipType{$num}d');
     setShipType(item,'shipping','{$num}','{$valid.s_country.$num}','{$valid.s_state.$num}','{$valid.s_zip.$num}');
   </script>
  {elseif $valid.return}
   <script type="text/javascript">
     var item = document.getElementById('shipType{$num}i');
     setShipType(item,'shipping','{$num}','{$valid.s_country.$num}','{$valid.s_state.$num}','{$valid.s_zip.$num}');
   </script>
  {/if}
{/if}
{if $address_code.$num && $valid.return == 'y'}
  <tr class="sectionHeader">
    <td align="right" class="normaltext">
      <input type="checkbox" name="s_noconfirm{$num}" value="y" />
    </td>
    <td class="normaltext">
      This address is a valid address and does not need confirmation.
    </td>
  </tr>
{/if}
  <tr>
    <td align="right" class="normaltext">
      {* set the hidden "req_s_phone" field to "y" and
         uncomment the code below to require this field *}
      {*<font color="#FF0000">*</font>*} Ship Phone:
    </td>
    <td>
      <input type="text" name="s_phone{$num}" value="{$valid.s_phone.$num}" class="formtext">
      {*{if $valid.return and  $valid.s_phone.$num == ''} <font color="#ff0000"><b>X</b></font> {/if}*}
    </td>
  </tr>
  <tr>
    <td align="right" class="normaltext">
      Ship Email:
    </td>
    <td>
      <input type="text" name="s_email{$num}" value="{$valid.s_email.$num}" class="formtext">
    </td>
  </tr>
  <tr>
    <td align="right">
      <input type="checkbox" name="s_email_send{$num}" value="y"{if $valid.s_email_send.$num == 'y'} checked="checked"{/if} class="formtext" />
    </td>
    <td align="left" class="normaltext">
      Email notification of this order to this email address.
     </td>
   </tr>
{else}
  <tr>
    <td colspan="2" class="normaltext" align="center">
      <script type="text/javascript" src="https://static-na.payments-amazon.com/cba/js/us/PaymentWidgets.js"></script>
      {if $product_mapping != 'add_cart'}
       {assign var="destination" value="Recipient_"|cat:$options.ship_num.$num}
      {else}
        {assign var="destination" value=$recipient_mappings.$num|replace:" ":"_"}
      {/if}
      {include file="amazon_checkout.tpl" destination=$destination num=$num}
    </td>
  </tr>
{/if}
  <tr>
    <td align="right" class="normaltext">
      Gift Message:<br /><span class="smalltext">(100 char. max)</span>
    </td>
    <td>
      <input type="text" name="gift_message{$num}" value="{$valid.gift_message.$num}" size="30" maxlength="100" class="formtext">
    </td>
  </tr>

{*
  <tr>
    <td align="right" class="normaltext">
      Gift Wrap?:&nbsp;<br />($4.00 charge per address)
    </td>
    <td>
      <input type="checkbox" name="wrap{$num}" {$valid.wrap.$num}>
    </td>
  </tr>
*}

    {if $shipping_disclaimer != ''}

  <tr>
    <td colspan="2" class="normaltext" align="center">
hey
      {$shipping_disclaimer}
    </td>
    <td>
      &nbsp;
    </td>
  </tr>

    {/if}
    {if $valid.s_method.$num == '' && $options.shipping.count > 1}

  <tr>
    <td align="right" class="normaltext">
      Shipping Method:
    </td>
    <td>
      <select name="s_method{$num}" class="formtext">
        {html_options options=$options.shipping.method selected=$valid.s_method.$num}
      </select>
    </td>
  </tr>

    {else}
     {assign var="print_method" value="y"}
    {/if}

  <tr>
    <td align="right" class="normaltext" colspan="2">
      &nbsp;
      {if $print_method == 'y' && $valid.s_method.$num != ''}
        <input type="hidden" name="s_method{$num}" value="{$valid.s_method.$num}">
      {elseif $print_method == 'y'}
        <input type="hidden" name="s_method{$num}" value="{$options.shipping.name}">
      {/if}
    </td>
  </tr>

{/section}

{if $num > 1}<tr><td colspan="2"><hr noShade size="1" width="75%"></td></tr>{/if}

  <tr>
    <td align="right">
      &nbsp;
      <!--<input type="submit" name="submit" value="Cancel">-->
    </td>
    <td>
      <input type="submit" name="submit" value="Continue >" class="addtocart_btn btnstyle1">
    </td>
  </tr>
</table>
</form>
{include file="_bottom.tpl"}
