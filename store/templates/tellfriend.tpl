{config_load file="store.conf" scope="global"}
<html>
{include file="_meta.tpl"}
<body id="{$view}" class="popup">

{if $prod_id != 'yes'}

<form method="post" name="ship_form" action="index.php">
<input type="hidden" name="action" value="TellFriend" />
<input type="hidden" name="page" value="{$prod_display_type}" />

<table border="0" cellspacing="0" cellpadding="3" width="100%">
  <tr>
    <th colspan="2">
      Tell a Friend 
    </th>
  </tr>
  <tr>
    <td class="normaltext" colspan="2" align="center">
      Enter the following information to share this page with a friend. 
    </td>
  </tr>
  <tr>
    <td colspan="2">
      &nbsp;
    </td>
  </tr>
  <tr valign="top">
    <td valign="top" align="right">
      <span class="normaltext">From First Name:&nbsp;</span>
    </td>
    <td>
      <input type="text" name="from_first" value="{$valid.from_first}" size="30" maxlength="40" class="formtext" />
    </td>
  </tr>
  <tr valign="top">
    <td valign="top" align="right">
      <span class="normaltext">From Last Name:&nbsp;</span>
    </td>
    <td>
      <input type="text" name="from_last" value="{$valid.from_last}" size="30" maxlength="40" class="formtext" />
    </td>
  </tr>
  <tr valign="top">
    <td valign="top" align="right">
      <span class="normaltext">From Email:&nbsp;</span>
    </td>
    <td>
      <input type="text" name="from_email" value="{$valid.from_email}" size="30" maxlength="40" class="formtext" />
    </td>
  </tr>
  <tr valign="top">
    <td valign="top" align="right">
      <span class="normaltext">To First Name:&nbsp;</span>
    </td>
    <td>
      <input type="text" name="to_first" value="{$valid.to_first}" size="30" maxlength="40" class="formtext" />
    </td>
  </tr>
  <tr valign="top">
    <td valign="top" align="right">
      <span class="normaltext">To Last Name:&nbsp;</span>
    </td>
    <td>
      <input type="text" name="to_last" value="{$valid.to_last}" size="30" maxlength="40" class="formtext" />
    </td>
  </tr>
  <tr valign="top">
    <td valign="top" align="right">
      <span class="normaltext">To Email:&nbsp;</span>
    </td>
    <td>
      <input type="text" name="to_email" value="{$valid.to_email}" size="30" maxlength="40" class="formtext" />
    </td>
  </tr>
  <tr valign="top">
    <td valign="top" align="right">
      <span class="normaltext">Message:&nbsp;</span>
    </td>
    <td>
      <textarea name="message" rows="15" cols="25" class="formtext">{if $valid.message != ''}{$valid.message}{else}{#tellafriend_message#}{/if}</textarea>
    </td>
  </tr>
</table>

<div class="popupbuttons">
 <input type="hidden" name="prod_id" value="{$prod_id}" />
 <input type="hidden" name="cat_id" value="{$cat_id}" />
 <input type="hidden" name="prod_name" value="{$prod_name}" />
 <input type="submit" name="submit" value="Tell a Friend" class="addtocart_btn btnstyle1"/>
</div>
</form>

{else}

<table border="0" cellspacing="0" cellpadding="3" width="100%">
  <tr>
    <th>
      Tell a Friend 
    </th>
  </tr>
    <tr>
      <td class="normaltext" align="center" height="100">
        Your email has been sent to {$to_email}.  Thank you for your interest. 
      </td>
    </tr>
</table>


<div class="popupbuttons">
 <button onClick="window.close();" class="button medium style1">Close Window</button>
</div>

{/if}

</body>
</html>