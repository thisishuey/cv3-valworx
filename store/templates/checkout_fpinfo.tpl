{include file="_top.tpl"}

{if $giveprodsprice > 0}
  <h1>Select Product for ${$giveprodsprice}</h1>
{else}
  <h1>Select Your Free Product</h1>
{/if}

<form method="post" name="product_form" action="index.php">
<input type="hidden" name="action" value="CheckoutFPInfo" />
<div class="normaltext mar_btm">
  We need more information before adding product #{$info.sku} ({$info.prod_name}) to your cart:
</div>
<div class="normaltext form-group">
{* Custom Form *}
{if $custom_form_num != '' && $custom_form_num != 0}
{include file="custom_form.tpl"}
{/if}

{* text field *}
{if $product.text_field == 'y'}
  Note: <input class="formtext form-control" type="text" name="note" value="" /><br />
{/if}

{* if it has attributes *}
{if $product.is_parent != 'y' && $product.has_attributes == 'y'}
  {include file="attributes.tpl"}

{elseif $product.is_parent == 'y'}
  {foreach from=$product.children item=child}
    <select class="formtext form-control" name="option1">
      {html_options values=$child.child_attributes output=$child.child_attributes}
    </select>
    <input type="hidden" name="num_attributes" value="1" />
    <input type="hidden" name="freeprod" value="{$child.prod_id}" />
  {/foreach}

{/if}

{if $product.is_parent != 'y'}
  <input type="hidden" name="freeprod" value="{$product.prod_id}" />
{/if} 
<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
</div>
</form>

{include file="_bottom.tpl"}