{if $settings.product_mapping != 'add_cart'}
<form method="post" action="index.php" name="quantities" role="form"> 
 <input type="hidden" name="action" value="UpdateCart" />
 {/if}
 <div class="cart-wrapper panel panel-default">
  <div class="panel-heading">
    {*<!-- Product{if $recipient_mapping != ''}s for {$recipient_mapping}{/if} -->*}
  </div>
  <div class="panel-body">
  <div class="row lead hidden-xs">    
    <div class="col-sm-4 col-md-5  cartprd-header">
      <div class="col-xs-4 col-sm-4">&nbsp;  </div>
      <div class="col-xs-8 col-sm-8 text-left">Product</div>
    </div>
    <div class="col-sm-3 col-md-2 text-center">Unit Price</div>
    <div class="col-sm-2 text-center">Qty</div>
    <div class="col-sm-1">Remove</div>
    <div class="col-sm-2 text-center">Total </div> 
  </div>
  {assign var="quantities" value=""}{assign var="print_gw" value="n"}
  {foreach from=$cart key=key item=prod}
    {if $prod.qty > 0 && !$prod.build_prod_id}
      <div class="row mar_btm">
        <!-- <div class="col-sm-1 mar_btm visible-xs hidden-sm hidden-md hidden-lg">
          <span class="glyphicon glyphicon-remove pull-left clickable red" onclick="javascript:remove_it('qty{$key}');"/></span>
          <span class="visible-xs">Remove</span>
        </div> -->
        <div class="col-xs-8 col-sm-4 col-md-5">
          <input type="hidden" name="sku{$key}" value="{$prod.sku}" />
          {assign var="prodcat" value=$prod.cat}
          <div class="row mar_btm">
            <div class="col-xs-4 col-sm-4">
              {if $prod.web_image}
                <a href="/product/{if $prod.url_name}{$prod.url_name}{else}{$prod.prod_id}{/if}{$url_split_char}{if $categories.$prodcat.url_name}{$categories.$prodcat.url_name}{else}{$prod.cat}{/if}">
                  <img src="{$prod.web_image|img_prefix}" alt="{$prod.name|replace:'& ':'&amp; '}" class="img img-responsive cart-image" />
                </a>
              {/if}
            </div>
            <div class="col-xs-8 col-sm-8">
              <a href="/product/{if $prod.url_name}{$prod.url_name}{else}{$prod.prod_id}{/if}{$url_split_char}{if $categories.$prodcat.url_name}{$categories.$prodcat.url_name}{else}{$prod.cat}{/if}">
                {$prod.name|replace:"& ":"&amp; "}
              </a>
              <br>Stock #: {$prod.sku}<br>
              {if $prod.backordered_date} *Backordered: {$prod.backordered_date}{/if}
              {if $prod.custom_form}<br />
                <a href="javascript:void(0);" onclick="javascript:window.open('/custom_form_info/{$key}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">View details &raquo;</a>
              {/if}
              {if $prod.wishlist}<a href="/wishlist/{$prod.wishlist}">Wishlist</a>{/if}
              {if $prod.att_list}<div>{$prod.att_list}</div>{/if}
              {if $prod.note}<div>- {$prod.note}</div>{/if}
              {if $prod.gifts|@count}
                {foreach from=$prod.gifts key=i item=glist}
                  {if $glist}<div>{$glist}</div>{/if}
                {/foreach}
              {/if}
              {if $prod.recurring > 0}
                <div>Reorder every {$prod.recurring} days</div>
              {/if}
            </div>
          </div>
        </div>
        <div class="col-xs-4 col-sm-3 col-md-2 text-center">
          {assign var="pcat" value=$smarty.session.price_cat}
          {if $prod.prices != ''}
            {assign var="stndrd_price" value=$prod.prices.$pcat.standard_price}
          {else}
            {assign var="stndrd_price" value=$prod.price}
          {/if}
          {if $prod.build_parent != 'y'}
            {if $prod.is_reward == 'y'}
              Points: {$prod.reward_amount}
            {elseif $prod.prices != '' && $prod.prices.$pcat.standard_price != '' && $prod.is_donation != 'y'}
              <strong class="visible-xs">Unit Price: </strong>
              {if $prod.discount_qty > 0 && $prod.is_donation != 'y' && $prod.discount_price != $stndrd_price }
                {$currency_type}{$prod.discount_price|commify}
              {else}
                {if $prod.is_special == 'y' && $prod.prices.$pcat.standard_price != $prod.prices.$pcat.special_price && $prod.prices.$pcat.standard_price != '0' && $prod.prices.$pcat.standard_price != ''}
                  <del>{$currency_type}{$prod.prices.$pcat.standard_price|commify}</del> {$currency_type}{$prod.prices.$pcat.special_price|commify}
                {else}
                  {$currency_type}{$prod.prices.$pcat.standard_price|commify}
                {/if}
              {/if} 
            {else}
              {if $prod.discount_qty > 0 && $prod.is_donation != 'y' && $prod.discount_price != $stndrd_price }
                {$currency_type}{$prod.discount_price|commify}
              {else}
                {$currency_type}{$prod.price|commify}
              {/if}
            {/if}
          {/if}
        </div>
        <div class="col-xs-6 col-sm-2 text-center">
          <div class="row"> 
            {if $prod.free == 'y' || $prod.wl_qty > 0 || $prod.is_donation == 'y'}
              <div class="col-xs-10 col-sm-12">
                <strong class="visible-xs">Qty: </strong>
                {$prod.qty}
              </div>
              <input type="hidden" name="qty{$key}" value="{$prod.qty}" />
            {else}
              <div class="col-xs-10 col-sm-12">
                <label class="visible-xs" for="qty_{$key}">Qty:</label>
                <input class="form-control" type="number" {if $prod.fractional_qty == 'y'}step="any"{/if} name="qty{$key}" id="qty_{$key}" class="qty" min="0" value="{$prod.qty}"{if $settings.interactive_pricing == 'y'} onkeyup="javascript: cartChange('{$key}','{$prod.real_price}','{$prod.qty}','{$totals.price}','quantities{$qty_id}','{$currency_type}');"{/if}/>
                <div class="update">
                  <input type="submit" name="submit_update" value="Update" class="btn btn-link" />
                </div>
              </div>
              {assign var="quantities" value=$quantities|cat:$key|cat:","|cat:$prod.qty|cat:"|"}
            {/if}
          </div>
        </div>
        <div class="col-xs-2 col-sm-1 mar_btm text-center">
          <span class="glyphicon glyphicon-remove   clickable red" onclick="javascript:remove_it('qty{$key}');"/></span>
          <span class="visible-xs">Remove</span>
        </div>
        <div class="col-xs-4 col-sm-2 text-center">
          {if $prod.is_reward == 'y'}
            Points: {math equation="subpts * qty" subpts=$prod.reward_amount qty=$prod.qty}
          {elseif $prod.build_parent != 'y'}
            {if $settings.interactive_pricing == 'y'}
              <label class="visible-xs" for="price_{$key}">Total Price:</label> 
              <input class="form-control dynamic_qty total" type="text" id="price_{$key}" value="{$currency_type}{$prod.total|commify}" readonly="readonly"/>
              <input type="hidden" id="hasUpdated" value="1"/>
            {else}
              <strong class="visible-xs">Total Price: </strong>{$currency_type}{$prod.total|commify}
            {/if}
          {/if}
        </div>
      </div>

      {if $prod.build_parent == 'y'}
      {foreach from=$cart key=ky item=pr}
      {if $pr.qty > 0 && $pr.build_prod_id && $pr.build_link == $prod.build_link}
      <div class="row mar_btm">
        
        <div class="col-sm-3">
         <input type="hidden" name="sku{$ky}" value="{$pr.sku}"/>
         {assign var="prodcat" value=$pr.cat}
         <a href="/product/{if $pr.url_name}{$pr.url_name}{else}{$pr.prod_id}{/if}{$url_split_char}{if $categories.$prodcat.url_name}{$categories.$prodcat.url_name}{else}{$pr.cat}{/if}">{$pr.name|replace:"& ":"&amp; "}</a>
         {if $pr.backordered_date} *Backordered: {$pr.backordered_date}{/if}
         {if $pr.custom_form|@count > 0}
         <div><a href="javascript:void(0);" onclick="javascript:window.open('/custom_form_info/{$key}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">view details &raquo;</a></div>
         {/if}
         {if $pr.att_list}{$pr.att_list|replace:"<br>":"<br />&nbsp;&nbsp;&nbsp;&nbsp;"}{/if}
         {if $pr.note}<div>- {$pr.note}</div>{/if}
         {if $pr.gifts|@count}
         {foreach from=$pr.gifts key=i item=glist}
         {if $glist}<div>{$glist}</div>{/if}
         {/foreach}
         {/if}
        </div>
        <div class="col-sm-3">
          <strong class="visible-xs">Unit Price: </strong>
         {math equation="x / y" x=$pr.total y=$pr.qty assign="buildprice"}
         {$currency_type}{$buildprice|commify}
        </div>
        <div class="col-sm-2">
          <strong class="visible-xs">Qty: </strong>
          {$pr.qty}
        </div>
        <div class="col-sm-2">&nbsp;</div>
        <div class="col-sm-2">
          <strong class="visible-xs">Total: </strong>
         <input type="hidden" name="qty{$ky}" value="{$pr.qty}"/>
         {$currency_type}{$pr.total|commify}
        </div>
      </div>
      {/if}
      {/foreach}
      {/if}

      {if $prod.gift_wrap == 'y' && $prod.gift_wrap_info}
      <div class="row mar_btm">
        
        <div class="col-xs-8 col-sm-4 col-md-5">- {$prod.gift_wrap_info.gift_wrap_name|replace:"& ":"&amp; "}</div>
        <div class="col-xs-4 col-sm-3 col-md-2 text-right">
          &nbsp;
        </div>
        <div class="col-xs-6 col-sm-2 text-center">
          <strong class="visible-xs">Qty: </strong>{$prod.qty}
        </div>
        <div class="col-sm-1 mar_btm">
          <input type="hidden" value="{$prod.qty}" name="gcqty{$key}">
          <span class="glyphicon glyphicon-remove pull-left clickable red" onclick="javascript:remove_it('gcqty{$key}');"/></span>
          <span class="visible-xs">Remove</span>
        </div>
        <div class="col-xs-6 col-sm-2 text-right">
          {if $settings.interactive_pricing == 'y'}
            <strong class="visible-xs">Total Price: </strong>
            <input type="text" value="{$currency_type}{$prod.gift_wrap_info.total|commify}" class="form-control dynamic_qty total" readonly="readonly"/>
            <input type="hidden" value="{$prod.qty}" name="gcqty{$key}"/>
          {else}
            <strong class="visible-xs">Total Price: </strong>{$currency_type}{$prod.gift_wrap_info.total|commify}
          {/if}
        </div>
      </div>
      {elseif $prod.gift_wrap_info}
        {assign var="print_gw" value="y"}
      {/if}

    {/if}
  {/foreach}
  </div>
