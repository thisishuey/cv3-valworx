{config_load file="store.conf" scope="global"}
<html>
{include file="_meta.tpl"}
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">

<table border="0" cellspacing="0" cellpadding="1" width="100%">
  <tr>
    <td colspan="3">
      <h4>{$prod_name} Details</h4>
    </td>
  </tr> 
  <tr>
    <td class="normalText" valign="top">
      <b>Qty</b>
    </td>
    <td class="normalText" valign="top">
      <b>Item #</b>
    </td>
    <td class="normalText" valign="top">
      <b>Product</b>
    </td>
  </tr> 
  {foreach from=$info key=cart_id item=value}
    <tr>
      <td class="normalText" valign="top">
        {$value.qty}
      </td>
      <td id="cartHelpText" valign="top">
        {$value.sku}
      </td>
      <td id="cartHelpText" valign="top">
        {$value.name}
      </td>
    </tr>
  {/foreach}
  <tr>
    <td class="normalText" colspan="3">
      &nbsp;
    </td>
  </tr> 
  <tr>
    <td class="normalText" colspan="3">
      &nbsp;
    </td>
  </tr> 
  <tr>
    <td id="cartHelpText" align="center" valign="bottom" colspan="3">
      <a href="javascript:window.close();">Click here to close</a> 
    </td>
  </tr>
</table>
</body>
</html>
