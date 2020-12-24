{config_load file="store.conf" scope="global"}
{assign var="src" value="utm_source=transactional_email&utm_medium=email&utm_campaign=order_confirmation&utm_term="|cat:$order_id}
{assign var="heading" value=""}

{include file="email_header.tpl" src=$src heading=$heading}

    
<table width="100%" border="0" align="center">
{if $first_name != ''}Dear {$first_name} -<br><br>{/if}
  {if #confirmation_email_special# != ''}
  <tr>
    <td colspan="2">
      {#confirmation_email_special#}<br /><br />
    </td>
  </tr>
  {/if}
  <tr>
    <td colspan="2">
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
      <td colspan="2">
        <b>Please see below for information regarding your electronic products.</b>
      </td>
    </tr>
    {/if}
    {* if there is a subscription product put a note here *}
    {if $has_subscriptions == 'y'}
    <tr>
      <td colspan="2">
        <b>Please see below for information regarding your subscription products.</b>
      </td>
    </tr>
    {/if}
    <tr>
      <td colspan="2">
        <br />
        <span style="font-weight:bold;font-size:14px">Order ID: {$order_id}</span>
        <br /><br />
      </td>
    </tr>
    <tr bgcolor="#D5D5D5">
      <td colspan="2" style="padding:2px">
        <span style="font-weight:bold;font-size:14px">Billing Information</span>
      </td>
    </tr>
    <tr>
      <td width="50%" valign="top">
        {if $billing.payment_method == 'paypal' && $settings.paypal_skip == 'y'}
          PayPal Order
        {else}
        {$billing.first_name} {$billing.last_name}
        <br />
           {if $billing.company != ''}
             {$billing.company}<br />
           {/if}
           {if $billing.title != ''}
             {$billing.title}<br />
           {/if}
           {$billing.billing_address1}<br />
           {if $billing.billing_address2 != ''}
             {$billing.billing_address2}<br />
           {/if}
           {$billing.billing_city}, {$billing.billing_state} {$billing.billing_zip}
           <br />{$billing.billing_country}<br /><br />
          {/if}
         </td>
         <td valign="top">
           Email: {$billing.email}<br />
           Phone: {$billing.phone}<br /><br />
         </td>
       </tr>
       <tr bgcolor="#D5D5D5">
         <td colspan="2" style="padding:2px">
           <span style="font-weight:bold;font-size:14px">Payment Information</span>
         </td>
       </tr>
       <tr>
         <td colspan="2">
           {assign var=meth value=$billing.payment_method}
           {if $gift_certificates.codes|@count > 0}
             {foreach from=$gift_certificates.codes item=code}
               Payment Method:&nbsp;Gift Certificate<br />
               Code:&nbsp;XXXXXXXXXXXX{$code.code|substr:'-4'}<br />
               Amount Used:&nbsp;{$currency_type}{$code.amount|commify}<br />
               Remaining Balance:&nbsp;{$currency_type}{$code.remaining|commify}<br /><br />
             {/foreach}
           {/if}
           {if $meth != 'giftcertificate'} 
             Payment Method:&nbsp;{$payment_methods.$meth}<br />
           {/if}
           {if $billing.payment_method == 'creditcard'}
             Name on Card: {$billing.ccname}<br />
             Card Type: {$billing.cctype}<br />
             Last Four Digits: {$billing.last_four}<br />
             {if $trans_id != ''}
               Transaction ID: {$trans_id}<br />
             {/if}
           {elseif $billing.payment_method == 'purchaseorder'}
             Purchase Order Number: {$billing.purchase_order}<br />
           {elseif $billing.payment_method == 'echeck'}
             Last Four Digits: {$billing.last_four}<br />
           {/if}
           {if $gift_certificates.codes|@count > 0 && $meth != 'giftcertificate'}
             {math equation="(x-y)+z" x=$gift_certificates.totals.total y=$gift_certificates.totals.gctotal z=$gift_certificates.totals.remaining assign=difference}
              Amount:&nbsp;{$currency_type}{$difference|string_format:"%.2f"}<br />
            {/if}
             <br />
         </td>
       </tr>
       <tr bgcolor="#D5D5D5">
         <td colspan="2" style="padding:2px">
           <span style="font-weight:bold;font-size:14px">Shipping Information</span>
         </td>
       </tr>
       {assign var="custom_detail" value="<tr bgcolor=\"#cccccc\"><td colspan=\"2\"><b><font size=\"+1\">Custom Product Information</span></td></tr>"}
       {assign var="print_custom_detail" value="n"}
       {assign var="gift_certificates" value="<tr bgcolor=\"#cccccc\"><td colspan=\"2\"><b><font size=\"+1\">Gift Certificate Information</span></td></tr>"}
       {assign var="print_gift_certificates" value="n"}
       {foreach from=$shipping key=num item=ship}
          {if $ship.prods|@count > 0}
             <tr>
               <td colspan="2">
                  {math equation="x+y" x=$num y=1 assign=recp_num}
                  <b>Recipient {$recp_num}</b>
                </td>
              </tr>
              <tr>
                <td valign="top">
                  {$ship.s_firstname} {$ship.s_lastname}<br />
                  {$ship.s_title}<br />
                  {$ship.s_company}<br />
                  {$ship.s_address1}<br />
                  {if $ship.s_address2 != ''}
                    {$ship.s_address2}<br />
                  {/if}
                  {$ship.s_city}, {$ship.s_state} {$ship.s_zip}<br />
                  {$ship.s_country}<br />
                  {if $ship.s_phone != ''}
                    {$ship.s_phone}<br />
                  {/if}
                  {if $ship.s_email != ''}
                    {$ship.s_email}<br />
                  {/if}

                  {if $settings.amazon_checkout == 'y' && isset($smarty.session.amazon_id) && $billing.payment_method == 'amazon'}
                    <br />Payment Method: Amazon Payments<br />
                  {/if}
                </td>
              <td valign="top">
                Comments: {$ship.s_comments}<br />
                {if $ship.gift_message != ''}
                  Gift Message: {$ship.gift_message}<br />
                {/if} 
                {if $ship.s_shipon == $smarty.now|date_format:"%Y-%m-%d" || $ship.s_shipon == 'As soon as possible'}
                   {assign var=ship_on value="As soon as possible"}
                {else}
                   {assign var=ship_on value=$ship.s_shipon}
                {/if}
                Requested Ship Date: {$ship_on}<br />
                Shipping Method: {$ship.s_method}
                {if $settings.ups_time_in_transit == 'y' && isset($transit_time.$num.arrival_date)}
                  <br />Transit Time: {$transit_time.$num.transit_days} Business Day{if $transit_time.$num.transit_days > 1}s{/if}<br />
                  Estimated Arrival: {$transit_time.$num.arrival_date|date_format:"%B %e"}<br />
                {/if}
              </td>
            </tr>
            <tr>
              <td colspan="2">
                &nbsp;
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr bgcolor="#D5D5D5">
                    <td style="padding:2px">
                      <b>Qty</b>
                    </td>
                    <td>
                      <b>Item #</b>
                    </td>
                    <td>
                      <b>Description</b>
                    </td>
                    <td>
                      <b>Price</b>
                    </td>
                  </tr>
                  {foreach from=$ship.prods item=prods}
                    {if $prods.build_prod_id == ''}
                    <tr>
                      <td valign="top">
                        {$prods.qty}
                      </td>
                      <td valign="top">
                       {if $prods.att_sku == ''}
                         {assign var="prod_sku" value=$prods.sku}
                       {else}
                         {assign var="prod_sku" value=$prods.att_sku}
                       {/if}
                       {$prod_sku}
                      </td>
                      <td valign="top">
                        {$prods.name}
                        {if $prods.gifts|@count > 0}
                          {foreach from=$prods.gifts key=i item=glist}
                            {if $glist != ''}
                               <br />* {$glist}
                            {/if}
                          {/foreach}
                        {/if}
                        {if $prods.note != ''}
                          <br />Note: {$prods.note}
                        {/if}
                        {if $prods.att_list != ''}
                           {$prods.att_list}
                        {/if}
                        {if $prods.gift_certificate != 'n' && $prods.gift_certificate|@count > 0}
                          <br />- See "Gift Certificate Information" Section for Details
                          {assign var=print_gift_certificates value="y"}
                          {assign var=gift_certificates value="$gift_certificates<tr><td colspan=\"2\"><b>Recipient $recp_num: "|cat:$prods.name|cat:" </b></td></tr>"}
                          {foreach from=$prods.gift_certificate item=gc}
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
                             {assign var=gift_certificates value="$gift_certificates<br />Expiration Date: "|cat:$exp|cat:"</td></tr>"}
                          {/foreach}
                        {/if}
                         {if $prods.custom_form != ''}
                            <br />- See "Custom Product Information" Section for Details
                            {assign var="print_custom_detail" value="y"}
                            {assign var=custom_detail value="$custom_detail<tr><td colspan=\"2\"><b>Recipient $recp_num: "|cat:$prods.name|cat:"</b></td></tr>"}
                            {assign var=custom_detail value="$custom_detail<tr><td><b>SKU:</b></td><td>$prod_sku</td></tr>"}
                            {foreach from=$prods.custom_form key=field item=label}
                              {assign var=custom_detail value="$custom_detail<tr><td><b>$field</b></td><td>$label</td></tr>"}
                            {/foreach}
                            {assign var=custom_detail value="$custom_detail<tr><td colspan=\"2\">&nbsp;</b></td></tr>"}
                         {/if}
                       </td>
                       <td valign="top">
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
                             <td valign="top">
                               {$prod.qty}
                             </td>
                             <td valign="top">
                               &nbsp;
                             </td>
                             <td valign="top">
                               &nbsp;&nbsp;&nbsp;{$prod.name}
                               {if $prod.gifts|@count > 0}
                                 {foreach from=$prod.gifts key=i item=glist}
                                   {if $glist != ''}
                                     <br />&nbsp;&nbsp;&nbsp;* {$glist}
                                   {/if}
                                 {/foreach}
                               {/if}
                               {if $prod.note != ''}
                                 <br />&nbsp;Note: {$prod.note}
                               {/if}
                               {if $prod.att_list != ''}
                                 {$prod.att_list|replace:"<br />":"<br />&nbsp;&nbsp;&nbsp;&nbsp;"}
                               {/if}
                               {if $prod.gift_certificate != 'n' && $prod.gift_certificate|@count > 0}
                                  <br />&nbsp;&nbsp;&nbsp;- See "Gift Certificate Information" Section for Details
                                  {assign var=print_gift_certificates value="y"}
                                  {assign var=gift_certificates value="$gift_certificates<tr><td colspan=\"2\"><b>Recipient $recp_num: "|cat:$prod.name|cat:" </b></td></tr>"}
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
                                      {assign var=gift_certificates value="$gift_certificates<br />Expiration Date: "|cat:$exp|cat:"</td></tr>"}
                                    {/foreach}
                                  {/if}
                                  {if $prod.custom_form != ''}
                                    <br />&nbsp;&nbsp;&nbsp;- See "Custom Product Information" Section for Details
                                    {assign var="print_custom_detail" value="y"}
                                    {assign var=custom_detail value="$custom_detail<tr><td colspan=\"2\"><b>Recipient $recp_num: "|cat:$prod.name|cat:"</b></td></tr>"}
                                    {foreach from=$prod.custom_form key=field item=label}
                                      {assign var=custom_detail value="$custom_detail<tr><td><b>$field</b></td><td>$label</td></tr>"}
                                    {/foreach}
                                    {assign var=custom_detail value="$custom_detail<tr><td colspan=\"2\">&nbsp;</b></td></tr>"}
                                  {/if}
                                </td>
                                <td valign="top">
                                  {$currency_type}{$prod.price|commify}
                                </td>
                              </tr>
                            {/if}
                          {/foreach}
                        {/if}
                        {if $prods.gift_wrap == 'y' && $prods.gift_wrap_info != ''}
                          <tr valign="top">
                            <td valign="top">
                              {$prods.qty}
                            </td>
                            <td valign="top">
                              {$prods.gift_wrap_info.gift_wrap_sku}
                            </td>
                            <td valign="top">
                              {$prods.gift_wrap_info.gift_wrap_name}
                            </td>
                            <td valign="top">
                              {$currency_type}{$prods.gift_wrap_info.total|commify}
                            </td>
                          </tr>
                        {/if}
                      {/if}
                    {/foreach}
              <tr>
                <td colspan="4" align="right">
                  <br />Subtotal: {$currency_type}{$totals.totals.$num.subtotal|commify}<br />
                  {if $totals.totals.$num.giftwrap != 0}
                    Gift Wrap: {$currency_type}{$totals.totals.$num.giftwrap}<br />
                  {/if}
                  Shipping Rate: {$currency_type}{$totals.totals.$num.shipping|commify}<br />
                  {if $totals.totals.$num.sgroupadd != 0}
                    Additional Flat Shipping Rate: {$currency_type}{$totals.totals.$num.sgroupadd}<br />
                  {/if}
                  {foreach from=$totals.totals.$num.totalpromo item=pro}
                    Promo Discount:&nbsp;- {$currency_type}{$pro.deduction}<br />
                  {/foreach}
                  {foreach from=$totals.totals.$num.shippromo item=pro}
                    Shipping Promo:&nbsp;- {$currency_type}{$pro.deduction}<br />
                  {/foreach}
                  Total: {$currency_type}{$totals.totals.$num.total|commify}<br />
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            &nbsp;
          </td>
        </tr>
      {/if}
    {/foreach}
    <tr bgcolor="#D5D5D5">
      <td colspan="2" style="padding:2px">
         <span style="font-weight:bold;font-size:14px">Grand Totals</span>:<br />
      </td>
    </tr>
    <tr>
      <td colspan="2" align="right">
         Subtotal: {$currency_type}{$totals.subtotal|commify}<br />
         {if $totals.gifttotal != 0}
            Gift Wrap Total: {$currency_type}{$totals.gifttotal}<br />
         {/if}
         {foreach from=$totals.totalordpromo item=pro}
          {if $pro.type != 'freeprod'}
            Promo Discount:&nbsp;- {$currency_type}{$pro.deduction}<br />
          {else}
            Free Product Discount ({$pro.prod_name}):&nbsp; -{$currency_type}{$pro.deduction}<br />
          {/if}
         {/foreach}
         {foreach from=$totals.totalordshippromo item=pro}
            Shipping Discount:&nbsp;- {$currency_type}{$pro.deduction}<br />
         {/foreach}
         Shipping Total: {$currency_type}{$totals.shiptotal}<br />
         {if $totals.protective != 0}
            Protective Shipping Total: {$currency_type}{$totals.protective|commify}<br />
         {/if}
         {if $totals.sgroupadd != 0}
            Additional Flat Shipping Rate: {$currency_type}{$totals.sgroupadd}<br />
         {/if}
         {if $totals.shipserviceadd != 0}
            Shipping Adjustment: {$currency_type}{$totals.shipserviceadd}<br />
         {/if}
         Estimated Tax Total: {$currency_type}{$totals.taxtotal|commify}<br />
         Grand Total: {$currency_type}{$totals.grandtotal|commify}<br />
       </td>
     </tr>
     {if $print_custom_detail == 'y'}
        <tr>
          <td colspan="2">
            &nbsp;
          </td>
        </tr>
        {$custom_detail}
     {/if}
     {if $print_gift_certificates == 'y'}
        <tr>
          <td colspan="2">
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
       <tr bgcolor="#D5D5D5">
         <td colspan="2" style="padding:2px">
           <span style="font-weight:bold;font-size:14px">Electronic Products</span>:<br />
         </td>
       </tr>
       <tr>
         <td colspan="2">
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
       <tr bgcolor="#D5D5D5">
         <td colspan="2" style="padding:2px">
           <span style="font-weight:bold;font-size:14px">Subscription Products</span>:<br />
         </td>
       </tr>
       <tr>
         <td colspan="2">
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
          <td colspan="2" align="center">
             {#confirmation_email_disclaimer#}
          </td>
        </tr>
      {/if}
    </table>
    {$custf}



   <br>
Please <a href="mailto:sales@valworx.com" style="color:#333;font-weight:bold;text-decoration:none">email us</a> or call <a href="tel:80051101001" style="text-decoration:none;color:#484848;font-weight:bold">1-800-511-0100</a> if you have any questions.<br>
<br>
Regards,<br>
 Valworx - Customer Service
  
{include file="email_footer.tpl" src=$src heading=$heading}