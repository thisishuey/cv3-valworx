{foreach from=$subcats key=key item=scat}

<br />
<a name="{$scat.id}"></a>
<h3>{$scat.name}</h3>

  {foreach from=$scat.products item=product}
    {assign var="prod_id" value=$product.prod_id}
    {assign var="results" value=$product.recipes}

<form method="post" action="index.php">
<input type="hidden" name="action" value="AddCart">
{* Product Image / Description Display *}
{include file="product_main.tpl"}

  {* if it has no children and is not a product pack *}
  {if $product.is_parent != 'y' && $product.gift_set != 'y'}
<br>
{* include file="prodparent.tpl" *}

  {* if it has children and is not a product pack *}
  {elseif $product.gift_set != 'y'}

  {* if children use same form or if parent has custom form *}
  {if $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) }
    {include file="prodchild2.tpl"}

  {* if children use separate forms *}
  {else}
    {include file="prodchild.tpl"}
  {/if}

  {* if product pack *}
  {elseif $product.gift_set == 'y'}

{include file="prodgiftset.tpl"}

  {/if}

</form>
  {/foreach}
{/foreach}

