{* ------[ This beginning part is just variable definitions that could possibly be moved to the backend code ]------ *}

{if $product.cid > 0}{assign var="prodcid" value=$product.cid}
{else}{assign var="prodcid" value=$cid}
{/if}

{if $settings.additional_prod_display_type == '2'}{assign var="one_add_button" value="y"}{/if}

{assign var=name value=$product.prod_name|replace:"& ":"&amp; "|replace:"'":"&#39;"|replace:'"':"&#34;"|strip_quotes|strip_tags:false}

{assign var="pid" value=$product.prod_id}
{assign var="prod_id" value=$product.prod_id}
{*assign var="results" value=$product.recipes*}
{assign var="attributes" value=$attys.$prod_id}
{assign var="valid" value=$valid.$prod_id}

{if ($product.stock_status == 'Backordered' && $product.backordered_date) || ($product.on_order > 0 && $product.inventory_control <= $product.out_of_stock_point && $product.backordered_date)}{assign var=backorder value=1}{/if}
{if $product.children|@count == ''}
    {if $product.outseason != 'y'}
        {if (($settings.inventory_control != 'y' || ($settings.inventory_control == 'y' && $product.has_attributes != 'y' && ($product.inventory_control > $product.out_of_stock_point || $product.on_order > 0 || ($product.stock_status == 'Backordered' && $product.backordered_date != '')))) && $product.stock_status != 'Out of Stock') || ($product.has_attributes == 'y' && $attributes.attributes|@count > 0)}
            {assign var=product_status value='In Stock'}
            {assign var=allow_purchase value=1}
        {else}
            {assign var=product_status value='Out of Stock'}
            {assign var=allow_purchase value=''}
        {/if}
    {else}
        {assign var=product_status value='Out of Season'}
        {assign var=allow_purchase value=''}
    {/if}
{else}
    {assign var=allow_purchase value=1}
{/if}

{assign var="custom_form_num" value=$product.form_id}
{assign var="custom_form" value=$custom_forms.$custom_form_num}

{if $product.min_qty > 1}{assign var=minQty value=$product.min_qty}{else}{assign var=minQty value=1}{/if}

{if $settings.inventory_control == 'y' && $settings.product_notify == 'y'}
    {assign var=notify value=1}
    {if $view == 'product' || view == 'product_builder'}{assign var=notify_url value="/product_notify/"|cat:$var1|cat:"/"|cat:$var2}
    {else}{assign var=notify_url value="/product_notify/"|cat:$prod_id|cat:"/"|cat:$var1}
    {/if}
{/if}

{if $product.web_image}{assign var=thumb_image value=$product.web_image}
{else}{assign var=thumb_image value="/images/nopicture_tn.jpg"}
{/if}

{if $product.large_image}{assign var=image value=$product.large_image}
{else}{assign var=image value="/images/nopicture_tn.jpg"}
{/if}

{if $product.full_image}{assign var=full_image value=$product.full_image}
{else}{assign var=full_image value="/images/nopicture_tn.jpg"}
{/if}

{if $view == 'product' || view == 'product_builder'}
{else}
    {if $categories.$prodcid.url_name != ''}{assign var=cat_url value=$categories.$prodcid.url_name}
    {else}{assign var=cat_url value=$prodcid}
    {/if}
    {if $product.url_name}{assign var="prod_url" value="/product/"|cat:$product.url_name}
    {else}{assign var=prod_url value="/product/"|cat:$product.prod_id}
    {/if}
{/if}
{capture name="product_url"}{$prod_url}/{$cat_url}{/capture}

{*-------[ Begin Display ]------------------------------------------------------------------------*}

