{include file="_top.tpl"}

<h1>Confirm Order Information</h1>

{if $change_shipper != ''}
<div class="mar_btm help-block"><b>{$change_shipper}</b></div>
{/if}

{if $change_tax == 'y'}
<div class="mar_btm help-block"><b>Note: Your tax total has changed.</b></div>
{/if}

{if $shipservicemsg != ''}
<div class="mar_btm help-block"><b>{$shipservicemsg}</b></div>
{/if}

{if $messages != ''}
<div class="help-block">
  <b>Note:</b><br />
  {foreach from=$messages item=msg}
  <b>&#149;&nbsp;{$msg}</b><br />
  {/foreach}
</div>
{/if}

<form method="post" action="index.php"> 
  <input type="hidden" name="action" value="CheckoutCorporateConfirmation"/>
  <input type="hidden" name="confirmation_text" value="{#confirmation_email_text#|replace:'"':'&quot;'}"/>
  <input type="hidden" name="confirmation_special" value="{#confirmation_email_special#|replace:'"':'&quot;'}"/>

  <div>
    <div class="mar_btm"> 
      <h2>Billing Information</h2>
      {if $settings.paypal_express_checkout != 'y'}
      <input type="submit" name="submit_edit" value="Edit" class="btn btn-default btn-sm"/>{/if} 
    </div>
    <div class="row">
      <div class="col-sm-4">
        <section class="mar_btm">
          {if $info.billing.payment_method == 'paypal' && ($settings.paypal_skip == 'y' || $settings.paypal_express_checkout == 'y')}
          <div>PayPal Order</div>
          {$info.billing.email}
          {else}
          <div>{$info.billing.first_name} {$info.billing.last_name}
            {if $info.billing.title != ''}, {$info.billing.title}{/if}
            {if $info.billing.company != ''}, {$info.billing.company}{/if}
          </div>
          <div>{$info.billing.billing_address1}</div>
          {if $info.billing.billing_address2 != ''}
            <div>{$info.billing.billing_address2}</div>
          {/if}
          <div>{$info.billing.billing_city}, {$info.billing.billing_state}  {$info.billing.billing_zip} {$info.billing.billing_country}</div>
          <div>{$info.billing.email}</div>
          <div>{$info.billing.phone}</div>
          {/if}
          {if $info.shipping.0.s_comments != ''}
            <div>Comments: {$info.shipping.0.s_comments}</div>
          {/if}
        </section>
      </div>
      <div class="col-sm-4">
        <section class="mar_btm">
          {assign var="meth" value=$info.billing.payment_method}
          {if $gift_certificates.codes|@count > 0}
          {foreach from=$gift_certificates.codes item=code}
            <div class="mar_btm">
              <div>Payment Method:&nbsp;Gift Certificate</div>
              <div>Code:&nbsp;{$code.code}</div>
              <div> Amount Used:&nbsp;{$currency_type}{$code.amount|commify}</div>
              <div>Remaining Balance:&nbsp;{$currency_type}{$code.remaining|commify}</div>
            </div>
          {/foreach}
          {/if}
          {if $meth != 'giftcertificate'} 
            <div>Payment Method:&nbsp;{$payment_methods.$meth}</div>
          {/if}
          {if $meth == 'creditcard'}
            <div>{$info.billing.ccname}</div>
            <div>{$info.billing.cctype}</div>
            <div>{$info.billing.last_four} (Last 4 digits)</div>
            {elseif $meth == 'purchaseorder'}
            <div>Purchase Order Number:&nbsp;{$info.billing.purchase_order}</div>
            {elseif $meth == 'echeck'}
            <div>{$info.billing.last_four} (Last 4 digits)</div>
          {/if}
          {if $gift_certificates.codes|@count > 0 && $meth != 'giftcertificate'}
            <div>{math equation="(x-y)+z" x=$gift_certificates.totals.total y=$gift_certificates.totals.gctotal z=$gift_certificates.totals.remaining assign=difference}
              Amount:&nbsp;{$currency_type}{$difference|string_format:"%.2f"}
            </div>
          {/if}
        </section>
      </div>
    </div>

    {counter start=0 assign=num}
    {section name=ship loop=$ship_num}
    <div class="row">
      <div class="col-sm-4">
        <div class="mar_btm">
          <h2>Order &amp; Shipping Information: {$info.shipping.$num.s_firstname} {$info.shipping.$num.s_lastname}</h2>
          {if $settings.paypal_express_checkout != 'y'}<input type="submit" name="submit_edit" value="Edit" class="btn btn-default btn-sm"/>{/if}
        </div>
        <section class="mar_btm">
          <div>{$info.shipping.$num.s_firstname} {$info.shipping.$num.s_lastname}{if $info.shipping.$num.s_title != ''}, {$info.shipping.$num.s_title}{/if}{if $info.shipping.$num.s_company != ''}, {$info.shipping.$num.s_company}{/if}</div>
          <div>{$info.shipping.$num.s_address1}</div>
          {if $info.shipping.$num.s_address2 != ''}
          <div>{$info.shipping.$num.s_address2}</div>
          {/if}
          <div>
            {$info.shipping.$num.s_city}, {$info.shipping.$num.s_state} {$info.shipping.$num.s_zip} {$info.shipping.$num.s_country}
          </div>
          {if $info.shipping.$num.s_phone != ''}
          <div>{$info.shipping.$num.s_phone}</div>
          {/if} 
          <div>
            Requested Ship Date: {$info.shipping.$num.s_shipon}
          </div>
          {if $info.shipping.$num.gift_message != ''}
          <div>Gift Message: {$info.shipping.$num.gift_message}</div>
          {/if}
        </section>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-2"><b>Qty</b></div>
      <div class="col-sm-3"><b>Item #</b></div>
      <div class="col-sm-4"><b>Description</b></div>
      <div class="col-sm-3"><b>Price</b></div>
    </div>

    {foreach from=$info.shipping.$num.prods item=prod}
      {if $prod.build_prod_id == ''}
      <div class="row mar_btm">
        <div class="col-sm-2">{$prod.qty}</div>
        <div class="col-sm-3">{$prod.sku}</div>
        <div class="col-sm-4">
          {$prod.name}
          {foreach from=$prod.gifts item=gift}
            {if $gift != ''}
            <br />* {$gift}
            {/if}
          {/foreach}
          {if $prod.note != ''}
            <br />Note: {$prod.note}
          {/if}
          {if $prod.att_list != ''}
            {$prod.att_list|replace:"<br />&nbsp;&nbsp;":", "|regex_replace:"/^,/":":"}
          {/if}
          {if $prod.custom_form != ''}
            [<a href="#" onclick= "javascript:window.open('/custom_form_info/{$prod.cart_id}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">View details</a>]
          {/if}
        </div>
        <div class="col-sm-3">
          {if $prod.build_parent != 'y'}
            {$currency_type}{$prod.price|commify}
          {else}
            &nbsp;
          {/if}
        </div>
      </div>
      {if $prod.build_parent == 'y'}
        {foreach from=$info.shipping.$num.prods item=pr}
          {if $pr.build_prod_id != '' && $pr.build_link == $prod.build_link}
          <div class="row mar_btm">
            <div class="col-sm-2">{$pr.qty}</div>
            <div class="col-sm-3">&nbsp;</div>
            <div class="col-sm-4">
            &nbsp;&nbsp;&nbsp;{$pr.name}
            {foreach from=$prod.gifts item=gift}
              {if $gift != ''}
                <br />&nbsp;&nbsp;&nbsp;* {$gift}
              {/if}
            {/foreach}
            {if $pr.note != ''}
              <br />&nbsp;&nbsp;&nbsp;Note: {$pr.note}
            {/if}
            {if $pr.att_list != ''}
              {$pr.att_list|replace:"<br />&nbsp;&nbsp;":", "|regex_replace:"/^,/":":"}
            {/if}
            {if $pr.custom_form != ''}
              [<a href="#" onclick= "javascript:window.open('/custom_form_info/{$prod.cart_id}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">View details</a>]
            {/if}
            </div>
            <div class="col-sm-3">
              {$currency_type}{$pr.price|commify}
            </div>
          </div>
          {/if}
        {/foreach}
      {/if}
      {if $prod.gift_wrap == 'y' && $prod.gift_wrap_info != ''}
        <div class="row mar_btm">
          <div class="col-sm-2">{$prod.qty}</div>
          <div class="col-sm-3">{$prod.gift_wrap_info.gift_wrap_sku}</div>
          <div class="col-sm-4">
            {$prod.gift_wrap_info.gift_wrap_name}
          </div>
          <div class="col-sm-3">
            {$currency_type}{$prod.gift_wrap_info.total|commify}
          </div>
        </div>
      {/if}
      {/if}
    {/foreach}

    {counter assign=num}
    {/section}

    <h3>Order Total</h3>
    <div>
      <div><b>Subtotal:</b> {$currency_type}{$order.subtotal|commify}</div>
      {if $order.gifttotal != 0}
      <div><b>Giftwrap Total:</b> {$currency_type}{$order.gifttotal|commify}</div>
      {/if}
      {foreach from=$order.totalordpromo item=promo}
      {if $promo.type == '%'}
      <div><b>Promo Discount: </b> -{$currency_type}{$promo.deduction}</div>
      {elseif $promo.type == '$'}
      <div><b>Promo Discount: </b>-{$currency_type}{$promo.deduction}</div>
      {elseif $promo.type == 'freeprod'}
      <div><b>Free Product Discount ({$promo.prod_name}): </b>-{$currency_type}{$promo.deduction}</div>
      {/if}
      {/foreach}
      {foreach from=$order.totalordshippromo item=promo}
      {if $promo.type == '%'}
      <div><b>Shipping Discount: </b> -{$currency_type}{$promo.deduction}</div>
      {elseif $promo.type == '$'}
      <div><b>Shipping Discount: </b>-{$currency_type}{$promo.deduction}</div>
      {/if}
      {/foreach}
      <div><b>Shipping Total:</b> {$currency_type}{$order.shiptotal|commify}</div>
      {if $order.sgroupadd != 0}
      <div><b>Additional Flat Shipping Total:</b> {$currency_type}{$order.sgroupadd}</div>
      {/if}
      {if $order.shipserviceadd != 0}
      <div><b>Shipping Adjustment:</b> {$currency_type}{$order.shipserviceadd}</div>
      {/if}
      <div><b>Tax Total:</b> {$currency_type}{$order.taxtotal|commify}</div>
      <div><b>Grand Total:</b> {$currency_type}{$order.grandtotal|commify}</div>
    </div>
    <div>
      <input type="submit" name="submit_edit" value="Edit" class="btn btn-default">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="hidden" name="to_email" value="{#form_orders_to#}">
      <input type="hidden" name="from_email" value="{#form_orders_from#}">
      <input type="hidden" name="paypal_express_checkout" value="{$settings.paypal_express_checkout}">
      <input type="submit" name="submit_continue" value="Submit Order" tabindex="1" class="btn btn-primary">  
    </div>
  </div>
</form>

    {include file="_bottom.tpl"}

