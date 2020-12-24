{if $google_checkout.google_checkout == 'y' && $google_checkout.merchant_id != ''}
  {if $google_checkout.exempt != 'y'}
    <form method="POST" action="https://checkout.google.com/cws/v2/Merchant/{$google_checkout.merchant_id}/checkout" role="form">
      <input type="hidden" name="cart" value="{$google_checkout.cart}"/>
      <input type="hidden" name="signature" value="{$google_checkout.signature}"/>
      <input type="image" name="Google Checkout" src="https://checkout.google.com/buttons/checkout.gif?merchant_id={$google_checkout.merchant_id}&w={$google_checkout.width}&h={$google_checkout.height}&style=trans&variant=text&loc=en_US" />
    </form>
  {else}
     <img src="https://checkout.google.com/buttons/checkout.gif?merchant_id={$google_checkout.merchant_id}&w={$google_checkout.width}&h={$google_checkout.height}&style=trans&variant=disabled&loc=en_US" />
   {/if} 
{/if}

