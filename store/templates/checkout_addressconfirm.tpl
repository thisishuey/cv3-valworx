{include file="_top.tpl"}

{if $addresses|@count > 0}
<h1>Address Confirmation for Recipient {$recipient}</h1>

<div class="mar_btm"><span class="normaltext">The address you entered for Recipient {$recipient} returned multiple matches or was incorrect.  Please select the correct address below.</span></div>
{else}
<h1>Address Confirmation</h1>
{/if}

<div class="form-container">

{if $error != ''}
  <div class="normaltext alert alert-danger"><b>{$error}</b></div>
{/if}

<form method="post" action="index.php">
<input type="hidden" name="action" value="AddressConfirm" />
<input type="hidden" name="recipient" value="{if $addresses|@count > 0}{$recipient}{else}0{/if}" />

<fieldset class="mar_btm">
 <legend>Address Matches</legend>

 {if $addresses|@count > 0}
  {foreach from=$addresses.$recipient item="address" key="key"}
   {if $key != "default" || $key == "0"}
    <div class="controlset radio">
      <label><input type="radio" name="address" value="1" /><b>Use this address.</b></label>
    </div>
    <div>
     <label>&nbsp;</label>{$address.s_firstname} {$address.s_lastname}<br />
     <label>&nbsp;</label>{$address.s_address1}<br /> {* street address *}
     {if $address.s_address2 != ''}<label>&nbsp;</label>{$address.s_address2}<br />{/if} {* apt/ste/etc *}
     <label>&nbsp;</label>{$address.s_city}, {$address.s_state} {$address.s_zip}<br /> {* city, state zip *}
    </div>
   {/if}
  {/foreach}
  {assign var="default" value=$addresses.$recipient.default}
  <div class="controlset radio">
      <label><input type="radio" name="address" value="0" /> <b>Keep the address I entered.</b></label>
  </div>
  <div>
  <label>&nbsp;</label>{$default.s_firstname} {$default.s_lastname}<br />
  <label>&nbsp;</label>{$default.s_address1}<br /> {* street address *}
  {if $default.s_address2 != ''}
    <label>&nbsp;</label>{$default.s_address2}<br />
  {/if} {* apt/ste/etc *}
  <label>&nbsp;</label>
  {$default.s_city}, {$default.s_state} {$default.s_zip}<br /> {* city, state zip *}
  </div>
 {else}
  <div>
   <input type="button" value="&lt; Go Back" class="btn btn-default" onclick="javascript: window.location.replace('checkout_shipping{if $settings.checkout_type == '3'}info{elseif $settings.checkout_type == '1'}address{/if}');" />
  </div>
 {/if}

</fieldset>

<div>
 <input type="submit" name="submit" value="Continue &gt;" class="btn btn-primary" />
</div>

</form>

</div>

{include file="_bottom.tpl"}
