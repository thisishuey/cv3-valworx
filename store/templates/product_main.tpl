{if $view == 'prod_detail_list'}

<table width="100%" border="0" cellpadding="5" cellspacing="0">
 <tr valign="top">
  <td width="155" class="normaltext">

   <a href="/product/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$cid}{/if}" id="prod_link_{$prod_id}"><img src="{if $product.web_image == ''}{$img_prefix}/images/nopicture_tn.jpg{else}{$product.web_image|img_prefix}{/if}" border="0" alt="{$product.prod_name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" class="bordered" id="prod_image_{$prod_id}" /></a>

   <div class="prod_links"><a href="/product/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$cid}{/if}">{$product.prod_name}</a></div>

   {include file="display_discounts.tpl" discounts=$product.discounts}
   
   {if $product.new == 'y'}<span style="color:#FF0000;">NEW!&nbsp;</span>{/if}

   {$product.prod_description}

   {if $product.special == 'y'}
    <div class="spacer_sm"></div>
    <span class="productprice">{$product.short_description}</span>
   {/if}

   {if $product.comparable == 'y' && !in_array($product.prod_id,$compare_list)}
     <div class="spacer"></div>
     <input type="checkbox" value="{$product.prod_id}" onclick="javascript: addRemoveCompare(this,{$current_comparable},{$max_comparable});" /> Compare
   {/if}
  </td>
 </tr>
</table>

{else} {*** NORMAL PRODUCT PAGE ***}

<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
  <td width="200" class="imagePadding">

   {if $product.full_image != '' && $product.full_image != '/images/nopicture_tn.jpg'}
    <a href="javascript: void(0);" id="prod_link_{$prod_id}" onclick= "javascript:window.open('/fullsize/{$prod_id}/{$cid}','popup','width=550,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes,resizable=yes');">
   {/if}
   <img src="{if $product.large_image == ''}{$img_prefix}/images/nopicture_tn.jpg{else}{$product.large_image|img_prefix}{/if}" border="0" alt="{$product.prod_name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" class="bordered" id="prod_image_{$prod_id}" />
   {if $product.full_image != '' && $product.full_image != '/images/nopicture_tn.jpg'}
    Enlarge Image</a>
   {/if}

   {include file="product_images.tpl"}

  </td>
  <td class="normaltext">
   <h1>{$product.prod_name}</h1>

   {include file="display_discounts.tpl" discounts=$product.discounts}

   <h2>{if $product.new == 'y'}<span style="color:#FF0000;">NEW!&nbsp;</span>{/if}{$product.prod_description}</h2>

   {if $product.special == 'y' && $product.short_description != ''}
    <span class="productprice">{$product.short_description}</span>
   {/if}

   {include file="product_kit.tpl"}

   {if $product.is_donation != 'y'}
     {include file="prodrecipe.tpl"}
   {/if}
  </td>
 </tr>
</table>

{/if}
