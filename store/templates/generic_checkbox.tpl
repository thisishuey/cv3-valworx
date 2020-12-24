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
    {html_checkboxes name="$field_name" values=$field.options output=$field.options selected=$selected}
    {if $valid.return and $field.required == 'y' and $valid.$field_name == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </td>
</tr>