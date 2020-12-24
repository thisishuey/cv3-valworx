{if $product.rel_prods|@count > 0}

<div class="spacer"></div>
<div class="sectionHeader">Related Products</div>

{assign var="rel_num_displayed" value="related_prods_num_displayed"}
{math equation=(x-y) x=$smarty.config.$rel_num_displayed y=1 assign=rel_displayed}

<table width="100%" cellpadding="5" cellspacing="5" border="0">
{counter start=0 assign=rel_num}
{foreach from=$product.rel_prods item=prod}
 {if $rel_num <= $rel_displayed}
 {cycle values="rel_left,rel_center,rel_right" assign="rel_which"}
 {if $rel_which == "rel_left"}
  {assign var="rel_begin" value="<tr>"}
  {assign var="rel_end" value=""}
 {elseif $rel_which == "rel_right"}
  {assign var="rel_begin" value=""}
  {assign var="rel_end" value="</tr>"}
 {else}
  {assign var="rel_begin" value=""}
 {/if}
 {$rel_begin}
  <td valign="top" width="33%">
  <table width="150" cellspacing="0" cellpadding="0" align="center">
   <tr><td align="center" class="normaltext"><a href="/product/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}{$url_split_char}{if $prod.cat_url_name != ''}{$prod.cat_url_name}{else}{$prod.cid}{/if}"><img src="{if $prod.web_image != ''}{$prod.web_image|img_prefix}{else}{$img_prefix}/images/nopicture_tn.jpg{/if}" alt="{$prod.prod_name|replace:"& ":"&amp; "}" class="bordered" /></a>
   <div class="prod_links"><a href="/product/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}{$url_split_char}{if $prod.cat_url_name != ''}{$prod.cat_url_name}{else}{$prod.cid}{/if}">{$prod.prod_name|replace:"& ":"&amp; "}</a></div>
   <div class="productprice">
   {if $prod.standard_price != '' && $prod.standard_price != '0.00'}
    {if $prod.special == 'y'}
     <del>{$currency_type}{$prod.standard_price|commify}</del>&nbsp;
     <span class="saleprice">{$currency_type}{$prod.special_price|commify}</span>
    {else}
     {$currency_type}{$prod.standard_price|commify}
    {/if}
   {/if}
   </div>

    {if $prod.has_attributes != 'y' && $prod.is_parent != 'y'}
     <div class="spacer"></div>
     <form method="post" action="index.php">
     <input type="hidden" name="action" value="ExpressOrder" />
     <input type="text" name="qty1" value="1" maxlength="3" class="formtext" size="1" />
     <input type="hidden" name="sku1" value="{$prod.sku}" />
     <input type="submit" name="submit" value="Buy Now" class="addtocart_btn btnstyle1" />
     </form>
    {else}
     <a href="/product/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}{$url_split_char}{if $prod.cat_url_name != ''}{$prod.cat_url_name}{else}{$prod.cid}{/if}">Choose Options</a>
    {/if}

   </td></tr>
  </table>
  </td>
{$rel_end}
{counter assign=rel_num}
{/if}
{/foreach}

{math equation=3-(x%y) y=3 x=$rel_num assign=rel_mod}
{if $rel_mod == 1}
 {cycle values="rel_left,rel_center,rel_right" assign="rel_which"}
 <td valign="top">&nbsp;</td>
 </tr>
{elseif $rel_mod == 2}
 {cycle values="rel_left,rel_center,rel_right" assign="rel_which"}
 {cycle values="rel_left,rel_center,rel_right" assign="rel_which"}
 <td valign="top">&nbsp;</td>
 <td valign="top">&nbsp;</td>
 </tr>
{/if}
{assign var=rel_which value=""}
</table>

{/if}
