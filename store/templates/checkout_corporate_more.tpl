{include file="_top.tpl"}
<h1>Corporate Order</h1>

<form method="post" name="product_form" action="index.php" role="form">
	<input type="hidden" name="action" value="AddCart">
	<input type="hidden" name="corporate_info" value="y">
	<input type="hidden" name="recipient_mapping" value="{$recipient}">

	<span class="mar_btm">We need more information about {if $product.additional_prods|@count > 1}these products{else}this product{/if} for: <b>{$recipient}</b></span>

	{include file="additional_products.tpl"}

	<div class="mar_btm">
		<input type="hidden" name="process_type" value="2">
		<input type="hidden" name="add_process_type" value="1">
		<input type="submit" name="submit" value="Add to Cart" class="btn btn-primary mar_btm">
	</div>
</form>


{include file="print_bottom.tpl"}
