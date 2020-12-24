{include file="_top.tpl"}

<h1>Express Order</h1>

{if $errors}
    <div class="alert alert-danger">
      <p>There was an error.</p>
      <p><em>{$errors}</em></p>
    </div>
{/if}
<form method="post" name="product_form" action="index.php">
<input type="hidden" name="action" value="AddCart" />
{if $info.wishlist != ''}
  <input type="hidden" name="wishlist" value="{$info.wishlist}" />
{/if}
<input type="hidden" name="express_info" value="y" />
<div class="normaltext mar_btm">
  {if $express_error !=''}<div class="alert alert-danger">{$express_error}</div>{/if}
  <div>We need more information before adding product #{$info.sku} ({$product.prod_name}) to your cart.</div>
</div>

{* Custom Form *}
{include file="custom_form.tpl"}

{* if it has no children and is not a product pack *}

{if $product.is_parent != 'y' && $product.gift_set != 'y'}
  {include file="express_product.tpl"}
{* if it has children and is not a product pack *}

{elseif $product.gift_set != 'y'}
  {* if children use same form or if parent has custom form *}
  {include file="prodchild2.tpl"}

{* if product pack *}

{elseif $product.gift_set == 'y'}
  {include file="prodgiftset.tpl"}
{/if}

</form>

{include file="_bottom.tpl"}
