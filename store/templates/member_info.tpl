{include file="_top.tpl"}

<h1>Update Account Information</h1>

<div class="form-container col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
  
  {if $valid.return == '1'}
  <div class="errors">
    <p><em>There was an error.</em></p>
    <p>Please double-check any highlighted fields.</p>
    <p><em>{$error}</em></p>
  </div>
  {/if}

  <p class="legend"><strong>Note:</strong> * Indicates a required field</p>

<form method="post" action="index.php" role="form">
<input type="hidden" name="action" value="MemberInfo" />

<fieldset><legend>Contact Information</legend>
<div class="row">
<div class="col-xs-12 col-md-6">
<div class="form-group {if $valid.return and $valid.first_name == ''} error{/if}">
 <label for="first_name"><span class="req">*</span> First Name:</label>
 <input class="form-control" type="text" name="first_name" id="first_name" value="{$valid.first_name}" />
</div>
</div>
<div class="col-xs-12 col-md-6">
<div class="form-group {if $valid.return and $valid.last_name == ''} error{/if}">
 <label for="first_name"><span class="req">*</span> Last Name:</label>
 <input class="form-control" type="text" name="last_name" id="last_name" value="{$valid.last_name}" />
</div>
</div>

{* Comment this field out if you do not wish to use it. *}
<div class="col-xs-12 col-md-6">
<div class="form-group {if $valid.return && $valid.is_valid.birthdate == 'n'} error{/if}">
 <label>Birthdate:</label>
 <div class="nowrap form-inline">
  <select class="form-control" name="birth_month">
   {html_options options=$options.birthdate.month selected=$valid.birth_month}
  </select>
  <select class="form-control" name="birth_day">
   {html_options options=$options.birthdate.day selected=$valid.birth_day}
  </select>
  <select class="form-control" name="birth_year">
   {html_options options=$options.birthdate.year selected=$valid.birth_year}
  </select>
 </div>
</div>
</div>
<div class="col-xs-12 col-md-6">
<div class="form-group">
 <label for="title">Title:</label>
 <input class="form-control" type="text" id="title" name="title" value="{$valid.title}" />
</div>
</div>
<div class="col-xs-12 col-md-6">
<div class="form-group">
 <label for="company">Company:</label>
 <input class="form-control" type="text" name="company" id="company" value="{$valid.company}" />
</div>
</div>
<div class="col-xs-12 col-md-6">
<div class="form-group"{if $valid.return and $valid.billing_address1 == ''} error{/if}">
 <label for="billing_address1"><span class="req">*</span> Billing Address:</label>
 <input class="form-control" type="text" name="billing_address1" id="billing_address1" value="{$valid.billing_address1}" />
</div>
</div>
<div class="col-xs-12 col-md-6">
<div class="form-group">
 <label for="billing_address2"></label>
 <input class="form-control" type="text" name="billing_address2" id="billing_address2" value="{$valid.billing_address2}" />
</div>
</div>
<div class="col-xs-12 col-md-6">
<div class="form-group {if $valid.return and !$valid.billing_city} error{/if}">
  <label for='billing_city'><span class="req">*</span> City:</label>
  <input class="form-control" type="text" name="billing_city" id="billing_city" value="{$valid.billing_city}" maxlength="50" />
</div>
</div>
<div class="col-xs-12 col-md-6">
<div class="form-group {if $valid.return and !$valid.billing_country} error{/if}">
  <label for="billing_country"><span class="req">*</span> Country:</label>
  <select class="form-control" name="billing_country" id="billing_country">
   {html_options options=$options.country selected=$valid.billing_country}
  </select>
</div>
    </div>
<div class="col-xs-12 col-md-6">
<div class="form-group {if $valid.return and !$valid.billing_state} error{/if}">
  <label><span class="req">*</span> State/Province:</label>
  <select class="form-control" name="billing_state" id="billing_state">
   {html_options options=$options.usstate selected=$valid.billing_state}
  </select>
  <select class="form-control" id='ca_province'>
    {html_options options=$ca_provinces selected=$valid.billing_state}
  </select>
  <input class="form-control" type='text' id="billing_province" value="{$valid.billing_state}" />
</div>
</div>
<div class="col-xs-12 col-md-6">
<div class="form-group {if $valid.return and !$valid.billing_zip} error{/if}">
  <label for="billing_zip"><span class="req">*</span> Postal Code:</label>
  <input class="form-control" type="text" name="billing_zip" id="billing_zip" value="{$valid.billing_zip}" maxlength="30" />
</div>
</div>
<div class="col-xs-12 col-md-6">
<div class="form-group {if $valid.return and $valid.email == ''} error{/if}">
 <label for="email"><span class="req">*</span> Email Address:</label>
 <input class="form-control" type="email" name="email" id="email" value="{$valid.email}" />
</div>
</div>
<div class="col-xs-12 col-md-6">
<div class="form-group {if $valid.return and $valid.phone == ''} error{/if}">
 <label for="phone"><span class="req">*</span> Phone Number:</label>
 <input class="form-control" type="tel" name="phone" id="phone" value="{$valid.phone}" />
</div>
</div>
<div class="col-xs-12 col-md-6">
<div class="controlset form-group">
 <label for="opt_out">I would like to receive email updates.</label>
   <div class="radio">
      <label><input type="radio" name="opt_out" value="n"{if $valid.opt_out != 'checked'} checked="checked"{/if}> Yes</label>
      <label><input type="radio" name="opt_out" value="y"{if $valid.opt_out == 'checked'} checked="checked"{/if}> No</label>
   </div>
</div>
</div>
</div>
</fieldset>

<div class="buttonrow">
 <input type="submit" name="submit" value="Update" class="button medium style1 btn btn-default" />
</div>

</form>

</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
   {include file="member_links.tpl"}
</div>
{include file="_bottom.tpl"}