<tr valign="top">
  <td class="normaltext" align="right" width="40%">
    {if $field.required == 'y'}
      <font color="#ff0000">*</font>
    {/if}
    {$field.label} 
  </td>
  <td class="normaltext" align="left">
    {if $valid.return}
      {assign var="selected" value=$valid.$field_name}
    {else}
      {assign var="selected" value=$field.default_value}
    {/if}
    <select name="{$field_name}" class="formtext">
      {html_options values=$field.options|array:"|" output=$field.options|array:"|" selected=$selected}
    </select>
    {if $valid.return and $field.required == 'y' and $valid.$field_name == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </td>
</tr>
