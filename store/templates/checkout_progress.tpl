<div id="steps">
  <ul class="nav nav-tabs nav-justified" id="progress">
    <li class="step-1{if $step == '1'} active{/if}">
      <a {if $step == '2' || $step == '3' || $step == '4'}href="/checkout"{/if}>Log In</a>
    </li>

{if $settings.checkout_type == '1' || $checkout_type == '1'}{* ADVANCED Checkout *}

  <li class="step-2{if $step == '2'} active{/if}">
    <a {if $step == '3' || $step == '4'}href="/checkout_shippingaddress"{/if}>Shipping Info</a>
  </li>

  <li class="step-3{if $step == '3'} active{/if}">
    <a {if $step == '4'}href="/checkout_billing"{/if}>Billing Info</a>
  </li>

{else}{* QUICK Checkout *}

  <li class="step-2{if $step == '2' || $step == '3'} active{/if}">
    <a {if $step == '4'}href="/checkout_shipping"{/if}>Shipping & Billing Info</a>
  </li>

{/if}

  <li class="step-4{if $step == '4'} active{/if}">
    <a {if $step == '4'}href=""{/if}>Confirmation</a>
  </li>

 </ul>
</div>