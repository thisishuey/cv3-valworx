{if $valid.return}
    {if isset($form_error_data.$prod_id) && $form_error_data.$prod_id.$fieldname != ''}
        {assign var="selected" value=$form_error_data.$prod_id.$fieldname}
    {elseif empty($form_error_data)}
        {assign var="selected" value=$valid.$fieldname}
    {/if}
{else}
    {assign var="selected" value=$field.default}
{/if}

<div class="form-group {if $valid.return and $field.req == 'y' and ((isset($form_error_data.$prod_id) and $form_error_data.$prod_id.$fieldname == '') || (empty($form_error_data) && $valid.$fieldname == ''))} has-error {/if}">
    <label for="{$fieldname}">{if $field.req == 'y'}<span class="req">*</span> {/if}{$field.label}:</label>
    <select name="{$fieldname}" id="{$fieldname}" class="formtext form-control">
        {html_options values=$field.values output=$field.names selected=$selected}
    </select>
</div>