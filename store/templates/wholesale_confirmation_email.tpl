<html>
<head>
<title>Wholesale Order Confirmation</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<table width="500" border="0" align="center">
  <tr>
    <td colspan="2">
      {if $wholesale_confirmation_email != ''}
        {$wholesale_confirmation_email}
      {else}
        Thank you for ordering from {$co_name}.  Your order has been received. Below you will find details about your current order.  You may wish to print and save this confirmation for possible future reference.
      {/if}
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <br/><br/>
      <b><font size="+1">Order ID: {$wsorder_id}</font></b>
      <br/><br/>
    </td>
  </tr>
  <tr bgcolor="#cccccc">
    <td colspan="2">
      <b><font size="+1">Billing Information</font></b>
    </td>
  </tr>
  <tr>
    <td width="50%" valign="top">
      {$info.contact_first_name} {$info.contact_last_name}<br/>
      {$info.company_name}<br/>
      {$info.billing_address1}<br/>
      {if $info.billing_address2 != ''}
         {$info.billing_address2}<br/>
      {/if}
      {$info.billing_city}, {$info.billing_state} {$info.billing_zip}<br />
      {$info.billing_country}<br/>
      Comments: {$info.comments}<br/>
    </td>
    <td valign="top">
      Email: {$info.email}<br/>
      Phone: {$info.phone}<br/>
      Fax: {$info.fax}<br/><br/>
    </td>
  </tr>
  {if $info.payment_type == 'credit_card'}
    <tr bgcolor="#cccccc">
      <td colspan="2">
        <b><font size="+1">Credit Card Information</font></b>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        Name on Card: {$values.cc_name}<br/>
        Card Type: {$values.cc_type}<br/>
        Last Four Digits: {$values.last_four}<br/><br/>
      </td>
    </tr>
  {elseif $info.payment_type == 'po_number'}
    <tr bgcolor="#cccccc">
      <td colspan="2">
        <b><font size="+1">PO Information</font></b>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        PO Number: {$values.po_number}<br/>
      </td>
    </tr>
  {/if}
  <tr bgcolor="#cccccc">
    <td colspan="2">
      <b><font size="+1">Shipping Information</font></b>
    </td>
  </tr>
  <tr>
    <td colspan="2" valign="top">
      {$info.shipping_attention}<br/>
      {$info.shipping_address1}<br/>
      {if $info.shipping_address2 != ''}
         {$info.shipping_address2}<br/>
      {/if}
      {$info.shipping_city}, {$info.shipping_state} {$info.shipping_zip}<br />
      {$info.shipping_country}<br/>
    </td>
  </tr>
  <tr bgcolor="#cccccc">
    <td colspan="2">
      <b><font size="+1">Your Order</font></b>
    </td>
  </tr>
  <tr>
    <td colspan="2" valign="top">
      Buyer:&nbsp;{$values.buyer_name}<br/>
      Requested Ship Date:&nbsp;{$values.ship_date}<br/><br/>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <table width="90%" border="0" align="center" cellpadding="2" cellspacing="0">
        <tr bgcolor="#eeeeee">
          <td>
            <b>Item No.</b>
          </td>
          <td>
            <b>Product Name</b>
          </td>
          <td>
            <b>Qty</b>
          </td>
          <td>
            <b>Unit Price</b>
          </td>
        </tr>
        {foreach from=$cart key=id item=product}
           {foreach from=$product item=prod}
              {if $prod.qty > 0}
                 <tr>
                   <td>
                     {$prod.sku}
                   </td>
                   <td>
                     {$prod.name}{if $prod.prodpak_items != ''} ({$prod.prodpak_items}){/if}
                   </td>
                   <td>
                     {$prod.qty}
                   </td>
                   <td>
                     {$currency_type}{$prod.price}
                   </td>
                 </tr>
               {/if}
             {/foreach}
           {/foreach} 
           <tr>
             <td colspan="4" align="right">
               <br/>
               Subtotal: {$currency_type}{$order_totals.price}<br/>
               Shipping Rate: {$currency_type}{$order_totals.ship}<br/>
               Tax: {$currency_type}{$order_totals.tax}<br/>
               Total: {$currency_type}{$order_totals.grand}<br/>
             </td>
           </tr>
         </table>
       </td>
     </tr>
   </table>
</body>
</html>

