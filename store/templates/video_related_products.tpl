{if $product.rel_prods|@count > 0}
	<div id='product_tabs' class="clearfix">
		<ul>
			<li id='section1_tab' class='tab'>Video</li>
		</ul>
		<div id='tab_contents'>
			<div id='section1' class='content' style="display:block">
				{include file="display_product_group.tpl" label="Related Products" products=$product.rel_prods max=6}
			</div>
		</div>
	</div>
{/if}