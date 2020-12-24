{config_load file="store.conf" scope="global"}
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<table width="550" border="0" align="center">
  <tr>
    <td colspan="2">
      Greetings {$shipping.s_firstname} {$shipping.s_lastname}, <br /><br />

       Items have been ordered by {$billing.first_name} {$billing.last_name} to be shipped to your address.  Below you will find details about the items.  You may wish to print and save this confirmation for possible future reference.
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
        <b><font size="+1">Order ID: {$order_id}</font></b>
        <br /><br />
      </td>
    </tr>

       <tr bgcolor="#cccccc">
         <td colspan="2">
           <b><font size="+1">Shipping Information</font></b>
         </td>
       </tr>
       {assign var="custom_detail" value="<tr bgcolor=\"#cccccc\"><td colspan=\"2\"><b><font size=\"+1\">Custom Product Information</font></b></td></tr>"}
       {assign var="print_custom_detail" value="n"}
       {assign var="gift_certificates" value="<tr bgcolor=\"#cccccc\"><td colspan=\"2\"><b><font size=\"+1\">Gift Certificate Information</font></b></td></tr>"}
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
                  {if $ship.s_title != ''}
                    {$ship.s_title}<br />
                  {/if}
                  {if $ship.s_company != ''}             
                    {$ship.s_company}<br />
                  {/if}
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
                  <tr bgcolor="#cccccc">
                    <td>
                      <b>Qty</b>
                    </td>
                    <td>
                      <b>Item #</b>
                    </td>
                    <td>
                      <b>Description</b>
                    </td>
                  </tr>
                  {foreach from=$ship.prods item=prods}
                    {if $prods.build_prod_id == ''}
                    <tr>
                      <td valign="top">
                        {$prods.qty}
                      </td>
                      <td valign="top">
                       {if $prods.att_sku == ''}{$prods.sku}{else}{$prods.att_sku}{/if}
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
                            {foreach from=$prods.custom_form key=field item=label}
                              {assign var=custom_detail value="$custom_detail<tr><td><b>$field</b></td><td>$label</td></tr>"}
                            {/foreach}
                            {assign var=custom_detail value="$custom_detail<tr><td colspan=\"2\">&nbsp;</b></td></tr>"}
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
      {/if}
    {/foreach}

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
       <tr bgcolor="#cccccc">
         <td colspan="2">
           <b><font size="+1">Electronic Products</font></b>:<br />
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
       <tr bgcolor="#cccccc">
         <td colspan="2">
           <b><font size="+1">Subscription Products</font></b>:<br />
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
</body>
</html>