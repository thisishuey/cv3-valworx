{config_load file="store.conf" scope="global"}
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<table width="550" border="0" align="center">
  <tr>
    <td class="normaltext">
      {$first_name} {$last_name} has opened a wishlist at {$store} and wanted to let you know.  You can view {$first_name}'s list by clicking on the link below or by searching for it at <a href="https://{$wishlist_url}">https://{$site_url}</a>. Below you will find a personal message from {$first_name}.
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;
    </td>
  </tr>
  <tr>
    <td class="normaltext">
      {$personal_message}
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;
    </td>
  </tr>
  <tr>
    <td class="normaltext">
      <a href="https://{$wishlist_url}">View {$first_name}'s wishlist</a>
    </td>
  </tr>
</table>
</body>
</html>