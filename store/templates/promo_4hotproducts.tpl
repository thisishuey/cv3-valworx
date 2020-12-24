{if $featured_count > 0}

<div class="spacer"></div>

<div class="sectionHeader">Featured Products</div>

{assign var="num_displayed" value="featured_prods_num_displayed"}
{math equation=(x-y) x=$smarty.config.$num_displayed y=1 assign=displayed}

<table width="100%" cellpadding="5" cellspacing="5">
{counter start=0 assign=f_num}
{foreach from=$featured item=prod}
 {cycle values="f_left,f_center,f_right" assign="f_which"}
 {if $f_which == "f_left"}
  {assign var="f_begin" value="<tr valign=\"top\">"}
  {assign var="f_end" value=""}
 {elseif $f_which == "f_right"}
  {assign var="f_begin" value=""}
  {assign var="f_end" value="</tr>"}
 {else}
  {assign var="f_begin" value=""}
 {/if}
 {if $f_num <= $displayed}
 {$f_begin}
  <td width="25%">

  <table width="150" cellspacing="0" cellpadding="0" align="center">
   <tr><td align="center"><a href="/product/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}/{if $prod.cid_name != ''}{$prod.cid_name}{else}{$prod.cid}{/if}"><img src="{if $prod.web_image != ''}{$prod.web_image|img_prefix}{else}{$img_prefix}/images/nopicture_tn.jpg{/if}" alt="{$prod.prod_name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" class="bordered" /></a>
   <div class="prod_links"><a href="/product/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}/{if $prod.cid_name != ''}{$prod.cid_name}{else}{$prod.cid}{/if}">{$prod.prod_name|replace:"& ":"&amp; "}</a></div>
   <div class="productprice">
   {if $prod.price != '' && $prod.price != '0.00' && $prod.build_product != 'y'}
    {if $prod.special == 'y'}
     <del>{$currency_type}{$prod.standard_price|commify}</del>&nbsp;
     <span class="saleprice">{$currency_type}{$prod.special_price|commify}</span>
    {else}
     {$currency_type}{$prod.standard_price|commify}
    {/if}
   {/if}
   </div>
   </td></tr>
  </table>

  </td>
{$f_end}
{counter assign=f_num}
{/if}
{/foreach}

{math equation=3-(x%y) y=3 x=$f_num assign=f_mod}
{if $f_mod == 1}
 {cycle values="f_left,f_center,f_right" assign="f_which"}
 <td valign="top">&nbsp;</td>
 </tr>
{elseif $f_mod == 2}
 {cycle values="f_left,f_center,f_right" assign="f_which"}
 {cycle values="f_left,f_center,f_right" assign="f_which"}
 <td valign="top">&nbsp;</td>
 <td valign="top">&nbsp;</td>
 </tr>
{/if}
{assign var=f_which value=""}
</table>

{/if}