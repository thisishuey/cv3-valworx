{include file="_wholesaletop.tpl"}

<form method="post" action="index.php" name="checkout">
<input type="hidden" name="action" value="WholesaleOrder3">

<div class="confirmation">
<h1>Order Confirmation</h1>
<h2>Shipping Information</h2>

<div class="mar_btm">
  <h3>Shipping Address:</h3>
  {$ship_info.ship_attn}<br />
  {$ship_info.address1}<br />
  {if $ship_info.address2 != ''}
    {$ship_info.address2}<br />
  {/if}
  {$ship_info.city}, {$ship_info.state} {$ship_info.zip}<br />
  {$ship_info.country}
</div>

<div class="">
  <strong>Buyer Name: </strong> {$values.buyer_name}<br />
  <strong>Shipping Method: </strong>{$values.ship_method}<br />
  <strong>Ship Date: </strong>{$values.ship_date}<br />
  <strong>Shipping Address Alias: </strong>{$ship_info.alias}<br />
  <strong>Comments or Special Instructions:</strong><br />{$values.comments}
</div>

<h3>Your Order</h3>
<div class="row">
<div class="col-xs-12 col-sm-8 col-lg-6">
<div class="panel panel-default mar_btm">
  <div class="panel-body">
    <div class="row lead">
      <div class="col-xs-3">Item No.</div>
      <div class="col-xs-4">Product Name</div>
      <div class="col-xs-2 text-right">Qty</div>
      <div class="col-xs-3 text-right">Unit Price</div>
    </div>


{foreach from=$cart key=key item=product}
{foreach from=$product item=prod}
<div class="row mar_btm">
  <div class="col-xs-3">{$prod.sku}</div>
  <div class="col-xs-4">{$prod.name}{if $prod.prodpak_items != ''}&nbsp;({$prod.prodpak_items}){/if}</div>
  <div class="col-xs-2 text-right">{$prod.qty}</div>
  <div class="col-xs-3 text-right">{$currency_type}{$prod.price|commify}{math equation="(x*y)+z" x=$prod.qty y=$prod.price z=$total assign=total}</div>
</div>
{/foreach}
{/foreach}
</div>
</div>
</div>
</div>

<div class="row mar_btm">
  <div class="col-xs-12 col-sm-4 col-lg-3">
    <div class="row">
      <div class="col-xs-6"><strong>Sub Total:</strong></div><div class="col-sm-6">{$currency_type}{$totals.price|commify}</div>
      <div class="col-xs-6"><strong>Tax Total:</strong></div><div class="col-sm-6">{$currency_type}{$totals.tax}</div>
      <div class="col-xs-6"><strong>Shipping Total:</strong></div><div class="col-sm-6">{$currency_type}{$totals.ship}</div>
      <div class="col-xs-6"><strong>Grand Total:</strong></div><div class="col-sm-6">{$currency_type}{$totals.grand|commify}</div>
    </div>
  </div>
</div>

<div class="">
  <input type="submit" name="submit" value="Edit Order" class="btn btn-default">
  <input type="hidden" name="payment_type" value="{$payment_type}">
  {* change complete order button name to submit_x if using an image *}
  <input type="submit" name="submit" value="Complete Order" class="btn btn-primary">
</div>

</div>

</form>

{*
<form method="post" action="index.php" name="checkout"> 
<input type="hidden" name="action" value="WholesaleOrder3">
<table width="80%"  border="0" cellspacing="0" cellpadding="3" align="center">
   <tr id="wholesaleHeaderText">
       <td align="center" colspan="2">
            Shipping Information
         </td>
    </tr>
   <tr class="normaltext">
       <td align="left" valign="top" width="50%">
          Shipping Address:<br />
          {$ship_info.ship_attn}<br />
          {$ship_info.address1}<br />
          {if $ship_info.address2 != ''}
            {$ship_info.address2}<br />
          {/if}
          {$ship_info.city}, {$ship_info.state} {$ship_info.zip}<br />
          {$ship_info.country}
       </td>
       <td align="left" valign="top" width="50%">
          Buyer Name: {$values.buyer_name}<br />     
          Shipping Method: {$values.ship_method}<br />     
          Ship Date: {$values.ship_date}<br />     
          Shipping Address Alias: {$ship_info.alias}<br />
          Comments or Special Instructions:<br />{$values.comments}
       </td>
    </tr>
    <tr>
       <td colspan="2" align="center">
<table width="100%"  border="0" cellspacing="0" cellpadding="3" align="center">
   <tr id="wholesaleHeaderText">
       <td align="center" colspan="4">
            Your Order 
         </td>
    </tr>
   <tr id="wholesaleCategoryRow">
      <td width="15%" align="center">
         Item No. 
      </td>
      <td width="60%" align="center">
         Product Name 
      </td>
      <td width="10%" align="center">
         Qty 
      </td>
      <td width="15%" align="center">
         Unit Price
      </td>
   </tr>
   {assign var="total" value="0"}
    {foreach from=$cart key=key item=product}
       {foreach from=$product item=prod}
      <tr id="wholesaleProdParentRow" style="color:black;background:white;">
         <td align="center">
            {$prod.sku} 
         </td>
         <td align="center">
            {$prod.name}
                {if $prod.prodpak_items != ''}&nbsp;({$prod.prodpak_items}){/if} 
         </td>
         <td align="center">
            {$prod.qty} 
         </td>
         <td align="center">
            {$currency_type}{$prod.price|commify} 
                  {math equation="(x*y)+z" x=$prod.qty y=$prod.price z=$total assign=total}
         </td>
      </tr>
         {/foreach}
    {/foreach}
   <tr id="wholesaleProdParentRow" style="color:black;background:white;border-top:1px solid black;">
      <td colspan="4" align="right">
          Sub Total:&nbsp;&nbsp;{$currency_type}{$totals.price|commify}<br>
          Tax Total:&nbsp;&nbsp;{$currency_type}{$totals.tax}<br> 
          Shipping Total:&nbsp;&nbsp;{$currency_type}{$totals.ship}<br> 
          Grand Total:&nbsp;&nbsp;{$currency_type}{$totals.grand|commify} 
       </td>
   </tr>
</table>
      </td>
   </tr>
   <tr id="wholesaleText">
       <td align="right" colspan="2">
            &nbsp;
         </td>
    </tr>
   <tr id="wholesaleText">
       <td align="center" colspan="2">
          <input type="submit" name="submit" value="Edit Order" class="addtocart_btn btnstyle1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="hidden" name="payment_type" value="{$payment_type}">
          <input type="submit" name="submit" value="Complete Order" class="addtocart_btn btnstyle1">

         </td>
    </tr>
   <tr id="wholesaleText">
       <td align="center" colspan="2">
            &nbsp;
         </td>
    </tr>
</table>
</form>
*}
{include file="_wholesalebottom.tpl"}
