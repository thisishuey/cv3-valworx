{config_load file="store.conf" scope="global"}
<html>
<body>
	<form action="https://www.paypal.com/cgi-bin/webscr" method="post" name="paypal" role="form">
		<input type="hidden" name="cmd" value="_cart">
		<input type="hidden" name="upload" value="1">
		<input type="hidden" name="business" value="{$paypal.paypal_business}">
		<input type="hidden" name="no_shipping" value="1">
		<input type="hidden" name="custom" value="{$paypal.conf}">
		<input type="hidden" name="invoice" value="{$paypal.order_id}">
		<input type="hidden" name="item_name_1" value="{#store_name#|regex_replace:"/<.*?>/":""} Items">
		<input type="hidden" name="amount_1" value="{$paypal.total_price}">
		<input type="hidden" name="shipping_1" value="{$paypal.total_shipping}">
		<input type="hidden" name="tax_cart" value="{$paypal.total_tax}">
		<input class="btn btn-primary" type="submit" value="Go To PayPal">
	</form>
	<script language="javascript" type="text/javascript">
	<!--
	document.paypal.submit();
//-->
</script>
</body>
</html>

