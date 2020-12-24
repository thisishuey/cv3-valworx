{******************************************************************
 * purpose: 
 *    create the email you would like to send to notify customers
 *    that a new item has been added to your store.
 *
 * to use:
 *    create your email below this comment.  You can use
 *    HTML, smarty and/or plain text for your email. 
 *
 * variables available: 
 *    {foreach from=$products item=product}
 *      {$product.prod_name}
 *      {$product.desc_header}
 *      {$product.prod_description}
 *      {$product.url_name}
 *      {$product.prod_id}
 *      {$product.cat_id}
 *      {$product.cat_url_name}
 *    {/foreach}
 *    {$email}
 *    {$first_name}
 *    {$last_name}
 *    {$mar_id}
 *    {$type} = 'new_product_notify'
 ********************************************************************}
{if $type == 'new_product_notify'} 
  {* product_notify *}
  We have added some new product(s):<br />
  {foreach from=$products item=product}
    <a href="https://www.domain.com/product/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{if $product.cat_url_name != ''}{$product.cat_url_name}{else}{$product.cat_id}{/if}">{$product.prod_name}</a><br />
  {/foreach}
<br />
  Enjoy!
{/if}

<br /><br />
<a href="https://www.domain.com/unsubscribe_prod_notify/{$email}">Click here</a> to discontinue receiving new product notifications.
