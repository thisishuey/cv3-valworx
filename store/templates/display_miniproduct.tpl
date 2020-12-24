{* -----[ Variable Definitions ]----- *}
{if $prddisplay!='hide'}
  {if $p.url_name != ''}{assign var=url_name value=$p.url_name}
  {else}{assign var=url_name value=$p.prod_id}
  {/if}

  {if $p.cid_name != ''}{assign var=cid_name value=$p.cid_name}
  {else}{assign var=cid_name value=$p.cid}
  {/if}

  {assign var=url value='/product/'|cat:$url_name|cat:$url_split_char|cat:$cid_name}

  {if $p.web_image != ''}{assign var=image value=$p.web_image}
  {else}{assign var=image value='/images/nopicture_tn.jpg'}
  {/if}
    {if $p.large_image != ''}{assign var=largeimage value=$p.large_image}
  {else}{assign var=largeimage value='/images/nopicture_tn.jpg'}
  {/if}
{*<!-- {array_debug var=$p} -->*}
  {* -----[ Begin Display ]----- *}
  {if $p.cust_9 && $cid != 's' && $view != 'page_not_found' && $view != 'viewcart' && $label!='Float Related Products'}
   <div class="prodtable"><div class="subheading">{$p.cust_9}</div></div>
  {/if}
 
  <div class='thumb-product'>
    <div class="image">
      <a href="{$url}" title="{$p.prod_name}">{if $label=='Float Related Products' || $view=='viewcart'}<img src="{$largeimage|img_prefix}" alt="{$p.prod_name}" title="{$p.prod_name}" class="img-responsive center-block">{else}<img src="{$image|img_prefix}" alt="{$p.prod_name}" title="{$p.prod_name}" class="img-responsive center-block">{/if}</a>
    </div>
    <div class="info">
      <div class="name">
        <a href="{$url}" title="{$p.prod_name}">{$p.prod_name}</a><br/>
        <span>Stock #: <strong>{$p.sku}</strong></span>
      </div>
    </div>
    <div class="price">
         {if $p.has_attributes == 'y' || $p.is_parent == 'y'}
          {*if $label == 'Recently Viewed'}
            Various Options Available
          {else*}
            {include file="price_ranges.tpl" }
          {*/if*}
        {else}
          {if $p.special == 'y' && $p.standard_price > $p.special_price && $p.special_price > 0.00}
            <del>{$currency_type}{$p.standard_price|commify}</del>
            <span class="sale-price">{$currency_type}{$p.special_price|commify}</span>
          {elseif $p.standard_price > 0.00 && $p.standard_price != ''}
            <span class="price-label">Price:</span> {$currency_type}{$p.standard_price|commify}
          {/if}
        {/if}
        <br/>
        {include file="display_discounts.tpl" discounts=$p.discounts}
    </div>
    <div class="order">
      <div class="form">
        {if $label != 'Float Related Products'}
        <form method="post" action="index.php" name="product_form" id='product{$p.prod_id}_form'>
          <input type="hidden" name="action" value="AddCart" />
        {/if}
          {include file="custom_form.tpl" p=$products[$smarty.section.tmp_id.index]}
          {include file="product_mapping.tpl" p=$products[$smarty.section.tmp_id.index]}
          {if $p.gift_set == 'y'}{include file="prodgiftset.tpl" p=$products[$smarty.section.tmp_id.index]} {/if}
          {if $p.text_field == 'y'}<div class="note"><input type="text" name="note{if $one_add_button}{$prod_id}{/if}" /></div>{/if}
          {if $p.gift_certificate == 'y' && $p.gift_certificate_value < '1'}<div class="gc-value"><label>Value:</label> <input type="number" name="gift_certificate_value{if $one_add_button}{$prod_id}{/if}" /></div>{/if}
          {if $p.has_attributes == 'y'}<div class="attributes">{include file="attributes.tpl" p=$products[$smarty.section.tmp_id.index]}</div>{/if}
          {if $p.qty_in_set > 1 && $p.num_sets_displayed > 1}
           <div class="qty-line"><span class="qty-label">Quantity</span> <select name="qty{if $one_add_button}{$p.prod_id}{/if}" class="qty" id="qty_{$prod_id}" onclick="priceChange('{$p.prod_id}','sub','');">
           <option value="{$minQty}">{$minQty}</option>
           {assign var="disp_qty" value=$p.min_qty}
           {section name="set" loop=$p.num_sets_displayed start=1}
            {math equation="x+y" x=$p.qty_in_set y=$disp_qty assign="disp_qty"}
            <option value="{$disp_qty}">{$disp_qty}</option>
           {/section}
           </select></div>
          {else}
           <div class="qty-line"><span class="qty-label">Quantity</span> <input type="text" class='qty' name="{if $label == 'Float Related Products'}qty{$counter}{else}qty{if $one_add_button}{$p.prod_id}{/if}{/if}" id="qty_{$p.prod_id}" value="{if $label == 'Float Related Products'}0{else}{if !$one_add_button}{if $minQty}{$minQty}{else}1{/if}{/if}{/if}" {if $settings.interactive_pricing == 'y'}onKeyUp="priceChange('{$p.prod_id}','dynamic','');"{/if} /></div>
          {/if}
          <input type="hidden" id="hidden_price_{$p.prod_id}" value="{$p.price}" />
          {if $label == 'Float Related Products'}
            {*<input type="hidden" name="prod_id{$p.prod_id}" value="{$p.prod_id}" />
            <input type="hidden" name="cat_id{$p.prod_id}" value="{if $p.cid > 0}{$p.cid}{else}{$cid}{/if}" />
            <input type="hidden" name="sku{$p.prod_id}" value="{$p.sku}" />*}
            <input type="hidden" name="sku{$counter}" value="{$p.sku}" />
          {/if}
          {if !$one_add_button && $label != 'Float Related Products'}
           <input type="hidden" name="prod_id" value="{$p.prod_id}" />
           <input type="hidden" name="cat_id" value="{if $p.cid > 0}{$p.cid}{else}{$cid}{/if}" />
           <input type="hidden" name="sku" value="{$p.sku}" />
           <div class="btn-add mar_top10"><input type="submit" name="addtocart_submit" class="btn btn-primary" value="Add to Cart" /></div>
           {*if $memberinfo.id}<div class="btn-wishlist"><input type="submit" name="wishlist_add" class="button medium white" value="Add to Wishlist" /></div>{/if*}
           {*if $memberinfo.id}<div class="btn-reorder"><input type="submit" name="reorder_add" class="button medium white" value="Easy Reorder" /></div>{/if*}
         </form>
         {if $notify}<div><a href="{$notify_url}">Notify me when this item is in stock</a></div>{/if}
        {/if}
        </div>
    </div>
  </div>
{/if}