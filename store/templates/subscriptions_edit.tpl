{include file="_top.tpl"}

<h1>Update Subscription Information</h1>

<div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
<form method="post" action="index.php" role="form"> 
<input type="hidden" name="action" value="SubscriptionsEdit" />
<div>
   <p class="lead"><span class="req">*</span> Indicates a required field</p>

   {if $valid.return == "1"}
      <div align="center" class="normaltext"><b>There has been an error. Please double check any fields that show an '<font color="#ff0000">X</font>'</b></div>
   {/if}
</div>
  <div class="form-group">
      <label for="billing_first_name"><font color="#ff0000">*</font> Billing First Name:</label>
      <input class="form-control" type="text" name="billing_first_name" id="billing_first_name" value="{$valid.billing_first_name}"/>{if $valid.return and  $valid.billing_first_name == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </div>
  <div class="form-group">
    <label for="billing_last_name"><font color="#ff0000">*</font> Billing Last Name:</label>
    <input class="form-control" type="text" name="billing_last_name" id="billing_last_name" value="{$valid.billing_last_name}"/>{if $valid.return and  $valid.billing_last_name == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </div>
  <div class="form-group">
    <label for="billing_title">Billing Title:</label>
    <input class="form-control" type="text" name="billing_title" id="billing_title" value="{$valid.billing_title}"/>
  </div>
  <div class="form-group">
    <label for="billing_company">Billing Company</label>
      <input class="form-control "type="text" name="billing_company" id="billing_company" value="{$valid.billing_company}"/>
  </div>
  <div class="form-group">
    <label for="billing_address1"><font color="#ff0000">*</font> Billing Address:</label>
      <input class="form-control" type="text" name="billing_address1" id="billing_address1" value="{$valid.billing_address1}" />{if $valid.return and  $valid.billing_address1 == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </div>
  <div class="form-group">
    <label class="sr-only" for="billing_address2">Billing Address 2:</label>
      <input class="form-control" type="text" name="billing_address2" id="billing_address2" value="{$valid.billing_address2}"/>
  </div>
  <div class="form-group">
    <label for="billing_city"><font color="#ff0000">*</font> Billing City:</label>
    <input class="form-control" type="text" name="billing_city" id="billing_city" value="{$valid.billing_city}"/>{if $valid.return and  $valid.billing_city == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </div>

{if $uk != 'y'}

  <div class="form-group">
    <label for="billing_state"><font color="#ff0000">*</font> Billing State/Province:</label>
    <select class="form-control" name="billing_state" id="billing_state">
        {html_options options=$options.state selected=$valid.billing_state}
      </select>
  </div>
  <div class="form-group">
    <label for="billing_zip"><font color="#ff0000">*</font> Billing Postal Code:</label>
    <input class="form-control" type="text" name="billing_zip" id="billing_zip" value="{$valid.billing_zip}"/>{if $valid.return and  $valid.billing_zip == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </div>
  <div class="form-group">
    <label for="billing_country"><font color="#ff0000">*</font> Billing Country:</label>
    <select class="form-control" name="billing_country" id="billing_country">
        {html_options options=$options.country selected=$valid.billing_country}
      </select>
  </div>

{else}
{* for uk *}
  <div class="form-group">
      <label for="shipping_type2"><font color="#CC0000">*</font> Shipping Type:</label>
      <div>
        <label class="radio-inline"><input type="radio" name="shipping_type2" id="shipType2d" value="dom" onmouseup="javascript: setShipType(this,'billing','2'); condHideFormDiv();
          addFormControls();" /> Domestic (U.S.A.)</label>
        <label class="radio-inline"><input type="radio" name="shipping_type2" id="shipType1i" value="int" onmouseup="javascript: setShipType(this,'billing','2'); condHideFormDiv();
          addFormControls();" /> International</label>
      </div>
  </div>
  <div class="form-group">
    <label for="sStateField2" id="stateCaption2">{*added by cart.js*}</label>
    <div id="stateField2">{*select or input added by cart.js*}</div>
  </div>
  <div id="cond_hide2" class="form-group">
    <label for="sCountryField2" id="countryCaption2">{*added by cart.js*}</label>
    <div id="countryField2">{*select added by cart.js*}</div>
  </div>
  <div class="form-group">
    <label for="sZipField2" class="normaltext" id="zipCaption2">{*added by cart.js*}</label>
    <div id="zipField2">{*input added by cart.js*}</div>
  </div>
  {if $valid.billing_country == 'United States'}
   <script type="text/javascript">
     var item = document.getElementById('shipType2d');
     setShipType(item,'billing','2','{$valid.billing_country}','{$valid.billing_state}','{$valid.billing_zip}');
   </script>
  {elseif $valid.return || $valid.billing_country != ''}
   <script type="text/javascript">
     var item = document.getElementById('shipType2i');
     setShipType(item,'billing','2','{$valid.billing_country}','{$valid.billing_state}','{$valid.billing_zip}');
   </script>
  {/if}
{/if}

  <div class="form-group">
    <label for="email"><font color="#ff0000">*</font> Email Address:</label>
    <input class="form-control" type="text" name="email" id="email" value="{$valid.email}"/>{if $valid.return and  $valid.email == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </div>
  <div class="form-group">
    <label for="billing_phone"><font color="#ff0000">*</font> Phone Number:</label>
    <input class="form-control" type="text" name="billing_phone" id="billing_phone" value="{$valid.billing_phone}"/>{if $valid.return and  $valid.billing_phone == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </div>
  <div class="form-group">
    <label for="shipping_first_name"><font color="#ff0000">*</font> Shipping First Name:</label>
    <input class="form-control" type="text" name="shipping_first_name" id="shipping_first_name" value="{$valid.shipping_first_name}"/>{if $valid.return and  $valid.shipping_first_name == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </div>
  <div class="form-group">
    <label for="shipping_last_name"><font color="#ff0000">*</font> Shipping Last Name:</label>
    <input class="form-control" type="text" name="shipping_last_name" id="shipping_last_name" value="{$valid.shipping_last_name}"/>{if $valid.return and  $valid.shipping_last_name == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </div>
  <div class="form-group">
    <label for="shipping_title">Shipping Title:</label>
    <input class="form-control" type="text" name="shipping_title" id="shipping_title" value="{$valid.shipping_title}"/>
  </div>
  <div class="form-group">
    <label for="shipping_company">Shipping Company:</label>
    <input class="form-control" type="text" name="shipping_company" id="shipping_company" value="{$valid.shipping_company}"/>
  </div>
  <div class="form-group">
    <label for="shipping_address1"><font color="#ff0000">*</font> Shipping Address:</label>
    <input class="form-control" type="text" name="shipping_address1" value="{$valid.shipping_address1}"/>{if $valid.return and  $valid.shipping_address1 == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </div>
  <div class="form-group">
    <label class="sr-only" for="shipping_address2">Shipping Address 2:</label>
    <input class="form-control" type="text" name="shipping_address2" id="shipping_address2" value="{$valid.shipping_address2}"/>
  </div>
  <div class="form-group">
    <label for="shipping_city"><font color="#ff0000">*</font> Shipping City:</label>
    <input class="form-control" type="text" name="shipping_city" id="shipping_city" value="{$valid.shipping_city}"/>{if $valid.return and  $valid.shipping_city == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </div>

{if $uk != 'y'}

  <div class="form-group">
    <label for="shipping_state"><font color="#ff0000">*</font> Shipping State/Province:</label>
    <select class="form-control" name="shipping_state" id="shipping_state">
        {html_options options=$options.state selected=$valid.shipping_state}
      </select>
  </div>
  <div class="form-group">
    <label for="shipping_zip"><font color="#ff0000">*</font> Shipping Postal Code:</label>
    <input class="form-control" type="text" name="shipping_zip" id="shipping_zip" value="{$valid.shipping_zip}"/>{if $valid.return and  $valid.shipping_zip == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </div>
  <div class="form-group" id="checkoutPanelNoWarn">
    <label for="shipping_country"><font color="#ff0000">*</font> Shipping Country:</label>
    <select class="form-control" name="shipping_country" id="shipping_country">
        {html_options options=$options.country selected=$valid.shipping_country}
      </select>
  </div>

{else}
{* for uk *}
  <div class="form-group">
    <label for="shipping_type1"><font color="#CC0000">*</font> Shipping Type:</label>
    <div>
      <label class="radio-inline"><input type="radio" name="shipping_type1" id="shipType1d" value="dom" onmouseup="javascript: setShipType(this,'shipping','1'); condHideFormDiv();
          addFormControls();" /> Domestic (U.S.A.)</label>
      <label class="radio-inline"><input type="radio" name="shipping_type1" id="shipType1i" value="int" onmouseup="javascript: setShipType(this,'shipping','1'); condHideFormDiv();
          addFormControls();" /> International</label>
    </div>
  </div>
  <div class="form-group">
    <label for="sStateField1" id="stateCaption1">{*added by cart.js*}</label>
    <div id="stateField1">{*select or input added by cart.js*}</div>
  </div>
  <div id="cond_hide1" class="form-group">
    <label for="sCountryField1" id="countryCaption1">{*added by cart.js*}</label>
    <div id="countryField1">{*select added by cart.js*}</div>
  </div>
  <div class="form-group">
    <label for="sZipField1" id="zipCaption1">{*added by cart.js*}</label>
    <div id="zipField1">{*input added by cart.js*}</div>
  </div>
  {if $valid.shipping_country == 'United States'}
   <script type="text/javascript">
     var item = document.getElementById('shipType1d');
     setShipType(item,'shipping','1','{$valid.shipping_country}','{$valid.shipping_state}','{$valid.shipping_zip}');
   </script>
  {elseif $valid.return || $valid.shipping_country != ''}
   <script type="text/javascript">
     var item = document.getElementById('shipType1i');
     setShipType(item,'shipping','1','{$valid.shipping_country}','{$valid.shipping_state}','{$valid.shipping_zip}');
   </script>
  {/if}
{/if}

  <div class="form-group">
      <input type="hidden" name="id" value="{$id}" />
      <input type="submit" name="submit" value="Update" class="addtocart_btn btnstyle1 btn btn-default" />
  </div>
</form>
</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
{if $type == 'm'}
 {include file="member_links.tpl"}
{/if}
</div>
{include file="_bottom.tpl"}