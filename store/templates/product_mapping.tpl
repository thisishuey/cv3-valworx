{if $possible_mappings.display == 'y'}
    <div class="mapping col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="col-lg-6 col-xs-12">
            <label class="recipent_mapping_shipto pull-left col-md-5 col-sm-4 col-xs-5 pdd_lt0" for="recipent_mapping">Ship to:</label>
            <div class="col-md-7 col-sm-8 col-xs-7 padd_0">
                <select class="form-control input-sm" name="recipient_mapping" id="recipient_mapping{if $settings.child_display_type == '1'}_ob_{$product.prod_id}{/if}">
                    <option value="me" label="Recipient">Recipient</option>
                    {foreach from=$possible_mappings.recipients item=recipient key=recipient_key}
                        <option value="{$recipient_key}" label="{$recipient}">{$recipient}</option>
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="col-lg-6 col-xs-12">
            <label class="new_recipient_mapping pdd_lt0 col-md-5 col-sm-4 col-xs-5"  for="new_recipient_mapping">or</label>
            <div class="col-md-7 col-sm-8 col-xs-7 padd_0">
                <input type="text" class="form-control input-sm" id="new_recipient_mapping{if $settings.child_display_type == '1'}_ob_{$product.prod_id}{/if}" name="new_recipient_mapping" {*onblur="if (this.value=='') this.value='Add New';" onfocus="javascript: if (this.value=='Add New') this.value='';" *} value="" placeholder="Add New" />
            </div>
            {if $possible_mappings.is_member != 'y'}
                {*<p><a href="/member">Log in to access address book</a></p>*}
            {/if}
        </div>
    </div>
{/if}
