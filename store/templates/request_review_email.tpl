{******************************************************************
 * purpose: 
 *    create the email you would like to send to customers
 *    to request they review the products they've purchased.
 *    You can turn on request review emails in 
 *    Settings->Options->Product Review Options
 *
 * to use:
 *    create your email below this comment.  You can use
 *    HTML, smarty and/or plain text for your email. 
 *
 * variables available: 
 *    {$first_name} is the first name of the customer, if available
 *    {$last_name} is the last name of the customer, if available
 *    {$email} is the email address of the customer
 *    {$order_id} is the order id
 *    {$date_ordered} is the date the order was placed
 *    {$products} is an array of items in the customer purchased
 *    {foreach from=$products item=prod}
 *      {$prod.prod_id} product url name or prod id
 *      {$prod.cat_id} category url name or cat id
 *      {$prod.sku} product sku
 *      {$prod.qty} qty purchased
 *      {$prod.name} product name
 *      {$prod.image} product image
 *      {foreach from=$prod.attributes item=attribute} attributes
 *        {$attribute}
 *      {/foreach}
 *    {/foreach}
 *
 * to link to create review page:
 *   <a href="https://www.domain.com/create_review/{$prod.prod_id}/{$prod.cat_id}">{$prod.name}</a>
 ********************************************************************}


{config_load file="store.conf" scope="global"}
{include file="email_header.tpl"}

<table width="600" border="0" align="center" style="font-family:Arial, Helvetica, sans-serif;">
<td style="padding:15px;font-family:Times, serif; font-size:12px; color:#333333; line-height:18px;">
Dear {$first_name},
<br/><br/>
Thank you for your recent purchase at {#store_name#}. We would like to invite you to review the products you ordered, sharing your feedback on our products and services.
<br>
<br>
Order Details<br>
Order Number:  {$order_id}<br>
Order Date:  {$date_ordered}<br><br>
<table width="600">
  {foreach from=$products item=prod}
    <tr>
      <td colspan="3" style="padding-top:0px; padding-right:18px; padding-bottom:4px; padding-left:18px">Products:</td>
      </tr>
    <tr>
    <td style="padding-top:0px; padding-right:18px; padding-bottom:4px; padding-left:18px"><img src="{$img_prefix}/{$prod.image}" alt="{$prod.name}" width="100"></td>
    <td width="200" style="padding-top:0px; padding-right:18px; padding-bottom:4px; padding-left:8px">{$prod.name}</td>
    <td width="250"><a href="https://www.commercev3.com/create_review/{$prod.prod_id}/{$prod.cat_id}">Submit a Review</a></td>
  </tr>
  {/foreach}
</table
>
<br/>
<br/>
We value your comments and hope that with your help we can make our products and our service even better. <br/>
<br/>
Thank you,<br>
{#store_name#}<br/>

</table>
{$custf}

{include file="email_footer.tpl"}



