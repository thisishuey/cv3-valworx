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
    {if !$oneButton}<li class="header-buy iefix">&nbsp;</li>{/if}
    </ul>*}

    {*** PRINT CHILD PRODUCTS ***}
    {foreach from=$product.children item=child}
        {*** FORM FOR BUTTON EACH LINE ***}
        {if !$oneButton}
        </form> {* end main product form *}
        <form name="product_form_{$child.prod_id}" id="product_form_{$child.prod_id}" method="post" action="index.php">
            <input type="hidden" name="action" value="AddCart" />
        {/if}
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
                {if $oneButton}
                  <input type="hidden" name="sku{$child.prod_id}" value="{$child.sku}" />
                  <input type="hidden" name="prod_id{$child.prod_id}" value="{$child.prod_id}" />
                  <input type="hidden" name="cat_id{$child.prod_id}" value="{if $child.cid > 0}{$child.cid}{else}{$cid}{/if}" />
                {/if}
            </li>
            {if $settings.recurring_orders_by_product == 'y' && $product.recurring_eligible == 'y'}
                    <br/>
                    <div id="recurring_eligible_{$child.prod_id}"{if $settings.child_display_type == '2'} style="display: none;"{/if}><legend>Eligible for recurring order:</legend><br/>
                      <div class="controlset">
                        <input type="radio" class="recurring_no" id="recurring_no_{$child.prod_id}" name="recurring_yesno{if $settings.child_display_type == '2'}{$child.prod_id}{/if}" value="n" checked/> <label for="recurring_no_{$child.prod_id}">Only order once</label><br/>
                        <input type="radio" class="recurring_yes" id="recurring_yes_{$child.prod_id}" name="recurring_yesno{if $settings.child_display_type == '2'}{$child.prod_id}{/if}" value="y" /><label for="recurring_yes_{$child.prod_id}"> Order Every
                          <input type="text" class="recurring_interval_num" id="recurring_interval_num_{$child.prod_id}" name="recurring_interval_num{if $settings.child_display_type == '2'}{$child.prod_id}{/if}" value="0"/>
                          <select name="recurring_interval{if $settings.child_display_type == '2'}{$child.prod_id}{/if}" class="recurring_interval">
                            <option value="w" selected> weeks</option>
                            <option value="d" > days</option>
                          </select>
                        </label>
                      </div>
                    </div>
                {/if}
            {if !$oneButton}
                <li class="child-buy iefix col-md-3 col-xs-4">
                    {if $child.stock_status=='Backordered' && $child.backordered_date != '' && $child.is_donation != 'y'}
                        <div class="red">*Backordered: {$child.backordered_date}</div>
                    {/if}
                    {if $view == 'product_builder'}
                      <input type="hidden" value="{$bp_id}" name="bp_id">
                      <input type="hidden" value="{$st_id}" name="st_id">
                      <input type="hidden" value="1" name="qty">
                    {/if}
                    <input type="hidden" name="prod_id" value="{$child.prod_id}" />
                    <input type="hidden" name="cat_id" value="{if $child.cid > 0}{$child.cid}{else}{$cid}{/if}" />
                    <input type="hidden" name="sku" value="{$child.sku}" />
                    <input type="hidden" name="recipient_mapping" id="recipient_mapping_{$child.prod_id}" value=""/>
                    <input type="hidden" name="new_recipient_mapping" id="new_recipient_mapping_{$child.prod_id}" value=""/>
                    {if $cid == 'rp' && $product.rewards_program == 'y'}
                        {if $child.rewards_points <= $member.points_available}
                            <input type="hidden" name="reward_amount" value="{$child.rewards_points}" />
                            <input type="submit" name="submit" value="Add to Cart" class="btn btn-primary text-uppercase pull-left mar_rt10 mar_btm addtocart_button" />
                        {/if}
                    {else}
                        <input type="submit" name="submit" value="Add to Cart" class="btn btn-primary text-uppercase pull-left mar_rt10 mar_btm addtocart_button" />
                    {/if}
                {if $memberinfo.id}<div class="btn-wishlist pull-left mar_rt10 mar_btm"><input type="submit" name="wishlist_add" value="Add to Wishlist" class="btn btn-default text-uppercase" /></div>{/if}
            {if $memberinfo.id}<div class="btn-reorder pull-left"><input type="submit" name="reorder_add" value="Easy Reorder" class="btn btn-default text-uppercase" /></div>{/if}
        </li>
    {/if}
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
{if !$oneButton}
    <script type="text/javascript">
                            $('#product_form_{$child.prod_id}').submit(function() {ldelim}
                                if ($('#recipient_mapping_{$child.prod_id}').val() == '' && $('#recipient_mapping').val() != ''){ldelim}
                                    $('#recipient_mapping_{$child.prod_id}').val($('#recipient_mapping').val());
        {rdelim}
                                if ($('#recipient_mapping_{$child.prod_id}').val() == '' && $('#recipient_mapping_ob_{$child.parent}').val() != ''){ldelim}
                                    $('#recipient_mapping_{$child.prod_id}').val($('#recipient_mapping_ob_{$child.parent}').val());
        {rdelim}
                                if ($('#new_recipient_mapping_{$child.prod_id}').val() == '' && $('#new_recipient_mapping').val() != ''){ldelim}
                                    $('#new_recipient_mapping_{$child.prod_id}').val($('#new_recipient_mapping').val());
        {rdelim}
                                if ($('#new_recipient_mapping_{$child.prod_id}').val() == '' && $('#new_recipient_mapping_ob_{$child.parent}').val() != ''){ldelim}
                                    $('#new_recipient_mapping_{$child.prod_id}').val($('#new_recipient_mapping_ob_{$child.parent}').val());
        {rdelim}
        {rdelim});
    </script>
