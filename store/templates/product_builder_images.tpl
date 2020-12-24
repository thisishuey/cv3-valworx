{*{foreach from=$product.images item=img}
  <img src="{$img.thumbnail|img_prefix}" \>
{/foreach}*}
{assign var="cols" value=#sec_img_num_cols#}

{* if there are extra images...print them *}
{if $product.images|@count > 0}
<table align="center" width="98%" border="0" cellspacing="0" cellpadding="3">
  {if #sec_img_width# != 0 && #sec_img_width# != ''}
    {assign var="width" value="width=\""}
    {assign var="widthval" value=#sec_img_width#}
    {assign var="widthend" value="\""}
  {else}
    {assign var="width" value=""}
    {assign var="widthval" value=""}
    {assign var="widthend" value=""}
  {/if}
  {if #sec_img_height# != 0 && #sec_img_height# != ''}
    {assign var="height" value="height=\""}
    {assign var="heightval" value=#sec_img_height#}
    {assign var="heightend" value="\""}
  {else}
    {assign var="height" value=""}
    {assign var="heightval" value= ""}
    {assign var="heightend" value=""}
  {/if}
  {counter start=0 assign=num}
    {foreach from=$product.images item=img}
      {if $img.rank > 1 || #sec_img_include_first# == 'y'}
      {if ($num mod $cols) == 0}
        <tr>
      {/if}
      <td align="center">
        <img src="{$img.thumbnail|img_prefix}" {$width}{$widthval}{$widthend} {$height}{$heightval}{$heightend}>
      </td>
      {if ($num mod $cols) == $cols-1}
        </tr>
      {/if}
     {counter assign=num}
     {/if}
   {/foreach}

   {math equation="y % x" y=$num x=$cols assign=md}
   {if $md != 0}
     {section name=lp start=$md loop=$cols}
       <td>
         &nbsp;
       </td>
     {/section}
     </tr>
   {/if}
</table>

{/if}

