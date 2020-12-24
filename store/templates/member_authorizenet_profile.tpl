{include file="_top.tpl"}

<h1>Manage Authorize.NET Profile</h1>

<div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3 nopad">
   <p>Below you can edit your Authorize.NET Customer Profile.</p>
   <p>The information in the profile below can be used during your checkout process.</p>

   <form method="post" action="https://{if $environment == 'live'}secure{else}test{/if}.authorize.net/profile/manage" id="formAuthorizeNetPopup" name="formAuthorizeNetPopup" target="iframeAuthorizeNet" style="display:none;">
  <input type="hidden" name="Token" value="{$profile_token}" />
   </form>
   <div class="embed-responsive embed-responsive-16by9">
      <iframe class="embed-responsive-item" name="iframeAuthorizeNet" id="iframeAuthorizeNet" frameborder="0" style="width: 100%; height: 600px;" ></iframe>
   </div>
   <script type="text/javascript">
      window.onload = document.getElementById('formAuthorizeNetPopup').submit();
   </script>
</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
   {include file="member_links.tpl"}
</div>
{include file="_bottom.tpl"}
