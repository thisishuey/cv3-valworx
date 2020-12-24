{if $print == "y"}
 {include file="print_top.tpl"}
{else}
 {include file="_top.tpl"}
{/if}

{include file="catbreadcrumb.tpl"}<br>

{if $cid != 's' && $cid != 'o' && $cid != 'p' && $cid != 'r' && $cid != 'n'}
 <h3>{$categories.$cid.name}</h3><br>
 {include file="catcascmenu.tpl"}

 {if $categories.$cid.image != ''}
  <img src="{$categories.$cid.image|img_prefix}" alt="{$categories.$cid.name}">
 {/if}

{else}
 <h3>Search Results</h3><br>
{/if}

{if $categories.$cid.cat_description != ''}
 <span class="normaltext">{$categories.$cid.cat_description}</span><br>
{/if}

{if $print != "y" && $products.data.0.prod_id != ''}
  <div class="normaltext">
   {include file="category_sort.tpl}
   {include file="prods_per_page.tpl}
  </div>
  <br /><br />
 <a href="javascript:void(0);" onclick="javascript:window.open('/category_print/{$cid}','print_','width=780,height=550,toolbars=yes,scrollbars=yes,status=no,menubar=yes'); return false;">Printable View</a><br><br>
{/if}

{if $products.data.0.prod_id != ''}

<table width="100%" cellpadding="5" cellspacing="0" border="0">
{counter assign=number start=0}
{foreach from=$products.data item=prod}
 {if $prod.cid > 0}
  {assign var="prodcid" value=$prod.cid}
 {else}
  {assign var="prodcid" value=$cid}
 {/if}
 {cycle values="left,middle,right" assign="which"}
 {if $which == "left"}
  {assign var="begin" value="<tr>"}
  {assign var="end" value=""}
 {elseif $which == "right"}
  {assign var="begin" value=""}
  {assign var="end" value="</tr>"}
 {else}
  {assign var="begin" value=""}
 {/if}
 {$begin}

  <td valign="top" width="33%" style="padding-top:10px;" class="normaltext">
  {include file="cat_thumb.tpl"}
  {if $prod.content_only != 'y' && $prod.build_product != 'y'}
   {include file="catparent.tpl"}
   {if $prod.is_parent != 'y' && $prod.gift_set != 'y' && $prod.text_field != 'y' && $prod.outseason != 'y' && $prod.has_attributes != 'y' && ($prod.form_id == 0 || $prod.form_id == '') && ($prod.gift_certificate != 'y' || ($prod.gift_certificate_value > '0' && $prod.gift_certificate_send != 'y'))}
    {if ($settings.inventory_control != 'y' || ($settings.inventory_control == 'y' && ($prod.inventory_control > $prod.out_of_stock_point || $prod.on_order > 0 || ($prod.stock_status == 'Backordered' && $prod.backordered_date != '')))) && $prod.stock_status != 'Out of Stock'}
     {include file="cataddtocart.tpl"}
    {else}
     <a href="/{if $prod.build_product != 'y'}product{else}product_builder{/if}/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}/{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$prodcid}{/if}">Out of Stock</a>
    {/if}
    {elseif $prod.outseason == 'y'}
    <a href="/{if $prod.build_product != 'y'}product{else}product_builder{/if}/{if $prod.url_name != ''}{$prod.url_name}{else}{$prod.prod_id}{/if}/{if $categories.$prodcid.url_name != ''}{$categories.$prodcid.url_name}{else}{$prodcid}{/if}">Out of Season</a>
   {else}
    {include file="catchild.tpl"}
   {/if}
  {else}
   {include file="content_prodcat.tpl"}
  {/if}
  </td>
 {$end}
{counter assign=number}
{/foreach}

{math equation=3-(x%y) y=3 x=$number assign=mod}
{if $mod == 1}
 {cycle values="left,middle,right" assign="which"}
 <td valign="top" width="33%">&nbsp;</td></tr>
{elseif $mod == 2}
 {cycle values="left,middle,right" assign="which"}
 {cycle values="left,middle,right" assign="which"}
 <td valign="top" width="33%">&nbsp;</td>
 <td valign="top" width="33%">&nbsp;</td>
</tr>
{/if}
{assign var=which value=""}
</table>

{/if}

{if $settings.sub_category_display == 'y'}
 {include file="sub_cat_list.tpl"} 
{/if}

{if $print != "y"}
 {include file="prevnextmenu.tpl"}
{/if}

{if $print == "y"}
 {include file="print_bottom.tpl"}
{else}
 {include file="_bottom.tpl"}
{/if}
