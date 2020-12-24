<form method="post" action="index.php">
<input type="hidden" name="action" value="AddCart" />

{*$prod.shipping_weight} {$prod.unit}<br>*}

{if $settings.interactive_pricing == 'y' || $prod.is_donation == 'y'}
  {if $prod.is_donation == 'y'}{$currency_type}{/if}<input type="text"{if $prod.is_donation == 'y'} name="donation_amount{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}"{/if} class="dynamic_qty{if $prod.special == 'y' && $prod.is_donation != 'y'} saleprice{elseif $prod.is_donation == 'y'} donation{/if}" id="price_{$prod.prod_id}" value="{if $prod.is_donation != 'y'}{$currency_type}{if $prod.min_qty > 1}{math equation="x*y" x=$prod.price y=$prod.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$prod.price|commify}{/if}{else}0{/if}"{if $prod.is_donation != 'y'} readonly="readonly"{/if} />
  <input type="hidden" id="hidden_price_{$prod.prod_id}" value="{$prod.price}" />
{else}
 <span class="productprice">
 {if $prod.special == 'y' && $prod.standard_price != $prod.price}
  <del>{$currency_type}{$prod.standard_price|commify}</del></span><span class="saleprice">
 {/if}
 {$currency_type}{if $prod.min_qty > 1}{math equation="x*y" x=$prod.price y=$prod.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$prod.price|commify}{/if}</span>
{/if}
<div class="spacer_sm"></div>

<input type="hidden" name="prod_id" value="{$prod.prod_id}" />
<input type="hidden" name="cat_id" value="{$prodcid}" />
<input type="hidden" name="price" value="{$prod.price}" />
{if $prod.qty_in_set > 1 && $prod.num_sets_displayed > 1 && $prod.is_donation != 'y'}
  <select name="qty{if $settings.additional_prod_display_type == '2'}{$prod.prod_id}{/if}" id="qty_{$prod.prod_id}" onclick="javascript: priceChange('{$prod.prod_id}','sub','{$prod.price}','{$currency_type}');">
    <option label="{$prod.min_qty}" value="{$prod.min_qty}">{$prod.min_qty}</option>
    {assign var="disp_qty" value=$prod.min_qty}
    {section name="set" loop=$prod.num_sets_displayed start=1}
      {math equation="x+y" x=$prod.qty_in_set y=$disp_qty assign="disp_qty"}
      <option label="{$disp_qty}" value="{$disp_qty}">{$disp_qty}</option>
    {/section}
   </select>
{elseif $prod.is_donation != 'y'}
  <input type="text" name="qty" id="qty_{$prod.prod_id}" value="{if $prod.min_qty > 1}{$prod.min_qty}{else}1{/if}" size="1" class="formtext" maxlength="3"{if $settings.interactive_pricing == 'y'} onKeyUp="javascript: priceChange('{$prod.prod_id}','dynamic','{$prod.price}','{$currency_type}');"{/if} />{if $settings.interactive_pricing == 'y'} <img src="{$img_prefix}/images/plus.gif" class="inline" alt="Increase Quantity" onclick="javascript: priceChange('{$prod.prod_id}','add','{$prod.price}','{$currency_type}');" style="cursor: pointer;" /> <img src="{$img_prefix}/images/minus.gif" class="inline" alt="Decrease Quantity" onclick="javascript: if (checkMinQty('qty_{$prod.prod_id}',{$prod.min_qty},'interactive')) priceChange('{$prod.prod_id}','sub','{$prod.price}','{$currency_type}');" style="cursor: pointer;" />{/if}&nbsp;
{elseif $prod.is_donation == 'y'}
  <input type="hidden" name="qty" id="qty_{$prod.prod_id}" value="1" />
{/if}
<input type="submit" name="submit" value="{if $prod.is_donation == 'y'}Donate{else}Buy Now{/if}" class="addtocart_btn btnstyle1" onclick="javascript: return checkMinQty('qty_{$prod.prod_id}',{$prod.min_qty},'');" />
</form>
