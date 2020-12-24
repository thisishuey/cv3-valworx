{include file="_top.tpl"}

<h3>Confirm all Information</h3>
<br>
<form method="post" action="index.php"> 
<input type="hidden" name="action" value="QuickBuyConfirm">
 <input type="hidden" name="confirmation_text" value="{#confirmation_email_text#}">
<input type="hidden" name="confirmation_special" value="{#confirmation_email_special#}">
        
<table width="90%" border="0" cellspacing="0" cellpadding="2" align="center" id="checkoutPanel">
            <tr id="checkoutPanelBar">
               <td>
                  Personal Information
               </td>
           </tr>
           <tr id="cartHelpText">
              <td>
                {$info.billing.first_name} {$info.billing.last_name}<br>
                {$info.billing.billing_address1}<br>
              {if $info.billing.billing_address2 != ''}
                {$info.billing.billing_address2}<br>
              {/if}
                {$info.billing.billing_city}, {$info.billing.billing_state}  {$info.billing.billing_zip}<br>
                {$info.billing.billing_country}<br>
                {$info.billing.email}<br>
                {$info.billing.phone}
              </td>
           </tr>
           <tr>
              <td>
                 &nbsp;
              </td>
           </tr>
  <tr id="checkoutPanelBar">
    <td>
      Payment Information
    </td>
  </tr>
  <tr id="cartHelpText">
    <td>
      {assign var="meth" value=$info.billing.payment_method}
      Payment Method:&nbsp;{$payment_methods.$meth}<br />
      {if $meth == 'creditcard'}
        {$info.billing.ccname}<br />
        {$info.billing.cctype}<br />
        {$info.billing.last_four} (Last 4 digits)<br />
      {elseif $meth == 'purchaseorder'}
        Purchase Order Number:&nbsp;{$info.billing.purchase_order}<br />
      {/if}
    </td>
  </tr>
           <tr>
              <td>
                 &nbsp;
              </td>
           </tr>
          {counter start=0 assign=num}
          {section name=ship loop=$ship_num}
           <tr id="checkoutPanelBar">
               <td>
                 Order &amp; Shipping Information: Recipient {$options.$num}
              </td>
           </tr>
           <tr id="cartHelpText">
              <td width="95%">
                 {$info.shipping.$num.s_firstname} {$info.shipping.$num.s_lastname}<br>
                 {$info.shipping.$num.s_address1}<br>
                 {if $info.shipping.$num.s_address2 != ''}
                   {$info.shipping.$num.s_address2}<br>
                 {/if}
                 {$info.shipping.$num.s_city}, {$info.shipping.$num.s_state} 
                 {$info.shipping.$num.s_zip}<br>
                 {$info.shipping.$num.s_country}<br>
                 <!--Ship On: {$info.shipping.$num.s_shipon} by 
                 <b>{$info.shipping.$num.s_method}</b><br><br>-->
                 <br>
                 Gift Message: {$info.shipping.$num.gift_message}<br><br>
                 Comments: {$info.shipping.$num.s_comments}<br>
                 <br><br>
                 <table width="100%" border="0" cellspacing="0" align="center">
                    <tr id="checkoutPanelBar2">
                       <td width="10%">
                          <b>Qty</b>
                       </td>
                       <td width="15%">
                          <b>SKU</b>
                       </td>
                       <td width="55%">
                          <b>Name</b>
                       </td>
                       <td width="20%">
                          <b>Price</b>
                       </td>
                    </tr>
                    {foreach from=$info.shipping.$num.prods item=prod}
                    <tr valign="top">
                       <td>
                          {$prod.qty}
                       </td>
                       <td>
                          {$prod.sku}
                       </td>
                       <td>
                          {$prod.name}
                          {foreach from=$prod.gifts item=gift}
                             {if $gift != ''}
                                <br>* {$gift}
                             {/if}
                           {/foreach}
													 {foreach from=$prod.attributes key=aname item=qnum}
													    <br>- {$qnum.qty} {$aname}
													 {/foreach}
                       </td>
                       <td>
                          {$currency_type}{$prod.price}
                       </td>
                    </tr>
                    {/foreach}
                    <tr>
                       <td align="right" colspan="4">
                          <br><b>Subtotal:</b> {$currency_type}{$order.totals.$num.subtotal}
                          <br><b>Shipping Rate:</b> {$currency_type}{$order.totals.$num.shipping}
                          {if $order.promotype == 'shipping' && $order.totals.$num.shippromo.deduction > 0}
                             <br><b>Shipping Promo:</b> - {$currency_type}{$order.totals.$num.shippromo.deduction}
                          {/if}
                          <br><b>Total:</b> {$currency_type}{$order.totals.$num.total}
                       </td>
                    </tr>
                 </table>
              </td>
           </tr>
          {counter assign=num}
          {/section}
           <tr id="checkoutPanelBar">
               <td>
                 Complete Order Total
              </td>
           </tr>
           <tr id="cartHelpText">
              <td align="right">
                <b>Subtotal:</b> {$currency_type}{$order.subtotal}<br>

						    {if $order.promotype == 'totalorder' && $order.totalordpromo.deduction > 0}
                  <b>Promo Discount:</b> - {$currency_type}{$order.totalordpromo.deduction}<br>
                {/if}
                <b>Shipping Total:</b> {$currency_type}{$order.shiptotal}<br>
                {if $order.protective != 0}
                   <b>Protective Shipping Total:</b> {$currency_type}{$order.protective}<br>
                {/if}
                <b>Tax Total:</b> {$currency_type}{$order.taxtotal}<br>
        {if $order.gifttotal != 0}
            <b>Giftwrap:</b> {$currency_type}{$order.gifttotal}<br />
        {/if}

                <b>Grand Total:</b> {$currency_type}{$order.grandtotal}
              </td>
           </tr>
           <tr>
              <td align="center">
                 <br><br>
                 <input type="submit" name="submit" value="Edit"  class="addtocart_btn btnstyle1">               
                 <input type="hidden" name="to_email" value="{#form_orders_to#}">
                 <input type="hidden" name="from_email" value="{#form_orders_from#}">
                <input type="submit" name="submit" value="Continue" tabindex="1" class="addtocart_btn btnstyle1">                 
     </td>
  </tr>
</table>
</form>

{include file="_bottom.tpl"}

