<div id="payment_info">

 {if $settings.amazon_checkout_type != '2' || !$smarty.session.amazon_id}
  <fieldset><legend>Payment Information</legend>
 {/if}

 {if $settings.amazon_checkout == 'y' && isset($smarty.session.amazon_id)}
  {if $settings.amazon_checkout_type == '1'}
   {include file="amazon_checkout.tpl" mode="payment"}
  {/if}
 {else}
  {if ($settings.payment_members_only == 'y' && $is_member == 'y') || $settings.payment_members_only != 'y'}
   {assign var=display_other_methods value='y'}
  {else}
   {assign var=display_other_methods value='n'}
  {/if}
  <div class="row">
  <div class="col-sm-6">
  <div class="clearfix form-group">
   <label>Payment Method:</label>
   {if $settings.payment_methods|@count > 1 and $display_other_methods == 'y'}
    <select class="form-control" id="payment_method" name="payment_method" onchange="paymentMethod(this.value,'{$paypal}'); {if $settings.authorize_cim == 'y'}populate_billing(this.value);{/if}">
    <option value="">Choose Method</option>
    {foreach from=$settings.payment_methods key=key item=method}
     <option value="{$method}" {if $valid.payment_method == $method}selected{/if}>{$options.payment_methods.$method}</option>
    {/foreach} 
    </select>
    {assign var=meth value=''}
   {else}
    {if $display_other_methods == 'n'}{assign var="meth" value='creditcard'}
    {else}{assign var="meth" value=$settings.payment_methods.0}
    {/if}
    <span>{$options.payment_methods.$meth}</span>
    <input type="hidden" id="payment_method" name="payment_method" value="{$meth}" />
   {/if}
  </div>
