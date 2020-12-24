{*************************************************
 * Purpose: send member registration confirmation
 * Available Fields:
 * {$first_name}
 * {$last_name}
 * {$title}
 * {$company}
 * {$billing_address1}
 * {$billing_address2}
 * {$billing_city}
 * {$billing_state}
 * {$billing_country}
 * {$billing_zip}
 * {$email}
 * {$phone}
 * {$link}
 * {$approved}
 **************************************************}
{if $approved == 'y'}  {*if you do not require member approval*}

{assign var="src" value="utm_source=transactional_email&utm_medium=email&utm_campaign=member_register"}
{assign var="heading" value=""}

{include file="email_header.tpl" src="$src" heading="$heading"}

      Welcome to our site, {$first_name} {$last_name}!
      <br /><br />
      Please go to the URL below to confirm:
      <br /><br />
      <a href="{$link}">{$link}</a>
      <br /><br />
      Thanks for joining our site!

{include file="email_footer.tpl" src="$src"}
{else}

{assign var="src" value="utm_source=order_confirmation_email&utm_medium=email&utm_campaign=member_register"}
{assign var="heading" value=""}

{include file="email_header.tpl" src=$src heading=$heading}

      Congratulations, {$first_name} {$last_name} and welcome to the member program.
      <br /><br />
      Please go to the URL below to confirm:
      <br /><br />
      <a href="{$link}">{$link}</a>
      <br /><br />
      Thanks for joining our site!

{include file="email_footer.tpl" src=$src}
{/if}
