{include file="_top.tpl"}

{include file="checkout_progress.tpl" step="2"}

<h1>Recipient Selection</h1>

<div class="recipients">
<p class="legend">Please match each item in your cart with the desired recipient.</p>

<form method="post" action="index.php" name="recipients" onsubmit="javascript: return verifyRecipients(this);"> 
<input type="hidden" name="action" value="CheckoutShippingDetail" />

 <ul class="header-row">
  <li class="header-item">Item #</li>
  <li class="header-product">Product</li>
  <li class="header-recipient">Recipient</li>
 </ul>
 {foreach from=$items.list key=key item=prod}
 <ul>
  <li class="table-item">{$prod.sku}</li>
  <li class="table-product">
   {if $prod.web_image}<img src="{$prod.web_image|img_prefix}" alt="{$prod.name|replace:'& ':'&amp; '}" class="table-image" />{/if}
   {$prod.name}
   {if $prod.note != ''}
    <div class="note">Note: {$prod.note}</div>
   {/if}
   {if $prod.gifts|@count > 0}
    {foreach from=$prod.gifts key=i item=glist}
     {if $glist != ''}
      <div class="gifts">* {$glist}</div>
     {/if}
    {/foreach}
   {/if}
   {if $prod.att_list != ''}
    <div class="attributes">{$prod.att_list}</div>
   {/if}
   {if $prod.wishlist != ''}
    <div class="wishlist">* Wishlist</div>
   {/if}
   {if $prod.custom_form != '' || $prod.custom_form == '0'}
    <div class="details"><a href="javascript:void(0);" onclick="javascript:window.open('/custom_form_info/{$prod.cart_id}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">view details &raquo;</a></div>
   {/if}
   {if $prod.build_parent == 'y'}
    <div class="details"><a href="javascript:void(0);" onclick="javascript:window.open('/product_builder_info/{$prod.cart_id}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">view details &raquo;</a></div>
   {/if}
  </li>
  <li class="table-recipient"><select name="recp{$prod.sku}-{$key}">
   <option value="">Select Recipient</option>
   {html_options options=$items.recipient.$key}
   </select>
  </li>
 </ul>
 {/foreach}

 <div class="buttonrow clearfix"><input type="submit" name="submit" value="Continue to Billing &gt;" class="button large style1" /></div>
</form>
</div>

{include file="_bottom.tpl"}