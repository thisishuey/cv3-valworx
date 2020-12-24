{config_load file="store.conf" scope="global"}
<html>
{include file="_meta.tpl"}

{if isset($smarty.get.att_id)}
  {assign var="att_id" value=$smarty.get.att_id}

  {foreach from=$product.images item="image" key="key"}
    {if $image.attribute_id == $att_id}
      {assign var="full_image" value=$image.popup|img_prefix}
    {/if}
  {/foreach}
{/if}

{if $full_image == ''}
  {assign var="full_image" value=$product.full_image|img_prefix}
{/if}

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
<table width="100%">
  <tr>
    <td align="center">
      <a href="javascript:window.close();"><img src="{$full_image}" border="0"></a><br>
      <a href="javascript:window.close();">Click here to close</a>
    </td>
  </tr>
</table>
</body>
</html>
