{if $valid.return}
 {if isset($form_error_data.$prod_id) && $form_error_data.$prod_id.$fieldname != ''}
  {assign var="selected" value=$form_error_data.$prod_id.$fieldname}
 {elseif empty($form_error_data) && $valid.fieldname != ''}
  {assign var="selected" value=$valid.$fieldname}
 {else}
  {assign var="selected" value=$field.default}
 {/if}
{else}
 {assign var="selected" value=$field.default}
{/if}

<div class="controlset{if $valid.return and $field.req == 'y' and ((isset($form_error_data.$prod_id) and $form_error_data.$prod_id.$fieldname == '') || (empty($form_error_data) && $valid.$fieldname == ''))} error{/if}">
 <span class="label">{if $field.req == 'y'}<span class="req">*</span> {/if}{$field.label}:</span>
 <input type="hidden" name="check_custom_field{if $settings.additional_prod_display_type == '2'}_{$prod_id}{/if}" value="{$fieldname}" />
 {html_checkboxes name="$fieldname" values=$field.values output=$field.names selected=$selected}
</div>