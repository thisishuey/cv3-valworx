{include file="_top.tpl"}
<h1>Account Information</h1>
  <div class="col-sm-4 col-sm-push-8 col-md-9 col-md-push-3 nopad" >
       <p><strong>Welcome back {$member.first_name}!</strong></p>
       <p>Not {$member.first_name}? <a href="/member_login/1">Click here</a> to log out.</p>
  
    {if $error == 'Password updated successfully.<br />'}
     <div class="messages">
      <p></p>
      <p><em>{$error|replace:"<br />":""}</em></p>
     </div>
    {/if}
  </div>
  
  <div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
    {include file="member_links.tpl"}
  </div>
{include file="bronto_api.tpl"}
{include file="_bottom.tpl"}
