{include file="_top.tpl"}

{include file="checkout_progress.tpl" step="2"}

<h1>Order Totals</h1>

{if $has_account == 'y' && $is_member == 'n'}
<p>We noticed that you have not logged in yet. Please <a href="/member_login">login</a>.</p>
{/if}

<div class="checkout-display-totals">
  <form method="post" action="index.php"> 
    <input type="hidden" name="action" value="CheckoutDisplay" />

    {if $change_shipper}<div>{$change_shipper}</div>{/if}
    {if $shipservicemsg}<div>{$shipservicemsg}</div>{/if}
    <div class="row">
    {foreach from=$recipients key=key item=recipient}
    {math equation="1+x" x=$key assign="recip_num"}
    <div class="col-lg-6">
      <div class="order-totals panel panel-default">
          <div class="panel-heading"><strong>Recipient: {$recipient}</strong></div>
          <div class="panel-body">
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Subtotal:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$order.totals.$key.subtotal|commify}</div>
          </div>
    
          {if $order.totals.$key.giftwrap > 0.00}
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Giftwrap:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$order.totals.$key.giftwrap|commify}</div>
          </div>
          {/if}
    
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Shipping:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$order.totals.$key.shipping|commify}</div>
          </div>
    
          {if $order.totals.$key.sgroupadd > 0.00}
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Additional Flat Shipping Rate:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$order.totals.$key.sgroupadd|commify}</div>
          </div>
          {/if}
          
          {foreach from=$order.totals.$key.totalpromo item=promo}
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4">
              {if $promo.type == '%'}<strong>Promo Discount: </strong>{$promo.amount}% off
              {elseif $promo.type == '$'}<strong>Promo Discount: </strong>${$promo.amount} off
              {/if}
            </div>
            <div class="col-xs-3 col-sm-2 text-right">- {$currency_type}{$promo.deduction}</div>
          </div>
          {/foreach}
    
          {foreach from=$order.totals.$key.shippromo item=promo}
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4">
              {if $promo.type == '%'}<strong>Shipping Promo: </strong>{$promo.amount}% off
              {elseif $promo.type == '$'}<strong>Shipping Promo: </strong>${$promo.amount} off
              {/if}
            </div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$promo.deduction}</div>
          </div>
          {/foreach}
    
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Total:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$order.totals.$key.total|commify}</div>
          </div>
    
          {if $settings.ups_time_in_transit == 'y' && isset($transit_time.$key.arrival_date)}
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Time in Transit:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$transit_time.$key.transit_days} Business Day{if $transit_time.$key.transit_days > 1}s{/if}</div>
          </div>
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Estimated Arrival:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$transit_time.$key.arrival_date|date_format:"%B %e"}</div>
          </div>
          {/if}
          </div>
        </div></div>
    {/foreach}
  </div>
  <div class="row">
    <div class="col-lg-6">
      <div class="order-totals panel panel-default mar_btm">
          <div class="panel-heading"><strong>Complete Order Total</strong></div>
          <div class="panel-body">
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Subtotal:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$order.subtotal|commify}</div>
          </div>
    
          {if $order.gifttotal > 0}
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Giftwrap Total:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$order.gifttotal|commify}</div>
          </div>      
          {/if}
    
          {foreach from=$order.totalordpromo item=promo}
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4">
              {if $promo.type == '%'}<strong>Promo Discount: </strong>{$promo.amount}% off
              {elseif $promo.type == '$'}<strong>Promo Discount: </strong>${$promo.amount} off
              {elseif $promo.type == 'freeprod'}<strong>Free Product Discount: </strong>${$promo.amount} off
              {/if}
            </div>
            <div class="col-xs-3 col-sm-2 text-right">- {$currency_type}{$promo.deduction}</div>
          </div>
          {/foreach}
    
          {foreach from=$order.totalordshippromo item=promo}
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4">
              {if $promo.type == '%'}<strong>Shipping Discount: </strong>{$promo.amount}% off
              {elseif $promo.type == '$'}<strong>Shipping discount: </strong>${$promo.amount} off
              {/if}
            </div>
            <div class="col-xs-3 col-sm-2 text-right">- {$currency_type}{$promo.deduction}</div>
          </div>
          {/foreach}
    
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Shipping Total:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$order.shiptotal|commify}</div>
          </div>
    
          {if $order.sgroupadd > 0}
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Additional Flat Shipping Total:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$order.sgroupadd}</div>
          </div>
          {/if}
    
          {if $order.shipserviceadd > 0}
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Shipping Adjustment:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$order.shipserviceadd|commify}</div>
          </div>
          {/if}
    
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Tax Total:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$order.taxtotal|commify}</div>
          </div>
    
          <div class="row">
            <div class="col-xs-6 col-sm-3 col-md-2 col-lg-4"><strong>Grand Total:</strong></div>
            <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$order.grandtotal|commify}</div>
          </div>
          </div>
        </div>
      </div>
    </div>
    <div class="buttonrow mar_btm">
     <input type="submit" name="submit" value="Continue to Billing &gt;" class="btn btn-primary" />
   </div>

 </form>
</div>
{include file="bronto_api.tpl"}
{include file="_bottom.tpl"}
