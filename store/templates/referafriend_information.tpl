{include file="_top.tpl"}

<h1>Edit Refer-a-Friend Information</h1>
<div class="mar_btm"><a href="referafriend">Refer-a-Friend Report</a>&nbsp;|&nbsp;<a href="referafriend_create_gc">Create Gift Certificate</a>&nbsp;|&nbsp;<a href="referafriend_history">Track Gift Certificates</a>&nbsp;|&nbsp;<a href="referafriend_login/1">Log Out</a></div>

<form method="post" action="index.php" role="form"> 
  <input type="hidden" name="action" value="ReferafriendInformation">
  <div>

    <div>
      <div class="mar_btm">
        <span class="req">*</span> Indicates a required field
      </div>
      {if $valid.return == "1"}
      <div class="mar_btm">
        <b>There has been an error. Please double check any fields that show an '<span class="glyphicon glyphicon-remove"></span>'</b>
      </div>
      {/if}
    </div>
    <div class="row">
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and  $valid.email == ''}has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> Email Address:</label>
          <input class="form-control" type="text" name="email" value="{$valid.email}" maxlength="30"/>{if $valid.return and  $valid.email == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and  $valid.address1 == ''}has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> Address:</label>
          <input class="form-control" type="text" name="address1" value="{$valid.address1}" maxlength="30"/>{if $valid.return and  $valid.address1 == ''} <span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group">
          <label>Address Line 2:</label>
          <input class="form-control" type="text" name="address2" value="{$valid.address2}" maxlength="30"/>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and  $valid.city == ''}has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> City:</label>
          <input class="form-control" type="text" name="city" value="{$valid.city}" maxlength="30"/>{if $valid.return and  $valid.city == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group">
          <label><span class="req">*</span> State/Province:</label>
          <select class="form-control" name="state">
            {html_options options=$options.state selected=$valid.state}
          </select>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and  $valid.zip == ''}has-error has-feedback bg-danger{/if}">
          <label><span class="req">*</span> Postal Code:</label>
          <input class="form-control" type="text" name="zip" value="{$valid.zip}" maxlength="30"/>{if $valid.return and  $valid.zip == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group">
          <label><span class="req">*</span> Country:</label>
          <select class="form-control" name="country">
            {html_options options=$options.country selected=$valid.country}
          </select>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="form-group {if $valid.return and  $valid.phone == ''}has-error has-feedback bg-danger{/if}">
          <label>Phone:</label>
          <input class="form-control" type="text" name="phone" value="{$valid.phone}">{if $valid.return and  $valid.phone == ''}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>
    </div>
    <fieldset>
      <legend>Change Password</legend>
      <div class="row">
        <div class="col-sm-6">
          <div class="form-group">
            <label>Current Password:</label>
            <input class="form-control" type="password" name="oldpw" value="" maxlength="50"/>
          </div>
        </div>
        <div class="clearfix"></div>
        <div class="col-sm-6">
          <div class="form-group">
            <label>New Password:</label>
            <input class="form-control" type="password" name="newpw1" value="" maxlength="50"/>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label>Confirm New Password:</label>
            <input class="form-control" type="password" name="newpw2" value="" maxlength="50"/>
          </div>
        </div>
      </div>
    </fieldset>
    <div>
      <input type="submit" name="submit" value="Submit" class="addtocart_btn btn btn-primary mar_btm">
    </div>

  </div>
</form>
{include file="_bottom.tpl"}

