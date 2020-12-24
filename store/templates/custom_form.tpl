{if $custom_form_num != ''}
<div class="prod-form">
 <fieldset>
  <legend>Additional Information</legend>
  <input type="hidden" name="custom_form{if $settings.additional_prod_display_type == '2'}_{$prod_id}{/if}" value="{$custom_form_num}" />

  {foreach from=$custom_form key=fieldname item=field}
   {if $settings.additional_prod_display_type == '2'}
    {assign var="fieldname" value=$fieldname|cat:"_$prod_id"}
   {/if}
   {include file=$field.type|cat:".tpl" id="0" prod_id=$prod_id}
  {/foreach}

 </fieldset>
</div>

{/if}
