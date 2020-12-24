{if $specials_count > 0}

<div class="spacer"></div>

<div class="sectionHeader">Online Specials</div>

{assign var="num_displayed" value="specials_num_displayed"}
{math equation=(x-y) x=$smarty.config.$num_displayed y=1 assign=displayed}

<table width="100%" cellpadding="5" cellspacing="5">
{counter start=0 assign=s_num}
{foreach from=$specials item=prod}
 {cycle values="s_left,s_center,s_right" assign="s_which"}
 {if $s_which == "s_left"}
  {assign var="s_begin" value="<tr valign=\"top\">"}
  {assign var="s_end" value=""}
 {elseif $s_which == "s_right"}
  {assign var="s_begin" value=""}
  {assign var="s_end" value="</tr>"}
 {else}
  {assign var="s_begin" value=""}
 {/if}
 {if $s_num <= $displayed}
 {$s_begin}
  <td width="25%">

  <table width="150" cellspacing="0" cellpadding="0" align="center">
   <tr><td align="center"><a href="/product/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}/{if $prod.cid_name != ''}{$prod.cid_name}{else}{$prod.cid}{/if}"><img src="{if $prod.web_image != ''}{$prod.web_image|img_prefix}{else}{$img_prefix}/images/nopicture_tn.jpg{/if}" alt="{$prod.prod_name|replace:"& ":"&amp; "|strip_quotes|strip_tags:false}" class="bordered" /></a>
   <div class="prod_links"><a href="/product/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}/{if $prod.cid_name != ''}{$prod.cid_name}{else}{$prod.cid}{/if}">{$prod.prod_name|replace:"& ":"&amp; "}</a></div>
   <span class="productprice">
   {if $prod.price != 'Various Options Available' && $prod.price != ''}
     {if $prod.price != '0.00' && $prod.build_product != 'y'}
       {if $prod.special == 'y'}
         <del>{$currency_type}{$prod.standard_price|commify}</del>&nbsp;
         <span class="saleprice">{$currency_type}{$prod.special_price|commify}</span>
       {else}
         {$currency_type}{$prod.standard_price|commify}
       {/if}
     {/if}
   {else}
     Various Options Available
   {/if}
   </span>
   </td></tr>
  </table>

  </td>
{$s_end}
{counter assign=s_num}
{/if}
{/foreach}

{math equation=3-(x%y) y=3 x=$s_num assign=s_mod}
{if $s_mod == 1}
 {cycle values="s_left,s_center,s_right" assign="s_which"}
 <td valign="top">&nbsp;</td>
 </tr>
{elseif $s_mod == 2}
 {cycle values="s_left,s_center,s_right" assign="s_which"}
 {cycle values="s_left,s_center,s_right" assign="s_which"}
 <td valign="top">&nbsp;</td>
 <td valign="top">&nbsp;</td>
 </tr>
{/if}
{assign var=s_which value=""}
</table>

{/if}