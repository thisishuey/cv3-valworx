{if $settings.amazon_checkout == 'y'}
	{if $view == "viewcart" && $cart|@count > 0 && $cart|@count <= 20} {* Amazon only supports up to 20 items in their inline checkout. *}
		<script type="text/javascript" src="https://static-na.payments-amazon.com/cba/js/us/PaymentWidgets.js"></script>
		<div id="AmazonWidget"></div>

		<script type="text/javascript">
			{if $settings.amazon_checkout_type == '1'}     
				new CBA.Widgets.InlineCheckoutWidget({ldelim}
			{else}
				new CBA.Widgets.ExpressCheckoutWidget({ldelim}
			{/if}
			merchantId: "{$settings.amazon_merchant_id}",
			onAuthorize: function(widget) {ldelim}
			window.location = '/checkout?amazon_id=' + widget.getPurchaseContractId();
			{rdelim}
			{rdelim}).render("AmazonWidget");
		</script>
	{elseif substr($view,0,17) == 'checkout_shipping' && $mode != 'payment'}
		<input type="hidden" name="amazon_checkout_{$num}" id="amazon_checkout_{$num}" value="0" />
		<div id="AmazonAddressWidget{$destination}"></div>
			<script type="text/javascript">
				new CBA.Widgets.AddressWidget({ldelim}
				merchantId: "{$settings.amazon_merchant_id}",
				destinationName: "{$destination}",
				onAddressSelect: function(widget) {ldelim}
				getInfo('amazon','Amazon_Class','getAmazonShipInfo','{$smarty.session.amazon_id}');
				var field = (document.getElementById) ? document.getElementById('amazon_checkout_{$num}') : document.all['amazon_checkout_{$num}'];
				var button = (document.getElementById) ? document.getElementById('continue_btn') : document.all['continue_btn'];
				if (button != null && typeof button != 'undefined') {ldelim}
					button.disabled = true;
				setTimeout("document.getElementById('continue_btn').disabled=false",2500);
				{rdelim}
				field.value = '1';
				{rdelim}
				{rdelim}).render("AmazonAddressWidget{$destination}");
			</script>
	{elseif substr($view,0,16) == 'checkout_billing' || ($view == 'checkout_shipping' && $mode == 'payment')}
		<input type="hidden" name="payment_method" value="amazon" />
		{if substr($view,0,16) == 'checkout_billing'}
			<script type="text/javascript" src="https://static-na.payments-amazon.com/cba/js/us/PaymentWidgets.js"></script>
		{/if}
		<div id="AmazonWalletWidget"></div>
		<script type="text/javascript">
			new CBA.Widgets.WalletWidget({ldelim}
			merchantId: "{$settings.amazon_merchant_id}",
			onPaymentSelect: function(widget) {ldelim}
			document.getElementById('continue_btn').disabled = false;
			document.getElementById('payment_notice').innerHTML = '';
			{rdelim}
			{rdelim}).render("AmazonWalletWidget");
		</script>
		<div class="spacer"></div>
		<span class="formtext notice" id="payment_notice">You must select a payment method before continuing.</span>
	{elseif ($view == 'checkout_thanks' || $view == 'member_orderdetail') && $order_ids != ''}
		{assign var="amazon_ids" value=$order_ids|array}
		<script type="text/javascript" src="https://static-na.payments-amazon.com/cba/js/us/PaymentWidgets.js"></script>
		<div class="spacer"></div>
		Your Amazon Payments Order ID{if count($amazon_ids) > 1}s{/if} {if count($amazon_ids) > 1}are{else}is{/if} 
		{counter start=1 step=1 assign="id_counter"}
		{foreach from=$amazon_ids item="amazon_id" key="key"}
			<a href="#" onclick="orderDetailsWidget{$key}.open('230px', '554px');">{$amazon_id}</a>{if $amazon_ids|@count > 1 && $id_counter < $amazon_ids|@count}, {else}.{/if}
			<script type="text/javascript">
				var orderDetailsWidget{$key} = new CBA.Widgets.OrderDetailsWidget({ldelim}
				merchantId: "{$settings.amazon_merchant_id}",
				orderID: "{$amazon_id}"
				{rdelim});
			</script>
			{if $view == 'member_orderdetail'}
				<br /><span class="notice">Note: You must be logged into your Amazon account to view your Amazon order information.</span>
			{/if}
			{counter assign="id_counter"}
		{/foreach}
	{/if}
{/if}
