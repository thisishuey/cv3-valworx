{include file="_top.tpl"}

Please enter your email:<br/>
<form name="EmailLogin" method="post" action="/index.php">
<input type="hidden" name="action" value="EmailLogin"/>
<input type="hidden" name="form_redirect" value="index"/>
<input type="text" name="email" value="{$valid.email}"/> <input type="submit" name="submit" value="Submit"/>
</form>

{include file="_bot.tpl"}
