<br>
<table width="100%" border="0" cellpadding="5">
  <tr>
    <td width="40%" align="center" valign="top">
      <img align="center" src="{if $product.large_image == ''}{$img_prefix}/images/nopicture_tn.jpg{else}{$product.large_image|img_prefix}{/if}" border="0" style="border:1px solid black;">
      <a href="javascript: void(0);" onclick= "javascript:window.open('/fullsize/{$prod_id}/{$cid}','popup','width=550,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">Click to Enlarge</a>
    </td>
    <td valign="top" style="padding-right:25px;">
      <h3>{$product.prod_name}</h3>
      <div class="normaltext">
      {include file="display_discounts.tpl" discounts=$product.discounts}
      <br />{if $product.new == 'y'}<span style="color:#FF0000;">NEW!&nbsp;</span>{/if}{$product.prod_description}</div>

{if $product.special == 'y'}

      <br><div class="productprice">{$product.short_description}</div>

{/if}

      <br />
      {* send to friend and recipes *}
      {include file="prodrecipe.tpl"}
    </td>
  </tr>
</table>
