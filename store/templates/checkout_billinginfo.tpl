{include file="_top.tpl"}

<h3>Confirm Order Information</h3>
<br />
<div class="normaltext"><font color="#FF0000">*</font> Indicates a required field</div>

{if $valid.return == "1"}
<br><div align="center" class="normaltext"><b>There has been an error. Please double check any fields that show an '<font color="#ff0000">X</font>'</b></div><br>
{/if}
{if $gateway_response != ""}
<br><div align="center" class="normaltext"><b><font color="#ff0000">There was an error processing your card: {$gateway_response}</font></b></div><br>
{elseif $error != ""}
<div align="center" class="normaltext"><b><font color="#ff0000">{$error}</font></b></div><br>
{/if}

{if $messages != ''}
<br />
<div id="cartHelpText">
  <b>Note:</b><br />
  {foreach from=$messages item=msg}
    <b>&#149;&nbsp;{$msg}</b><br />
  {/foreach}
</div>
{/if}

<form method="post" action="index.php" name="ship_form"> 
<input type="hidden" name="action" value="CheckoutBillingInfo">
<table width="80%" border="0" cellspacing="0" cellpadding="3" id="checkoutPanel" align="center">
  <tr id="checkoutPanelBar">
    <th align="left" colspan="2"> 
      &nbsp;Customer Information
    </th>
  </tr>
{if $settings.amazon_checkout != 'y' || !isset($smarty.session.amazon_id)}
  <tr>
    <td width="30%" class="normaltext">
      Name:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.billing.first_name} {$info.billing.last_name}
    </td>
  </tr>
  {if $info.billing.title != ''}
  <tr>
    <td width="30%" class="normaltext">
      Title:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.billing.title}
    </td>
  </tr>
  {/if}
  {if $info.billing.company != ''}
  <tr>
    <td width="30%" class="normaltext">
      Company:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.billing.company}
    </td>
  </tr>
  {/if}
{/if}
  <tr>
    <td width="30%" class="normaltext">
      Email:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.billing.email}
    </td>
  </tr>
{if $settings.amazon_checkout != 'y' || !isset($smarty.session.amazon_id)}
  <tr>
    <td width="30%" class="normaltext">
      Phone:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.billing.phone}
    </td>
  </tr>
{/if}
  <tr>
    <td class="normaltext" colspan="2">
      &nbsp;
    </td>
  </tr>
  <tr id="checkoutPanelBar">
    <th align="left" colspan="2"> 
      &nbsp;Shipping Information
    </th>
  </tr>
  <tr>
    <td width="30%" class="normaltext">
      Name:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.shipping.0.s_firstname} {$info.shipping.0.s_lastname}
    </td>
  </tr>
  {if $info.shipping.0.s_title != ''}
  <tr>
    <td width="30%" class="normaltext">
      Company:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.shipping.0.s_title}
    </td>
  </tr>
  {/if}
  {if $info.shipping.0.s_company != ''}
  <tr>
    <td width="30%" class="normaltext">
      Company:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.shipping.0.s_company}
    </td>
  </tr>
  {/if}
{if $settings.amazon_checkout != 'y' || !isset($smarty.session.amazon_id)}
  <tr>
    <td width="30%" class="normaltext" valign="top">
      Address:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.shipping.0.s_address1}<br />
      {if $info.shipping.0.s_address2 != ''}
        {$info.shipping.0.s_address2}<br />
      {/if}
      {$info.shipping.0.s_city}, {$info.shipping.0.s_state} {$info.shipping.0.s_zip}
    </td>
  </tr>
{/if}
  <tr>
    <td width="30%" class="normaltext">
      Country:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.shipping.0.s_country}
    </td>
  </tr>
  {if $info.shipping.0.s_phone != ''}
  <tr>
    <td width="30%" class="normaltext">
      Ship Phone:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.shipping.0.s_phone}
    </td>
  </tr>
  {/if}

  {if $info.shipping.0.s_email != ''}
  <tr>
    <td width="30%" class="normaltext">
      Ship Email:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.shipping.0.s_email}
    </td>
  </tr>
  {/if}
  {if $info.shipping.0.gift_message != ''}
  <tr>
    <td width="30%" class="normaltext">
      Gift Message:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.shipping.0.gift_message}
    </td>
  </tr>
  {/if}
  <tr>
    <td width="30%" class="normaltext">
      Shipping Method:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.shipping.0.s_method}
    </td>
  </tr>
  <tr>
    <td width="30%" class="normaltext">
      Requested Ship Date:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$info.shipping.0.s_shipon}
    </td>
  </tr>
{if $settings.ups_time_in_transit == 'y' && isset($transit_time.0.arrival_date)}
  <tr>
    <td width="30%" class="normaltext">
      Transit Time:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$transit_time.0.transit_days} Business Day{if $transit_time.0.transit_days > 1}s{/if}
    </td>
  </tr>
  <tr>
    <td width="30%" class="normaltext">
      Estimated Arrival:&nbsp;
    </td>
    <td width="70%" class="normaltext">
      {$transit_time.0.arrival_date|date_format:"%B %e"}
    </td>
  </tr>
{/if}


  <tr>
    <td class="normaltext" colspan="2">
      &nbsp;
    </td>
  </tr>
  <tr id="checkoutPanelBar">
    <th align="left" colspan="2"> 
      &nbsp;Payment Information
    </th>
  </tr>
  <tr>
    <td colspan="2" align="left">
      {include file="payment_block.tpl"}
    </td>
  </tr>
{if $settings.amazon_checkout != 'y' || !isset($smarty.session.amazon_id)}
  <tr>
    <td class="normaltext" colspan="2">
      <input type="checkbox" name="diff_bill" onChange="toggle('bill_info');"> Check here if your billing address is different from your shipping address.
    </td>
  </tr>
{/if}
  <tr>
   <td colspan="2">
    <div id="bill_info" style="display:none">
    <table width="100%" border="0" cellspacing="0" cellpadding="3" align="center">

  <tr>
    <td align="left" class="normaltext">
      <font color="#FF0000">*</font> Billing Address:&nbsp;
    </td>
    <td>
      <input type="text" name="billing_address1" value="{$valid.billing_address1}" size="30" maxlength="50" class="formtext">{if $valid.return and  $valid.billing_address1 == ''} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>
  <tr {if $valid.return and $valid.is_valid.billing_address2 == 'n'} id="checkoutPanelWarning" {else} id="checkoutPanelNoWarn"{/if}>
    <td align="left">
      &nbsp;
    </td>
    <td>
      <input type="text" name="billing_address2" value="{$valid.billing_address2}" size="30" maxlength="50" class="formtext">
    </td>
  </tr>
  <tr>
    <td align="left" class="normaltext">
      <font color="#FF0000">*</font> City:&nbsp;
    </td>
    <td>
      <input type="text" name="billing_city" value="{$valid.billing_city}" size="30" maxlength="50" class="formtext">{if $valid.return and  $valid.billing_city == ''} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>

