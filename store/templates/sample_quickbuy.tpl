{include file="_top.tpl"}
<form method="post" action="index.php" name="ship_form">
<input type="hidden" name="action" value="QuickBuy">
<input type="hidden" name="3phone" value="y">
<input type="hidden" name="redirect" value="quickbuy_thanks">
<center>
<table border="0" cellspacing="0" cellpadding="4" width="85%" style="text-align: left;">
<tr>
      <td align="center" colspan="2">
         <span class='emphred'>Mailing Address</span>
      </td>
   </tr>
   <tr {if $valid.return and $valid.shipping_first_name == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   First Name:
			</td>
			<td class="formtext">
			   <input type="text" name="shipping_first_name" value="{$valid.shipping_first_name}" size="35">
			</td>
	 </tr>
   <tr {if $valid.return and $valid.shipping_last_name == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   Last Name:
			</td>
			<td class="formtext">
			   <input type="text" name="shipping_last_name" value="{$valid.shipping_last_name}" size="35">
			</td>
	 </tr>
   <tr valign="top">
      <td align="right" class="formtext">Title:&nbsp;</td>
      <td class="formtext">
         <input type="text" name="shipping_title" value="{$valid.shipping_title}" size="35" maxlength="50">
      </td>
   </tr>
   <tr valign="top">
      <td align="right" class="formtext">Company:&nbsp;</td>
      <td class="formtext">
         <input type="text" name="shipping_company" value="{$valid.shipping_company}" size="35" maxlength="50">
      </td>
   </tr>
   <tr {if $valid.return and $valid.shipping_address1== ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   Street Address: 
			</td>
			<td class="formtext">
			   <input type="text" name="shipping_address1" value="{$valid.shipping_address1}" size="35">
			</td>
	 </tr>
   <tr>
      <td class="formtext" width="40%" align="right">
			   &nbsp;
			</td>
			<td class="formtext">
			   <input type="text" name="shipping_address2" value="{$valid.shipping_address2}" size="35">
			</td>
	 </tr>
   <tr {if $valid.return and $valid.shipping_city == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   City:
			</td>
			<td class="formtext">
			   <input type="text" name="shipping_city" value="{$valid.shipping_city}" size="35">
			</td>
	 </tr>
   <tr {if $valid.return and $valid.shipping_state == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   State:
			</td>
			<td class="formtext">
         <select name="shipping_state" class="formtext">
            {html_options options=$options.state selected=$valid.shipping_state}
         </select>
			</td>
	 </tr>
   <tr {if $valid.return and $valid.shipping_zip == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   Zip Code:
			</td>
			<td class="formtext">
			   <input type="text" name="shipping_zip" value="{$valid.shipping_zip}" size="10">
			</td>
	 </tr>
   <tr {if $valid.return and $valid.badphone == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   Phone Number:
			</td>
			<td class="formtext">
			   <input type="text" name="phone1" value="{$valid.phone1}" size="3" maxlength="3" onkeyup="javascript:fieldAdvance2(this,'phone2',3)"> -
                           <input type="text" name="phone2" value="{$valid.phone2}" size="3" maxlength="3" onkeyup="javascript:fieldAdvance2(this,'phone3',3)"> -
                           <input type="text" name="phone3" value="{$valid.phone3}" size="4" maxlength="4">
			</td>
	 </tr>
   <tr {if $valid.return and $valid.email == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   Email Address:
			</td>
			<td class="formtext">
			   <input type="text" name="email" value="{$valid.email}" size="35">
			</td>
	 </tr>
<tr>
    <td align="right" class="normaltext">
      Gift Message:<br /><span class="smalltext">(100 char. max)</span>
    </td>
    <td>
      <input type="text" name="gift_message" value="{$valid.gift_message}" size="30" maxlength="100" class="formtext">
    </td>
  </tr>
  <tr>
    <td align="right" class="normaltext">
      Gift Wrap?:&nbsp;<br />
    </td>
    <td>
      <input type="checkbox" name="wrap" {$valid.wrap}>
    </td>
  </tr>

   <tr>
      <td align="right" class="formtext">
        {* Shipping Method:&nbsp; *}
      </td>
      <td>
         <input type="hidden" name="ship_method" value="Ground">
      </td>
   </tr>

   <tr>
      <td class="formtext" width="40%" align="right">
			   &nbsp;
			</td>
			<td class="formtext">
			   &nbsp;
			</td>
	 </tr>
   <tr>
      <td align="center" colspan="2">
         <span class='emphred'>Billing Address</span>      </td>
   </tr>
   <tr>
      <td align="center" colspan="2" class="formtext">
			   <input type="checkbox" name="same" value="y" onClick="javascript:addressCopy2()"> Check if billing address is the same as shipping address.
      </td>
   </tr>
   <tr {if $valid.return and $valid.billing_first_name == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   First Name:
			</td>
			<td class="formtext">
			   <input type="text" name="billing_first_name" value="{$valid.billing_first_name}" size="35">
			</td>
	 </tr>
   <tr {if $valid.return and $valid.billing_last_name == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   Last Name:
			</td>
			<td class="formtext">
			   <input type="text" name="billing_last_name" value="{$valid.billing_last_name}" size="35">
			</td>
	 </tr>
   <tr valign="top">
      <td align="right" class="formtext">Title:&nbsp;</td>
      <td class="formtext">
         <input type="text" name="billing_title" value="{$valid.title}" size="35" maxlength="50">
      </td>
   </tr>
   <tr valign="top">
      <td align="right" class="formtext">Company:&nbsp;</td>
      <td class="formtext">
         <input type="text" name="billing_company" value="{$valid.company}" size="35" maxlength="50">
      </td>
   </tr>
   <tr {if $valid.return and $valid.billing_address1 == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   Street Address: 
			</td>
			<td class="formtext">
			   <input type="text" name="billing_address1" value="{$valid.billing_address1}" size="35">
			</td>
	 </tr>
   <tr>
      <td class="formtext" width="40%" align="right">
			   &nbsp;
			</td>
			<td class="formtext">
			   <input type="text" name="billing_address2" value="{$valid.billing_address2}" size="35">
			</td>
	 </tr>
   <tr {if $valid.return and $valid.billing_city == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   City:
			</td>
			<td class="formtext">
			   <input type="text" name="billing_city" value="{$valid.billing_city}" size="35">
			</td>
	 </tr>
   <tr {if $valid.return and $valid.billing_state == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   State:
			</td>
			<td class="formtext">
         <select name="billing_state" class="formtext">
            {html_options options=$options.state selected=$valid.billing_state}
         </select>
			</td>
	 </tr>
   <tr {if $valid.return and $valid.billing_zip == ''} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
      <td class="formtext" width="40%" align="right">
			   Zip Code:
			</td>
			<td class="formtext">
			   <input type="text" name="billing_zip" value="{$valid.billing_zip}" size="10">
			</td>
	 </tr>
   <tr>
      <td align="center" colspan="2">
         &nbsp; 
      </td>
   </tr>
   <tr>
      <td align="center" colspan="2">
      </td>
   </tr>
   <tr>
      <td align="center" colspan="2">
         &nbsp; 
      </td>
   </tr>
   <tr>
      <td align="center" colspan="2">
         <span class='emphred'>Payment Information</span>
      </td>
   </tr>
<tr>
    <td align="right">
      Payment Method: &nbsp;
    </td>
    {assign var="cnt" value=$settings.payment_methods|@count}
    {if $settings.payment_members_only and $is_member != 'y'}
      {assign var="cnt" value="1"}
    {/if}
    {if $cnt > 1}
    <td>
      <select name="payment_method" class="formtext" onChange="paymentMethod(this.value);">
        <option value="">Choose Method</option>
        {foreach from=$settings.payment_methods key=key item=method}
           {if $method == 'creditcard'}
             {assign var="printcreditcard" value="y"}
           {elseif $method == 'purchaseorder'}
             {assign var="printpurchaseorder" value="y"}
           {elseif $method == 'giftcertificate'}
             {assign var="printgiftcertificate" value="y"}
           {/if}
           <option value="{$method}" {if $valid.payment_method == $method}selected{/if}>{$options.payment_methods.$method}</option>
        {/foreach}
      </select>
    </td>
      {else}
    <td class="normaltext">
        {if $settings.payment_members_only}
          {assign var="meth" value='creditcard'}
        {else}
          {assign var="meth" value=$settings.payment_methods.0}
        {/if}
        {$options.payment_methods.$meth}
        <input type="hidden" name="payment_method" value="{$meth}">
        {if $meth == 'creditcard'}
          {assign var="printcreditcard" value="y"}
        {elseif $meth == 'purchaseorder'}
          {assign var="printpurchaseorder" value="y"}
        {elseif $meth == 'giftcertificate'}
          {assign var="printgiftcertificate" value="y"}
        {/if}
    </td>
      {/if}
  </tr>
{if $printcreditcard == 'y'}
  <tr {if $valid.return and $valid.is_valid.ccname == 'n'} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
    <td align="right">
      Name on Card:&nbsp;
    </td>
    <td>
      <input type="text" name="ccname" value="{$valid.ccname}" size="30" maxlength="50" class="formtext" {if $cnt != '1' and (!$valid.return or $valid.payment_method != 'creditcard')}disabled{/if}>
    </td>
  </tr>
  <tr {if $valid.return and $valid.is_valid.cctype == 'n'} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
    <td align="right">
      Card Type:&nbsp;
    </td>
    <td>
      <select name="cctype" class="formtext" {if $cnt != '1' and (!$valid.return or $valid.payment_method != 'creditcard')}disabled{/if}>
        {html_options options=$options.cctype selected=$valid.cctype}
      </select>
    </td>
  </tr>
  <tr {if $valid.return and $valid.is_valid.cvv2 == 'n'} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
    <td align="right">
      Card Number:&nbsp;
    </td>
    <td>
      <input type="text" name="ccnum" value="" size="30" maxlength="50" class="formtext" {if $cnt != '1' and (!$valid.return or $valid.payment_method != 'creditcard')}disabled{/if}>
    </td>
  </tr>
                                                                                
{* CVV2 is an optional field. In order to make it required set the hidden field cvv2_req = y and remove the comment delimiters ("{*" and "* }") from the code. If you do not want to include this field you may delete it from the template. *}                                                                                
{*
  <tr {if $valid.return and $valid.is_valid.cvv2 == 'n'} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
    <td align="right">
      CVV2:&nbsp;
    </td>
    <td>
      <input type="text" name="cvv2" size="4" maxlength="4" {if $cnt != '1' and (!$valid.return or $valid.payment_method != 'creditcard')}disabled{/if}>
      <input type="hidden" name="req_cvv2" value="y">
    </td>
  </tr>
*}

                                                                                
{* End CVV2 *}
                                                                                
  <tr {if $valid.return and ($valid.is_valid.expy == 'n' or $valid.is_valid.expm == 'n')} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
    <td align="right">
      Card Expiration Date:&nbsp;
    </td>
    <td>
      <select name="ccexpm" class="formtext" {if $cnt != '1' and (!$valid.return or $valid.payment_method != 'creditcard')}disabled{/if}>
        {html_options options=$options.ccexpm selected=$valid.ccexpm}
      </select>
      <select name="ccexpy" class="formtext" {if $cnt != '1' and (!$valid.return or $valid.payment_method != 'creditcard')}disabled{/if}>
        {html_options options=$options.ccexpy selected=$valid.ccexpy}
      </select>
    </td>
  </tr>
{/if}
{if $printpurchaseorder == 'y'}
  <tr {if $valid.return and $valid.is_valid.purchase_order == 'n'} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn" {/if}>
    <td align="right">
      Purchase Order Number:&nbsp;
    </td>
    <td>
      <input type="text" name="purchase_order" value="{$valid.purchase_order}" size="30" maxlength="50" class="formtext" {if $cnt != '1' and (!$valid.return or $valid.payment_method != 'purchaseorder')}disabled{/if}>
    </td>
  </tr>
{/if}
{if $printgiftcertificate == 'y'}
  <tr>
    <td align="right" class="normaltext">
      <font color="#FF0000">*</font> Gift Certificate Code: 
    </td>
    <td>
      <input type="text" name="gift_certificate" value="{$valid.gift_certificate}" size="30" maxlength="50" class="formtext" {if $cnt != '1' and (!$valid.return or $valid.payment_method != 'giftcertificate')}style="background: #EEE;" disabled{/if}>{if $valid.return and $valid.is_valid.gift_certificate == 'n'} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>
{/if}
  <tr valign="top">
    <td align="center" colspan="2">
      &nbsp;
    </td>
  </tr>
  <tr valign="top">
    <td align="center" colspan="2">
      <input type="hidden" id="print_cc" name="print_cc" value="{$printcreditcard}">
      <input type="hidden" id="print_po" name="print_po" value="{$printpurchaseorder}">
      <input type="hidden" id="print_gc" name="print_gc" value="{$printgiftcertificate}">
      <input type="hidden" name="product" value="33">
      <input type="submit" name="submit" value="Continue"  class="addtocart_btn btnstyle1">
    </td>
  </tr>
</table>

{include file="_bottom.tpl"}
