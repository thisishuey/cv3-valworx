{include file="_top.tpl"}

<h3>Checkout</h3>
<br />
<font class="normaltext"><font color="#FF0000">You have {$totals.qty} product(s) in your cart.</font></font><br>

{if $password_error != ''}
  <div align="center" class="normaltext" style="color: red;"><b>{$password_error}<br /></b></div>
{/if}

{if $error != ''}
  <div align="center" class="normaltext" style="color: red;"><b>{$error}</b></div>
{/if}

<form method="post" action="index.php" name="checkout">
<input type="hidden" name="source_code" value="{$source_code}">
<input type="hidden" name="action" value="CheckoutMemberLogin">
<table id="checkoutPanel" border="0" width="100%" cellspacing="3" cellpadding="0">
{* If a Member is logged in, they don't have to login again *}
{if $is_member=='y'}
  <tr>
    <td colspan="2" id="cartHelpText">
      <b>Welcome back, {$member.first_name} {$member.last_name}!</b>&nbsp;&nbsp;<a href="/member_login/1">Not {$member.first_name}?</a>
    </td>
  </tr>
{else}
  <tr>
    <td>
      <table cellpadding="0" cellspacing="0" style="border: 1px solid #ccc;">
        <tr>
          <td colspan="2" id="cartHelpText">
            <h3 style="text-align:center;">Guest Checkout</h3><br>
            {#checkoutcontact_txt#}
          </td>
        </tr>
        <tr>
          <td align="right" class="normaltext">
            <b>E-mail:&nbsp;</b>
          </td>
          <td>
            <input type="text" name="contact_email" value="{$valid.contact_email}" size="25" class="formtext"><br>
          </td>
        </tr>
        <tr>
          <td align="right" class="normaltext">
            <b>Phone:&nbsp;</b>
          </td>
          <td>
            <input type="text" name="contact_phone" value="{$valid.contact_phone}" size="25" class="formtext">
          </td>
        </tr>
      </table>
    </td>
    <td>
      <table cellspacing="0" cellpadding="0" style="border: 1px solid #ccc;">
        <tr>
          <td colspan="2" id="cartHelpText">
            <h3 style="text-align:center;">Returning Customers</h3><br>
            {#checkoutlogin_text#}      
          </td>
        </tr>
        <tr>
          <td align="right" class="normaltext">
            <b>E-mail:&nbsp;</b>
          </td>
          <td>
            <input type="text" name="username" value="{$valid.username}" size="25" class="formtext">
          </td>
        </tr>
        <tr>
          <td align="right" class="normaltext">
            <b>Password:&nbsp;</b>
          </td>
          <td>
            <input type="password" name="password" value="{$valid.password}" size="25" class="formtext">
          </td>
        </tr>
      </table>
    </td>
  </tr>
{/if}

{* if they need to choose how many shiptos *}
{if $totals.qty > 1 && $checkout_type == 1 && $product_mapping != 'add_cart'}
  <tr>
    <td colspan="2" id="cartHelpText">
      How many addresses will you be shipping to?&nbsp;
      <select name="ship_num" onChange="javascript: setCookie('shipto',this.value);" id="ship_num">
        {html_options options=$options.ship_num selected=$valid.ship_num}
      </select>
{literal}
<script type="text/javascript">
if (getCookie('shipto') != '') {
   document.getElementById('ship_num').value = getCookie('shipto');
}
</script>
{/literal}
    </td>
  </tr>

{elseif $product_mapping == 'add_cart'}
  <input type="hidden" name="ship_num" value="{$ship_num}">
{else}
  <input type="hidden" name="ship_num" value="1">

{/if}

  <tr>
    <td colspan="2" id="cartHelpText">
      If you have received one of our catalogs, please enter the catalog code found on the address label:
    </td>
  </tr>
  <tr>
    <td align="right" class="normaltext">
      <b>Catalog Code:</b>
    </td>
    <td>
      <input type="text" name="cat_code" value="{$valid.cat_code}" size="25" class="formtext">
    </td>
  </tr>
  <tr>
    <td colspan="2">
      &nbsp;
    </td>
  </tr>
  <tr>
    <td>
      &nbsp;
    </td>
    <td colspan="2">
      <input type="hidden" name="totalqty" value="{$totals.qty}">
      <input type="submit" name="submit" value="Continue >"  class="addtocart_btn btnstyle1">
    </td>
  </tr>
</table>
</form>
{include file="_bottom.tpl"}

