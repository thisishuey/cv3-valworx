{* if there are suggested products...print them *}
{if $rel_prods|@count > 0}
{*get num columns*}
{if $rel_prods|@count < #suggested_prods_num_displayed#}
  {assign var="numcols" value=$rel_prods|@count}
{else}
  {assign var="numcols" value=#suggested_prods_num_displayed#}
{/if}  
<table align="center" width="98%" border="0" cellspacing="0">
  <tr>
    <td colspan="{$numcols}" valign="top" align="left">
      <h4>Suggested Products</h4>
    </td>
  </tr>
  <tr>

  {if #suggested_prods_img_width# != 0 && #suggested_prods_img_width# != ''}
    {assign var="width" value="width=\""}
    {assign var="widthval" value=#suggested_prods_img_width#}
    {assign var="widthend" value="\""}
  {else}
    {assign var="width" value=""}
    {assign var="widthval" value=""}
    {assign var="widthend" value=""}
  {/if}
  {if #suggested_prods_img_height# != 0 && #suggested_prods_img_height# != ''}
    {assign var="height" value="height=\""}
    {assign var="heightval" value=#suggested_prods_img_height#}
    {assign var="heightend" value="\""}
  {else}
    {assign var="height" value=""}
    {assign var="heightval" value= ""}
    {assign var="heightend" value=""}
  {/if}
  {math equation= x/y x=100 y=#suggested_prods_num_displayed# assign=wdth}
  {counter start=1 assign=num}
    {foreach from=$rel_prods item=prod}
      {if $num <= #suggested_prods_num_displayed#}

    <td width="{$wdth}%" align="center" class="normaltext">
      <a href="/product/{$prod.prod_id}{$url_split_char}{$prod.cid}"><img src="{$prod.web_image|img_prefix}" {$width}{$widthval}{$widthend} {$height}{$heightval}{$heightend}></a><br />
      {if $prod.special_price}<strike>{$currency_type}{$prod.standard_price}</strike> {$currency_type}{$prod.special_price}{else}{$currency_type}{$prod.standard_price}{/if}<br />
      <a href="/product/{$prod.prod_id}{$url_split_char}{$prod.cid}">{$prod.prod_name}</a>
    </td>

      {/if}
    {counter assign=num}
  {/foreach}

  </tr>
</table>

{/if}
