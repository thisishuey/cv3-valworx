<form method="post" action="index.php" name="quantities"> 
  <input type="hidden" name="action" value="UpdateCart" />

  {counter name="rec_cntr" assign=cntr}
  {foreach from=$split_cart.recipients key=recipient_mapping item=sc}
  {include file="cartitems.tpl" cart=$sc recipient_mappings=$recipient_mapping qty_id=$cntr}
  {counter name="rec_cntr" assign=cntr}
  {/foreach}

  {*Update Cart*}

  {if $split_cart.print_gw == 'y'}
  <div class="add-gift-wrap">
    <label><input type="checkbox" name="gw_per_prod" value="y" onClick="document.quantities.submit();"/> Add gift wrap per item</label>
  </div>
  {/if}

  <div class="update-total row">
    <!-- <div class="update mar_btm">
      <input type="submit" name="update_quan" value="Update Cart" class="btn btn-default" />
    </div> -->
    <div class="update_msg col-sm-8 col-lg-10 nopad">
      <p>* If you have changed the quantity of any of your items, please make sure to update the cart before checking out.</p>
    </div>
    <div class="total col-sm-4 col-lg-2">
      <div class="text-right">
      {if $settings.hide_viewcart_discounts == 'n' && $totals.price > $totals.discount_price}
        <span class="subtotal" style="font-size:12px;font-weight:normal">
          Sub-Total: {$currency_type}{$totals.price|commify}<br />
          Promo: {$currency_type}{$totals.discount_amount|commify}<br />
        </span>
      {/if}
      <strong>Total: 
      {if $settings.interactive_pricing == 'y'}
        <input type="text" id="total" class="dynamic_qty form-control" value="{$currency_type}{if $settings.hide_viewcart_discounts == 'n' && $totals.price > $totals.discount_price}{$totals.discount_price|commify}{else}{$totals.price|commify}{/if}" readonly="true">
      {else}
        {$currency_type}
        {if $settings.hide_viewcart_discounts == 'n' && $totals.price > $totals.discount_price}
          {$totals.discount_price|commify}
        {else}
          {$totals.price|commify}
        {/if}
      {/if}
      </strong>
    </div>
    </div>
  </div>
  <div class="row text-right">
    <input type="button" name="change_recipients" value="Shipping to Multiple Recipients?" class="btn btn-link" onclick="javascript: parent.location='/modify_product_mapping';{if $settings.interactive_pricing == 'y'} javascript: return hasUpdated();{/if}" />
  </div>
  {if $settings.hide_viewcart_discounts == 'n' && $totals.price > $totals.discount_price}
    <div class="nopad">
      <p>Disclaimer: Discounts may not reflect final price due to other variables at checkout.</p>
    </div>
  {/if}
</form>