{if $uk != 'y'}

  <tr id="checkoutPanelNoWarn">
    <td align="left" class="normaltext">
      <font color="#FF0000">*</font> State/Province:&nbsp;
    </td>
    <td>
      <select name="billing_state" class="formtext">
        {html_options options=$options.state selected=$valid.billing_state}
      </select>
    </td>
  </tr>
  <tr>
    <td align="left" class="normaltext">
      <font color="#FF0000">*</font> Postal Code:&nbsp;
    </td>
    <td>
      <input type="text" name="billing_zip" value="{$valid.billing_zip}" size="15" maxlength="30" class="formtext">{if $valid.return and  $valid.billing_zip == ''} <font color="#ff0000"><b>X</b></font> {/if}
    </td>
  </tr>
  <tr id="checkoutPanelNoWarn">
    <td align="left" class="normaltext">
      <font color="#FF0000">*</font> Country:&nbsp;
    </td>
    <td>
      <select name="billing_country" class="formtext">
        {html_options options=$options.country selected=$valid.billing_country}
      </select>
    </td>
  </tr>

{else}
  {* for uk *}
  <tr>
    <td class="normaltext">
      <font color="#CC0000">*</font> Shipping Type:
    </td>
    <td align="left" class="formtext">
      <input type="radio" name="shipping_type1" id="shipType1d" value="dom" onMouseUp="javascript: setShipType(this,'billing','1');" /> Domestic (U.S.A.)
      <input type="radio" name="shipping_type1" id="shipType1i" value="int" onMouseUp="javascript: setShipType(this,'billing','1');" /> International
    </td>
  </tr>
  <tr valign="top">
    <td class="normaltext" id="stateCaption1"></td>
    <td align="left" id="stateField1"></td>
  </tr>
  <tr valign="top">
    <td class="normaltext" id="countryCaption1"></td>
    <td id="countryField1"></td>
  </tr>
  <tr valign="top">
    <td class="normaltext" id="zipCaption1"></td>
    <td id="zipField1"></td>
  </tr>
  {if $valid.billing_country == 'United States'}
   <script type="text/javascript">
     var item = document.getElementById('shipType1d');
     setShipType(item,'billing','1','{$valid.billing_country}','{$valid.billing_state}','{$valid.billing_zip}');
   </script>
  {elseif $valid.return || $valid.billing_country != ''}
   <script type="text/javascript">
     var item = document.getElementById('shipType1i');
     setShipType(item,'billing','1','{$valid.billing_country}','{$valid.billing_state}','{$valid.billing_zip}');
   </script>
  {/if}
{/if}
  </table>
  </div>
  </td>
  </tr>
  <tr>
    <td colspan="2">
      &nbsp;
    </td>
  </tr>
  <tr id="checkoutPanelBar">
    <th align="left" colspan="2"> 
      Comments / Special Instructions
    </th>
  </tr>
  <tr>
    <td align="left" colspan="2"> 
      <textarea name="s_comments" class="formtext" cols="50" rows="5" wrap="virtual">{$valid.s_comments}</textarea><br><br>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      &nbsp;
    </td>
  </tr>
  <tr id="checkoutPanelBar">
    <th align="left" colspan="2"> 
      Shopping Cart
    </th>
  </tr>
  <tr>
    <td align="left" colspan="2"> 
      <table width="100%" border="0" cellspacing="0" align="center" style="border:1px solid black;">
        <tr id="checkoutPanelBar2">
          <th width="10%" align="center" style="background:#CCCCCC;color:black;border-bottom:1px solid black;">
            <b>Qty</b>
          </th>
          <th width="10%" align="center" style="background:#CCCCCC;color:black;border-bottom:1px solid black;">
            <b>Item #</b>
          </th>
          <th width="60%" align="left" style="background:#CCCCCC;color:black;border-bottom:1px solid black;">
            <b>Description</b>
          </th>
          <th width="20%" align="right" style="background:#CCCCCC;color:black;border-bottom:1px solid black;">
            <b>Price</b>
          </th>
        </tr>
        {foreach from=$info.shipping.0.prods item=prod}
        <tr valign="top" id="cartHelpText">
          <td align="center">
            {$prod.qty}
          </td>
          <td align="center">
            {if $prod.att_sku == ''}{$prod.sku}{else}{$prod.att_sku}{/if}
          </td>
          <td>
            {$prod.name}
            {foreach from=$prod.gifts item=gift}
              {if $gift != ''}
                <br />* {$gift}
              {/if}
            {/foreach}
            {if $prod.note != ''}
              <br />Note: {$prod.note}
            {/if}
            {if $prod.att_list != ''}
              {$prod.att_list}
            {/if}
            {if $prod.custom_form != ''}
              [<a href="#" onclick= "javascript:window.open('/custom_form_info/{$prod.cart_id}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">view details</a>]
            {/if}
          </td>
          <td align="right">
            {$currency_type}{$prod.price|commify}
          </td>
        </tr>
        {/foreach}
        <tr id="cartHelpText">
          <td align="right" colspan="4">
            <br /><b>Subtotal:</b> {$currency_type}{$order.totals.0.subtotal|commify}
            {if $order.totals.0.giftwrap != 0}
              <br /><b>Giftwrap:</b> {$currency_type}{$order.totals.0.giftwrap|commify}
            {/if}
            <br /><b>Shipping Rate:</b> {$currency_type}{$order.totals.0.shipping|commify}
            {if $order.totals.0.sgroupadd != 0}
              <br /><b>Additional Flat Shipping Rate:</b> {$curreny_type}{$order.totals.0.sgroupadd|commify}
            {/if}
            {foreach from=$order.totals.0.shippromo item=promo}
              {if $promo.type == '%'}
                <br /><b>Shipping Promo: </b>-{$currency_type}{$promo.deduction}
              {elseif $promo.type == '$'}
                <br /><b>Shipping Promo: </b>-{$currency_type}{$promo.deduction}
              {/if}
            {/foreach}
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr id="cartHelpText">
    <td align="right" colspan="2">
      <b>Subtotal:</b> {$currency_type}{$order.subtotal|commify}<br />
   {if $order.gifttotal != 0}
      <b>Giftwrap Total:</b> {$currency_type}{$order.gifttotal|commify}<br />
   {/if}
      {foreach from=$order.totalordpromo item=promo}
          {if $promo.type == '%'}
            <b>Promo Discount: </b> -{$currency_type}{$promo.deduction}<br />
          {elseif $promo.type == '$'}
            <b>Promo Discount: </b>-{$currency_type}{$promo.deduction}<br />
          {elseif $promo.type == 'freeprod'}
            <b>Free Product Discount ({$promo.prod_name}): </b>-{$currency_type}{$promo.deduction}<br />
          {/if}
       {/foreach}
      {foreach from=$order.totalordshippromo item=promo}
          {if $promo.type == '%'}
            <b>Shipping Discount: </b> -{$currency_type}{$promo.deduction}<br />
          {elseif $promo.type == '$'}
            <b>Shipping Discount: </b>-{$currency_type}{$promo.deduction}<br />
          {/if}
       {/foreach}
      <b>Shipping Total:</b> {$currency_type}{$order.shiptotal|commify}<br />

