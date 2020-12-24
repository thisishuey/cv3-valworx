<div>
  {if $error != ''}
    <div class="alert alert-danger">{$error}</div>
  {/if}

  {if $product.stock_status=='Backordered' && $product.backordered_date != ''}
    <div class="alert alert-danger">*Backordered: {$product.backordered_date}</div>
  {/if}
</div>
<div>
<div class="mar_btm">
  <div class="lead row hidden-xs">
    <div class="col-sm-3">
      <div>Description</div>
    </div>
    <div class="col-sm-2">Item #</div>
    <div class="col-sm-3" id="price_label_{$prod_id}">
      {if $product.is_donation == 'y'}Donation Amount{else}Price{/if}
    </div>
    {if $product.is_donation != 'y'}
      <div class="col-sm-2">Weight</div>
      {/if}
    {*Customize, Options moved from here*}
    {if $product.is_donation != 'y'}
      <div class="col-sm-2">Qty</div>
    {/if}
    {*if $settings.additional_prod_display_type == '1' || $view == 'prod_detail_list'}
      <div>&nbsp;</div>
    {/if*}
  </div>
  <div class="row">
    <div class="col-sm-3">
      {$product.prod_name}
    </div>
    <div class="col-sm-2">
          <strong class="visible-xs pull-left">Item #:&nbsp;</strong>
          {$product.sku}
    </div>
    <div class="col-sm-3" id="price_cell_{$prod_id}">
      <div class="row">
        <div class="col-sm-6 col-lg-4 pull-left split-left">
          <strong class="visible-xs pull-left">Price:&nbsp;</strong>
      {if $product.special == 'y' && $product.is_donation != 'y'}
          <del>{$currency_type}{$product.standard_price|commify}</del>
      {/if}
      {if $product.is_donation == 'y'}
          {$currency_type}
      {/if}
        </div>
        <div class="col-sm-6 pull-left split-right">
        <input type="text"{if $product.is_donation == 'y'} name="donation_amount{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}"{/if} class="dynamic_qty{if $product.special == 'y' && $product.is_donation != 'y'} saleprice{elseif $product.is_donation == 'y'} donation{/if}" id="price_{$prod_id}" value="{if $product.is_donation != 'y'}{$currency_type}{if $product.min_qty > 1}{math equation="x*y" x=$product.price y=$product.min_qty assign="tmp_price"}{$tmp_price|commify}{else}{$product.price|commify}{/if}{else}0{/if}"{if $product.is_donation != 'y'} readonly="readonly"{/if} />
      </div>
    </div>
    </div>
    {if $product.is_donation != 'y'}
    
      <div class="col-sm-2">
        <strong class="visible-xs pull-left">Weight:&nbsp;</strong>
        {if $product.shipping_weight == ''}
          &nbsp;
        {else}
          {$product.shipping_weight} {$product.unit}
        {/if}
      </div>
    {/if}

    {if $product.outseason != 'y'}
      {if ($settings.inventory_control != 'y' || ($product.has_attributes == 'y' && $attributes.count > 1) || ($settings.inventory_control == 'y' && ($product.inventory_control > $product.out_of_stock_point || $product.on_order > 0 || ($product.stock_status == 'Backordered' && $product.backordered_date != '')))) && $product.stock_status != 'Out of Stock'}
        

        {if $product.is_donation != 'y'}
          
          <div class="col-sm-2" id="qty_cell_{$prod_id}">
            <strong class="visible-xs pull-left">Qty:&nbsp;</strong>
            <div id="qty_div_{$prod_id}">
              {if $product.qty_in_set > 1 && $product.num_sets_displayed > 1}
                <select class="form-control" name="qty{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" id="qty_{$prod_id}" onclick="javascript: priceChange('{$prod_id}','sub','','{$currency_type}');">
                  <option label="{$product.min_qty}" value="{$product.min_qty}">{$product.min_qty}</option>
                  {assign var="disp_qty" value=$product.min_qty}
                  {section name="set" loop=$product.num_sets_displayed start=1}
                    {math equation="x+y" x=$product.qty_in_set y=$disp_qty assign="disp_qty"}
                    <option label="{$disp_qty}" value="{$disp_qty}">{$disp_qty}</option>
                  {/section}
                </select>
              {else}
                <div class="row">
                  <div class="col-xs-4 col-sm-12">
                    <input class="form-control" type="text" name="qty{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" id="qty_{$prod_id}" value="{if $settings.additional_prod_display_type == '1' || $view == 'prod_detail_list'}{if $product.min_qty > 1}{$product.min_qty}{else}1{/if}{/if}" maxlength="3" {if $settings.interactive_pricing == 'y'} onkeyup="javscript: priceChange('{$prod_id}','dynamic','','{$currency_type}');"{/if} />
                    {if $settings.interactive_pricing == 'y'} 
                      <img class="img img-responsive inline" src="{$img_prefix}/images/plus.gif" alt="Increase Quantity" onclick="javascript: priceChange('{$prod_id}','add','','{$currency_type}');" style="cursor: pointer;" id="qty_img1_{$prod_id}" /> 
                      <img class="img img-responsive inline" src="{$img_prefix}/images/minus.gif" alt="Decrease Quantity" onclick="javascript: if (checkMinQty('qty_{$prod_id}',{$product.min_qty},'interactive')) priceChange('{$prod_id}','sub','','{$currency_type}');" style="cursor: pointer;" id="qty_img2_{$prod_id}" />
                    {/if}
                    <input type="hidden" id="hidden_price_{$prod_id}" value="{if $product.is_donation != 'y'}{$product.price}{else}0{/if}" />
                  </div>
                </div>
              {/if}
            </div>
          </div>
        {else}
        <div class="col-sm-6">
          <strong class="visible-xs pull-left">Qty:&nbsp;</strong>
          <input type="hidden" name="qty{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" value="1" />
        </div>
        {/if}
        </div>
        <div> {*Customize, Options moved to here so they can be on their own row*}
          <div class="row lead hidden-xs">
            {if ($product.text_field == 'y' || ($product.gift_certificate == 'y' && $product.gift_certificate_value < '1')) && $product.outseason != 'y'}
              <div class="col-sm-6">Customize</div>
            {/if}
            {if $product.has_attributes == 'y' && $product.outseason != 'y'}
              <div class="col-sm-6">Options</div>
            {/if}
          </div>
          <div class="row">
          {if $product.text_field == 'y' || ($product.gift_certificate == 'y' && $product.gift_certificate_value < '1')}

            <div class="col-sm-6">
              {if $product.text_field == 'y'}
                <input class="form-control" type="text" name="note{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" value=""/>
              {/if}
              {if $product.gift_certificate == 'y' && $product.gift_certificate_value < '1'} 
                Value: <input class="form-control" type="text" name="gift_certificate_value{if $settings.additional_prod_display_type == '2' && $view != 'prod_detail_list'}{$prod_id}{/if}" value="" />
              {/if}
            </div>

          {/if}
          {if $product.has_attributes == 'y'}
            <div class="col-sm-6">
              {include file="attributes.tpl"}
            </div>
          {/if}
          </div> 
        </div> 
      {else}
        <div class="normaltext col-sm-2">
          <b>Out of Stock</b>
        </div>
        </div>
      {/if}
    {else}
      <div class="normaltext col-sm-2">
        <b>Out of Season</b>
      </div>
      </div>
    {/if}
