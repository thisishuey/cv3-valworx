{include file="_top.tpl"}

<h1>E-mail Wishlist</h1>

<div class="form-container col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">


  {if $valid.return == '1'}
  <div class="row">
    <div class="errors col-sm-6 nopad">
      <p><em>There was an error.</em></p>
      <p>Please double-check any highlighted fields.</p>
      {if $error != ''}<p class="alert alert-danger"><em>{$error}</em></p>{/if}
    </div>
  </div>
  {/if}

  <form class="form-horizontal" method="post" action="index.php" role="form"> 
    <input type="hidden" name="action" value="MemberWlsend" />
    <input type="hidden" name="wl_id" value="{$wl_id}" />

    <fieldset>
      <legend>E-mail Wishlist </legend>

      <div>
        <p>A link to your wishlist will be sent to the following e-mail addresses.  It will include the personal message you enter below.</p>
      </div>

      <div class="form-group {if $valid.is_valid.personal_message == "n"} has-error has-feedback bg-danger{/if}">
        <label class="control-label col-sm-3 col-md-2" for="personal_message"> <span class="req">*</span> Message:</label>
        <div class="col-sm-9 col-md-8 col-lg-6">
          <textarea class="form-control" name="personal_message" id="personal_message"></textarea>
          {if $valid.is_valid.personal_message == "n"}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
        </div>
      </div>

      {counter name=num assign=num}
      {section loop=10 name=tmp}
      {assign var=tmp value="email_"|cat:$num}
      <div class="form-group {if $valid.is_valid.$tmp == "n"}has-error has-feedback bg-danger{/if}">
        <label class="control-label col-sm-3 col-md-2" for="email_{$num}"> Email {$num}:</label>
        <div class="col-sm-9 col-md-8 col-lg-6">
          <input class="form-control" type="text" name="email_{$num}" id="email_{$num}" value="{$valid.$tmp}"/>
          {if $valid.is_valid.$tmp == "n"}<span class="glyphicon glyphicon-remove form-control-feedback"></span>{/if}
          {counter name=num assign=num}
        </div>
      </div>
      {/section}

      

    </fieldset>

    <input type="submit" name="submit" value="Send" class="btn btn-default" />

 </form>

</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
  {include file="member_links.tpl"}
</div>
{include file="_bottom.tpl"}