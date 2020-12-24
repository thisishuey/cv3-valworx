{config_load file="store.conf" scope="global"}
{assign var="template_section" value=$template_section|default:"default"}
<!DOCTYPE html>
<html>
{include file="_meta.tpl"}
<body>
	<div align="center">{$meta.pre_body}</div>

	<div class="container nopad" id="popup">
		<h2>What is CVV2, CVC2, or CID?</h2>
		<div class="row">
			<div class="col-sm-6">
				<h3>Credit Card Verification Numbers</h3>
				<p>To help guard against fraud, the major credit card companies have implemented a system to ensure the credit card used in a transaction is actually posessed by the user. This system may be variously called CVV2 (Visa), CVC2 (MasterCard), or CID (American Express). The verification number is a non-embossed number printed on the credit card.</p>
			</div>
		
			<div class="img col-sm-6">
				<img class="img img-responsive" src="{$img_prefix}/images/cvv2.png" alt="CVV2 locations" />
			</div>
		</div>
		<div class="row"> 
			<div class="col-sm-6">
				<h4>Visa, MasterCard, and Discover</h4>
				<p>For Visa, MasterCard, and Discover cards, the number is located on the back of your card near your signature. The number on these cards is three digits long.</p>
			</div>
			<div class="col-sm-6">
				<h4>American Express</h4>
				<p>For American Express cards, the number is located on the front of your card, on the right hand side above your card number. The number on American Express cards is four digits long.</p>
			</div>
		</div>
		<p>[<a href="javascript:window.close();">Click here to close</a>]</p>

	</div>
</body>
</html>