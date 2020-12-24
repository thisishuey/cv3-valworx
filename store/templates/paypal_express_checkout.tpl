{if $paypal_express == 'y'}
<form method="post" action="index.php" style="margin:0px;padding:0px;" role="form"> 
  <input type="hidden" name="action" value="PayPalExpressCheckout">
  <input type='image' name='submit' src='https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif' border='0' align='top' alt='PayPal'/>
</form>
{/if}

