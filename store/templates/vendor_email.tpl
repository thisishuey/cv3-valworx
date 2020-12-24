{*
   Use this template to customize your Vendor e-mail.
   Available variables:

   $order_id - The ID of the order.
   $vendor_id - The ID of the vendor.
   $billing - Contains all of the billing information for the order (except payment info)
   $shipping - Contains all of the shipping information for the order, including product information.
               The product information is stored in $shipping.ID.prods.  Most product fields available
               on the product page area available here.
   $product_info - Contains vendor associations for products.
*}
{config_load file="store.conf" scope="global"}
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<pre>
Order ID: {$order_id}
Email: {$billing.email}

Shipping Information:
{strip}{assign var="recipient_body" value=""}{assign var="print_custom_detail" value="n"}{assign var="custom_detail" value=""}
{foreach from=$shipping key=num item=ship}
  {math equation="x+1" x=$num assign="num"}
  {assign var="prod_list" value=""}
  {foreach from=$ship.prods key=p_id item=prods}
    {assign var="prod_id" value=$prods.prod_id}
    {assign var="parent_id" value=$product_info.prod_id.parent}
    {if $product_info.$prod_id.vendor == $vendor_id || $product_info.$parent_id.vendor == $vendor_id}
      {if $prods.att_sku != ''}
        {assign var="sku" value=$prods.att_sku}
      {else}
        {assign var="sku" value=$prods.sku}
      {/if}
      {assign var="prod_list" value=$prod_list|cat:$prods.qty|cat:"\t"|cat:$sku|cat:"\t"|cat:$prods.name}
      {if isset($prods.gifts)}
        {foreach from=$prods.gifts key=i item=glist}
          {if $glist != ''}
            {assign var="prod_list" value=$prod_list|cat:"\r\t\t* "|cat:$glist|cat:"\r"}
          {/if}
        {/foreach}
      {/if}
      {if isset($prods.attributes)}
        {foreach from=$prods.attributes key=aname item=alist}
          {assign var="prod_list" value=$prod_list|cat:"\r\t\t- "|cat:$alist}
        {/foreach}
      {/if}
      {if isset($prods.custom_form) && $prods.custom_form != ''}
        {assign var="print_custom_detail" value="y"}
        {assign var="prod_list" value=$prod_list|cat:"\r\t\t - See \"Custom Product Information\" Section for Details"}
        {assign var="custom_detail" value=$custom_detail|cat:"\rRecipient "|cat:$num|cat:": "|cat:$prods.name|cat:"\r"}
        {foreach from=$prods.custom_form key=label item=value}
          {assign var="custom_detail" value=$custom_detail|cat:$label|cat:" "}
          {if is_array($value)}
            {assign var="custom_detail" value=$custom_detail|cat:","|implode:$value}
          {else}
            {assign var="custom_detail" value=$custom_detail|cat:$value}
          {/if}
          {assign var="custom_detail" value=$custom_detail|cat:"\r"}
        {/foreach}
        {assign var="custom_detail" value=$custom_detail|cat:"\r"}
      {/if}
      {assign var="prod_list" value=$prod_list|cat:"\r"}
    {/if}
  {/foreach}
  {if $prod_list != ''}
    {assign var="recipient_body" value=$recipient_body|cat:"Recipient "|cat:$num|cat:"\r"}
    {assign var="recipient_body" value=$recipient_body|cat:$ship.s_firstname|cat:" "|cat:$ship.s_lastname|cat:"\r"}
    {assign var="recipient_body" value=$recipient_body|cat:$ship.s_address1|cat:"\r"}
    {if $ship.s_address2 != ''}
      {assign var="recipient_body" value=$recipient_body|cat:$ship.s_address2|cat:"\r"}
    {/if}
    {assign var="recipient_body" value=$recipient_body|cat:$ship.s_city|cat:", "|cat:$ship.s_state|cat:" "|cat:$ship.s_zip|cat:"\r"|cat:$ship.s_country|cat:"\r\r"}
    {assign var="recipient_body" value=$recipient_body|cat:"Ship Date: "|cat:$ship.s_shipon|cat:"\r"}
    {assign var="recipient_body" value=$recipient_body|cat:"Ship Method: "|cat:$ship.s_method|cat:"\r"}
    {assign var="recipient_body" value=$recipient_body|cat:"Gift Message: "|cat:$ship.gift_message|cat:"\r"}
    {assign var="recipient_body" value=$recipient_body|cat:"Comments: "|cat:$ship.s_comments|cat:"\r\r"}
    {assign var="recipient_body" value=$recipient_body|cat:"Qty\tSKU\tName\r"}
    {assign var="recipient_body" value=$recipient_body|cat:$prod_list}
    {assign var="recipient_body" value=$recipient_body|cat:"\r\r"}
  {/if}
{/foreach}
{if $print_custom_detail == 'y'}
  {assign var="recipient_body" value=$recipient_body|cat:$custom_detail}
{/if}
{* print the recipient information *}{/strip}
{$recipient_body}
</pre>
</body>
</html>
