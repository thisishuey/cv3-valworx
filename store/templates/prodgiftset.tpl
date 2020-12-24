{* Product Gift Set *}

<div class="form-container">
    <form method="post" action="index.php">
        <input type="hidden" name="action" value="AddCart">

        {if $product.text_field == 'y'}
            <div class="form-group">
                <label for="note">Note:</label>
                <input type="text" name="note" value="" size="25" class="form-control">
            </div>
        {/if}

        <hr> 
        <p class="padd_0">On the left, you will find a list of products eligible for this product pack. On the right, please pick an eligible product for each product choice available.  These are the products that will be used to build your product pack.  Click on any of the eligible products to get a picture of that item.</p>

        <h3>Eligible Products:</h3>
        <p class="padd_0">
            {counter start=1 assign=num}
            {foreach from=$product.gift_options key=key item=gift_name}
                {$num}.&nbsp;<a href="/regsize/{$product.gift_pics.$key}" class="fancybox" id="small_text">{$gift_name}</a><br />
{*
                {$num}.&nbsp;<a href="#" onclick="javascript:window.open('/regsize/{$product.gift_pics.$key}', '', 'height=500,width=500');" id="small_text">{$gift_name}</a><br />
*}
                {counter assign=num} 
            {/foreach}
        </p>

        <h3>Please choose the products for your gift set:</h3>
        {section name="gift_num" loop=$product.num_gifts}
            <div class="row"><div class="col-xs-12 col-sm-10 col-md-8 col-lg-6">
            <div class="form-group">
                Product {$smarty.section.gift_num.iteration}:&nbsp;
                <select name=choose_gift{$smarty.section.gift_num.iteration} class="form-control">
                    {html_options options=$product.gift_options}
                </select>
            </div>
          </div></div>
        {/section}

        {if $product.outseason != 'y'}
            {if $settings.inventory_control != 'y' || ($settings.inventory_control == 'y' && ($product.inventory_control >0 || $product.on_order > 0 || ($product.stock_status == 'Backordered' && $product.backordered_date != '')))}

{if $settings.recurring_orders_by_product == 'y' && $product.recurring_eligible == 'y'}
<br/>
<div id="recurring_eligible"><legend>Eligible for recurring order:</legend><br/>
  <div class="controlset">
    <input type="radio" id="recurring_no" name="recurring_yesno" value="n" checked/> <label for="recurring_no">Only order once</label><br/>
    <input type="radio" id="recurring_yes" name="recurring_yesno" value="y" /><label for="recurring_yes"> Order Every
      <input type="text" id="recurring_interval_num" name="recurring_interval_num" value="0"/>
      <select name="recurring_interval">
        <option value="d" > days</option>
        <option value="w" selected> weeks</option>
      </select>
    </label>
  </div>
</div>  {/if}


<div class="row">
<label for="qty{if $one_add_button}{$prod_id}{/if}" class="qty-label col-xs-2 col-lg-1">Qty.</label>                
<div class="col-xs-4 col-sm-3 col-lg-2">
<input type="text" name="qty" value="1" size="3" maxlength="3" class="formtext form-control"> 
</div>

                <input type="hidden" name="prod_name" value="{$product.prod_name}">
                <input type="hidden" name="prod_id" value="{$prod_id}" >
                <input type="hidden" name="cat_id" value="{$cid}" >
                <input type="hidden" name="sku" value="{$product.sku}" >
                <input type="hidden" name="price" value="{$product.price}" >
                <input type="hidden" name="num_gifts" value="{$product.num_gifts}" >
                <input type="submit" name="submit" value="Add to Cart"  class="btn btn-primary pull-left mar_rt10 text-uppercase">
</div>
                {if $memberinfo.id}
                  <div class="btn-wishlist pull-left mar_rt10"><input type="submit" name="wishlist_add" class=" btn btn-default text-uppercase" value="Add to Wishlist" /></div>
                {/if}
                {if $memberinfo.id}
                  <div class="btn-reorder pull-left"><input type="submit" name="reorder_add" class="btn btn-default text-uppercase" value="Easy Reorder" /></div>
                {/if}

            {else}
                *Out of Stock
            {/if}
        {else}
            *Out of Season
        {/if}

    </form>

</div>

{if $settings.inventory_control == 'y' && $settings.product_notify == 'y' && $product.notify == 'y'}
    <div><a href="/product_notify/{if $view == 'product'}{$var1}/{$var2}{else}{$prod_id}/{$var1}{/if}">Notify me when this item is in stock</a></div>
{/if}
