{if $valid.return && !empty($error)}
  <div class="alert alert-danger">
    <p><em>There was an error.</em></p>
    <p>Please double-check any highlighted fields.</p>
    <p><em>{$error}</em></p>
  </div>
{/if}

<div class="form-container">

<form method="post" action="index.php" name="generic_form" id="generic_form"> 
<input type="hidden" name="action" value="GenericForm"/>

<fieldset>
  <div class="row">
{foreach from=$generic_form item=field}
  {assign var=fieldname value="field_"|cat:$field.id}
  {assign var=field_type value=$field.field_type}

  {if $valid.return}
    {if $valid.is_valid.$fieldname == 'y'}
      {assign var="selected" value=$valid.$fieldname}
    {else}
      {assign var="selected" value=$field.default_value}
    {/if}
  {else}
    {assign var="selected" value=$field.default_value}
  {/if}

  {assign var='field_error' value=0}
  {if $valid.return and $valid.is_valid.$fieldname == 'n'}{assign var='field_error' value=1}{/if}

  <div class="{if $field_type == 'generic_checkbox' || $field_type == 'generic_multicheckbox' || $field_type == 'generic_radio' || $field_type == 'generic_textarea'}col-sm-12{else}col-sm-6{/if}">
  <div class="form-group {if $field_type == 'generic_checkbox' || $field_type == 'generic_multicheckbox' || $field_type == 'generic_radio'}controlset {/if}{if $field_error} has-error has-feedback bg-danger{/if}">

  {if $field_type == 'generic_checkbox' || $field_type == 'generic_multicheckbox' || $field_type == 'generic_radio'}
    <input class="form-control" type="hidden" name="generic_custom_field" value="{$fieldname}" />
  {/if}

  {if $field_type == 'generic_text'}
    <label for="{$fieldname}">{if $field.required == 'y'}<span class="req">* </span>{/if}{$field.label}</label>
    <input class="form-control" type="text" name="{$fieldname}" id="{$fieldname}" class="{if $field_error}error{/if}" value="{$selected}" size="{$field.size}" maxlength="{$field.maxlength}" />{if $field_error}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    <span class="help-block">{$field.custom}</span>

  {elseif $field_type == 'generic_textarea'}
    <label for="{$fieldname}">{if $field.required == 'y'}<span class="req">* </span>{/if}{$field.label}<br /><div class="help-block">{$field.custom}</div></label>
    <textarea name="{$fieldname}" id='{$fieldname}' rows="{$field.rows}" cols="{$field.cols}" class="form-control {if $field_error}error{/if}" placeholder="">{$selected}</textarea>{if $field_error}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}

  {elseif $field_type == 'generic_subheading'}
    <h3>{$field.label}</h3>

  {elseif $field_type == 'generic_select'}
    <label for="{$fieldname}" class="select">{if $field.required == 'y'}<span class="req">* </span>{/if}{$field.label}</label>
    <select class="form-control" name="{$fieldname}" id="{$fieldname}"{if $field_error} has-error has-feedback bg-danger{/if}>
    {assign var=values value='|'|explode:$field.options}
      {if !$selected}<option value=''>{$field.label}</option>{/if}
      {html_options values=$values output=$values selected=$selected}
    </select>{if $field_error}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    <span class="help-block">{$field.custom}</span>

  {elseif $field_type == 'generic_break'}<br />

  {elseif $field_type == 'generic_checkbox'}
    <div class="checkbox">
      {if $field.label != ''}
        <label for="{$fieldname}" class="title">{if $field.required == 'y'}<span class="req">* </span>{/if}{$field.label}</label>
      {else}
        <span class="label"></span>
      {/if}
      <label for="{$fieldname}"><input type="checkbox" name="{$fieldname}" id="{$fieldname}" />{$field.options}</label>
    </div>{if $field_error}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    <span class="help-block">{$field.custom}</span>

  {elseif $field_type == 'generic_multicheckbox'}
    {assign var=values value='|'|explode:$field.options}
    <label for="{$fieldname}" class="title">{if $field.required == 'y'}<span class="req">* </span>{/if}{$field.label}</label>
    {foreach from=$values key=k item=f}
      {assign var='default' value=$f|in_array:$field.default}
       <div class="checkbox">
          <label for='{$fieldname}{$k}'><input type='checkbox' value='{$f}' name='{$fieldname}[]' id='{$fieldname}{$k}' {if $default || in_array($f,$selected)}checked="checked"{/if} /> 
      {$f}</label>
     </div>{if $field_error}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    {/foreach}{$selected}
    <span class="help-block">{$field.custom}</apan>

  {elseif $field_type == 'generic_radio'}
    
    <label for="{$fieldname}" class="title">{if $field.required == 'y'}<span class="req">* </span>{/if}{$field.label}</label>
    {assign var=values value='|'|explode:$field.options}
    {foreach from=$values key=k item=f}
      {if $default == $f}{assign var='default' value=$field.default}{else}{assign var='default' value=0}{/if}
        <div class="radio">
        <label><input type='radio' value='{$f}' name='{$fieldname}' id='{$fieldname}{$k}' {if $default}checked="yes"{/if} />{$f}</label>
        </div>{if $field_error}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    {/foreach}
    <span class="help-block">{$field.custom}</span>

  {elseif $field_type == 'generic_fileupload'}
  <fieldset data-role="controlgroup" id="fieldset{$field.id}">
    <label for="pickfile{$field.id}">{if $field.required == 'y'}<span class="req">* </span>{/if}{$field.label}</label>
    <input class="form-control" type="file" id="pickfile{$field.id}" name="pickfile{$field.id}" />
    <input type="hidden" id="{$fieldname}" name="{$fieldname}" class="setfile" />
    <div id="filestatus"><div id="progress_bar"><div class="percent">0%</div></div><span id="status"></span></div>{if $field_error}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
    <script type="text/javascript">
      document.getElementById('pickfile{$field.id}').addEventListener('change', handleFileSelect, false);
    </script>
    <span class="help-block">{$field.custom}</span>
  </fieldset>

  {elseif $field_type == 'generic_image_verify'}
    {include file="generic_image_verify.tpl"}
  {else}Unknown field type: {$field_type}<br />
  {/if}

  </div>
 </div>
 {/foreach}

 </div>
</fieldset>
  <div class="buttonrow">
    <input type="submit" name="submit_generic_form" value="Submit" class="button medium style1 btn btn-default" />
  </div>
</form>

</div>