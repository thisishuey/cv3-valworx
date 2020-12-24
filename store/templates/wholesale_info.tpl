{include file="_wholesaletop.tpl"}

<h1>Update Account Information</h1>

{if $valid.return == '1'}
 <div class="errors">
  <p><em>There was an error.</em></p>
  <p>Please double-check any highlighted fields.</p>
  <p><em>{$error}</em></p>
 </div>
{/if}

<form method="post" action="index.php"> 
<input type="hidden" name="action" value="WholesaleInfo">

<div class="row">

<div class="col-sm-4">
  <div class="form-group {if $valid.return and !$valid.contact_first_name} error{/if}">
    <label class="control-label" for="contact_first_name"> First name:</label>
    <input type="text" name="contact_first_name" value="{$valid.contact_first_name}" class="form-control" />
  </div>
</div>

<div class="col-sm-4">
  <div class="form-group {if $valid.return and !$valid.contact_last_name} error{/if}">
    <label class="control-label" for="contact_last_name"> Last name:</label>
    <input type="text" name="contact_last_name" value="{$valid.contact_last_name}" class="form-control" />
  </div>
</div>

<div class="col-sm-4">
  <div class="form-group">
    <label class="control-label" for="company_name">Company:</label>
    <input class="form-control" type="text" name="company_name" id="company_name" value="{$valid.company_name}" />
  </div>
</div>

<div class="col-sm-4">
  <div class="form-group {if $valid.return and !$valid.billing_address1} error{/if}">
    <label class="control-label" for="billing_address1"><span class="req">*</span> Billing Address:</label>
    <input class="form-control" type="text" id="billing_address1" name="billing_address1" value="{$valid.billing_address1}" />
  </div>
</div>

<div class="col-sm-4">
  <div class="form-group">
    <label class="control-label"><span class="label">&nbsp;</span></label>
    <input class="form-control" type="text" name="billing_address2" value="{$valid.billing_address2}" />
  </div>
</div>

<div class="col-sm-4">
  <div class="form-group {if $valid.return and !$valid.billing_city} error{/if}">
    <label class="control-label" for="billing_city"><span class="req">*</span> City:</label>
    <input class="form-control" type="text" name="billing_city" id="billing_city" value="{$valid.billing_city}" />
  </div>
</div>

<div class="col-sm-4">
  <div class="form-group {if $valid.return and !$valid.billing_country}error{/if}">
    <label class="control-label" for="billing_country"><span class="req">*</span> Country:</label>
    <select class="form-control" name="billing_country" id="billing_country">
     {html_options options=$options.country selected=$valid.billing_country}
    </select>
  </div>
</div>

<div class="col-sm-4">
  <div class="form-group {if $valid.return and !$valid.billing_state} error{/if}">
    <label class="control-label"><span class="req">*</span> State/ Province:</label>
    <select class="form-control" name="billing_state" id="billing_state">
     {html_options options=$options.state selected=$valid.billing_state}
    </select>
    <select class="form-control" id='ca_province'>
      {html_options options=$ca_provinces selected=$valid.billing_state}
    </select>
    <input class="form-control" type='text' id="billing_province" value="{$valid.billing_state}" />
  </div>
</div>

<div class="col-sm-4">
  <div class="form-group {if $valid.return and !$valid.billing_zip} error{/if}">
    <label class="control-label" for="billing_zip"><span class="req">*</span> Postal Code:</label>
    <input class="form-control" type="text" name="billing_zip" id="billing_zip" value="{$valid.billing_zip}" />
  </div>
</div>

<div class="col-sm-4">
  <div class="form-group {if $valid.return and !$valid.phone} error{/if}">
    <label class="control-label" for='phone'><span class="req">*</span> Phone Number:</label>
    <input class="form-control" type="tel" name="phone" id="phone" value="{$valid.phone}" />
  </div>
</div>

<div class="col-sm-4">
  <div class="form-group {if $valid.return and !$valid.fax} error{/if}">
    <label class="control-label" for="fax"><span class="req">*</span> Fax:</label>
    <input class="form-control" type="tel" name="fax" id="fax" value="{$valid.fax}" />
  </div>
</div>

</div>

<div class="buttonrow">
  <input type="submit" name="submit" value="Update" class="btn btn-primary">
</div>

</form>

{include file="_wholesalebottom.tpl"}