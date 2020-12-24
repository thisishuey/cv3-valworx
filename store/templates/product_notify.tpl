{include file="_top.tpl"}

<h3>{$product.prod_name}</h3>
<a href="/product/{$back_pid}{$url_split_char}{$back_cid}">Back to Product</a>
<p class="pdd_tp10 mar_0">Enter the following information and you will be notified once the item is in stock.</p>
{if $error != ''}
    <p class="normaltext text-danger"><b>{$error}</b></p>
        {/if}
<form method="post" action="index.php"> 
    <input type="hidden" name="action" value="ProductNotify">
    <div class="form-group clearfix">
        <label class="col-xs-12 col-sm-1 col-md-1 pdd_lt0">Email</label>
        <div class="col-xs-12 col-sm-4 col-md-4 pdd_lt0">
            <input type="text" name="email" value="" size="30" maxlength="50" class="form-control">
        </div>
    </div>


    {if $product.is_parent == 'y'}
        <div class="form-group">
            <label>Select the sub-products you are intereseted in</label>
            {foreach from=$product.children item=child}
                {if $child.inv_control_exempt != 'y' && $child.inventory_control < 1 && $child.on_order < 1}
                    <div class="checkobox"><label><input type="checkbox" name="subprods[]" value='{$child.prod_id}' checked />{$product.prod_name} - {$child.prod_name}</label></div>
                        {/if}
                    {/foreach}
        </div>
    {/if}

    {if $product.has_attributes == 'y'}

        <div class="form-group">
            <label>Select the attributes you are interested in</label>
        </div>
        <div class="form-group">
            {if $attributes.names.num >= 1}                            
                {$attributes.names.att1}                            
            {/if}
            {if $attributes.names.num >= 2}
                {$attributes.names.att2}                            
            {/if}
            {if $attributes.names.num >= 3}
                {$attributes.names.att3}
            {/if}
            {if $attributes.names.num >= 4}
                {$attributes.names.att4}
            {/if}
        </div>  
        {foreach from=$attributes.attributes item=attribute}
            {if $product.inv_control_exempt != 'y' && $attribute.qty < 1 && $attribute.on_order < 1}
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="attys[]" value='{$attribute.id}' checked/>
                        {if $attributes.names.num >= 1}
                            {$attribute.att1}
                        {/if}
                        {if $attributes.names.num >= 2}
                            {$attribute.att2}
                        {/if}
                        {if $attributes.names.num >= 3}
                            {$attribute.att3}
                        {/if}
                        {if $attributes.names.num >= 4}
                            {$attribute.att4}
                        {/if}
                    </label>
                </div>
            {/if}
        {/foreach}
    {/if}
    <div class="form-group">
        <input type="hidden" name="prod_id" value="{$prod_id}" />
        <input type="hidden" name="cat_id" value="{$cat_id}" />
        <label class="col-sm-1 col-md-1 col-xs-12 hgt_0">&nbsp;</label>
        <input type="submit" name="submit"  value="Notify Me" class="addtocart_btn btn btn-primary">
    </div>
</form>
{include file="_bottom.tpl"}