</form>
{/if}
{/foreach}

{*** ONE BUTTON AREA ***}
{if $oneButton && $settings.additional_prod_display_type != '2'}
    <div class="child-one-btn">
        {if $cid == 'rp' && $product.rewards_program == 'y'}
            <input type="hidden" name="reward_amount" value="1" />
        {/if}
        <input type="hidden" name="process_type" value="2" />
        {if $settings.recurring_orders_by_product == 'y' && $product.recurring_eligible == 'y' && $settings.child_display_type == '2'}
            <div id="recurring_eligible_children">
                {*<!-- <legend>Eligible for recurring order:</legend> -->*}
                <div class="controlset radio">
                    <input type="radio" id="recurring_no_children" name="recurring_yesno_children" value="n" checked/>
                    <label for="recurring_no_children">Only order once</label>
                </div>
                <div class="controlset radio">
                    <input type="radio" id="recurring_yes_children" name="recurring_yesno_children" value="y" />
                    <label for="recurring_yes_children"> Order Every
                        <input type="text" id="recurring_interval_num_children" name="recurring_interval_num_children" value="0"/>
                        <select name="recurring_interval_children">
                            <option value="w" selected> weeks</option>
                            <option value="d" > days</option>
                        </select>
                    </label>
                </div>
            </div>
        {/if}
        <input type="submit" name="submit" value="Add to Cart" class="btn btn-primary text-uppercase pull-left mar_rt10 mar_btm addtocart_button" />
        {if $memberinfo.id}<div class="btn-wishlist pull-left mar_rt10 mar_btm"><input type="submit" name="wishlist_add" value="Add to Wishlist" class="btn btn-default text-uppercase" /></div>{/if}
        {if $memberinfo.id}<div class="btn-reorder pull-left"><input type="submit" name="reorder_add" value="Easy Reorder" class="btn btn-default text-uppercase" /></div>{/if}
</div>
{/if}

</div>

{if $settings.inventory_control == 'y' && $settings.product_notify == 'y' && $product.notify == 'y'}
    <div class="notify"><a href="/product_notify/{if $view == 'product'}{$var1}/{$var2}{else}{$prod_id}/{$var1}{/if}">Notify me when this item is in stock</a></div>
{/if}