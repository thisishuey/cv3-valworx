{assign var="src" value="utm_source=transactional_email&utm_medium=email&utm_campaign=member_pw"}
{assign var="heading" value=""}

{include file="email_header.tpl" src=$src heading=$heading}

Your member password has been reset.
<br /><br />
Your new password is: {$password}
<br /><br />
Sincerely,<br />
{$co_name}

{include file="email_footer.tpl" src=$src}
