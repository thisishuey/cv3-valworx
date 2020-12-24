{include file="_top.tpl"}

<h1>{if !isset($valid.uship_id) || $valid.uship_id == ''}Add{else}Edit{/if} Shipping Address</h1>

<div class='form-container col-sm-8 col-sm-push-4 col-md-9 col-md-push-3'>

{if $valid.return == '1'}
 <div class="errors">
  <p><em>There was an error.</em></p>
  <p>Please double-check any highlighted fields.</p>
  <p><em>{$error}</em></p>
 </div>
{/if}

<p class="legend"><strong>Note:</strong> * Indicates a required field</p>

<form method="post" action="index.php" id='address_edit' role="form"> 
<input type="hidden" name="action" value="MemberAddress" />
<input type="hidden" name="uship_id" value="{$valid.uship_id}" />

<fieldset><legend>Address &amp; Contact Information</legend>

<div class="form-group {if $valid.return and !$valid.alias} error{/if}">
  <label for='alias'><span class="req">*</span> Shipping Alias:</label>
  <input class="form-control" type="text" id="alias" name="alias" value="{$valid.alias}"  />
</div>
  
<div class="form-group {if $valid.return and !$valid.ship_name} error{/if}">
  <label for='ship_name'><span class="req">*</span> First Name:</label>
  <input class="form-control" type="text" id="ship_name" name="ship_name" value="{$valid.ship_name}" />
</div>
  
<div class="form-group {if $valid.return and !$valid.ship_lastname} error{/if}">
  <label for='ship_lastname'><span class="req">*</span> Last Name:</label>
  <input class="form-control" type="text" id="ship_lastname" name="ship_lastname" value="{$valid.ship_lastname}" />
</div>
  
<div class="form-group">
  <label for='title'>Title:</label>
  <input class="form-control" type="text" id="title" name="title" value="{$valid.title}" />
</div>
  
<div class="form-group">
  <label for='company'>Company:</label>
  <input class="form-control" type="text" id="company" name="company" value="{$valid.company}" />
</div>

<div{if $valid.return and !$valid.address1} class='error'{/if}>
  <label for='address1'><span class="req">*</span> Address:</label>
  <input class="form-control" type="text" name="address1" id="address1" value="{$valid.address1}" />
</div>

<div class="form-group">
  <label for='address2'>&nbsp;</label>
  <input class="form-control" type="text" name="address2" value="{$valid.address2}" />
</div>

    <div class="form-group {if $valid.return and $valid.city == ''} error{/if}">
      <label for="city"><span class="req">*</span> City:</label>
      <input class="form-control" type="text" name="city" id="city" value="{$valid.city}" maxlength="50" />
    </div>

    <div class="form-group {if $valid.return and !$valid.country} error{/if}">
      <label for="country"><span class="req">*</span> Country:</label>
      <select class="form-control" name="country" id="country">
       {html_options options=$options.country selected=$valid.country}
      </select>
    </div>
    
    <div class="form-group {if $valid.return and !$valid.state} error{/if}">
      <label for="state"><span class="req">*</span> State/Province:</label>
      <select class="form-control" name="state" id="state">
       {html_options options=$options.usstate selected=$valid.state}
      </select>
      <select class="form-control" id='ca_province'>
        {html_options options=$ca_provinces selected=$valid.state}
      </select>
      <input class="form-control" type='text' id="province" value="{$valid.state}" />
    </div>

    <div class="form-group {if $valid.return and !$valid.zip} error{/if}">
      <label for="zip"><span class="req">*</span> Postal Code:</label>
      <input class="form-control" type="text" name="zip" id="zip" value="{$valid.zip}" />
    </div>

<div class="form-group">
  <label for='ship_phone'>Ship Phone:</label>
  <input class="form-control" type="tel" id="ship_phone" name="ship_phone" value="{$valid.ship_phone}" />
</div>

</fieldset>

<div class="buttonrow">
  <input type="submit" name="submit" value="Submit" class="button medium style2 btn btn-default" />
</div>

</form>

</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
   {include file="member_links.tpl"}
</div>
{include file="_bottom.tpl"}