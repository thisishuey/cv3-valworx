{config_load file="store.conf" scope="global"}
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<table width="550" border="0" align="center">
  {if #confirmation_email_special# != ''}
  <tr>
    <td colspan="2" style="font-size: 12px;">
      {#confirmation_email_special#}<br/><br/>
    </td>
  </tr>
  {/if}
  <tr>
    <td colspan="2" style="font-size: 12px;">
      {if #confirmation_email_text# != ''}
        {assign var=confirm value=#confirmation_email_text#|replace:"[[first_name]]":$billing.first_name}   
        {assign var=confirm value=$confirm|replace:"[[last_name]]":$billing.last_name}   
        {assign var=confirm value=$confirm|replace:"[[co_name]]":#store_name#}
        {$confirm}   
      {else}
         Thank you, {$billing.first_name} {$billing.last_name}, for ordering from {#store_name#}.  Your order has been received. Below you will find details about your current order.  You may wish to print and save this confirmation for possible future reference.
      {/if}
      </td>
    </tr>
    {* if there is an electronic download product put a note here *}
    {if $has_ed == 'y'}
    <tr>
      <td colspan="2" style="font-size: 12px;">
        <b>Please see below for information regarding your electronic products.</b>
      </td>
    </tr>
    {/if}
    {* if there is a subscription product put a note here *}
    {if $has_subscriptions == 'y'}
    <tr>
      <td colspan="2" style="font-size: 12px;">
        <b>Please see below for information regarding your subscription products.</b>
      </td>
    </tr>
    {/if}
    <tr>
      <td colspan="2" style="font-size: 13px;">
        <br/>
        <b>Order ID: {$order_id}</b>
        <br/><br/>
      </td>
    </tr>
    <tr bgcolor="#cccccc">
      <td colspan="2" style="font-size: 13px;">
        <b>Billing Information</b>
      </td>
    </tr>
    <tr>
      <td width="50%" valign="top" style="font-size: 12px;">
        {if $billing.payment_method == 'paypal' && $settings.paypal_skip == 'y'}
          PayPal Order
        {else}
          {$billing.first_name} {$billing.last_name}{if $billing.company != ''}, {$billing.company}{/if}{if $billing.title != ''}, {$billing.title}{/if}<br/>
           {$billing.billing_address1}<br/>
           {if $billing.billing_address2 != ''}
             {$billing.billing_address2}<br/>
           {/if}
           {$billing.billing_city}, {$billing.billing_state} {$billing.billing_zip}
           <br/>{$billing.billing_country}<br/>
           {$billing.email}<br/>
           {$billing.phone}<br />
           {if $shipping.0.s_comments != ''}
              Comments: {$shipping.0.s_comments}<br />
           {/if}
          {/if}
         </td>
         <td valign="top" style="font-size: 12px;">
           {assign var=meth value=$billing.payment_method}
           {if $gift_certificates.codes|@count > 0}
             {foreach from=$gift_certificates.codes item=code}
               Payment Method:&nbsp;Gift Certificate<br/>
               Code:&nbsp;XXXXXXXXXXXX{$code.code|substr:'-4'}<br/>
               Amount Used:&nbsp;{$currency_type}{$code.amount|commify}<br/>
               Remaining Balance:&nbsp;{$currency_type}{$code.remaining|commify}<br/><br/>
             {/foreach}
           {/if}
           {if $meth != 'giftcertificate'} 
             Payment Method:&nbsp;{$payment_methods.$meth}<br/>
           {/if}
           {if $billing.payment_method == 'creditcard'}
             Name on Card: {$billing.ccname}<br/>
             Card Type: {$billing.cctype}<br/>
             Last Four Digits: {$billing.last_four}<br/>
             {if $trans_id != ''}
               Transaction ID: {$trans_id}<br/>
             {/if}
           {elseif $billing.payment_method == 'purchaseorder'}
             Purchase Order Number: {$billing.purchase_order}<br/>
           {elseif $billing.payment_method == 'echeck'}
             Last Four Digits: {$billing.last_four}<br/>
           {/if}
           {if $gift_certificates.codes|@count > 0 && $meth != 'giftcertificate'}
             {math equation="(x-y)+z" x=$gift_certificates.totals.total y=$gift_certificates.totals.gctotal z=$gift_certificates.totals.remaining assign=difference}
              Amount:&nbsp;{$currency_type}{$difference|string_format:"%.2f"}<br/>
            {/if}
         </td>
       </tr>
       <tr>
         <td colspan="2">
           &nbsp;
         </td>
       </tr>
       {assign var="custom_detail" value="<tr bgcolor=\"#cccccc\"><td colspan=\"2\" style=\"font-size: 13px;\"><b>Custom Product Information</b></td></tr>"}
       {assign var="print_custom_detail" value="n"}
       {assign var="gift_certificates" value="<tr bgcolor=\"#cccccc\"><td colspan=\"2\" style=\"font-size: 13px;\"><b>Gift Certificate Information</b></td></tr>"}
       {assign var="print_gift_certificates" value="n"}
       {foreach from=$shipping key=num item=ship}
          {if $ship.prods|@count > 0}
             {assign var="recip_name" value=$ship.s_firstname|cat:" "|cat:$ship.s_lastname}
             <tr bgcolor="#cccccc" >
               <td colspan="2" style="font-size: 13px;">
                  <b>Shipping Information: {$recip_name}
                </td>
              </tr>
              <tr>
                <td valign="top" style="font-size: 12px;">
                  {$ship.s_firstname} {$ship.s_lastname}{if $ship.s_title != ''}, {$ship.s_title}{/if}{if $ship.s_title != ''}, {$ship.s_company}{/if}<br/>
                  {$ship.s_address1}<br/>
                  {if $ship.s_address2 != ''}
                    {$ship.s_address2}<br/>
                  {/if}
                  {$ship.s_city}, {$ship.s_state} {$ship.s_zip}<br/>
                  {$ship.s_country}<br/>
                  {if $ship.s_phone != ''}
                    {$ship.s_phone}<br/>
                  {/if}
                  {if $ship.gift_message != ''}
                    Gift Message: {$ship.gift_message}<br/>
                  {/if} 
                  {if $ship.s_shipon == $smarty.now|date_format:"%Y-%m-%d" || $ship.s_shipon == 'As soon as possible'}
                     {assign var=ship_on value="As soon as possible"}
                  {else}
                     {assign var=ship_on value=$ship.s_shipon}
                  {/if}
                  Requested Ship Date: {$ship_on}<br/>
                  Shipping Method: {$ship.s_method}
                </td>
              <td valign="top">
                <table width="100%" border="0" cellspacing="0" align="center" style="border:1px solid black;">
                  <tr>
                    <td align="center" style="background:#CCCCCC;color:black;border-bottom:1px solid black;font-size:12px;font-weight:bold;">
                      Qty
                    </td>
                    <td align="center" style="background:#CCCCCC;color:black;border-bottom:1px solid black;font-size:12px;font-weight:bold;">
                      Item #
                    </td>
                    <td align="center" style="background:#CCCCCC;color:black;border-bottom:1px solid black;font-size:12px;font-weight:bold;">
                      Description
                    </td>
                    <td align="center" style="background:#CCCCCC;color:black;border-bottom:1px solid black;font-size:12px;font-weight:bold;">
                      Price
                    </td>
                  </tr>
                  {foreach from=$ship.prods item=prods}
                    {if $prods.build_prod_id == ''}
                    <tr>
                      <td valign="top" align="center" style="font-size: 12px;">
                        {$prods.qty}
                      </td>
                      <td valign="top" style="font-size: 12px;">
                       {if $prods.att_sku == ''}{$prods.sku}{else}{$prods.att_sku}{/if}
                      </td>
                      <td valign="top" style="font-size: 12px;">
                        {$prods.name}
                        {if $prods.gifts|@count > 0}
                          {foreach from=$prods.gifts key=i item=glist}
                            {if $glist != ''}
                               &nbsp;* {$glist}
                            {/if}
                          {/foreach}
                        {/if}
                        {if $prods.note != ''}
                          &nbsp;Note: {$prods.note}
                        {/if}
                        {if $prods.att_list != ''}
                           {$prods.att_list|replace:"<br />&nbsp;&nbsp;":", "|regex_replace:"/^,/":":"}
                        {/if}
                        {if $prods.gift_certificate != 'n' && $prods.gift_certificate|@count > 0}
                          &nbsp;- See "Gift Certificate Information"
                          {assign var=print_gift_certificates value="y"}
                          {assign var=gift_certificates value="$gift_certificates<tr><td colspan=\"2\" style=\"font-size: 12px;\"><b>Recipient $recip_name: "|cat:$prods.name|cat:" </b></td></tr>"}
                          {foreach from=$prods.gift_certificate item=gc}
                            {if $gc.expiration != "None"}
                              {assign var=exp value=$gc.expiration|date_format:"%D"}
                            {else}
                              {assign var=exp value="None"}
                            {/if}
                            {assign var=gift_certificates value="$gift_certificates<tr><td colspan=\"2\" style=\"font-size: 12px;\">Redemption Code: "}
                            {if $gc.recipient != '' && $gift_certificate_delay=='y'}
                              {assign var=gift_certificates value=$gift_certificates|cat:"will be emailed to "|cat:$gc.recipient|cat:" once the order has been validated"}
                            {elseif $gc.recipient != ''}
                              {assign var=gift_certificates value=$gift_certificates|cat:"emailed to "|cat:$gc.recipient}
                            {elseif $gift_certificate_delay == 'y'}
                              {assign var=gift_certificates value=$gift_certificates|cat:"will be emailed to you once the order has been validated"}
                            {else}
                              {assign var=gift_certificates value=$gift_certificates|cat:$gc.code}
                            {/if}
                             {assign var=gift_certificates value="$gift_certificates<br/>Expiration Date: "|cat:$exp|cat:"</td></tr>"}
                          {/foreach}
                        {/if}
                         {if $prods.custom_form != ''}
                            &nbsp;- See "Custom Product Information"
                            {assign var="print_custom_detail" value="y"}
                            {assign var=custom_detail value="$custom_detail<tr><td colspan=\"2\" style=\"font-size: 12px;\"><b>Recipient $recip_name: "|cat:$prods.name|cat:"</b></td></tr>"}
                            {foreach from=$prods.custom_form key=field item=label}
                              {assign var=custom_detail value="$custom_detail<tr><td style=\"font-size: 12px;\"><b>$field</b></td><td style=\"font-size: 12px;\">$label</td></tr>"}
                            {/foreach}
                            {assign var=custom_detail value="$custom_detail<tr><td colspan=\"2\" style=\"font-size: 12px;\">&nbsp;</b></td></tr>"}
                         {/if}
                       </td>
                       <td valign="top" align="right" style="font-size: 12px;">
                         {if $prods.build_parent != 'y'}
                           {$currency_type}{$prods.price|commify}
                         {else}
                           &nbsp;
                         {/if}
                       </td>
                     </tr>

                     {if $prods.build_parent == 'y'}
                       {foreach from=$ship.prods item=prod}
                         {if $prod.build_prod_id != '' && $prod.build_link == $prods.build_link}
                           <tr>
                             <td valign="top" align="center" style="font-size: 12px;">
                               {$prod.qty}
                             </td>
                             <td valign="top" style="font-size: 12px;">
                               &nbsp;
                             </td>
                             <td valign="top" style="font-size: 12px;">
                               &nbsp;&nbsp;&nbsp;{$prod.name}
                               {if $prod.gifts|@count > 0}
                                 {foreach from=$prod.gifts key=i item=glist}
                                   {if $glist != ''}
                                     &nbsp;* {$glist}
                                   {/if}
                                 {/foreach}
                               {/if}
                               {if $prod.note != ''}
                                 &nbsp;Note: {$prod.note}
                               {/if}
                               {if $prod.att_list != ''}
                                 {$prod.att_list|replace:"<br />&nbsp;&nbsp;":", "|regex_replace:"/^,/":":"}
                               {/if}
                               {if $prod.gift_certificate != 'n' && $prod.gift_certificate|@count > 0}
                                  &nbsp;- See "Gift Certificate Information"
                                  {assign var=print_gift_certificates value="y"}
                                  {assign var=gift_certificates value="$gift_certificates<tr><td colspan=\"2\" style=\"font-size: 12px;\"><b>Recipient $recip_name: "|cat:$prod.name|cat:" </b></td></tr>"}
                                  {foreach from=$prod.gift_certificate item=gc}
                                    {if $gc.expiration != "None"}
                                      {assign var=exp value=$gc.expiration|date_format:"%D"}
                                    {else}
                                      {assign var=exp value="None"}
                                    {/if}
                                    {assign var=gift_certificates value="$gift_certificates<tr><td colspan=\"2\">Redemption Code: "}
                                      {if $gc.recipient != '' && $gift_certificate_delay=='y'}
                                        {assign var=gift_certificates value=$gift_certificates|cat:"will be emailed to "|cat:$gc.recipient|cat:" once the order has been validated"}
                                      {elseif $gc.recipient != ''}
                                        {assign var=gift_certificates value=$gift_certificates|cat:"emailed to "|cat:$gc.recipient}
                                      {elseif $gift_certificate_delay == 'y'}
                                        {assign var=gift_certificates value=$gift_certificates|cat:"will be emailed to you once the order has been validated"}
                                      {else}
                                        {assign var=gift_certificates value=$gift_certificates|cat:$gc.code}
                                      {/if}
                                      {assign var=gift_certificates value="$gift_certificates<br/>Expiration Date: "|cat:$exp|cat:"</td></tr>"}
                                    {/foreach}
                                  {/if}
                                  {if $prod.custom_form != ''}
                                    &nbsp;- See "Custom Product Information"                        {assign var="print_custom_detail" value="y"}
                                    {assign var=custom_detail value="$custom_detail<tr><td colspan=\"2\"><b>Recipient $recip_name: "|cat:$prod.name|cat:"</b></td></tr>"}
                                    {foreach from=$prod.custom_form key=field item=label}
                                      {assign var=custom_detail value="$custom_detail<tr><td style=\"font-size: 12px;\"><b>$field</b></td><td>$label</td></tr>"}
                                    {/foreach}
                                    {assign var=custom_detail value="$custom_detail<tr><td colspan=\"2\" style=\"font-size: 12px;\">&nbsp;</b></td></tr>"}
                                  {/if}
                                </td>
                                <td valign="top" align="right" style="font-size: 12px;">
                                  {$currency_type}{$prod.price|commify}
                                </td>
                              </tr>
                            {/if}
                          {/foreach}
                        {/if}
                        {if $prods.gift_wrap == 'y' && $prods.gift_wrap_info != ''}
                          <tr valign="top">
                            <td valign="top" align="center" style="font-size: 12px;">
                              {$prods.qty}
                            </td>
                            <td valign="top" style="font-size: 12px;">
                              {$prods.gift_wrap_info.gift_wrap_sku}
                            </td>
                            <td valign="top" style="font-size: 12px;">
                              {$prods.gift_wrap_info.gift_wrap_name}
                            </td>
                            <td valign="top" style="font-size: 12px;">
                              {$currency_type}{$prods.gift_wrap_info.total|commify}
                            </td>
                          </tr>
                        {/if}
                      {/if}
                    {/foreach}
              </table>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              &nbsp;
            </td>
          </tr>
        <tr>
          <td colspan="2">
            &nbsp;
          </td>
        </tr>
      {/if}
    {/foreach}
    <tr bgcolor="#cccccc">
      <td colspan="2" style="font-size: 13px;">
         <b>Grand Totals</b>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="right" style="font-size: 12px;">
         Subtotal: {$currency_type}{$totals.subtotal|commify}<br/>
         {if $totals.gifttotal != 0}
            Gift Wrap Total: {$currency_type}{$totals.gifttotal}<br/>
         {/if}
         {foreach from=$totals.totalordpromo item=pro}
          {if $pro.type != 'freeprod'}
            Promo Discount:&nbsp;- {$currency_type}{$pro.deduction}<br/>
          {else}
            Free Product Discount ({$pro.prod_name}):&nbsp; -{$currency_type}{$pro.deduction}<br/>
          {/if}
         {/foreach}
         {foreach from=$totals.totalordshippromo item=pro}
            Shipping Discount:&nbsp;- {$currency_type}{$pro.deduction}<br/>
         {/foreach}
         Shipping Total: {$currency_type}{$totals.shiptotal}<br/>
         {if $totals.protective != 0}
            Protective Shipping Total: {$currency_type}{$totals.protective|commify}<br/>
         {/if}
         {if $totals.sgroupadd != 0}
            Additional Flat Shipping Rate: {$currency_type}{$totals.sgroupadd}<br/>
         {/if}
         {if $totals.shipserviceadd != 0}
            Shipping Adjustment: {$currency_type}{$totals.shipserviceadd}<br/>
         {/if}
         Tax Total: {$currency_type}{$totals.taxtotal|commify}<br/>
         Grand Total: {$currency_type}{$totals.grandtotal|commify}<br/>
       </td>
     </tr>
     {if $print_custom_detail == 'y'}
        <tr>
          <td colspan="2" style="font-size: 12px;">
            &nbsp;
          </td>
        </tr>
        {$custom_detail}
     {/if}
     {if $print_gift_certificates == 'y'}
        <tr>
          <td colspan="2" style="font-size: 12px;">
            &nbsp;
          </td>
        </tr>
        {$gift_certificates}
     {/if}
     {if $has_ed == 'y'}
       <tr>
         <td colspan="2">
           &nbsp;
         </td>
       </tr>
       <tr bgcolor="#cccccc">
         <td colspan="2" style="font-size: 13px;">
           <b>Electronic Products</b>
         </td>
       </tr>
       <tr>
         <td colspan="2" style="font-size: 12px;">
           Your electronic products are now available for download.  Please visit the <a href="https://{$url}/electronic_delivery_login">Electronic Delivery</a> section of the site and enter the order id, billing zip code and email address for this order. Alternately, you can access your downloads in the <a href="https://{$url}/member_login">Member</a> section.
         </td>
       </tr>
     {/if}
     {if $has_subscriptions == 'y'}
       <tr>
         <td colspan="2">
           &nbsp;
         </td>
       </tr>
       <tr bgcolor="#cccccc">
         <td colspan="2" style="font-size: 13px;">
           <b>Subscription Products</b>
         </td>
       </tr>
       <tr>
         <td colspan="2" style="font-size: 12px;">
           Subscription information can be found in the <a href="https://{$url}/subscriptions_login">Subscription</a> section of the site.  You can edit your shipping and billing information as well as cancel subscriptions.  You will need to enter the order id, billing zip code and email address for this order to see the information. Alternately, you can access your subscriptions in the <a href="https://{$url}/member_login">Member</a> section.
         </td>
       </tr>
     {/if}
     {if #confirmation_email_disclaimer# != ''}
        <tr>
          <td colspan="2">
             &nbsp;
          </td>
        </tr>
        <tr>
          <td colspan="2">
             &nbsp;
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center" style="font-size: 12px;">
             {#confirmation_email_disclaimer#}
          </td>
        </tr>
      {/if}
    </table>
    {$custf}
</body>
</html>
