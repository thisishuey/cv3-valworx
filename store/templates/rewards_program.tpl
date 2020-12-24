{include file="_top.tpl"}
<h1>Rewards Program</h1>
<div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">

   <p><strong>You currently have {math equation="earned - redeemed" earned=$member.points_earned redeemed=$member.points_redeemed} Reward points!</strong></p>
   <p>Visit the <a href="/{$prod_display_type}/rp">Rewards</a> page to spend your available points.</p>
</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
   {include file="member_links.tpl"}
</div>
{include file="_bottom.tpl"}
