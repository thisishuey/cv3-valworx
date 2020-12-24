{include file="_top.tpl"}
<header><h1>CommerceV3 Subscription Removal</h1></header>
{if $type=='sure'} {* are you sure page *}
  
  <form method="get" action="/lettercast/b_noemail.php" role="form">
    
    <p>Are you sure you would like to cancel your subscription to this mailing?<p>
    <div class="checkbox">
      <label><input type="checkbox" name="sure" value="y"/>Yes, please remove me.</label>
    </div>
    <div>
      <input type="hidden" name="c" value="{$c}" />
      <input class="btn btn-default" type="submit" name="submit" value="Cancel" />
      <input class="btn btn-primary" type="submit" name="submit" value="Submit" />
    </div>
  </form>

{elseif $type == 'cancel'} {* they chose to cancel their request *}
  <p>You have opted to continue receiving e-mails from this system. Thank You.</p>

{elseif $type == 'removed'} {* they chose to be removed *}
  <p>Your e-mail address has been successfully removed from the mailing. You will receive no more e-mails from this system. This system is for legitimate opt-in mailings only, if you have received an unsolicited e-mail please forward the full message to the address below. Thank you. </p>
  <div>
    <a href="mailto:abuse@commercev3.com?subject=Report as Abuse:{$store} {$blast_id}">abuse@commercev3.com</a>
  </div>
{/if}
{include file="_bottom.tpl"}