{if !$child}
    <section class='product clearfix'>
        {if $product.build_product == 'y' || $product.content_only == 'y'}
            <div class="content-only">
                <div class='image iefix'>
                    <a href="{$smarty.capture.product_url}"><img src="{if $view == 'product'}{$image|img_prefix}{else}{$thumb_image|img_prefix}{/if}" alt="{$name}" id='product_image-{$pid}' class='product_image' /></a>
                </div>
                <div class='info'>
                    <div class='content'>
                        <a href='{$smarty.capture.product_url}'><h2>{$product.prod_name}</h2></a>
                        <div class="prod-desc">{$product.prod_description|strip_tags|truncate:"120"}</div>
                        <a class="read_more_link" href='{$smarty.capture.product_url}'>Read More &raquo;</a>
                    </div>
                </div>
            </div>
        {else}
            <div class='image iefix'>
                <a href="{$smarty.capture.product_url}" title="{$name}"><img src="{if $view == 'product'}{$image|img_prefix}{else}{$thumb_image|img_prefix}{/if}" alt="{$name}" title="{$name}" id='product_image-{$pid}' class='product_image' /></a>
            </div>

            <div class='info iefix'>
                <div class="content">
                    {if !$child}
                        <a href='{$smarty.capture.product_url}' title="{$name}"><h2>{$product.prod_name}</h2></a>
                            {else}
                        <h2>{$product.prod_name}</h2>
                    {/if}
                    <div class="rev-stars">{include file="product_review.tpl"}</div>
                    {if $backorder}
                        <div class='backordered'>*Backordered: {$product.backordered_date}</div>
                    {/if}
                    {if $product.desc_header}
                        <div class="short-desc">{$product.desc_header}</div>
                    {/if}
                </div>

                <div class="order">

                    <div class="form">
                        {*** CATEGORY FORM LAYOUT ***}
                        {if $allow_purchase}
                            {if $product.is_parent != 'y' && $product.has_attributes != 'y' && $product.gift_set != 'y' && $product.text_field != 'y' && ($product.form_id == 0 || $product.form_id == '') && ($product.gift_certificate != 'y' || ($product.gift_certificate_value > '0' && $product.gift_certificate_send != 'y'))}
                                {if $error != ''}
                                    <div class="errors">
                                        <p><em>{$error}</em></p>
                                    </div>
                                {/if}

                                <form class="form-inline" method="post" action="index.php" name="product_form" id='product{$pid}_form'>
                                    <input type="hidden" name="action" value="AddCart" />
                                    <div class="row">
                                        <div class="col-xs-4">
                                            {if $product.is_donation != 'y'}
                                                <div class='price' id="price_{$prod_id}">
                                                    {if $cid == 'rp' && $product.rewards_program == 'y' && $product.rewards_points > 0}
                                                        <span>Rewards Points: {$product.rewards_points}</span>
                                                    {else}
                                                        <span>{if $product.special == 'y' && $product.standard_price > $product.special_price}<del>{$currency_type}{$product.standard_price|commify}</del> </span><span class="sale-price">{/if}{$currency_type}{$product.price*$minQty|commify}</span>
                                                    {/if}
                                                </div>
                                            {/if}
                                        </div>
                                        <div class="col-xs-8">
                                            {if $product.qty_in_set > 1 && $product.num_sets_displayed > 1}
                                                <div class="qty-line">
                                                    <label for="qty{if $one_add_button}{$prod_id}{/if}">Qty.</label>
                                                    <select class="form-control" name="qty{if $one_add_button}{$prod_id}{/if}" id="qty_{$prod_id}" onclick="priceChange('{$prod_id}', 'sub', '', '{$currency_type}');">
                                                        <option value="{$minQty}">{$minQty}</option>
                                                        {assign var="disp_qty" value=$product.min_qty}
                                                        {section name="set" loop=$product.num_sets_displayed start=1}
                                                            {math equation="x+y" x=$product.qty_in_set y=$disp_qty assign="disp_qty"}
                                                            <option value="{$disp_qty}">{$disp_qty}</option>
                                                        {/section}
                                                    </select>
                                                </div>
                                            {else}
                                                <div class="qty-line">
                                                    <label for="qty{if $one_add_button}{$prod_id}{/if}">Qty.</label>
                                                    <input type="number" {if $product.fractional_qty == 'y'}step="any"{/if} class="qty form-control" name="qty{if $one_add_button}{$prod_id}{/if}" id="qty_{$prod_id}" value="{if !$one_add_button}{$minQty}{/if}" {if $settings.interactive_pricing == 'y'}onKeyUp="priceChange('{$prod_id}', 'dynamic', '', '{$currency_type}');"{/if} />
                                                </div>
                                            {/if}
                                        </div>
                                    </div>

                                    <input type="hidden" id="hidden_price_{$prod_id}" value="{$product.price}" />
                                    <input type="hidden" name="prod_id" value="{$prod_id}" />
                                    <input type="hidden" name="cat_id" value="{if $product.cid > 0}{$product.cid}{else}{$cid}{/if}" />
                                    <input type="hidden" name="sku" value="{$product.sku}" />
                                    {if $cid == 'rp'}
                                        {if $member.points_available >= $product.rewards_points}
                                            <input type="hidden" name="reward_amount" id="reward_amount_{$prod_id}" value="{$product.rewards_points}" />
                                            <input type="submit" name="addtocart_submit" class="btn btn-primary text-uppercase addtocart_button" value="Add to Cart" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty}, '');" />
                                        {/if}
                                    {else}
                                        <input type="button" name="addtocart_submit" class="btn btn-primary text-uppercase addtocart_button" value="Add to Cart" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty}, '');" />
                                    {/if}
                                </form>
                            {else}
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="price">{include file="price_ranges.tpl" p=$product}</div>
                                    </div>
                                </div>
                                <input type="button" name="addtocart_submit" class="btn btn-primary text-uppercase" value="View Options" onclick="window.location.href = '{$smarty.capture.product_url}';" />
                            {/if}
                        {else}
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="price">{include file="price_ranges.tpl" p=$product}</div>
                                </div>
                            </div>
                            <input type="button" name="addtocart_submit" class="btn btn-primary text-uppercase" value="More Info" onclick="window.location.href = '{$smarty.capture.product_url}';" />
                        {/if}

                    </div>

                </div>
                {if $product.comparable == 'y' && !in_array($product.prod_id,$compare_list) && $product.is_donation != 'y' && ($view == 'category' || $view == 'prod_detail_list')}
                    <div class="comparable">
                        <input type="checkbox" value="{$product.prod_id}" onclick="javascript: addRemoveCompare(this,{$current_comparable},{$max_comparable});" />
                        Compare
                    </div>
                {elseif in_array($product.prod_id,$compare_list) && ($view == 'category' || $view == 'prod_detail_list')}
                    <div class="comparable">
                        <input type="checkbox" value="{$product.prod_id}" checked onclick="javascript: parent.location = '/compare_products';" />
                        Compare
                        {*<a href="/compare_products">Remove from Compare List</a>*}
                    </div>
                {/if}
            </div>
        {/if}
    </section>

{else}

{/if}