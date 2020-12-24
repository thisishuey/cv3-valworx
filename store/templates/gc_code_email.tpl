{******************************************************************
 * purpose: 
 *    create the email you would like to send to recipients of 
 *    gift certificates from the admin.
 *
 * to use:
 *    create your email below this comment.  You can use
 *    HTML, smarty and/or plain text for your email. 
 *
 * variables available: 
 *    {$codes} is an array of information about the gift certificates created 
 *       for them.  Below is an example of how to loop through the array 
 *       to print all information for each code purchased for this recipient:
         {foreach from=$codes item=code}
           Redemption Code: {$code.code}<br />
           Expiration Date: {$code.expiration}<br />
           Value: {$code.value}<br />
           <br />
         {/foreach}
 *    {$gift_message} is the gift message for the ship-to this gift 
 *       certificate is assigned to
 *    {$message_code} is the message code for the product sending the 
 *       gift certificate
 *    {$recipient.first_name} is the first name of the ship-to this gift 
 *       certificate is assigned to
 *    {$recipient.last_name} is the last name of the ship-to this gift
 *       certificate is assigned to
 *    {$billing.first_name} is the billing address first name of this order
 *    {$billing.last_name} is the billing address last name of this order
 *    {$type} is "recipient" or "purchaser" depending on who will be receiving
 *       the email. This can be used to customize the email.
 *    {$order_id}  only available when type= "purchaser"
 *    {$gc_name} is the product name of the gift certificate that was
 *       purchased
 ********************************************************************}

{if $type == 'recipient'} 
  {* gift code recipient email *}
Dear {$recipient.first_name} {$recipient.last_name},<br/>
<br/>
The awesome, {$billing.first_name} {$billing.last_name}  bought you a gift certificate!! Wasn't that really really sweet of them? We think so! Here is what they had to say:<br/>

{$gift_message} <br/>
<br/>
Here is the info you will need:<br/>
         {foreach from=$codes item=code}
           Redemption Code: {$code.code}<br />
           Expiration Date: {$code.expiration}<br />
           Value: {$code.value}<br />
           <br />
         {/foreach}
<br/>
Hope you enjoy!<br/>

{else} 
  {* gift code purchaser email *}

{/if}
