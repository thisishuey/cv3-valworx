{config_load file="store.conf" scope="global"}
<html>
<body>
<form action="https://payflowlink.paypal.com" method="post" name="payflow">
<input type="hidden" name="LOGIN" value="{$payflow.merchant_info.username}" />
<input type="hidden" name="PARTNER" value="{$payflow.merchant_info.partner}" />
<input type="hidden" name="AMOUNT" value="{$payflow.total_price}" />
<input type="hidden" name="TYPE" value="{$payflow.merchant_info.option1}" />
<input type="hidden" name="DESCRIPTION" value="{#store_name#|regex_replace:"/<.*?>/":""} Items">
<input type="hidden" name="NAME" value="{$payflow.first_name} {$payflow.last_name}">
<input type="hidden" name="ADDRESS" value="{$payflow.billing_address1}">
<input type="hidden" name="CITY" value="{$payflow.billing_city}">
<input type="hidden" name="STATE" value="{$payflow.billing_state}">
<input type="hidden" name="ZIP" value="{$payflow.billing_zip}">
<input type="hidden" name="COUNTRY" value="{$payflow.billing_country}">
<input type="hidden" name="PHONE" value="{$payflow.phone}">
<input type="hidden" name="EMAIL" value="{$payflow.email}">
<input type="hidden" name="CARDNUM" value="{$payflow.bill.num}">
<input type="hidden" name="EXPDATE" value="{$payflow.bill.exp}">
<input type="hidden" name="METHOD" value="CC">
{if $payflow.cvv2 != ''}
  <input type="hidden" name="CSC" value="{$payflow.cvv2}">
{/if}
<input type="hidden" name="USER1" value="{$payflow.order_id}">
<input type="hidden" name="USER2" value="{$payflow.conf}">
<input type="submit" value="Go To PayFlow Link">
</form>
<script language="javascript" type="text/javascript">
<!--
 document.payflow.submit();
//-->
</script>
</body>
</html>

