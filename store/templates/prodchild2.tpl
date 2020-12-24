{assign var=oneButton value="y"}
<div class="child-wrapper">
    {*<ul class="header-row">
    <li class="header-desc iefix">Description</li>
    {if $cid == 'rp' && $product.rewards_program == 'y'}
    <li class="header-price iefix">Points</li>
    {else}
    <li class="header-price iefix">Price</li>
    {/if}
    {if ($product.text_field == 'y' || $product.has_child_attributes == 'y') && $product.outseason != 'y'}
    <li class="header-options">Options</li>
    {/if}
    <li class="header-qty iefix">Qty</li>
    </ul>*}

    {*** PRINT CHILD PRODUCTS ***}
    {foreach from=$product.children item=child}
        {*** FORM FOR BUTTON EACH LINE ***}
        <ul class="row">
            <li class="child-desc iefix col-md-6 col-xs-4">
                {*if $child.child_image != ''}
                <img src="{$child.child_image|img_prefix}" alt="{$child.prod_name}" class="child-image" />
                {/if*}
                {$child.prod_name}{*$child.sku*}
            </li>
            <li class="child-price iefix col-md-3 col-xs-4">
                {if $cid == 'rp' && $product.rewards_program == 'y'}
                    <input type="text" name="reward_amount{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$child.prod_id}{/if}" class="dynamic_qty" value="{$child.rewards_points}" />
                {elseif $child.is_donation != 'y'}
                    {if $settings.interactive_pricing == 'y'}
                        <input type="text" class="dynamic_qty" id="price_{$child.prod_id}" value="{$currency_type}{if $child.min_qty > 1}{math equation="x*y" x=$child.price y=$child.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$child.price|commify}{/if}" readonly="true" />
                    {else}
                        {if $child.special == 'y' && $child.standard_price != $child.price}
                            <del>{$currency_type}{$child.standard_price|commify}</del>
                            <span class="sale-price"> {$currency_type}{$child.price|commify}</span>
                       {else}
                        {$currency_type}{$child.price|commify}
                       {/if}
                    {/if}
                {else}
                {$currency_type}<input type="text" name="donation_amount{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$child.prod_id}{/if}" class="donation" />
            {/if}
        </li>
        {* print add to cart if product is available *}
        {if ($child.stock_status == 'In Stock' || ($child.stock_status == 'Backordered' && $child.backordered_date != '')) && $product.outseason != 'y' && $child.outseason != 'y'}
            {if $settings.inventory_control != 'y' || ($settings.inventory_control == 'y' && ($child.inventory_control > $child.out_of_stock_point || $child.on_order > 0 || ($child.stock_status == 'Backordered' && $child.backordered_date != '')))}
                {if ($product.text_field == 'y' || $child.has_attributes == 'y') && $product.outseason != 'y'}
                    <li class="child-options iefix col-md-3 col-xs-4">
                        {if $child.has_attributes == 'y'}
                            <select name="option1{if $settings.additional_prod_display_type == '2'}_{$child.prod_id}{/if}">
                                {html_options values=$child.child_attributes output=$child.child_attributes}
                            </select>
                            <input type="hidden" name="num_attributes{if $settings.additional_prod_display_type == '2'}{$child.prod_id}{/if}" value="1" />
                        {/if}
                        {if $product.text_field == 'y'}
                            <input type="text" name="note{if $settings.additional_prod_display_type == '2'}{$child.prod_id}{/if}" value="" />
                        {/if}
                    </li>
                {/if}
                <li class="child-qty iefix col-md-3 col-xs-4">
                    {if $child.min_qty > 1 && $child.qty_in_set > 1 && $child.num_sets_displayed > 1 && $child.is_donation != 'y'}
                        <select class="form-control" name="qty{if $settings.additional_prod_display_type == '2'}{$child.prod_id}{/if}" id="qty_{$child.prod_id}" onclick="javascript: priceChange('{$child.prod_id}', 'sub', '{$child.price}', '{$currency_type}');">
                            <option label="{$child.min_qty}" value="{$child.min_qty}">{$child.min_qty}</option>
                            {assign var="disp_qty" value=$child.min_qty}
                            {section name="set" loop=$child.num_sets_displayed start=1}
                                {math equation="x+y" x=$child.qty_in_set y=$disp_qty assign="disp_qty"}
                                <option label="{$disp_qty}" value="{$disp_qty}">{$disp_qty}</option>
                            {/section}
                        </select>
                    {elseif $child.is_donation != 'y'}
                        {if $smarty.session.mobile}
                            <input type="number" {if $child.fractional_qty== 'y'}step="any"{/if} class="qty form-control" name="qty{if ($settings.additional_prod_display_type == '2' && $product.additional_prods|@count > 0) || $oneButton}{$child.prod_id}{/if}" id="qty_{$child.prod_id}" value="{if $child.min_qty > 1}{$child.min_qty}{elseif $oneButton}{else}1{/if}" size="1" maxlength="3"{if $settings.interactive_pricing == 'y'} onKeyUp="javscript: priceChange('{$child.prod_id}', 'dynamic', '{$child.price}', '{$currency_type}');"{/if} />{if $settings.interactive_pricing == 'y'} <img src="{$img_prefix}/images/plus.gif" class="inline" alt="Increase Quantity" onclick="javascript: priceChange('{$child.prod_id}', 'add', '{$child.price}', '{$currency_type}');" style="cursor: pointer;" /> <img src="{$img_prefix}/images/minus.gif" class="inline" alt="Decrease Quantity" onclick="javascript: if (checkMinQty('qty_{$child.prod_id}',{$child.min_qty}, 'interactive'))
                                    priceChange('{$child.prod_id}', 'sub', '{$child.price}', '{$currency_type}');" />{/if}
                        {else}
                            <input type="text" {if $child.fractional_qty== 'y'}step="any"{/if} class="qty form-control" name="qty{if ($settings.additional_prod_display_type == '2' && $product.additional_prods|@count > 0) || $oneButton}{$child.prod_id}{/if}" id="qty_{$child.prod_id}" value="{if $child.min_qty > 1}{$child.min_qty}{elseif $oneButton}{else}1{/if}" placeholder="Qty" size="1" maxlength="3" {*onfocus="javascript: if (this.value=='Qty') this.value='';" onblur="if (this.value=='') this.value='Qty';" *} {if $settings.interactive_pricing == 'y'} onKeyUp="javscript: priceChange('{$child.prod_id}', 'dynamic', '{$child.price}', '{$currency_type}');"{/if} />{if $settings.interactive_pricing == 'y'} <img src="{$img_prefix}/images/plus.gif" class="inline" alt="Increase Quantity" onclick="javascript: priceChange('{$child.prod_id}', 'add', '{$child.price}', '{$currency_type}');" style="cursor: pointer;" /> <img src="{$img_prefix}/images/minus.gif" class="inline" alt="Decrease Quantity" onclick="javascript: if (checkMinQty('qty_{$child.prod_id}',{$child.min_qty}, 'interactive'))
                                    priceChange('{$child.prod_id}', 'sub', '{$child.price}', '{$currency_type}');" />{/if}
                        {/if}
                    {elseif $child.is_donation == 'y'}
                        <input type="hidden" name="qty{if $settings.additional_prod_display_type == '2'}{$child.prod_id}{/if}" value="1" />
                    {/if}
                {if $oneButton}<input type="hidden" name="sku{$child.prod_id}" value="{$child.sku}" />{/if}
            </li>
{else}
{if ($product.text_field == 'y' || $child.has_attributes == 'y') && $product.outseason != 'y'}<li class="child-options iefix"></li>{/if}
<li class="child-qty iefix col-md-3 col-xs-4">Out of Stock</li>
{/if}
{elseif $product.outseason == 'y' || $child.outseason == 'y'}
<li class="child-qty iefix col-md-3 col-xs-4">Out of Season</li>
{else}
<li class="child-qty iefix col-md-3 col-xs-4">{$child.stock_status}</li>
{/if}
</ul>
{/foreach}

{*** ONE BUTTON AREA ***}
{if $oneButton && $settings.additional_prod_display_type != '2'}
    <div class="child-one-btn">
        {if $cid == 'rp' && $product.rewards_program == 'y'}
            <input type="hidden" name="reward_amount" value="1" />
        {/if}
        <input type="hidden" name="process_type" value="2" />
        <input type="submit" name="submit" value="Add to Cart" class="btn btn-primary text-uppercase pull-left mar_rt10 mar_btm" />
       {if $memberinfo.id}<div class="btn-wishlist pull-left mar_rt10 mar_btm"><input type="submit" name="wishlist_add" value="Add to Wishlist" class="btn btn-default text-uppercase" /></div>{/if}
       {if $memberinfo.id}<div class="btn-reorder pull-left"><input type="submit" name="reorder_add" value="Easy Reorder" class="btn btn-default text-uppercase" /></div>{/if}
    </div>
{/if}

</div>

{if $settings.inventory_control == 'y' && $settings.product_notify == 'y' && $product.notify == 'y'}
    <div class="notify"><a href="/product_notify/{if $view == 'product'}{$var1}/{$var2}{else}{$prod_id}/{$var1}{/if}">Notify me when this item is in stock</a></div>
{/if}
