{if $settings.ship_calculator == 'y'}
  {if $settings.product_mapping == 'add_cart'}
    {* $id is set in cartitems.tpl *}
    {assign var="recip" value=$id|escape:"quotes"} {* escape recip quotes *}
    {assign var="label" value="_"|cat:$id} {* do NOT escape the label quotes *}
    {assign var="id" value="_"|cat:$id|escape:"quotes"} {* escape id quotes *}
  {else}
    {assign var="id" value=""}
  {/if}
<script type="text/javascript" src="/shipEstimator.js"></script>
{***** swap out with above for live site
<script type="text/javascript" src="{$cdn_path.prefix}/shipEstimator{$cdn_path.js_postfix}"></script>
*****}
<div class="panel panel-default">
<div id="cart_ship_estimator_header{$label}" class="ship_estimator_header clearfix panel-heading" style="display: none;">
  <div class="row">  
    <div class="col-sm-6 nopad">
      {* <p class="pull-left"><strong>Calculate Shipping Costs{if $settings.product_mapping == 'add_cart'} for {$recip|replace:"\'":"'"}{/if}</strong>&nbsp&nbsp</p> *}
      {* <p class="pull-left"><a href="javascript: void(0);" onclick="javascript: hideShowCalc('{$recip}');" id="hideShowCalc{$label}">Show Details</a></p> *}
      <p class="pull-left" style="color:#e20000;font-size:16px;font-weight:bold"><strong>Need it in a hurry{if $settings.product_mapping == 'add_cart'} for {$recip|replace:"\'":"'"}{/if}?</strong>&nbsp;&nbsp;</p>


   <div class="btn-continue mar_btm  pull-left">
      <input type="button" name="calc-ship" value="Calculate Expedited Shipping Costs" class="btn btn-default" style="font-size:11px" onclick="javascript: hideShowCalc('{$recip}');" id="hideShowCalc{$label}" />
    </div>


    </div>
  </div>
