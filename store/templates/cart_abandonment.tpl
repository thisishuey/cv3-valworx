{if $email_id == '3'}
{assign var="src" value="utm_source=transactional_email&utm_medium=email&utm_campaign=cartemail&"|cat:$session_link}
{elseif $email_id == '4'}
{assign var="src" value="utm_source=transactional_email&utm_medium=email&utm_campaign=cartemail2&"|cat:$session_link}
{/if}

{assign var="heading" value=""}

{include file="email_header.tpl" src=$src heading=$heading}


    {if $first_name !=''}{$first_name} -
   <br><br> {/if}
        Did you leave something behind in your cart at <a href="https://www.valworx.com/viewcart/?{$src}" target="_blank" style="color:#333;font-weight:bold;text-decoration:none">Valworx.com</a>? Fear not, we saved it for you:<br>
    <br>

 {if $cart|@count > 0}
      <table border="0" cellspacing="0" cellpadding="5" align="center" style="font-family:Arial, Helmet, Freesans, Helvetica, sans-serif; font-size: 14px; text-align:left; line-height: 24px;padding:0 20px !important;color:#484848">
       <tr>
        <th>
          <div align="left">Product{if $recipient_mapping != ''}s for {$recipient_mapping}{/if}</div>
        </th>
        <th align="center">Qty</th>
        <th align="center">Unit Price</th>
        <th align="right">Total Price</th>
       </tr>
       {foreach from=$cart key=key item=prod}
       <tr>
        <td>
          <a href="https://www.valworx.com/viewcart/?{$src}" target="_blank" style="color:#333;text-decoration:none">{$prod.name}</a><br><a href="https://www.valworx.com/viewcart/?{$src}" target="_blank" style="color:#666;text-decoration:none">{$prod.sku}</a>
        </td>
        <td align="center">{$prod.qty}</td>
        <td align="center">{$currency_type}{$prod.price|commify}</td>
        <td align="center">
         {math equation='x*y' x=$prod.price y=$prod.qty assign='line_total'}
         {$currency_type}{$line_total|commify}
        </td>
       </tr>
       {/foreach}
      </table>
      <br>

      <p align="center"><a href="https://www.valworx.com/viewcart/?{$src}" target="_blank"><img src="{$img_prefix}/images/email/checkout.jpg" alt="Return to Your Cart" border="0"></a></p>
     {/if}
	   <br>
	<table style="font-family:Arial, Helmet, Freesans, Helvetica, sans-serif; font-size: 14px; text-align:left; line-height: 24px;color:#484848" cellpadding="10">
		<tr>
			<td width="50%" align="center">
				<a href="https://www.valworx.com/shipping?{$src}" target="_blank"><img src="{$img_prefix}/images/cs_fast_free_shipping_100.png" width="100" border="0"></a>
				<br><br>
				<a href="https://www.valworx.com/shipping?{$src}" target="_blank" style="color:#CD2027;text-decoration:none">Fast, Free Shipping</a><br>Free ground shipping on orders over $99.
			</td>
			<td width="50%" align="center">
				<a href="https://www.valworx.com/category/technical-support?{$src}" target="_blank"><img src="{$img_prefix}/images/ts-tech_resources_100.png" width="100" border="0"></a>
				<br><br>
				<a href="https://www.valworx.com/category/technical-support?{$src}" target="_blank" style="color:#CD2027;text-decoration:none">Free Tech Support</a><br>Get comprehensive, expert help with selection, installation and service.
			</td>
		</tr>
	</table>
	<br>
Please <a href="mailto:sales@valworx.com" style="color:#333;font-weight:bold;text-decoration:none">email us</a> or call <a href="tel:80051101001" style="text-decoration:none;color:#484848;font-weight:bold">1-800-511-0100</a> if you have any questions.<br>
<br>
Regards-<br>
Valworx - Customer Service
  
{include file="email_footer.tpl" src=$src}