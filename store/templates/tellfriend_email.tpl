{**********************************************
 * Purpose: to send an email to the tell a friend recipient
 * Available Fields:
 * {$from_first} 
 * {$from_last}
 * {$from_email}
 * {$to_first}
 * {$to_last}
 * {$to_email}
 * {$message}
 * {$link}
 * {$link2} - an alternate option for prod_detail_list users
 * {$prod_name}
 **********************************************}
<html>
<body>
{if $to_first != ''}
  {$to_first} -<br/><br/>
{/if}
{$message}
<br/><br/>
<a href="{$link}">{$prod_name}</a>
<br/><br/>
{$from_first} {$from_last}
</body>
</html>
