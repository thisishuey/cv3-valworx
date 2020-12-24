{* Product Image / Description Display *}
{include file="product_builder_main.tpl" product=$build_prod}
{include file="product_builder_images.tpl" product=$build_prod}

{if $build_prod.is_parent != 'y' || $settings.child_display_type == '2' || ($build_prod.form_id != '' && $build_prod.form_id != 0) || ($build_prod.gift_certificate == 'y' && $build_prod.gift_certificate_send == 'y')}
<form method="post" name="product_form" action="index.php">
<input type="hidden" name="action" value="AddCart">
{/if}

{* Custom Form *}
{include file="custom_form.tpl"}

{* if it has no children and is not a product pack *}
{if $build_prod.is_parent != 'y' && $build_prod.gift_set != 'y'}
  {include file="product_builder_parent.tpl" product=$build_prod}

{* if it has children and is not a product pack *}

{elseif $build_prod.gift_set != 'y'}
  {* if children use same form or if parent has custom form *}
  {if $settings.child_display_type == '2' || ($build_prod.form_id != '' && $build_prod.form_id != 0) || ($build_prod.gift_certificate == 'y' && $build_prod.gift_certificate_send == 'y') }
    {include file="product_builder_child2.tpl" product=$build_prod}
  {* if children use separate forms *}
  {else}
    {include file="product_builder_child.tpl" product=$build_prod}
  {/if}

{* if product pack *}

{elseif $build_prod.gift_set == 'y'}
  {include file="product_builder_giftset.tpl" product=$build_prod}
{/if}

{if $build_prod.is_parent != 'y' || $settings.child_display_type == '2' || ($build_prod.form_id != '' && $build_prod.form_id != 0)}
</form>
{/if}

