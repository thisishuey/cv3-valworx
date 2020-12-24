{include file="_wholesaletop.tpl"}

{if $error}<div align="center" class="normaltext" style="color:#FF0000;"><b>{$error}</b></div><br>{/if}

<form method="post" action="index.php" name="checkout"> 
<input type="hidden" name="action" value="WholesaleOrder2">


<div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
  <section>
    <div class="nopad">
      Buyer(Your) Name:&nbsp;{if $ws_valid.buyer_name == ''}*{/if}
      <input type="text" name="buyer_name" value="{$ws_valid.buyer_name|stripslashes}" size="25">
    </div>
    <div class="nopad">
      Requested Ship Date (yyyy-mm-dd):&nbsp;{if $ws_valid.ship_date == ''}*{/if}
      <input type="text" name="ship_date" value="{$ws_valid.ship_date}" size="10">
    </div>
    <div class="nopad">
      Shipping Address:&nbsp;
      <select name="ship_addy">
        {html_options options=$options.ship_addy}
      </select>
      <a href="/wholesale_address">Add/Edit Addresses</a>
    </div>
    {if $options.shipping.count > 1}
    <div class="nopad">
      Ship Method:&nbsp;
      <select name="ship_method">
        {html_options options=$options.shipping.method selected=$ws_valid.ship_method}
      </select>
    </div>
    {else}
        <input type="hidden" name="ship_method" value="{$options.shipping.name}">
    {/if}
    <div class="nopad">
      Comments or Special Instructions:
        <textarea name="comments" class="formtext" cols="25" rows="5" wrap="virtual">{$ws_valid.comments}</textarea>
    </div>
    {if $payment_type == 'po_number'}
    <div class="nopad">
      P.O. Number:&nbsp;{if $ws_valid.po_number == ''}*{/if}
      <input type="text" name="po_number" value="{$ws_valid.po_number}" size="25">
    </div>
    {elseif $payment_type == 'credit_card'}
      You are approved to pay by Credit Card:
      <div class="nopad">
        Name on Card:&nbsp;{if $ws_valid.cc_name == ''}*{/if}
        <input type="text" name="cc_name" value="{$ws_valid.cc_name}" size="25">
      </div>
      <div class="nopad">
        Card Type:&nbsp;{if $ws_valid.cc_type == ''}*{/if}
        <select name="cc_type">
          {html_options options=$options.cctype selected=$ws_valid.cc_type}
        </select>
      </div>
      <div class="nopad">
        Card Number:&nbsp;{if $ws_valid.cc_num == ''}*{/if}
        <input type="text" name="cc_num" size="25">
      </div>
{* CVV2 is an optional field, in order to make it required set the hidden field cvv2_req = y.  If you do not want to include this field you may delete it from the template *}
 {* 
 CVV2:&nbsp;*
 <input type="text" name="cvv2" size="4" maxlength="4">
 <input type="hidden" name="req_cvv2" value="y">
 *}
{* End CVV2 *}
      <div class="nopad">
        Card Expiration Date:&nbsp;{if $ws_valid.ccexpm == '' || $ws_valid.ccexpy == ''}*{/if}
        <select name="cc_exp_month">
            {html_options options=$options.ccexpm}
         </select>
         <select name="cc_exp_year">
            {html_options options=$options.ccexpy}
         </select>
      </div>
    {/if}
    <input type="hidden" name="payment_type" value="{$payment_type}">
    <input type="submit" name="submit" value="Continue" class="button medium style1 btn btn-default">
  </section>
</div>
</form>

<div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
  <h2>Your Order:</h2>

  <table class="table table-striped">
   <thead>
   <tr>
      <th>Item #</th>
      <th>Description</th>
      <th>Qty</th>
      <th>{if $order.recipient_order != 'y'}Price{else}&nbsp;{/if}</th>
  </tr>
  </thead>
  <tbody>
  {foreach from=$cart key=key item=prod}
  {foreach from=$prod item=product}
  <tr>
     <td>{$product.sku}</td>
     <td>{$product.name}{if $prod.prodpak != ''}{$prod.prodpak}{/if}</td>
     <td>{$product.qty}</td>
     <td>{if $product.build_parent != 'y' && $order.recipient_order != 'y'}{$currency_type}{$product.price|commify}{/if}</td>
  </tr>
  {/foreach}
  {/foreach}
  </tbody>
  </table>
</div>

{include file="_wholesalebottom.tpl"}
