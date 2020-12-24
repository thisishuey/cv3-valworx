<tr valign="top">
  <td class="normaltext" align="right" width="40%">
    {if $field.required == 'y'}
      <font color="#ff0000">*</font>
    {/if}
    {$field.label} 
  </td>
  <td align="left">
    <textarea name="{$field_name}" cols="{$field.cols}" rows="{$field.rows}" class="formtext">{if $valid.return && $valid.$field_name != ''}{$valid.$field_name}{else}{$field.default_value}{/if}</textarea>
    {if $valid.return and $field.required == 'y' and $valid.$field_name == ''} <font color="#ff0000"><b>X</b></font> {/if}
  </td>
</tr>