</div>

{if $settings.interactive_pricing == 'y'}
<script type="text/javascript">
setCookie('quantities{$qty_id}','{$quantities}');
</script>
{/if}

{if $settings.product_mapping != 'add_cart'}
{if $print_gw == 'y'}
<div class="add-gift-wrap"><input type="checkbox" name="gw_per_prod" value="y" onclick="document.quantities.submit();"/>&nbsp;+ Add gift wrap per item</div>
{/if}
<div class="update-total row">
  <!-- <div class="update">
   <input type="submit" name="submit_update" value="Update Cart" class="btn btn-default" />
 </div> -->
    <div class="update_msg col-sm-8 col-lg-10 nopad">* If you have changed the quantity of any of your items, please make sure to update the cart before checking out.</div>
    <div class="total col-sm-4 col-lg-2 text-right">
      {if $settings.hide_viewcart_discounts == 'n' && $totals.price > $totals.discount_price}
      <span class="subtotal" style="font-size:12px;font-weight:normal">
        Sub-Total: {$currency_type}{$totals.price|commify}<br />
        Promo: {$currency_type}{$totals.discount_amount|commify}<br />
      </span>
      {/if}
      <strong>Total: {if $settings.interactive_pricing == 'y'}<input type="number" id="total" min="0" value="{$currency_type}{if $settings.hide_viewcart_discounts == 'n' && $totals.price > $totals.discount_price}{$totals.discount_price|commify}{else}{$totals.price|commify}{/if}" readonly="readonly" />{else}{$currency_type}{if $settings.hide_viewcart_discounts == 'n' && $totals.price > $totals.discount_price}{$totals.discount_price|commify}{else}{$totals.price|commify}{/if}{/if}</strong>
    </div>
  </div>
{if $settings.hide_viewcart_discounts == 'n' && $totals.price > $totals.discount_price}
<div style="text-align:right;color:#900">
  Disclaimer: Discounts may not reflect final price due to other variables at checkout.
</div>
{/if}
{/if}

{if $settings.product_mapping != 'add_cart'}</form>{/if}

{include file="ship_calculator.tpl" id=$recipient_mapping}