</div>
</div>
  {if in_array("creditcard",$settings.payment_methods) or  in_array("purchasecard",$settings.payment_methods)}
   <div id="cc_panel" style="display:{if $meth == 'creditcard' or $meth == 'purchasecard' or ($valid.return and $valid.payment_method == 'purchasecard') or ($valid.return and $valid.payment_method == 'creditcard')}block{else}none{/if};">
    <div class="cc_logos mar_btm">{if $options.cctype.VI}<img src="{$img_prefix}/images/cc_visa.gif">{/if}{if $options.cctype.MC}<img src="{$img_prefix}/images/cc_mc.gif">{/if}{if $options.cctype.AX}<img src="{$img_prefix}/images/cc_amex.gif">{/if}{if $options.cctype.DI}<img src="{$img_prefix}/images/cc_disc.gif">{/if}</div>
    <div class="row">
    <div class="col-sm-6">
      <div class="form-group {if $valid.return and $valid.is_valid.ccname == 'n'} has-error has-feedback bg-danger{/if}">
       <label for='ccname'><span class="req">*</span> Name on Card:</label>
       <input class="form-control" type="text" id="ccname" name="ccname" value="{$valid.ccname}"{if $view == 'checkout_shippingaddress'} size="30"{/if} maxlength="50" />{if $valid.return and $valid.is_valid.ccname == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
    {if $settings.hide_cc_list != 'y'}
    <div class="col-sm-6">
     <div class="form-group {if $valid.return and $valid.is_valid.cctype == 'n'} has-error has-feedback bg-danger{/if}" id="dd_cctype"  style="display:{if $meth == 'creditcard' or ($valid.return and $valid.payment_method == 'creditcard')}block{else}none{/if};">
      <label for='cctype'><span class="req">*</span> Card Type:</label>
      <select class="form-control" id="cctype" name="cctype" onchange="cardType(this.value);">
      {html_options options=$options.cctype selected=$valid.cctype}
      </select>{if $valid.return and $valid.is_valid.cctype == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
     </div>
     {* two sets of Credit Card Types... one for Credit Card, and this next one is for Purchase Cards ... toggled between in the cart.js  *}
     {if in_array("purchasecard",$settings.payment_methods)}
     <div class="form-group {if $valid.return and $valid.is_valid.cctype == 'n'} has-error has-feedback bg-danger{/if}" id="dd_pcctype"  style="display:{if $meth == 'purchasecard' or ($valid.return and $valid.payment_method == 'purchasecard')}block{else}none{/if};">
      <label for='pcctype'><span class="req">*</span> Card Type:</label>
      <select class="form-control" id="pcctype" name="pcctype">
      {html_options options=$options.pcctype selected=$valid.cctype}
      </select>{if $valid.return and $valid.is_valid.cctype == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
     </div>
     {/if}
   </div>
    {/if}
    <div class="col-sm-6">
      <div class="form-group {if $valid.return and $valid.is_valid.ccnum == 'n'} has-error has-feedback bg-danger{/if}">
       <label for='ccnum'><span class="req">*</span> Card Number:</label>
       <input class="form-control" type="tel" id="ccnum" name="ccnum"{if $view == 'checkout_shippingaddress'} size="30"{/if} maxlength="50" />{if $valid.return and $valid.is_valid.ccnum == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
    {if $settings.display_cvv2 == 'y'}
      <div class="col-sm-6">
       <div class="form-group {if $valid.return && !$valid.cvv2 && $valid.payment_method == 'creditcard' && $valid.cctype != 'PL'} has-error has-feedback bg-danger{/if}">
        <label for='cvv2'><span class="req">*</span> CVV2:</label>
        <input class="form-control" type="tel" id="cvv2" name="cvv2" size="4" maxlength="4" />{if $valid.return && !$valid.cvv2 && $valid.payment_method == 'creditcard' && $valid.cctype != 'PL'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        <a href="javascript: void(0);" onclick="MM_openBrWindow('/cvv2','','scrollbars=yes,resizable=yes,width=515,height=530')">What's this?</a>
        <input type="hidden" name="cvv2_req" value="y" />
       </div>
     </div>
    {/if}
    <div class="col-sm-6">
      <div class="form-group {if $valid.return and ($valid.is_valid.ccexpm == 'n' || $valid.is_valid.ccexpy == 'n')} has-error has-feedback bg-danger{/if}">
       <label for='ccexpm'><span class="req">*</span> Expiration Date:</label>
       <div class="nowrap row">
        <div class="col-xs-6">
          <select class="form-control" id="ccexpm" name="ccexpm">
            {html_options options=$options.ccexpm selected=$valid.ccexpm}
          </select>{if $valid.return and ($valid.is_valid.ccexpm == 'n' || $valid.is_valid.ccexpy == 'n')}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
        <div class="col-xs-6">
          <select class="form-control" name="ccexpy">
           {html_options options=$options.ccexpy selected=$valid.ccexpy}
          </select>{if $valid.return and ($valid.is_valid.ccexpm == 'n' || $valid.is_valid.ccexpy == 'n')}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
       </div>
      </div>
    </div>
  </div>
   </div>
  {/if}
<div class="row">
  {in_array arr=$settings.payment_methods val="purchaseorder"} 
  {if $ret == 'y' and $display_other_methods == 'y'} 
   <div id="po_panel" style="display:{if $meth == 'purchaseorder' or ($valid.return and $valid.payment_method == 'purchaseorder')}block{else}none{/if};">
    <div class="col-sm-6">
    <div class="form-group {if $valid.return and $valid.is_valid.purchase_order == 'n'} has-error has-feedback bg-danger{/if}">
     <label for='purchase_order'><span class="req">*</span> Purchase Order #:</label>
     <input class="form-control" type="text" id="purchase_order" name="purchase_order" value="{$valid.purchase_order}"{if $view == 'checkout_shippingaddress'} size="30"{/if} maxlength="50" />{if $valid.return and $valid.is_valid.purchase_order == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    </div>
    </div>
   </div>
  {/if}

  {in_array arr=$settings.payment_methods val="giftcertificate"} 
  {if $ret == 'y' and $display_other_methods == 'y'} 
   <div id="gc_panel" style="display:{if $meth == 'giftcertificate' or ($valid.return and $valid.payment_method == 'giftcertificate')}block{else}none{/if};">
    <div class="col-sm-6">
      <div class="form-group {if $valid.return and $valid.is_valid.gift_certificate == 'n'} has-error has-feedback bg-danger{/if}">
       <label for='gift_certificate'><span class="req">*</span> Gift Certificate Code:</label>
       <input class="form-control" type="text" id="gift_certificate" name="gift_certificate" value="{$valid.gift_certificate}"{if $view == 'checkout_shippingaddress'} size="30"{/if} maxlength="50" />{if $valid.return and $valid.is_valid.gift_certificate == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}

          {if $settings.gcv_processor == 'y' && $settings.gcv_version == 'current'}
            <br/>
            <label for='gc_pin'><span class="req">*</span> Gift Certificate Pin:</label>
            <input type="password" id="gc_pin" name="gc_pin" class="form-control" />
          {/if}

      </div>
    </div>
    {if $settings.gcaloha_pinverify == 'y'}
      <div class="col-sm-6">
       <div class="form-group {if $valid.return && !$valid.aloha_pin && $valid.payment_method == 'giftcertificate'} has-error has-feedback bg-danger{/if}">
        <label for='aloha_pin'><span class="req">*</span> PIN:</label>
        <input class="form-control" type="text" id="aloha_pin" name="aloha_pin" size="6" maxlength="6" />{if $valid.return && !$valid.aloha_pin && $valid.payment_method == 'giftcertificate'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        <span class="help-block">Scratch off back of card for 6 digit PIN number.</span>
       </div>
     </div>
    {/if}

   </div>
  {/if}

  {in_array arr=$settings.payment_methods val="echeck"} 
  {if $ret == 'y' and $display_other_methods == 'y'} 
   <div id="ec_panel" style="display:{if $meth == 'echeck' or ($valid.return and $valid.payment_method == 'echeck')}block{else}none{/if};">

    <div class="col-sm-6">
      <div class="form-group {if $valid.return and $valid.is_valid.echeck_acct_name == 'n'} has-error has-feedback bg-danger{/if}">
        <label for='echeck_acct_name'><span class="req">*</span> Name on Account:</label>
        <input class="form-control" type="text" id="echeck_acct_name" name="echeck_acct_name" value="{$valid.echeck_acct_name}"{if $view == 'checkout_shippingaddress'} size="30"{/if} maxlength="50" />{if $valid.return and $valid.is_valid.echeck_acct_name == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
    <div class="col-sm-6">
      <div class="form-group {if $valid.return and $valid.is_valid.echeck_routing_num == 'n'} has-error has-feedback bg-danger{/if}">
       <label for='echeck_routing_num'><span class="req">*</span> Routing Number:</label>
       <input class="form-control" type="number" id="echeck_routing_num" name="echeck_routing_num" value="{$valid.echeck_routing_num}"{if $view == 'checkout_shippingaddress'} size="30"{/if} maxlength="50" />{if $valid.return and $valid.is_valid.echeck_routing_num == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
    <div class="col-sm-6">
      <div class="form-group {if $valid.return and $valid.is_valid.echeck_acct_num == 'n'} has-error has-feedback bg-danger{/if}">
       <label for='echeck_acct_num'><span class="req">*</span> Account Number:</label>
       <input class="form-control" type="number" id="echeck_acct_num" name="echeck_acct_num" value="{$valid.echeck_acct_num}"{if $view == 'checkout_shippingaddress'} size="30"{/if} maxlength="50" />{if $valid.return and $valid.is_valid.echeck_acct_num == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
    <div class="col-sm-6">
      <div class="form-group {if $valid.return and $valid.is_valid.echeck_bank_name == 'n'} has-error has-feedback bg-danger{/if}">
       <label for='echeck_bank_name'><span class="req">*</span> Bank Name:</label>
       <input class="form-control" type="text" id="echeck_bank_name" name="echeck_bank_name" value="{$valid.echeck_bank_name}"{if $view == 'checkout_shippingaddress'} size="30"{/if} maxlength="50" />{if $valid.return and $valid.is_valid.echeck_bank_name == 'n'}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
      </div>
    </div>
   </div>
  {/if}
</div>
 {/if}


 {if $settings.amazon_checkout_type != '2' || !$smarty.session.amazon_id}
  </fieldset>
 {/if}

</div>
