{include file="_top.tpl"}

<h1>Payment Information</h1>

<div class="normaltext"><span class="req">*</span> Indicates a required field</div>

{if $valid.return == "1"}
<div class="normaltext">There has been an error. Please double check any fields that show an <span class="glyphicon glyphicon-remove has-error"></span></div>
{/if}
{if $error != ""}
<div class="alert alert-danger"><b>{$error}</b></div>
{/if}

{* view paid *}
<div class="alert alert-danger">
  {math equation="x-y" x=$gift_certificates.totals.total y=$gift_certificates.totals.gctotal assign=difference}
  {if $gift_certificates.totals.remaining > 0}
  {math equation="x+y" x=$gift_certificates.totals.remaining y=$difference assign=remaining}
  <div>Note: your gift certificate(s) could not cover the entire order.  Please choose another payment method for the remaining {$currency_type}{$remaining|string_format:"%.2f"}</div>
  {elseif $settings['gift_certificate_applyshipping'] == 'n' || $settings['gift_certificate_applytax'] == 'n'}
  {assign var='noShipping' value='0'}
  {assign var='noTax' value='0'}
  {if $settings['gift_certificate_applyshipping'] == 'n' && $totals['shiptotal'] > 0}
  {assign var='noShipping' value='1'}
  {/if}
  {if $settings['gift_certificate_applytax'] == 'n' && $totals['taxtotal'] > 0}
  {assign var='noTax' value='1'}
  {/if}
  <div>{if $noShipping && $noTax}Shipping and tax{elseif $noShipping}Shipping{elseif $noTax}Tax{/if} cannot be paid for with gift certificates.  Please choose another payment method for the remaining {$currency_type}{$difference|string_format:"%.2f"}.</div>
  {else}
  <div>Note: Gift certificates cannot be purchased with another gift certificate.  Please choose another payment method for the remaining {$currency_type}{$difference|string_format:"%.2f"}</div>
  {/if}
