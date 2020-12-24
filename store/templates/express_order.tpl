{include file="_top.tpl"}

<h1>Express Order</h1>

<div class="express">
  <div class="mar_btm">
   {#express_order_text#}
  </div>

   <div class="mar_btm">

    <form method="post" action="index.php" name="checkout"> 
    <input type="hidden" name="action" value="ExpressOrder" />

    <fieldset class="order-item iefix mar_btm">
      <legend>Enter Item # and Qty</legend>
      <div class="row form-group">
        <div class="col-xs-1">&nbsp;</div>
        <div class="col-xs-6 col-sm-3"><label>Item #</label></div>
        <div class="col-xs-4 col-sm-2"><label>Qty</label></div>
      </div>
     {counter start=1 assign=num name=num}
     {section name=prods loop=10}
      <div class="row form-group">
        <div class="col-xs-1"><label>{$num}.</label></div>
        <div class="col-xs-6 col-sm-3">
          <input class="form-control" type="text" name="sku{$num}" value="{if isset($valid.sku.$num)}{$valid.sku.$num}{/if}" size="6" tabindex="{$num}" />
        </div>
        <div class="col-xs-4 col-sm-2">
          <input class="qty form-control"type="number" step="any" name="qty{$num}" value="{if isset($valid.qty.$num)}{$valid.qty.$num}{/if}" tabindex="{$num}" />
        </div>
      </div>
      {counter name=num}
     {/section}
    </fieldset>

    <div class="text-right">
      <div class="col-xs-11 col-sm-6">
        <input type="submit" name="submit" value="Add Items" class="btn btn-primary" />
      </div>
    </div>
    </form>

   </div>
</div>

{include file="_bottom.tpl"}