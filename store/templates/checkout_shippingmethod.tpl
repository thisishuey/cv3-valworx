{include file="_top.tpl"}

<h3>Shipping Options</h3>
<br />
<span class="normaltext"><font color="#FF0000">You have {$totals.qty} product(s) in your cart.</font><br>

<font color="#FF0000">*</font> Indicates a required field</span>

{if $valid.return == "1"}
<br><div align="center" class="normaltext"><b>There has been an error. Please double check any fields that show an '<font color="#ff0000">X</font>'</b></div><br>
{/if}

<form method="post" action="index.php" name="ship_form">
<input type="hidden" name="action" value="CheckoutShippingMethod">

<table width="100%" border="0" cellspacing="0" cellpadding="3" id="checkoutPanel">
  <tr>
    <td align="right" class="normaltext">
      Shipping Method:
 </td>
    <td>
      <select name="s_method" class="formtext">
        {html_options options=$options.shipping.method selected=$valid.s_method.1}
      </select>
    </td>
  </tr>
  {if $get_ship_type}
    <tr>
      <td align="right" class="normaltext" valign="top">
        Type:
      </td>
      <td align="left" class="normaltext">
        {include file="ship_address_type.tpl" num=1}
      </td>
    </tr>
  {/if}
  <tr>
    <td align="right" class="normaltext">
      Requested Ship Date: <br /><span class="smalltext"><i>(i.e. {$smarty.now|date_format:"%Y-%m-%d"})</i></span>
    </td>
    <td>
      <input type="text" name="s_shipon" class="formtext" value="{$valid.s_shipon.1}">
      <select name="choose" class="formtext" onChange="javascript:changeDate('s_shipon','choose');">
        {html_options options=$options.shipon}
      </select>
    </td>
  </tr>

  <tr>
    <td align="right">
      &nbsp;
      <!--<input type="submit" name="submit" value="Cancel">-->
    </td>
    <td>
      <input type="submit" name="submit" value="Continue >" class="addtocart_btn btnstyle1">
    </td>
  </tr>
</table>
</form>
{include file="_bottom.tpl"}
