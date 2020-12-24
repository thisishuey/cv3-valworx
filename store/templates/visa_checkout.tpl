{if $settings.visa_checkout == 'y' && $cart|@count > 0}
<script type="text/javascript">
var apikey = "{$settings.visa_key}";
var collectShipping = "true";
var cardBrands = {$visa_card_info};
var reviewMessage = "Is this correct?";
var reviewButtonName = "Continue";
var dataLevel = "SUMMARY";
var currencyCode = "USD";

{literal}
function onVisaCheckoutReady(){
	console.log("Trying to init");
	V.init({
      apikey: apikey,
      settings: {
        shipping: {
          collectShipping: collectShipping
        },
        payment: {
          cardBrands: cardBrands
        },
        review: {
          message: reviewMessage,
          buttonAction: reviewButtonName
        },
        dataLevel: dataLevel
      }
    });
  
	V.on("payment.success", function(payment){
	  visa_success_handler(payment); 
	});
	V.on("payment.error", function (payment, error) { 
	  alert("There was an error handling your request."); 
	});
  
    function visa_success_handler(payment){
    	newLoc = '/checkout?visa_id='+payment['callid'];
		window.location = newLoc;
    }
}
{/literal}
</script>
<img name="visa_checkout" alt="Visa Checkout" class="v-button" role="button" src="https://{if $settings.visa_testing == 'y'}sandbox.{/if}secure.checkout.visa.com/wallet-services-web/xo/button.png?size=154"/>
<script type="text/javascript" src="https://{if $settings.visa_testing == 'y'}sandbox-{/if}assets.secure.checkout.visa.com/checkout-widget/resources/js/integration/v1/sdk.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
{/if}
