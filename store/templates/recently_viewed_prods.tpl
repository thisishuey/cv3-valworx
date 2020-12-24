{if $recently_viewed|@count > 0}

<div class="lnavHeader">Recently Viewed</div>

<table border="0" cellspacing="5" width="100%">
{counter start=1 step=1 assign=num}
{foreach from=$recently_viewed item=prod}
 {if $prod.cid != ''}        
  {assign var="prodcid" value=$prod.cid}
  {if $num <= #recently_viewed_num_displayed#}
  <tr>
   <td valign="top" align="left" width="50"><a href="/product/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}{$url_split_char}{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$prodcid}{/if}"><img src="{$prod.web_image|img_prefix}" alt="{$prod.prod_name|replace:"& ":"&amp; "}" width="50" class="bordered" /></a></td>
   <td align="left" class="normaltext"> 
    <a href="/product/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}{$url_split_char}{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$prodcid}{/if}">{$prod.prod_name|replace:"& ":"&amp; "}</a>
    {if $prod.content_only != 'y' && $prod.build_product != 'y'} 
     <div class="spacer_sm"></div>
     <div class="productprice">
     {if $prod.is_parent != 'y'}
      {if $prod.special == 'y'}
       <del>{$currency_type}{$prod.standard_price|commify}</del> <span class="saleprice">{$currency_type}{$prod.special_price|commify}</span>
      {else}
       {$currency_type}{$prod.standard_price|commify}
      {/if}
     {else}
      Choose Options
     {/if}
     </div>
    {/if}

   </td>
  </tr>
  {/if}
  {counter assign=num}
 {/if}
{/foreach}
</table>

{/if}