{if $product.additional_prods|@count > 0}

    <div id="additional" class="clearfix">

        {foreach from=$product.additional_prods item=product}
            {assign var=prod_id value=$product.prod_id}
            {assign var=cid value=""}
            {assign var=isAdditional value="y"}

            {if $add_form_errors.errors > 0 && $settings.additional_prod_display_type == '2'}
                {$add_form_errors.$prod_id}
            {/if}

            {if ($product.is_parent != 'y' || $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) || ($product.gift_certificate == 'y' && $product.gift_certificate_send == 'y') || $product.gift_wrap == 'y') && $settings.additional_prod_display_type != '2'}
                <form method="post" name="product_form" action="index.php">
                    <input type="hidden" name="action" value="AddCart">
                {/if}

                <div class="additional-prod col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    {include file="display_product.tpl" product=$product}
                </div>

                {if ($product.is_parent != 'y' || $settings.child_display_type == '2' || ($product.form_id != '' && $product.form_id != 0) || $product.gift_wrap == 'y') && $settings.additional_prod_display_type != '2'}
                </form>
            {/if}

        {/foreach}

    </div>

{/if}