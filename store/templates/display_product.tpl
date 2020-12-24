{* ------[ This beginning part is just variable definitions that could possibly be moved to the backend code ]------ *}

{if $product.cid > 0}{assign var="prodcid" value=$product.cid}
{else}{assign var="prodcid" value=$cid}
{/if}

{array_debug var=$product}
{if $settings.additional_prod_display_type == '2'}{assign var="one_add_button" value="y"}{/if}

{assign var=name value=$product.prod_name|replace:"& ":"&amp; "|replace:"'":"&#39;"|replace:'"':"&#34;"|strip_quotes|strip_tags:false}

{assign var="pid" value=$product.prod_id}
{assign var="prod_id" value=$product.prod_id}
{*assign var="results" value=$product.recipes*}
{assign var="attributes" value=$attys.$prod_id}
{assign var="valid" value=$valid.$prod_id}

{*if $product.stock_status == 'Backordered' && $product.backordered_date}{assign var=backorder value=1}{/if*}
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
  {/if}

  {assign var="custom_form_num" value=$product.form_id}
  {assign var="custom_form" value=$custom_forms.$custom_form_num}

  {if $product.min_qty > 1}{assign var=minQty value=$product.min_qty}{else}{assign var=minQty value=1}{/if}

  {if $settings.inventory_control == 'y' && $settings.product_notify == 'y' && $product.notify == 'y'}
    {assign var=notify value=1}
    {if $view == 'product' || $view == 'product_builder'}{assign var=notify_url value="/product_notify/"|cat:$var1|cat:"/"|cat:$var2}
  {else}{assign var=notify_url value="/product_notify/"|cat:$prod_id|cat:"/"|cat:$var1}
  {/if}
{/if}

{*<!-- {if $product.web_image}{assign var=thumb_image value=$product.web_image}
{else}{assign var=thumb_image value="/images/nopicture_tn.jpg"}
{/if}

{if $product.large_image}{assign var=image value=$product.large_image}
{else}{assign var=image value="/images/nopicture_tn.jpg"}
{/if}

{if $product.full_image}{assign var=full_image value=$product.full_image}
{else}{assign var=full_image value="/images/nopicture_tn.jpg"}
{/if} -->*}

{if $product.web_image}{assign var=thumb_image value=$product.web_image}
{else}{assign var=thumb_image value="/images/nopicture_tn.jpg"}
{/if}

{if $product.large_image}{assign var=image value=$product.large_image}
{else}{assign var=image value="/images/nopicture_tn.jpg"}
{/if}

{if $product.full_image}{assign var=full_image value=$product.full_image}
{else}{assign var=full_image value="/images/nopicture_tn.jpg"}
{/if}


{if $view == 'product' || $view == 'product_builder'}
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

{if ($view == 'product' || $view == 'product_builder') && $settings.additional_prod_display_type == '2' && $add_form_errors.errors > 0 && $product.additional_prods|@count > 0}
  <div class="errors">{$add_form_errors.error}</div>
{/if}