</div>
{if $settings.additional_prod_display_type == '1' || $view == 'prod_detail_list'}
  <div>
    <input type="submit" name="submit" id="addcart_submit" value="Add to Cart" class="btn btn-primary mar_btm" onclick="javascript: return checkMinQty('qty_{$prod_id}',{$product.min_qty},'');" />
    {if $memberinfo.id}
      <div class="btn-wishlist mar_btm">
        <input type="submit" name="wishlist_add" class="btn btn-default" value="Add to Wishlist" />
      </div>
    {/if}
    {if $memberinfo.id}
      <div class="btn-reorder mar_btm">
        <input type="submit" name="reorder_add" class="btn btn-default" value="Easy Reorder" />
      </div>
    {/if}
    <input type="hidden" name="prod_id" value="{$prod_id}" />
    <input type="hidden" name="cat_id" value="{if $product.cid > 0}{$product.cid}{else}{$cid}{/if}" />
    <input type="hidden" name="sku" value="{$product.sku}" />
  </div>
{/if}
</div>

{if $settings.inventory_control == 'y' && $settings.product_notify == 'y' && $product.notify == 'y'}
  <div>
    <a href="/product_notify/{if $view == 'product'}{$var1}/{$var2}{else}{$prod_id}/{$var1}{/if}">Notify me when this item is in stock</a>
  </div>
{/if}
