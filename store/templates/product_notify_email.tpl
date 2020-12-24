{******************************************************************
 * purpose: 
 *    create the email you would like to send to notify customers
 *    that an item is back in stock.
 *
 * to use:
 *    create your email below this comment.  You can use
 *    HTML, smarty and/or plain text for your email. 
 *
 * variables available: 
 *    {$product.prod_name}
 *    {$product.desc_header}
 *    {$product.prod_description}
 *    {$product.url_name}
 *    {$product.prod_id}
 *    {$product.cat_id}
 *    {$product.cat_url_name}
 *    {$product.attributes}
 *    {$email}
 *    {$type} = 'product_notify'
 ********************************************************************}
{if $type == 'product_notify'} 
  {* product_notify *}
  <a href="https://www.domain.com/product/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{if $product.cat_url_name != ''}{$product.cat_url_name}{else}{$product.cat_id}{/if}">{$product.prod_name}</a> is now in stock.<br />
<br />
  Thanks!
{/if}