{if !$child}
  <div class="row">
    <section class="product clearfix">
      <div class="content col-xs-12">
        <h1 class="capitalize">{$product.prod_name}</h1>
      </div>
      {if $product.build_product == 'y' || $product.content_only == 'y'}
        <div class="content-only mar_btm clearfix">
          <div class="info col-sm-12">
            {*<div class="image pull-right col-xs-4">
              <img src="{$image|img_prefix}" alt="{$name}" id='product_image-{$pid}' class="product_image popup-img img-responsive thumbnail" data-img="{$product.full_image}" />
            </div>*}      
            {*<h1 class="capitalize">{$product.prod_name}</h1>     *}
              {eval var=$product.prod_description}
        </div>
      {else}
        <div class="image iefix col-sm-5 col-md-6">
          
          {if $image}
          
      <div id="group-img-enlarge">
          
          
          <div class="main-image">
              {*<!-- <a href="{$image|img_prefix}" class="MagicZoom" id="zoom_{$prod_id}" data-options="zoomPosition: right; selectorTrigger: hover; variableZoom: true; textClickZoomHint:" title="{$name}" > -->*}
                <a href="{$image|img_prefix}" class="MagicZoom" id="zoom_{$prod_id}" data-options="selectorTrigger: hover; transitionEffect: false; textClickZoomHint: ; lazyZoom: true; rightClick: true; expand: off" title="{$name}" >
                
                <img src="{if $view == 'product' && $isAdditional != y}{$image|img_prefix}{else}{$thumb_image|img_prefix}{/if}" alt="{$name}" id="product_image-{$pid}" class='product_image img-responsive' />
              </a> 
          </div>
          {if $product.images|@count > 1 }                        
            <br>
            {assign var=alt_images value=$product.images}
            {if $product.images|@count > 1}
            <div class="alternate-images">
                {foreach from=$alt_images item=alt}       
               <a data-zoom-id="zoom_{$prod_id}" href="{$alt.large}" data-image="{$alt.large}" title="{$alt.title}" ><img src="{$alt.thumbnail}"/></a>                    
                {/foreach} 
              </div>
              {/if}
            
          {/if}

        </div>
      {/if}
          {*if !$child}
            <div class="emailafriend">
              <a href="javascript: openPopup('/tellfriend/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}', 400, 500);"><img src="{$img_prefix}/images/email.png" alt="Email icon" /></a><a href="javascript: openPopup('/tellfriend/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}/{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}', 400, 500);">Email a Friend</a>
            </div>
            <div class="bookmark">{include file="bookmark.tpl"}</div>
          {/if*}
          <div id="social">
          <!-- To activate AddThis, edit the pubid value in the add this script tab on display_product.tpl, and remove the Smarty comment tags from around the code -->
          {*<!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style ">
              <a class="addthis_button_preferred_1"></a>
              <a class="addthis_button_preferred_2"></a>    
              <a class="addthis_button_preferred_5"></a>   
              <a class="addthis_button_compact"></a>
              <a class="addthis_counter addthis_bubble_style"></a>
            </div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=xx-################"></script>
          <!-- AddThis Button END -->*}
          </div>
        </div>
        <div class="info iefix col-sm-7 col-md-6">
          <div class="content">
            {*<!-- <h1 class="capitalize">{$product.prod_name}</h1> -->*}
            {if $isAdditional == y}
              <h2>{$product.prod_name}</h2>
            {else}
              {*<h1 class="text-uppercase">{$product.prod_name}</h1>*}
            {/if}
            {if $product.children|@count == ''}
        {if $view != 'category'}
                   <div class='sku'><div class="prod_info_list">Stock #:</div><span class="skunum">{$product.sku}</span></div>
                   <div class='sku'><div class="prod_info_list">Brand:</div><span class="skunum">{$product.cust_1}</span></div>
                   <div class='sku'><div class="prod_info_list">Series:</div><span class="skunum">{$product.cust_2}</span></div>
                   <div class='sku'><div class="prod_info_list">Mfr Part #:</div><span class="skunum">{$product.cust_3}</span></div>
                  {*<div class="rev-stars">{include file="product_review.tpl"}</div>*}
                  {* <div class='status'>Availability: {$product_status}</div>*}
                   {if $backorder}<div class='backordered'>*Backordered: {$product.backordered_date}</div>{/if}
                   <br>
                {/if}
            {/if}
           {* <div class="rev-stars">{include file="product_review.tpl"}</div> *}
            {* <div class="qanda"><a href="/product_qanda/{if $product.url_name != ''}{$product.url_name}{else}{$product.prod_id}{/if}{$url_split_char}{if $categories.$cid.url_name != ''}{$categories.$cid.url_name}{else}{$cid}{/if}">Product Q&A</a></div>*}
            {if $backorder}<div class='backordered'>*Backordered: {$product.backordered_date}</div>{/if}
            {if $product.children|@count == ''}
              {*<div class='status'>Availability: <span>{$product_status}</span></div>*}
              {if $product.cust_18 != ''}
                  <span class="listprice">List Price: {$currency_type}{$product.cust_18}</span><br />
              {/if}
                {if $product.is_parent == 'y' || $product.has_attributes == 'y'} 
                <div class='price'>Price: {include file="price_ranges.tpl" p=$product}</div>
              {else}
                <div class='price'>
                  {if $cid == 'rp' && $product.rewards_program == 'y'}
                    Reward Points: {$product.rewards_points}
                  {else}
                    Price:
                    {if $product.special == 'y' && $product.standard_price > $product.special_price}<del>{$currency_type}{$product.standard_price|commify}</del>{/if}
                    {if $product.is_donation == 'y'}{$currency_type}{/if}
                    <input type="text"{if $product.is_donation == 'y'} name="donation_amount{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}"{/if} class="{if $product.is_donation != 'y'}dynamic_qty{/if}{if $product.special == 'y' && $product.standard_price > $product.special_price && $product.is_donation != 'y'} sale-price{elseif $product.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" value="{if $product.is_donation != 'y'}{$currency_type}{if $product.min_qty > 1}{math equation="x*y" x=$product.price y=$product.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$product.price|commify}{/if}{else}0{/if}"{if $product.is_donation != 'y'} readonly="readonly" onfocus="this.blur()"{/if} />
                  {/if}
                </div>
              {/if}
            {/if} {* $product.children|@count == '' *}

            {*if $product.shipping_weight}Weight: {$product.shipping_weight} {$product.unit}{/if*}

            {if $view == product}
            {include file="display_discounts.tpl" discounts=$product.discounts}<br />
              {if $product.inventory_control < 1}
               <div class='sku'>Usually Ships: <strong>{$product.cust_4}</strong>
                {if !$smarty.session.mobile}<br><span class="listprice"><a onclick="javascript:window.open('/sameday_shipping','popup','width=350,height=350,statusbar=no,toolbars=no,location=no,scrollbars=no,resizeable=no');" href="javascript:void(0);">Free Shipping</a> on orders over $99</span>{/if}
               </div>
              {else}
               <div class='sku'>Usually Ships: <strong>Same Day</strong>
                {if !$smarty.session.mobile}<br><span class="listprice"><a onclick="javascript:window.open('/sameday_shipping','popup','width=300,height=320,statusbar=no,toolbars=no,location=no,scrollbars=no,resizeable=no');" href="javascript:void(0);">Free Shipping</a> on orders over $99</span>{/if}
               </div>
              {/if}
           {/if}
            

            {*if $product.special == 'y' && $product.short_description}<p>{$product.short_description}</p>{/if*}
            {include file="product_kit.tpl"}
            {*include file="prodrecipe.tpl"*}

          </div>

          <div class="order">
            <div class="form">
              {*** PRODUCT FORM LAYOUT ***}
              {if $product.children|@count == ''}
                <form method="post" action="index.php" name="product_form" id="product{$pid}_form" role="form">
                <input type="hidden" name="action" value="AddCart" />

                {if $error != ''}
                  <div class="errors">
                    <p><em>{$error}</em></p>
                  </div>
                {/if}

                {if $view == 'product_builder'}
                  <input type="hidden" value="{$bp_id}" name="bp_id">
                  <input type="hidden" value="{$st_id}" name="st_id">
                  <input type="hidden" value="1" name="qty">
                {/if}
                {if $allow_purchase}
                  {include file="custom_form.tpl"}
                  {include file="gift_wrap.tpl"}
                  {include file="gc_send.tpl"}
                  {if ($settings.additional_prod_display_type != '2' || $product.additional_prods|@count > 0) && $view != 'product_builder'}
                    {include file="product_mapping.tpl"}
                  {/if}
                {/if}
                {if $product.gift_set == 'y'}
                  {include file="prodgiftset.tpl"}
                {else}
                  {if $allow_purchase}
                    {if $product.text_field == 'y'}
                      <div class="note"><input type="text" name="note{if $one_add_button}{$prod_id}{/if}" /></div>
                    {/if}
                    {if $product.gift_certificate == 'y' && $product.gift_certificate_value < '1'}
                      <div class="gc-value"><label>Value:</label> <input type="number" name="gift_certificate_value{if $one_add_button}{$prod_id}{/if}" /></div>
                    {/if}
                    {if $product.has_attributes == 'y'}
                      <div class="attributes clearfix">{include file="attributes.tpl"}</div>
                    {/if}
                    {if $settings.recurring_orders_by_product == 'y' && $product.recurring_eligible == 'y'}
                      <div id="recurring_eligible">
                        <div class="title">Eligible for recurring order:</div>
                        <div class="radio">
                          <label>
                            <input type="radio" id="recurring_no" name="recurring_yesno" value="n" checked/> Only order once
                          </label>
                        </div>
                        <div class="radio">
                          <label>
                            <input type="radio" id="recurring_yes" name="recurring_yesno" value="y" /> Order Every
                            <input type="text" id="recurring_interval_num" class="form-control" name="recurring_interval_num" value="0" />
                            <select name="recurring_interval" class="form-control">
                              <option value="w" selected>weeks</option>
                              <option value="d">days</option>
                            </select>
                          </label>
                        </div>
                      </div>  
                    {/if}
                    <div class="row">
                      {if $view != 'product_builder'}
                        {if $product.qty_in_set > 1 && $product.num_sets_displayed > 1}
                          <div class="qty-line col-xs-4 col-sm-5 col-md-4">
                            <div class="form-group row">
                              <label for="qty{if $one_add_button}{$prod_id}{/if}" class="qty-label col-xs-4 col-lg-4">Quantity</label>
                              <div class="col-xs-8">
                                <select name="qty{if $one_add_button}{$prod_id}{/if}" class="qty form-control" id="qty_{$prod_id}" onclick="priceChange('{$prod_id}', 'sub', '', '{$currency_type}');">
                                  <option value="{$minQty}">{$minQty}</option>
                                  {assign var="disp_qty" value=$product.min_qty}
                                  {section name="set" loop=$product.num_sets_displayed start=1}
                                  {math equation="x+y" x=$product.qty_in_set y=$disp_qty assign="disp_qty"}
                                  <option value="{$disp_qty}">{$disp_qty}</option>
                                  {/section}
                                </select>
                              </div>
                            </div>
                          </div>
                        {else}
                          <div class="qty-line col-xs-4 col-sm-6 col-md-4">
                            <div class="form-group row">
                              <label for="qty_{$prod_id}" class="qty-label col-xs-6 col-lg-6">Quantity</label>
                              <div class="col-xs-6">
                                <input type="number" {if $product.fractional_qty == 'y'}step="any"{/if} min="1" class="qty form-control input-number" name="qty{if $one_add_button}{$prod_id}{/if}" id="qty_{$prod_id}" value="{if !$one_add_button}{if $product.min_qty > 1}{$product.min_qty}{else}1{/if}{/if}" {if $settings.interactive_pricing == 'y'}onKeyUp="priceChange('{$prod_id}', 'dynamic', '', '{$currency_type}');"{/if} />
                                {if $product.fractional_qty == 'y'}{#fractional_qty#}{/if}
                              </div>
                            </div>
                          </div>
                        {/if}
                      {/if}
                      <input type="hidden" id="hidden_price_{$prod_id}" value="{$product.price}" />
                  {/if}
                  {if $one_add_button != 'y'}
                    {if $allow_purchase}
                      <input type="hidden" name="prod_id" value="{$prod_id}" />
                      <input type="hidden" name="cat_id" value="{if $product.cid > 0}{$product.cid}{else}{$cid}{/if}" />
                      <input type="hidden" name="sku" value="{$product.sku}" />
                      {if $product.rewards_program == 'y' && $cid == 'rp'}
                        {$minPoints}
                        {if $member.points_available >= $product.rewards_points}
                          <input type="hidden" name="reward_amount" id="reward_amount_{$prod_id}" value="{$product.rewards_points}" />
                          <div class="btn-add"><input type="submit" name="addtocart_submit" class="btn btn-primary text-uppercase addtocart_button" value="Add to Cart" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty}, '');"/></div>
                        {/if}
                      {else}
                        <div class="btn-add col-xs-8 col-sm-6 col-md-8"><input type="submit" name="addtocart_submit" class="btn btn-primary text-uppercase addtocart_button" value="Add to Cart" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty}, '');"/></div>
                      {/if}
                    </div><!-- end qty add to cart row-->

                      {if $memberinfo.id}
                        <div class="row">
                          <div class="btn btn-default btn-wishlist col-xs-6">
                            <input type="submit" name="wishlist_add" class="btn btn-default text-uppercase" value="Add to Wishlist" />
                          </div>
                          <div class="btn btn-default btn-reorder col-xs-6">
                            <input type="submit" name="reorder_add" class="btn btn-default text-uppercase" value="Easy Reorder" />
                          </div>
                        </div>
                      {/if}
                    {else}
                      <div class="btn btn-default">{*Out of Stock*}{$product_status}</div>
                    {/if}
                    {if $notify}<div><a href="{$notify_url}">Notify me when this item is in stock</a></div>{/if}
                  {else}
                    </div><--! end qty with no add to cart row-->
                  {/if}
                  {*if $product.desc_header}
                    <div class="short-desc">{if $product.new == 'y'}<span class="red">NEW!</span> {/if}{$product.desc_header}</div>
                  {/if*}
                {/if}
                {if $settings.additional_prod_display_type != '2'}</form>{/if}
              {elseif $product.children|@count != ''}

                {if $settings.child_display_type == '2'}
                  {assign var=oneButton value="1"}
                {/if}

                {*** FORM FOR ONE BUTTON ***}
                {*if $oneButton}
                  <form method="post" name="product_form" action="index.php" id="product{$pid}_form">
                    <input type="hidden" name="action" value="AddCart" />
                {/if*}

                {include file="custom_form.tpl"}
                {include file="gift_wrap.tpl"}
                {include file="gc_send.tpl"}
                {if ($product.additional_prods|@count > 0 || $settings.additional_prod_display_type == '1') && $view != 'product_builder'}
                  {include file="product_mapping.tpl"}
                {/if} 
                {if $product.gift_set == 'y'}{include file="prodgiftset.tpl"}{/if}
                {include file="display_child_product.tpl"}

                {*if $oneButton}
                  </form>
                {/if*}
              {/if}
            </div><!--form-->
          </div><!--order-->
        </div><!--info-->
      {/if}
    </section>
  </div>
{else}

{/if}