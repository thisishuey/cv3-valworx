{include file="_wholesaletop.tpl"}

<h1>Wholesale Shipping Address Book</h1>

<div class="form-container">
<form class="form-horizontal" method="post" action="index.php">
<input type="hidden" name="action" value="WholesaleAlias">
 
<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='aliases'> Edit:</label>
  <div class="col-xs-8 col-md-10">
    <select name="aliases" onchange="javascript:submit();" class="formtext">
      {html_options options=$options.alias selected=$valid.uship_id}
    </select>
  </div>
</div>
</form>

 <form class="form-horizontal" method="post" action="index.php">
 <input type="hidden" name="action" value="WholesaleAddress">

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2" for='alias'> Alias:</label>
  <div class="col-xs-8 col-md-10">
      <input type="text" name="alias" value="{$valid.alias}" size="20" maxlength="30" class="formtext">
  </div>
</div>

<div class="form-group {if $valid.return and $valid.is_valid.ship_attn == 'n'} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='ship_attn'> Shipping Attention:</label>
  <div class="col-xs-8 col-md-10">
      <input type="text" name="ship_attn" value="{$valid.ship_attn}" size="20" maxlength="30" class="formtext">
  </div>
</div>

<div class="form-group {if $valid.return and $valid.is_valid.address1 == 'n'} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='billing_address1'><span class="req">*</span> Billing Address:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" id="billing_address1" name="address1" value="{$valid.address1}" />
  </div>
</div>

<div class="form-group">
  <label class="control-label col-xs-4 col-md-2"><span class="label">&nbsp;</span></label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="address2" value="{$valid.address2}" />
  </div>
</div>

<div class="form-group {if $valid.return and $valid.is_valid.city == 'n'} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for='city'><span class="req">*</span> City:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="city" id="billing_city" value="{$valid.billing_city}" />
  </div>
</div>

<div class="form-group {if $valid.return and !$valid.is_valid.country == 'n'}error{/if}">
  <label class="control-label col-xs-4 col-md-2" for="country"><span class="req">*</span> Country:</label>
  <div class="col-xs-8 col-md-10">
  <select class="form-control" name="country" id="billing_country">
   {html_options options=$options.country selected=$valid.country}
  </select>
  </div>
</div>

<div class="form-group {if $valid.return and $valid.is_valid.billing_state == 'n'} error{/if}">
  <label class="control-label col-xs-4 col-md-2"><span class="req">*</span> State/ Province:</label>
  <div class="col-xs-8 col-md-10">
  <select class="form-control" name="state" id="billing_state">
   {html_options options=$options.state selected=$valid.state}
  </select>
  </div>
  <div class="col-xs-8 col-md-10">
  <select class="form-control" id='ca_province'>
    {html_options options=$ca_provinces selected=$valid.state}
  </select>
  </div>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type='text' id="billing_province" value="{$valid.state}" />
  </div>
</div>

<div class="form-group {if $valid.return and $valid.is_valid.zip == 'n'} error{/if}">
  <label class="control-label col-xs-4 col-md-2" for="zip"><span class="req">*</span> Postal Code:</label>
  <div class="col-xs-8 col-md-10">
  <input class="form-control" type="text" name="zip" id="billing_zip" value="{$valid.billing_zip}" />
  </div>
</div>

<input type="hidden" name="uship_id" value="{$valid.uship_id}">
<input type="submit" name="submit" value="Submit" class="button medium style1 btn btn-default">
</div>
</form>

{include file="_wholesalebottom.tpl"}