{if $order.sgroupadd != 0}
      <b>Additional Flat Shipping Total:</b> {$currency_type}{$order.sgroupadd}<br />
{/if}
{if $order.shipserviceadd != 0}
      <b>Shipping Adjustment:</b> {$currency_type}{$order.shipserviceadd}<br />
{/if}

      <b>Tax Total:</b> {$currency_type}{$order.taxtotal|commify}<br />
      <b>Grand Total:</b> {$currency_type}{$order.grandtotal|commify}
    </td>
  </tr>
  <tr>
    <td align="center">
      &nbsp;
    </td>
    <td style="padding-top:15px;">
      <input type="submit" name="submit_edit" value="Edit"  class="addtocart_btn btnstyle1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="hidden" id="print_cc" name="print_cc" value="{$printcreditcard}">
      <input type="hidden" id="print_po" name="print_po" value="{$printpurchaseorder}">
      <input type="hidden" id="print_gc" name="print_gc" value="{$printgiftcertificate}">
      <input type="submit" name="submit_continue" value="Submit Order" tabindex="1" class="addtocart_btn btnstyle1" id="continue_btn"{if $settings.amazon_checkout == 'y' && isset($smarty.session.amazon_id)} disabled{/if} />
    </td>
  </tr>

</table>
</form>

{include file="_bottom.tpl"}