</div>
<form method="post" action="index.php" name="ship_form" role="form"> 
  <input type="hidden" name="action" value="CheckoutPayment" />

  <div>
   {assign var='col_1_align' value='right'}
   {assign var='col_1_width' value='40'}
   {assign var='col_2_width' value='60'}
   {if ($settings.payment_members_only == 'y' && $is_member == 'y') || $settings.payment_members_only != 'y'}
   {assign var=display_other_methods value='y'}
   {else}
   {assign var=display_other_methods value='n'}
   {/if}
   <div class="row">
     <div class="col-sm-6">
       <div class="form-group">
        <label>Payment Method:</label>
        {if $settings.payment_methods|@count > 1 and $display_other_methods == 'y'}
          <select class="formtext form-control" name="payment_method" onchange="javascript: paymentMethod(this.value);">
            <option value="">Choose Method</option>
            {foreach from=$settings.payment_methods key=key item=method}
            <option value="{$method}" {if $valid.payment_method == $method}selected{/if}>{$options.payment_methods.$method}</option>
            {/foreach} 
          </select>
        {assign var=meth value=''}
        {else}
        <div class="normaltext">
          {if $display_other_methods == 'n'}
          {assign var="meth" value='creditcard'}
          {else}
          {assign var="meth" value=$settings.payment_methods.0}
          {/if}
          {$options.payment_methods.$meth}
          <input type="hidden" name="payment_method" value="{$meth}" />
        </div>
        {/if}
      </div>
    </div>
  </div>

    <div>
      {in_array arr=$settings.payment_methods val="creditcard"} 
      {if $ret == 'y'} 
      <div class="row" id="cc_panel" style="display:{if $meth == 'creditcard' or ($valid.return and $valid.payment_method == 'creditcard')}block{else}none{/if};">
          <div class="col-sm-6">
            <div class="form-group {if $valid.return and $valid.is_valid.ccname == 'n'} has-error has-feedback bg-danger{/if}">
              <label for="ccname"><span class="req">*</span> Name on Card:</label>
              <input class="formtext form-control" type="text" name="ccname" id="ccname" value="{$valid.ccname}" maxlength="50" />{if $valid.return and $valid.is_valid.ccname == 'n'} <span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group">
              <label><span class="req">*</span>Card Type:</label>
              <select class="formtext form-control" name="cctype"  onchange="javascript: cardType(this.value);" >
                {html_options options=$options.cctype selected=$valid.cctype}
              </select>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group {if $valid.return and $valid.is_valid.ccnum == 'n'} has-error has-feedback bg-danger{/if}">
              <label><span class="req">*</span> Card Number:</label>
              <input class="formtext form-control" type="text" name="ccnum" value="" maxlength="50"/>{if $valid.return and $valid.is_valid.ccnum == 'n'} <span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            </div>
          </div>
          {if $settings.display_cvv2 == 'y'}
          <div class="col-sm-6">
            <div class="form-group {if $valid.return && $valid.cvv2 == '' && $valid.payment_method == 'creditcard' && $valid.cctype != 'PL'} has-error has-feedback bg-danger {/if}">
              <label><span class="req">*</span> CVV2:</label>
              <input class="formtext form-control" type="text" name="cvv2" maxlength="4" /> {if $valid.return && $valid.cvv2 == '' && $valid.payment_method == 'creditcard' && $valid.cctype != 'PL'}<span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
              <a href="javascript: void(0);" onclick="MM_openBrWindow('/cvv2','','scrollbars=yes,resizable=yes,width=465,height=453')">What's this?</a>
              <input type="hidden" name="cvv2_req" value="y" />
            </div>
          </div>
          {/if}

          {* End CVV2 *}
          <div class="col-sm-6">
            <div class="form-group">
              <label><span class="req">*</span> Card Expiration Date:</label>
              <div class="row">
                <div class="col-xs-6">
                  <select class="formtext form-control" name="ccexpm" >
                    {html_options options=$options.ccexpm selected=$valid.ccexpm}
                  </select>
                </div>
                <div class="col-xs-6">
                  <select class="formtext form-control" name="ccexpy">
                    {html_options options=$options.ccexpy selected=$valid.ccexpy}
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
      {/if}

      {in_array arr=$settings.payment_methods val="purchaseorder"} 
      {if $ret == 'y' and $display_other_methods == 'y'} 
      <div class="row" id="po_panel" style="display:{if $meth == 'purchaseorder' or ($valid.return and $valid.payment_method == 'purchaseorder')}block{else}none{/if};">
        <div class="col-sm-6">
          <div class="form-group {if $valid.return and $valid.is_valid.purchase_order == 'n'} has-error has-feedback bg-danger{/if}">
            <label><span class="req">*</span> Purchase Order Number:</label>
            <input class="formtext form-control" type="text" name="purchase_order" value="{$valid.purchase_order}" maxlength="50"  />{if $valid.return and $valid.is_valid.purchase_order == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          </div>
        </div>
      </div>
      {/if}

      {in_array arr=$settings.payment_methods val="giftcertificate"} 
      {if $ret == 'y' and $display_other_methods == 'y'} 
      <div id="gc_panel" style="display:{if $meth == 'giftcertificate' or ($valid.return and $valid.payment_method == 'giftcertificate')}block{else}none{/if};">
        <div class="row">
          <div class="col-sm-6">
            <div class="form-group {if $valid.return and $valid.is_valid.gift_certificate == 'n'} has-error has-feedback bg-danger{/if}">
              <label><span class="req">*</span> Gift Certificate Code:</label>
              <input class="formtext form-control" type="text" name="gift_certificate" value="{$valid.gift_certificate}" maxlength="50" />{if $valid.return and $valid.is_valid.gift_certificate == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
              {if $settings.gcv_processor == 'y' && $settings.gcv_version == 'current'}
                   <label><span class="req">*</span> Gift Certificate PIN:</label>          
                   <input type="password" name="gc_pin" size="30" maxlength="50" class="formtext form-control" />
                 {/if}
            </div>
          </div>
          {if $settings.gcaloha_pinverify == 'y'}
          <div class="col-sm-6">  
            <div class="form-group {if $valid.return and $valid.is_valid.aloha_pin == 'n'} has-error has-feedback bg-danger{/if}">
              <label><span class="req">*</span> Gift Certificate PIN:</label>
                <input class="formtext form-control" type="text" name="aloha_pin" value="{$valid.aloha_pin}" maxlength="6"  />{if $valid.return and $valid.is_valid.aloha_pin == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
               
                
            </div>
          </div>
          {/if}
        </div>
      </div>
      {/if}

      {in_array arr=$settings.payment_methods val="echeck"} 
      {if $ret == 'y' and $display_other_methods == 'y'} 
      <div id="ec_panel" style="display:{if $meth == 'echeck' or ($valid.return and $valid.payment_method == 'echeck')}block{else}none{/if};">
        <div class="row">
          <div class="col-sm-6">
            <div class="form-group {if $valid.return and $valid.is_valid.echeck_acct_name == 'n'} has-error has-feedback bg-danger{/if}">
              <label><span class="req">*</span>Name on Account:</label>
                <input class="formtext form-control" type="text" name="echeck_acct_name" value="{$valid.echeck_acct_name}" maxlength="50"/>{if $valid.return and $valid.is_valid.echeck_acct_name == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group {if $valid.return and $valid.is_valid.echeck_routing_num == 'n'} has-error has-feedback bg-danger{/if}">
                <label><span class="req">*</span>Routing Number:</label>
                <input class="formtext form-control" type="text" name="echeck_routing_num" value="{$valid.echeck_routing_num}" maxlength="50"/>{if $valid.return and $valid.is_valid.echeck_routing_num == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span> {/if}
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group {if $valid.return and $valid.is_valid.echeck_acct_num == 'n'} has-error has-feedback bg-danger{/if}">
              <label><span class="req">*</span>Account Number:</label>
                <input class="formtext form-control" type="text" name="echeck_acct_num" value="{$valid.echeck_acct_num}" maxlength="50" />{if $valid.return and $valid.is_valid.echeck_acct_num == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            </div>
          </div>
          <div class="col-sm-6">
            <div class="form-group{if $valid.return and $valid.is_valid.echeck_bank_name == 'n'} has-error has-feedback bg-danger{/if}">
              <label><span class="req">*</span>Bank Name:</label>
                <input class="formtext form-control" type="text" name="echeck_bank_name" value="{$valid.echeck_bank_name}" maxlength="50"/>{if $valid.return and $valid.is_valid.echeck_bank_name == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
            </div>
          </div>
        </div>
      </div>
      {/if}
  </div>

  <div class="row mar_btm">
    <div class="col-sm-6">
      <input type="hidden" id="print_cc" name="print_cc" value="{$printcreditcard}" />
      <input type="hidden" id="print_po" name="print_po" value="{$printpurchaseorder}" />
      <input type="hidden" id="print_gc" name="print_gc" value="{$printgiftcertificate}" />
      <input type="submit" name="submit" value="Continue &gt;" class="btn btn-primary" />
    </div>
  </div>
</div>
</form>

{include file="_bottom.tpl"}
