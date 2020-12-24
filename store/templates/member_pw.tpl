{include file="_top.tpl"}

<h1>Change Account Password</h1>

<div class="form-container col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
  
  {if $error || $password_error}
  <div class="errors">
    <p><em>There was an error.</em></p>
    <p>Please double-check any highlighted fields.</p>
    <p><em>{if $error != ''}{$error}{else}{$password_error}{/if}</em></p>
  </div>
  {/if}

  <p class="legend"><strong>Note:</strong> * Indicates a required field</p>

<form method="post" action="index.php" role="form"> 
<input type="hidden" name="action" value="MemberPW" />

<fieldset><legend>Change Password</legend>
<div class="row">
<div class="col-xs-12 col-md-6">
<div class="form-group {if $valid.return and $valid.oldpw == ''} error{/if}">
 <label for="oldpw"><span class="req">*</span> Old Password:</label>
 <input class="form-control" type="password" id="oldpw" name="oldpw" value="" />
</div>
<div class="form-group {if $valid.return and $valid.newpw1 == ''} error{/if}">
 <label for="newpw1"><span class="req">*</span> New Password:</label>
 <input class="form-control" type="password" id="newpw1" name="newpw1" value="" />
 <span class="help-block">{#password_text#}</span>
</div>
<div class="form-group {if $valid.return and  $valid.newpw2 == ''} error{/if}">
 <label for="newpw2"><span class="req">*</span> Confirm New Password:</label>
 <input class="form-control" type="password" id="newpw2" name="newpw2" value="" />
</div>
</div>
</div>
</fieldset>

<div class="buttonrow">
 <input type="submit" name="submit" value="Update" class="button medium style1 btn btn-default" />
</div>

</form>

</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
   {include file="member_links.tpl"}
</div>
{include file="_bottom.tpl"}