</div>
<div id="cart_ship_estimator{$label}" class="ship_estimator clearfix panel-body" style="display: none;">
  {if $settings.product_mapping != 'add_cart'}
  <form onsubmit="javascript: getNewShipCost(document.getElementById('zip{$id}').value,document.getElementById('country{$id}').value,document.getElementById('method{$id}').value,'s_address_type{$id}','{$smarty.session.store}','{$recip}'); return false;" action="index.php" role="form">
  {/if}
    <div class="row">
      <div class="col-sm-6 mar_btm">
        <div class="form-group">
          <label for="country{$label}">Select Country:</label>
          <select class="form-control" id="country{$label}" name="country{$label}" onchange="hideShowCalcStateZip('{$label}',this.value); getInfo('limit_shipping_method','Shipping_Class','limitMethods',this.value+'||method{$label}');">
            <option value="">Select Country -</option>
            {html_options options=$options.country}
          </select>
        </div>
        <div class="form-group" id="staterow{$label}" style="display: none;">
          <label for="state{$label}">Select State:</label>
          <select class="form-control" id="state{$label}" name="state{$label}" onchange="getInfo('limit_shipping_method','Shipping_Class','limitMethods','United States|'+this.value+'|method{$label}');">
            <option value="">Select State -</option>
             {html_options options=$options.usstate}
          </select>
        </div>
  <div id="cityrow{$label}" style="display: none;">
    <div id="freightcity{$label}" style="{if !isset($settings.fedex_freight_account_num) || $settings.fedex_freight_account_num == ''}display: none;{/if}">
      <label for="city{$label}">Enter City:</label>
      <input type="text" id="city{$label}" name="city{$label}" size="15" maxlength="40" />
    </div>
  </div>
        <div class="form-group" id="ziprow{$label}" style="display: none;">
          <label for="zip{$label}">Enter Zip:</label>
          <input class="form-control" type="text" id="zip{$label}" name="zip{$label}" size="5" maxlength="5" {if $settings.product_mapping == 'add_cart'} onkeypress="javascript: if (event.keyCode == '13') {ldelim} getNewShipCost(document.getElementById('zip{$id}').value,document.getElementById('country{$id}').value,document.getElementById('method{$id}').value,'s_address_type{$id}','{$smarty.session.store}','{$recip}'); return false; {rdelim}" {/if} />
        </div>
        <div class="form-group">
          <label for="method{$label}">Select Method: <font color="red">Free UPS Ground Shipping on orders over $99</font></label>
          <select class="form-control" id="method{$label}" name="method{$label}">
            <option value="">Select Method -</option>
              {html_options options=$options.shipping.method}
          </select>
        </div>
      {if $get_ship_type}
        <div class="form-group" style="display:none;">
          <label for="">Type:</label>
          <div class="controlset">
            <label class="radio-inline"><input type="radio" id="s_address_type{$num}r" name="s_address_type{$num}" value="r" {if $valid.s_address_type.$num != "c"}checked{/if} /> Residential</label>
            <label class="radio-inline"><input type="radio" id="s_address_type{$num}c" name="s_address_type{$num}" value="c" {if $valid.s_address_type.$num == "c"}checked{/if} /> Commercial</label>
          </div>
        </div>
      {/if}
        <div class="buttonrow">
          <input type="button" value="Calculate Shipping" onclick="javascript: getNewShipCost(document.getElementById('zip{$id}').value,document.getElementById('country{$id}').value,document.getElementById('method{$id}').value,'s_address_type{$id}','{$smarty.session.store}','{$recip}',document.getElementById('city{$id}').value);" class="btn btn-default" />
        </div>
      </div>
      <div class="col-sm-6">
        <div class="row">
        <div class="nopad">
          <div class="col-xs-6">
            <label>Cart Total:</label>
          </div>
          <div class="col-xs-6">
          {if $settings.product_mapping == 'add_cart'}
            {assign var="total" value="0"}
            {foreach from=$smarty.session.cart item=prod key=key}
              {if $prod.recipient_mapping == $recip|replace:"\'":"'"}
                {math equation="x+y" x=$total y=$prod.total assign="total"}
              {/if}
            {/foreach}
          {else}
            {assign var="total" value=$totals.price}
          {/if}
            <p class="pull-right">{$currency_type}{$total|commify}</p> {* $total is set in cartitems *}
          </div>
        </div>
        <div class="nopad">
          <div class="col-xs-6">
            <label>{*<span id="method_label{$label}"></span> *}Shipping Cost:</label>
          </div>
          <div class="col-xs-6">
            <p class="pull-right" id="method_cost{$label}"{* name="method_cost{$label}"*}>&nbsp;</p>
          </div>
        </div>

        <div class="nopad">
          <div class="col-xs-6">
            <label>{*<span id="tax_label{$label}"></span> *}Estimated Tax:</label>
          </div>
          <div class="col-xs-6">
            <p class="pull-right" id="tax_cost{$label}"{* name="tax_cost{$label}"*}>&nbsp;</p>
          </div>
        </div>

        {if $settings.product_mapping != 'add_cart'}
          <div class="nopad">
            <div class="col-xs-6">
              <label><span id="promo"></span></label>
            </div>
            <div class="col-xs-6">
              <p class="pull-right" id="promo_price"{* name="promo_price"*}>&nbsp;</p>
            </div>
          </div>
        {/if}

        <div class="nopad">
          <div class="col-xs-6">
            <label>Total Cost:</label>
          </div>
          <div class="col-xs-6">
            <p class="pull-right" id="total_cost{$label}"{* name="total_cost{$label}"*}>&nbsp;</p>
          </div>
        </div>

        <div class="col-xs-12">
          <div class="note nopad">
            <p>Note: {if $settings.product_mapping == 'add_cart'}Promotional discounts and t{else}T{/if}axes may be applied to your order total and/or shipping total based on your shipping and/or billing state. Expedited shipping applies to <b>business days only</b>.  To arrange Saturday delivery, please call 1-800-511-0100.</p>
          </div>
        </div>

     </div>
    </div>
   </div>
   {if $settings.product_mapping != 'add_cart'}
 </form>
 {/if}
</div>
</div>
<noscript>
  <div class="noscript">If you had JavaScript enabled, you could calculate your shipping charges here.</div>
</noscript>
<script type="text/javascript">
 document.getElementById('cart_ship_estimator_header{$id}').style.display = 'block';
</script>
{/if}