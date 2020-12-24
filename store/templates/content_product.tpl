{if $settings.additional_prod_display_type == '2' && $add_form_errors.errors > 0 && $product.additional_prods|@count > 0}
 <div class="normaltext" align="center" style="font-weight: bold; color: red;">{$add_form_errors.error}</div>
{/if}

{if $add_form_errors.errors > 0 && $settings.additional_prod_display_type == '2'}
 <div class="normaltext" align="center" style="font-weight: bold; color: red;">{$add_form_errors.$prod_id}</div>
{/if}

<div class="normaltext">
{eval var=$product.prod_description}
</div>
<br />

{if $settings.additional_prod_display_type == '2'}
 <form method="POST" action="index.php">
  <input type="hidden" name="action" value="AddCart" />
{/if}

{include file="additional_products.tpl"}

{if $settings.additional_prod_display_type == '2'}
 <div align="center">
  <input type="hidden" name="process_type" value="2" />
  <input type="hidden" name="add_process_type" value="2" />
  <input type="submit" name="submit" value="Add to Cart" class="addtocart_btn btnstyle1" />
  {include file="wishlist_add.tpl"}
  {include file="reorder_add.tpl"}
 </div>
 </form>
{/if}

<br />
{include file="related_products.tpl"}
