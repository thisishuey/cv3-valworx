{if $upsells_num > 0}

<div class="spacer"></div>
<div class="sectionHeader">Suggested Products</div>

<table width="100%" cellpadding="0" cellspacing="5">

{counter start=1 assign=number_ab}
{foreach from=$upsells item=prod}
{cycle values="left2,middle2,right2" assign="nwhich"}
{if $nwhich == "left2"}
  {assign var="nbegin" value="<tr>"}
  {assign var="nend" value=""}
{elseif $nwhich == "right"}
  {assign var="nbegin" value=""}
  {assign var="nend" value="</tr>"}
{else}
  {assign var="nbegin" value=""}
{/if}
{$nbegin}
{if $number_ab <= #upsells_num_displayed#}

  <td align="center" valign="top" style="padding-bottom:7px;" class="normaltext">
   <a href="/product/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}{$url_split_char}{if $prod.cid_name != ''}{$prod.cid_name}{else}{$prod.cid}{/if}"><img src="{if $prod.web_image != ''}{$prod.web_image|img_prefix}{else}{$img_prefix}/images/nopicture_tn.jpg{/if}" alt="{$prod.prod_name}"></a>
   <div class="prod_links"><a href="/product/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}{$url_split_char}{if $prod.cid_name != ''}{$prod.cid_name}{else}{$prod.cid}{/if}">{$prod.prod_name}</a></div>

  {if $prod.content_only != 'y'}
    <div class="productprice">
    {if $prod.has_attributes != 'y' && $prod.is_parent != 'y'}
      {if $prod.special == 'y'}
        <del>{$currency_type}{$prod.standard_price|commify}</del>&nbsp;
        {$currency_type}{$prod.special_price|commify}
      {else}
        {$currency_type}{$prod.standard_price|commify}
      {/if}
    {else}
       Various Options Available
    {/if}
  </div>
  {/if}     
  </td>

{/if}
{$nend}
{counter assign=number_ab}
{/foreach}
 {if $nwhich != "right2"}</tr>{/if}
</table>

{/if}
