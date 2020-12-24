{assign var=attributes value=$attys.$prod_id}
<input type="hidden" name="num_attributes{if $settings.additional_prod_display_type == '2'}{$prod_id}{/if}" value="{$attributes.num}" />
<div class="row">
<div class="col-xs-8 col-sm-7 col-md-6 col-lg-5">
<select name="option1{if $settings.additional_prod_display_type == '2'}_{$prod_id}{/if}" id="option1_{$prod_id}" class="formtext form-control input-sm" {if $attributes.num > '1'}onchange="javascript: populate_options({$prod_id},{$attributes.num}, 1);
        showAttyImage('{$prod_id}', this.options[this.selectedIndex].text, document.getElementById('product_image-{$prod_id}'), getProdImages{$prod_id}());"{elseif $attributes.num == 1} onchange="javascript: if (this.value != '') {ldelim}
        populate_price({$prod_id}, 1, '{$settings.interactive_pricing}', '{$product.price}', '{$product.special}');
            showAttyImage('{$prod_id}', this.options[this.selectedIndex].text, document.getElementById('product_image-{$prod_id}'), getProdImages{$prod_id}());
            showDonationFields({$prod_id}, 1);
            check_status({$prod_id}, 1);
        {rdelim}"{/if}>
    <option value="" selected="selected">Choose {$attributes.names.attribute1} -</option>
    {foreach from=$attributes.attributes item=att key=id}
      <option value="{$att.name|replace:'&':'&amp;'|replace:'"':'&quot;'}">{if $att.status == 'active' && $att.backordered != ''}{$att.name} *{$att.backordered}{else}{$att.name}{/if}</option>
    {/foreach}
</select>
{if 2 <= $attributes.num}
    <select name="option2{if $settings.additional_prod_display_type == '2'}_{$prod_id}{/if}" id="option2_{$prod_id}" class="formtext form-control input-sm"{if $attributes.num > '2'}onchange="populate_options({$prod_id},{$attributes.num}, 2);
        showAttyImage('{$prod_id}', this.options[this.selectedIndex].text, document.getElementById('product_image-{$prod_id}'), getProdImages{$prod_id}());"{elseif $attributes.num == 2} onchange="javascript: if (this.value != ' ') {ldelim}
        populate_price({$prod_id}, 2, '{$settings.interactive_pricing}', '{$product.price}', '{$product.special}');
            showAttyImage('{$prod_id}', this.options[this.selectedIndex].text, document.getElementById('product_image-{$prod_id}'), getProdImages{$prod_id}());
            showDonationFields({$prod_id}, 2);
            check_status({$prod_id}, 2);
        {rdelim}"{/if}>
        <option value="" selected="selected">Choose {$attributes.names.attribute2} -</option>
    </select>
{/if}
{if 3 <= $attributes.num}
    <select name="option3{if $settings.additional_prod_display_type == '2'}_{$prod_id}{/if}" id="option3_{$prod_id}" class="formtext form-control input-sm"{if $attributes.num > '3'}onchange="populate_options({$prod_id},{$attributes.num}, 3);
        showAttyImage('{$prod_id}', this.options[this.selectedIndex].text, document.getElementById('product_image-{$prod_id}'), getProdImages{$prod_id}());"{elseif $attributes.num == 3} onchange="javascript: if (this.value != '') {ldelim}
        populate_price({$prod_id}, 3, '{$settings.interactive_pricing}', '{$product.price}', '{$product.special}');
            showAttyImage('{$prod_id}', this.options[this.selectedIndex].text, document.getElementById('product_image-{$prod_id}'), getProdImages{$prod_id}());
            showDonationFields({$prod_id}, 3);
            check_status({$prod_id}, 3);
        {rdelim}"{/if}>
        <option value="" selected="selected">Choose {$attributes.names.attribute3} -</option>
    </select>
{/if}
{if 4 <= $attributes.num}
    <select name="option4{if $settings.additional_prod_display_type == '2'}_{$prod_id}{/if}" id="option4_{$prod_id}" class="formtext form-control input-sm" onchange="if (this.value != ' ') {ldelim}
        populate_price({$prod_id}, 4, '{$settings.interactive_pricing}', '{$product.price}', '{$product.special}');
            showAttyImage('{$prod_id}', this.options[this.selectedIndex].text, document.getElementById('product_image-{$prod_id}'), getProdImages{$prod_id}());
            showDonationFields({$prod_id}, 4);
            check_status({$prod_id}, 4);
        {rdelim}">
        <option value="" selected="selected">---Choose {$attributes.names.attribute4}---</option>
    </select>
{/if}
</div>
</div>
<script type="text/javascript">
    {* sort the images into a more usable format *}
    function getProdImages{$prod_id}() {ldelim}
        var images = new Array();
        images[0] = new Array(3)
        images[0][0] = '{$product.web_image}';
        images[0][1] = '{$product.large_image}';
        images[0][2] = '{$product.full_image}';
    {foreach from=$product.images item="image" key="img_key"}
        {if $image.attribute_id != '' && $image.type == 'attribute' && $image.inactive != 'y'}
        images['{$image.attribute_id}'] = new Array(3);
        images['{$image.attribute_id}'][0] = '{$image.thumbnail}';
        images['{$image.attribute_id}'][1] = '{$image.large}';
        images['{$image.attribute_id}'][2] = '{$image.popup}';
        {/if}
    {/foreach}
        return images;
    {rdelim}
</script>
