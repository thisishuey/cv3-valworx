{include file="_top.tpl"}

{include file="checkout_progress.tpl" step="4"}

<h1>Confirm Order Information</h1>

<div class="confirmation">

  {if $has_account == 'y' && $is_member == 'n'}
  <p>We noticed that you have not logged in yet. Please <a href="/member_login">login</a>.</p>
  {/if}

  {if $change_shipper}<p>{$change_shipper}</p>{/if}

  {if $change_tax == 'y'}<p>Note: Your tax total has changed.</p>{/if}

  {if $shipservicemsg}<p>{$shipservicemsg}</p>{/if}

  {if $messages}
  <div class="messages">
    <span class="label">Note:</span>
    <ul>
     {foreach from=$messages item=msg}
     <li>{$msg|replace:"<br>":""}</li>
     {/foreach}
    </ul>
  </div>
  {/if}

  <form method="post" action="index.php"> 
    <input type="hidden" name="action" value="CheckoutConfirmation" />
    <input type="hidden" name="confirmation_text" value="{#confirmation_email_text#|replace:'"':'&quot;'}" />
    <input type="hidden" name="confirmation_special" value="{#confirmation_email_special#|replace:'"':'&quot;'}" />

    <div class="clearfix">
      <div class="row">
        <div class="col-sm-4">
          <div id="person_info">

              {if isset($smarty.session.visa_id)}
                <div class="heading mar_btm">
                  <input type="button" value="Edit Order" name="visa_edit" class="button medium style2" onclick="javascript: parent.location='/viewcart';"/>
                </div>
              {elseif ($settings.amazon_checkout != 'y' || !$smarty.session.amazon_id) && ($info.billing.payment_method != 'paypal')}
              <div class="heading mar_btm">
                <h3>Personal Information <input type="submit" name="submit_billing" value="Edit" class="btn btn-default btn-xs" /></h3>
                
              </div>
              {/if}
              <section>
                {if $settings.amazon_checkout != 'y' || !$smarty.session.amazon_id}
                  {if $info.billing.payment_method == 'paypal' && ($settings.paypal_skip == 'y' || $settings.paypal_exp_billing != 'y')}
                    <div>PayPal Order</div>
                  {else}
                    <div>{$info.billing.first_name} {$info.billing.last_name}</div>
                    {if $info.billing.company}
                      <div>{$info.billing.company}</div>
                    {/if}
                    {if $info.billing.title}
                      <div>{$info.billing.title}</div>
                    {/if}
                    <div>{$info.billing.billing_address1}</div>
                    {if $info.billing.billing_address2}
                      <div>{$info.billing.billing_address2}</div>
                    {/if}
                    <div>{$info.billing.billing_city}, {$info.billing.billing_state} {$info.billing.billing_zip}</div>
                    <div>{$info.billing.billing_country}</div>
                  {/if}
                  <div>{$info.billing.email}</div>
                  <div>{$info.billing.phone}</div>
                {/if}
              </section>
            </div>
          </div>

        <div class="col-sm-4">
          <div id="payment_info">
              <div class="heading mar_btm">
                <h3>Payment Information {if $settings.paypal_express_checkout != 'y'}
                    <input type="submit" name="submit_payment" value="Edit" class="btn btn-default btn-xs" />
                  {/if}</h3>
                
              </div>
              <section>
                {assign var="meth" value=$info.billing.payment_method}
                  {if $gift_certificates.codes|@count > 0}
                    {foreach from=$gift_certificates.codes item=code}
                      <div>
                        <label>Payment Method:</label> 
                        <span>Gift Certificate</span>
                      </div>
                      <div>
                        <label>Code:</label> 
                        <span>{$code.code}</span>
                      </div>
                      <div>
                        <label>Amount Used:</label> 
                        <span>{$currency_type}{$code.amount|commify}</span>
                      </div>
                      <div>
                        <label>Remaining Balance:</label> 
                        <span>{$currency_type}{$code.remaining|commify}</span>
                      </div>
                    {/foreach}
                  {/if}
      
                  {if $meth != 'giftcertificate'}
                    <div>
                      <label>Payment Method:</label> 
                      <span>{$payment_methods.$meth}</span>
                    </div>
                  {/if}
      
                  {if $meth == 'creditcard'}
                    <div>{$info.billing.ccname}</div>
                    <div>{$info.billing.cctype}</div>
                    <div>{$info.billing.last_four} (Last 4 digits)</div>
                  {elseif $meth == 'purchaseorder'}
                    <div>
                      <label>Purchase Order Number:</label> 
                      <span>{$info.billing.purchase_order}</span>
                    </div>
                  {elseif $meth == 'echeck'}
                    <div>{$info.billing.last_four} (Last 4 digits)</div>
                  {/if}
      
                  {if $gift_certificates.codes|@count > 0 && $meth != 'giftcertificate'}
                    {math equation="(x-y)+z" x=$gift_certificates.totals.total y=$gift_certificates.totals.gctotal z=$gift_certificates.totals.remaining assign=difference}
                    <div>
                      <label>Amount:</label> 
                      <span>{$currency_type}{$difference|string_format:"%.2f"}</span>
                    </div>
                  {/if}
                </section>
              </div>
            </div>
          
        <div class="col-sm-4">
          <div id="total_info">
                  <div class="heading">
                    <h3>Complete Order Total</h3>
                  </div>
                  <section class="totals">
                    <div class="row">
                      <div class="col-xs-5 col-sm-6"><label>Subtotal:</label></div> 
                      <div class="col-xs-3 col-sm-4 text-right">{$currency_type}{$order.subtotal|commify}</div>
                    </div>
                    {if $order.reward_total != 0}
                      <div class="row">
                        <div class="col-xs-5 col-sm-6"><label>Reward Points Used:</label></div> 
                        <div class="col-xs-3 col-sm-4 text-right">{$order.reward_total}</div>
                      </div>
                    {/if}
                    {if $order.gifttotal != 0}
                      <div class="row">
                        <div class="col-xs-5 col-sm-6"><label>Giftwrap Total:</label> </div>
                        <div class="col-xs-3 col-sm-4 text-right">{$currency_type}{$order.gifttotal|commify}</div>
                      </div>
                    {/if}
                    {foreach from=$order.totalordpromo item=promo}
                      {if $promo.type == '%'}
                        <div class="row">
                          <div class="col-xs-5 col-sm-6"><label>Promo Discount:</label></div> 
                          <div class="col-xs-3 col-sm-4 text-right">- {$currency_type}{$promo.deduction}</div>
                        </div>
                      {elseif $promo.type == '$'}
                        <div class="row">
                          <div class="col-xs-5 col-sm-6"><label>Promo Discount:</label> </div>
                          <div class="col-xs-3 col-sm-4 text-right">- {$currency_type}{$promo.deduction}</div>
                        </div>
                      {elseif $promo.type == 'freeprod'}
                        <div class="row">
                          <div class="col-xs-5 col-sm-6"><label>Free Product Discount ({$promo.prod_name}):</label> </div>
                          <div class="col-xs-3 col-sm-4 text-right">- {$currency_type}{$promo.deduction}</div>
                        </div>
                      {/if}
                    {/foreach}
                    {foreach from=$order.totalordshippromo item=promo}
                      {if $promo.type == '%'}
                        <div class="row">
                          <div class="col-xs-5 col-sm-6"><label>Shipping Discount:</label></div> 
                          <div class="col-xs-3 col-sm-4 text-right">- {$currency_type}{$promo.deduction}</div>
                        </div>
                      {elseif $promo.type == '$'}
                        <div class="row">
                          <div class="col-xs-5 col-sm-6"><label>Shipping Discount:</label></div> 
                          <div class="col-xs-3 col-sm-4 text-right">- {$currency_type}{$promo.deduction}</div>
                        </div>
                      {/if}
                    {/foreach}
                    <div class="row">
                      <div class="col-xs-5 col-sm-6"><label>Shipping Total:</label></div> 
                      <div class="col-xs-3 col-sm-4 text-right">{$currency_type}{$order.shiptotal|commify}</div>
                    </div>
        
                    {if $order.sgroupadd != 0}
                      <div class="row">
                        <div class="col-xs-5 col-sm-6"><label>Additional Flat Shipping Total:</label> </div>
                        <div class="col-xs-3 col-sm-4 text-right">{$currency_type}{$order.sgroupadd}</div>
                      </div>
                    {/if}
                    {if $order.shipserviceadd != 0}
                      <div class="row">
                        <div class="col-xs-5 col-sm-6"><label>Shipping Adjustment:</label></div> 
                        <div class="col-xs-3 col-sm-4 text-right">{$currency_type}{$order.shipserviceadd}</div>
                      </div>
                    {/if}
        
                    <div class="row">
                      <div class="col-xs-5 col-sm-6"><label>Estimated Tax Total:</label></div> 
                      <div class="col-xs-3 col-sm-4 text-right">{$currency_type}{$order.taxtotal|commify}</div>
                    </div>
                    <div class="grand-total row">
                      <div class="col-xs-5 col-sm-6"><label>Grand Total:</label> </div>
                      <div class="col-xs-3 col-sm-4 text-right">{$currency_type}{$order.grandtotal|commify}</div>
                    </div>
                    <input type="submit" name="submit_continue" value="Place My Order" tabindex="1" class="btn btn-primary" />
                  </section>
                </div>
              </div>
            </div>
      </div>

      {counter start=0 assign="num" name="num"}
      {section name=ship loop=$ship_num}
      <div class=" mar_btm">
        <h3>Order &amp; Shipping Information{if $options.$num != 'One'}: Recipient {$options.$num}{/if} {if $settings.paypal_express_checkout != 'y'}
          <input type="submit" name="submit_shipping" value="Edit" class="btn btn-default btn-xs" />
        {/if}
        </h3>
        
      </div>
      <section class="mar_btm">
        <div>{$info.shipping.$num.s_firstname} {$info.shipping.$num.s_lastname}</div>
          {if $info.shipping.$num.s_title}
            <div>{$info.shipping.$num.s_title}</div>
          {/if}
          {if $info.shipping.$num.s_company}
            <div>{$info.shipping.$num.s_company}</div>
          {/if}
          {if $settings.amazon_checkout != 'y' || !$smarty.session.amazon_id}
            <div>{$info.shipping.$num.s_address1}</div>
            {if $info.shipping.$num.s_address2}
              <div>{$info.shipping.$num.s_address2}</div>
            {/if}
          {/if}

          <div>{$info.shipping.$num.s_city}, {$info.shipping.$num.s_state} {$info.shipping.$num.s_zip}</div>
          <div>{$info.shipping.$num.s_country}</div>
          {if $info.shipping.$num.s_phone}
            <div>{$info.shipping.$num.s_phone}</div>
          {/if}
          {if $info.shipping.$num.s_email}
            <div>{$info.shipping.$num.s_email}</div>
          {/if}

          {if $settings.amazon_checkout == 'y' && isset($smarty.session.amazon_id) && $info.billing.payment_method == 'amazon'}
            <div>Payment Method: Amazon Payments<div>
          {/if}

          {if $info.shipping.$num.s_shipon != 'As soon as possible'}
            <div>
              <label>Requested Ship Date:</label> 
              <span>{$info.shipping.$num.s_shipon}</span>
            </div>
          {/if}
          {if $settings.ups_time_in_transit == 'y' && isset($transit_time.$num.arrival_date)}
            <div>
              <label>Transit Time:</label> 
              <span>{$transit_time.$num.transit_days} Business Day{if $transit_time.$num.transit_days > 1}s{/if}</span>
            </div>
            <div>
              <label>Estimated Arrival:</label> 
              <span>{$transit_time.$num.arrival_date|date_format:"%B %e"}</span>
            </div>
          {/if}

          {if $info.shipping.$num.gift_message}
            {if $settings.gift_msg_separate == 'y'}
              <div>
                <label>Gift Message:</label><br><br>
                {$info.shipping.$num.gift_message|replace:'::':'<br>'}
              </div>
            {else}
              <div>
                <label>Gift Message:</label> 
                <span>{$info.shipping.$num.gift_message}</span>
              </div>
            {/if}
          {/if}
          {if $info.shipping.$num.s_comments}
          <div>
            <label>Comments:</label> 
            <span>{$info.shipping.$num.s_comments}</span>
          </div>
          {/if}
        </section>

        {assign var="own_box_shipping" value=0}
        {assign var="own_box_subtotal" value=0}
        {assign var="skip_ownbox_prods" value=''}
        {if $settings.checkout_vendor_ship == 'y'}
          {foreach from=$order.totals.$num.own_box item=own_box_prod name=it_skip}
            {math assign="own_box_shipping" equation="own_box_shipping + own_box_ship_cost" own_box_shipping=$own_box_shipping own_box_ship_cost=$own_box_prod.shipping} 
            {math assign="own_box_subtotal" equation="own_box_subtotal + own_box_cost" own_box_subtotal=$own_box_subtotal own_box_cost=$own_box_prod.subtotal} 
          {/foreach}
        {/if}

        {assign var=need_basic_table value='y'} {* Set flag to 'y' so basic table will show if no vendor boxes, or it is turned off. *}
        {if $settings.checkout_vendor_ship == 'y'}

          {foreach from=$order.totals.$num.own_box item=own_box_table name=build_ob_tables}
            <div class="cart-wrapper panel panel-default">
              <div class="panel-body">
                <div class="visible-xs"><h4>Products</h4></div>
              <div class="lead row hidden-xs">
                <div class="col-sm-4">Product</div>
                <div class="col-sm-3">Unit Price</div>
                <div class="col-sm-2">Qty</div>
                <div class="col-sm-3">Total Price</div>
              </div>
              {foreach from=$own_box_table.prod_cart_ids key=ob_cart_id item=ob_qty}
                {assign var=prod value=$cart.$ob_cart_id}
                {*if $smarty.foreach.build_ob_tables.iteration > 1}
                  {assign var=skip_ownbox_prods value=$skip_ownbox_prods|cat:','}
                {/if}
                {assign var=skip_ownbox_prods value=$skip_ownbox_prods|cat:$prod.prod_id*}
                {assign var=skip_ownbox_prods value=$skip_ownbox_prods|cat:$prod.prod_id|cat:','}
                <div class="row mar_btm pdd_tp10 border_top">
                  <div class="col-sm-4">
                    <div class="row">
                      {if $prod.web_image}
                        <div class="col-xs-6">
                          <img class="cart-image img img-responsive" src="{$prod.web_image|img_prefix}" alt="{$prod.name|replace:'& ':'&amp; '}"  />
                        </div>
                        <div class="col-xs-6">
                      {else}
                        <div class="col-sm-12">
                      {/if}
                      {$prod.name}
                      <div>Item #: {$prod.sku}</div>
                      {foreach from=$prod.gifts item=gift}
                        {if $gift}
                          <div>* {$gift}</div>
                        {/if}
                      {/foreach}
                      {if $prod.note}
                        <div>Note: {$prod.note}</div>
                      {/if}
                      {if $prod.att_list}
                        <div>{$prod.att_list}</div>
                      {/if}
                      {if $prod.custom_form}
                        <div><a href="javascript:void(0);" onclick="javascript:window.open('/custom_form_info/{$ob_cart_id}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">View details</a></div>
                      {/if}
                      {if $prod.recurring}<div>Re-order every {$prod.recurring} days</div>{/if}
                    </div>
                    </div>
                  </div>
                  <div class="col-xs-12 col-sm-3">
                    {assign var="pcat" value=$smarty.session.price_cat}
                    {if $prod.prices != ''}
                      {assign var="stndrd_price" value=$prod.prices.$pcat.standard_price}
                    {else}
                      {assign var="stndrd_price" value=$prod.price}
                    {/if}
                    {if $prod.is_reward == 'y'}
                      <div class="row">
                        <div class="col-xs-6 col-sm-3 col-md-2"><strong>Points: </strong></div> 
                        <div class="col-xs-3 col-sm-2 text-right">{$prod.reward_amount}</div>
                      </div>
                    {elseif $prod.build_parent != 'y'}
                      <div class="row">
                        <div class="col-xs-6 col-sm-3 col-md-2"><strong class="visible-xs">Unit Price: </strong></div>
                        <div class="col-xs-3 col-sm-2 text-right">
		                      {if $prod.prices != '' && $prod.prices.$pcat.standard_price != '' && $prod.is_donation != 'y'}
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
		                    </div>
		                  </div>
                    {/if}
                  </div>
                  <div class="col-xs-12 col-sm-2">
                    <div class="row">
                      <div class="col-xs-6 col-sm-3 col-md-2"><strong class="visible-xs">Qty: </strong></div>
                      <div class="col-xs-3 col-sm-2 text-right">{$ob_qty}</div>
                    </div>
                  </div>
                  <div class="col-xs-12 col-sm-3">
                    {if $prod.is_reward == 'y'}
                      <div class="row">
                        <div class="col-xs-6 col-sm-3 col-md-2"><strong>Points: </strong></div>
                        <div class="col-xs-3 col-sm-2 text-right">{$prod.reward_amount}</div>
                      </div>
                    {elseif $prod.build_parent != 'y'}
                      <div class="row">
                        <div class="col-xs-6 col-sm-3 col-md-2"><strong class="visible-xs">Total Price:</strong></div>
                        <div class="col-xs-3 col-sm-2 text-right">
                      {if $prod.prices != ''}
                        {if $prod.is_special == 'y' && $prod.prices.$pcat.standard_price != $prod.prices.$pcat.special_price && $prod.prices.$pcat.standard_price != '0'}
                          <del>{$currency_type}{$prod.prices.$pcat.standard_price|commify}</del>{$currency_type}{$prod.prices.$pcat.special_price|commify}
                        {else}
                          {$currency_type}{math assign='prodtot' equation="subtot * qty" qty=$ob_qty subtot=$prod.prices.$pcat.standard_price}{$prodtot|commify}
                        {/if}
                      {else}
                        {$currency_type}{math assign='prodtot' equation="subtot * qty" qty=$ob_qty subtot=$prod.price}{$prodtot|commify}
                      {/if}
                    </div>
                    </div>
                    {else}
                      &nbsp;
                    {/if}
                  </div>
                </div>
              {/foreach}

              {if $prod.build_parent == 'y'}
                {foreach from=$info.shipping.$num.prods item=pr}
                  <div class="row mar_btm">
                    {if $pr.build_prod_id && $pr.build_link == $prod.build_link}
                      <div class="col-sm-4">
                        {$pr.name}
                        {foreach from=$prod.gifts item=gift}
                          {if $gift}
                            <div>* {$gift}</div>
                          {/if}
                        {/foreach}
                        {if $pr.note}
                          <div>Note: {$pr.note}</div>
                        {/if}
                        {if $pr.att_list}
                          <div>{$pr.att_list}</div>
                        {/if}
                        {if $pr.custom_form}
                          <div><a href="javascript:void(0);" onclick="javascript:window.open('/custom_form_info/{$prod.cart_id}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">View details</a></div>
                        {/if}
                      </div>
                      <div class="col-xs-3">
                        <div class="col-xs-6 col-sm-3 col-md-2"><strong class="visible-xs">Unit Price:</strong></div>
                        <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{math equation="x / y" x=$pr.price y=$pr.qty format="%.2f"}</div>
                      </div>
                      <div class="row">
                        <div class="col-xs-6 col-sm-3 col-md-2"><strong class="visible-xs">Qty:</strong></div>
                        <div class="col-xs-3 col-sm-2 text-right">{$pr.qty}</div>
                      </div>
                      <div class="row">
                         <div class="col-xs-6 col-sm-3 col-md-2"><strong class="visible-xs">Total Price:</strong></div>
                        <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$pr.price|commify}</div>
                      </div>
                    {/if}
                  </div>
                {/foreach}
              {/if}

              {if $prod.gift_wrap == 'y' && $prod.gift_wrap_info}
                <div class="row mar_btm">
                  <div class="col-sm-4">
                    {$prod.gift_wrap_info.gift_wrap_name}
                    <div>Item #: {$prod.gift_wrap_info.gift_wrap_sku}</div>
                  </div>
                  <div class="col-xs-3">
                    <strong class="visible-xs">Unit Price:</strong>
                    {$currency_type}{math equation="x / y" x=$prod.gift_wrap_info.total y=$prod.qty|commify}
                  </div>
                  <div class="col-xs-2" >
                    <strong class="visible-xs">Qty:</strong>{$prod.qty}
                  </div>
                  <div class="col-xs-3">
                    <strong class="visible-xs">Total Price:</strong>
                    {$currency_type}{$prod.gift_wrap_info.totalformat="%.2f"}
                  </div>
                </div>
              {/if}
            
              <div class="cart-totals panel-footer">
                <div class="row">
                  <div class="col-xs-6 col-sm-3 col-md-2"><label>Shipper:</label></div> 
                  <div class="col-xs-3 col-sm-2 text-right"><span>{$own_box_table.ship_method}<span></div>
                </div>
                <div class="row">
                  <div class="col-xs-6 col-sm-3 col-md-2"><label>Subtotal:</label></div> 
                  <div class="col-xs-3 col-sm-2 text-right"><span>{$currency_type}{$own_box_table.subtotal|commify}</span></div>
                </div>
                <div class="row">
                  <div class="col-xs-6 col-sm-3 col-md-2"><label>Shipping Rate:</label></div> 
                  <div class="col-xs-3 col-sm-2 text-right"><span>{$currency_type}{$own_box_table.shipping|commify}</span></div>
                </div>
                {math assign="own_box_total" equation="subtotal + shipping" subtotal=$own_box_table.subtotal shipping=$own_box_table.shipping}
                <div class="row">
                  <div class="col-xs-6 col-sm-3 col-md-2">label><b>Total:</b></label></div> 
                  <div class="col-xs-3 col-sm-2 text-right"><span><b>{$currency_type}{$own_box_total|commify}</b></span></div>
                </div>
              </div>
            </div>
          </div>
          {/foreach}

          {assign var=need_basic_table value='n'}
        {/if}

        {assign var=skip_prods value=$skip_ownbox_prods|substr:0:-1|array}
        {foreach from=$info.shipping.$num.prods item=prod}
          {in_array val=$prod.prod_id arr=$skip_prods}
          {if $ret != 'y'}
            {assign var=need_basic_table value='y'}
          {/if} 
        {/foreach}

        {if $need_basic_table == 'y' }
          <div class="cart-wrapper panel panel-default">
            <div class="panel-body">
              <div class="visible-xs"><h4>Products</h4></div>
            <div class="lead row hidden-xs">
              <div class="col-sm-4">Product</div>
              <div class="col-sm-3">Unit Price</div>
              <div class="col-sm-2">Qty</div>
              <div class="col-sm-3">Total Price</div>
            </div>

            {foreach from=$info.shipping.$num.prods item=prod}
              {in_array val=$prod.prod_id arr=$skip_prods}
              {if !$prod.build_prod_id && !($settings.checkout_vendor_ship == 'y' && $ret == 'y')}

                <div class="row mar_btm pdd_tp10 border_top">
                  <div class="col-sm-4">
                    <div class="row">
	                    {if $prod.web_image}
	                      <div class="col-xs-6">
	                        <img class="cart-image img img-responsive" src="{$prod.web_image|img_prefix}" alt="{$prod.name|replace:'& ':'&amp; '}"  />
	                      </div>
	                      <div class="col-xs-6">
	                    {else}
	                      <div class="col-sm-12">
	                    {/if}
	                    {$prod.name}
	                    <div>Item #: {$prod.sku}</div>
	                    {foreach from=$prod.gifts item=gift}
	                      {if $gift}
	                        <div>* {$gift}</div>
	                      {/if}
	                    {/foreach}
	                    {if $prod.note}
	                      <div>Note: {$prod.note}</div>
	                    {/if}
	                    {if $prod.att_list}
	                      <div>{$prod.att_list}</div>
	                    {/if}
	                    {if $prod.custom_form}
	                      <div>
	                        <a href="javascript:void(0);" onclick="javascript:window.open('/custom_form_info/{$prod.cart_id}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">View details</a>
	                      </div>
	                    {/if}
	                  </div>
	                </div>
                </div>
                <div class="">
                	<div class="col-xs-12 col-sm-3">
                    {assign var="pcat" value=$smarty.session.price_cat}
                    {if $prod.prices != ''}
                      {assign var="stndrd_price" value=$prod.prices.$pcat.standard_price}
                    {else}
                      {assign var="stndrd_price" value=$prod.price}
                    {/if}
                    {if $prod.is_reward == 'y'}
                      <div class="row">
                        <div class="col-xs-6 col-sm-3 col-md-2"><strong>Points: </strong></div> 
                        <div class="col-xs-3 col-sm-2 text-right">{$prod.reward_amount}</div>
                      </div>
                    {elseif $prod.build_parent != 'y'}
                      <div class="row">
                        <div class="col-xs-6 col-sm-3 col-md-2"><strong class="visible-xs">Unit Price: </strong></div>
                        <div class="col-xs-3 col-sm-2 text-right">
		                      {if $prod.prices != '' && $prod.prices.$pcat.standard_price != '' && $prod.is_donation != 'y'}
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
		                    </div>
		                  </div>
                    {/if}
                  </div>
                  <div class="col-xs-12 col-sm-2">
                    {if $prod.build_parent != 'y'}
                      <div class="row">
                        <div class="col-xs-6 col-sm-3 col-md-2"><strong class="visible-xs">Qty:</strong></div>
                        <div class="col-xs-3 col-sm-2 text-right">{$prod.qty}</div>
                      </div>
                    {else}
                      &nbsp;
                    {/if}
                  </div>
                  <div class="col-xs-12 col-sm-3">
	                  {if $prod.is_reward == 'y'}
	                    <div class="row">
	                      <div class="col-xs-6 col-sm-3 col-md-2"><strong>Points: </strong></div>
	                      <div class="col-xs-3 col-sm-2 text-right">{math equation="subpts * qty" subpts=$prod.reward_amount qty=$prod.qty}</div>
	                    </div>
	                  {else}
	                    <div class="row">
	                      <div class="col-xs-6 col-sm-3 col-md-2"><strong class="visible-xs">Total Price:</strong></div>
	                      <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$prod.price|commify}</div>
	                    </div>
	                  {/if}
	                </div>
                </div>
              </div>

                {if $prod.build_parent == 'y'}
                  {foreach from=$info.shipping.$num.prods item=pr}
                    <div class="row mar_btm">
                      {if $pr.build_prod_id && $pr.build_link == $prod.build_link}
                        <div class="col-sm-4">
                          {$pr.name}
                          {foreach from=$prod.gifts item=gift}
                            {if $gift}
                              <div>* {$gift}</div>
                            {/if}
                          {/foreach}
                          {if $pr.note}
                            <div>Note: {$pr.note}</div>
                          {/if}
                          {if $pr.att_list}
                            <div>{$pr.att_list}</div>
                          {/if}
                          {if $pr.custom_form}
                            <div><a href="javascript:void(0);" onclick="javascript:window.open('/custom_form_info/{$prod.cart_id}','popup','width=400,height=500,statusbar=no,toolbars=no,location=no,scrollbars=yes');">View details</a></div>
                          {/if}
                        </div>
                        <div class="col-xs-3">
                          <div class="col-xs-6 col-sm-3 col-md-2"><strong class="visible-xs">Unit Price:</strong></div>
                          <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{math equation="x / y" x=$pr.price y=$pr.qty format="%.2f"}</div>
                        </div>
                        <div class="row">
                          <div class="col-xs-6 col-sm-3 col-md-2"><strong class="visible-xs">Qty:</strong></div>
                          <div class="col-xs-3 col-sm-2 text-right">{$pr.qty}</div>
                        </div>
                        <div class="row">
                          <div class="col-xs-6 col-sm-3 col-md-2"><strong class="visible-xs">Total Price:</strong></div>
                          <div class="col-xs-3 col-sm-2 text-right">{$currency_type}{$pr.price|commify}</div>
                        </div>
                      {/if}
                    </div>
                  {/foreach}
                {/if}

                {if $prod.gift_wrap == 'y' && $prod.gift_wrap_info}
                  <div class="row mar_btm">
                    <div class="col-sm-4">
                      {$prod.gift_wrap_info.gift_wrap_name}
                      <div>Item #: {$prod.gift_wrap_info.gift_wrap_sku}</div>
                    </div>
                    <div class="col-xs-3">
                      <strong class="visible-xs">Unit Price:</strong>{$currency_type}{math equation="x / y" x=$prod.gift_wrap_info.total y=$prod.qty|commify}
                    </div>
                    <div class="col-xs-2">
                      <strong class="visible-xs">Qty:</strong>{$prod.qty}
                    </div>
                    <div class="col-xs-3"><strong class="visible-xs">Total Price:</strong>{$currency_type}{$prod.gift_wrap_info.totalformat="%.2f"}</div>
                  </div>
                {/if}
              {/if}
            {/foreach}
            </div>
            <div class="cart-totals panel-footer">
              {math assign="remaining_subtotal" equation="subtotal - own_box_subtotal" subtotal=$order.totals.$num.subtotal own_box_subtotal=$own_box_subtotal}
              <div class="row">
                <div class="col-xs-6 col-sm-3 col-md-2"><label>Subtotal:</label> </div>
                <div class="col-xs-3 col-sm-2 text-right"><span>{$currency_type}{$remaining_subtotal|commify}</span></div>
              </div>
              {if $order.totals.$num.giftwrap != 0}
                <div class="row">
                  <div class="col-xs-6 col-sm-3 col-md-2"><label>Giftwrap:</label></div> 
                  <div class="col-xs-3 col-sm-2 text-right"><span>{$currency_type}{$order.totals.$num.giftwrap|commify}</span></div>
                </div>
              {/if}
              {if $order.totals.$num.reward_total != 0}
                <div class="row">
                  <div class="col-xs-6 col-sm-3 col-md-2"><label>Reward Points Used:</label></div>
                  <div class="col-xs-3 col-sm-2 text-right"><span>{$order.totals.$num.reward_total}</span></div>
                </div>
              {/if}
              {math assign="remaining_shipping" equation="shipping - own_box_shipping" shipping=$order.totals.$num.shipping own_box_shipping=$own_box_shipping}
              <div class="row">
                <div class="col-xs-6 col-sm-3 col-md-2"><label>Shipping Rate:</label> </div>
                <div class="col-xs-3 col-sm-2 text-right"><span>{$currency_type}{$remaining_shipping|commify}</span></div>
              </div>
              {if $order.totals.$num.sgroupadd != 0}
                <div class="row">
                  <div class="col-xs-6 col-sm-3 col-md-2"><label>Additional Flat Shipping Rate:</label> </div>
                  <div class="col-xs-3 col-sm-2 text-right"><span>{$curreny_type}{$order.totals.$num.sgroupadd|commify}</span></div>
                </div>
              {/if}
              {foreach from=$order.totals.$num.totalpromo item=promo}
                {if $promo.type == '%'}
                  <div class="row">
                    <div class="col-xs-6 col-sm-3 col-md-2"><label>Promo Discount:</label> </div>
                    <div class="col-xs-3 col-sm-2 text-right"><span>- {$currency_type}{$promo.deduction}</span></div>
                  </div>
                {elseif $promo.type == '$'}
                  <div class="row">
                    <div class="col-xs-6 col-sm-3 col-md-2"><label>Promo Discount:</label></div> 
                    <div class="col-xs-3 col-sm-2 text-right"><span>- {$currency_type}{$promo.deduction}</span></div>
                  </div>
                {/if}
              {/foreach}
              {foreach from=$order.totals.$num.shippromo item=promo}
                {if $promo.type == '%'}
                  <div class="row">
                    <div class="col-xs-6 col-sm-3 col-md-2"><label>Shipping Promo:</label></div> 
                    <div class="col-xs-3 col-sm-2 text-right"><span>- {$currency_type}{$promo.deduction}</span></div>
                  </div>
                {elseif $promo.type == '$'}
                  <div class="row">
                    <div class="col-xs-6 col-sm-3 col-md-2"><label>Shipping Promo:</label> </div>
                    <div class="col-xs-3 col-sm-2 text-right"><span>- {$currency_type}{$promo.deduction}</span></div>
                  </div>
                {/if}
              {/foreach}
              {math assign="remaining_total" equation="total - own_box_shipping - own_box_subtotal" total=$order.totals.$num.total own_box_shipping=$own_box_shipping own_box_subtotal=$own_box_subtotal}
              <div class="row">
                <div class="col-xs-6 col-sm-3 col-md-2"><label><b>Total:</b></label></div>
                <div class="col-xs-3 col-sm-2 text-right"><span><b>{$currency_type}{$remaining_total|commify}</b></span></div>
              </div>
            </div>
          </div>

        {/if}{* END IF ALL PRODUCTS SHIP IN OWN BOX OR VENDOR BOX *}

        {counter assign="num" name="num"}
      {/section}

    <div class="buttons">
      <input type="hidden" name="to_email" value="{#form_orders_to#}" />
      <input type="hidden" name="from_email" value="{#form_orders_from#}" />
      <input type="hidden" name="paypal_express_checkout" value="{$settings.paypal_express_checkout}" />
      <div class="btn-continue mar_btm">
        <input type="submit" name="submit_edit" value="Edit Order" class="btn btn-default btn-md" />
      </div>
      <div class="btn-checkout mar_btm">
        <input type="submit" name="submit_continue" value="Place My Order" tabindex="1" class="btn btn-primary" />
      </div>
    </div>

  </form>
</div>
{include file="bronto_api.tpl"}
{include file="_bottom.tpl"}
