<div class="member-links clearfix list-group">
<ul>
  <li><a class="list-group-item" href="/viewcart">View Cart</a></li>
  <li><a class="list-group-item" href="/member_orders">Past Orders</a></li>
  {*<li><a class="list-group-item" href="/electronic_delivery/m">Downloads</a></li>
 <li><a class="list-group-item" href="/subscriptions/m">Subscriptions</a></li>
  <li><a class="list-group-item" href="/rewards_program">Rewards Program</a></li>*}
  <li><a class="list-group-item" href="/member_info">Update Account</a></li>
  <li><a class="list-group-item" href="/member_pw">Change Password</a></li>
  <li><a class="list-group-item" href="/member_address">Shipping Addresses</a></li>
  
  <li><a class="list-group-item" href="/easy_reorder">Easy Reorder</a></li>
  {*<li><a class="list-group-item" href="/member_wishlists">Wishlists</a></li>
  <li><a class="list-group-item" href="/member_reminder_service">Reminder Service</a></li>*}
  {if $profile_token}<li><a class="list-group-item" href="/member_authorizenet_profile">Manage Authorize.NET Profile</a></li>{/if}
  <li><a class="list-group-item" href="{if $confirm_cart_clear == 'y' && $cart|@count > 0}javascript: void(0);{else}/member_login/1{/if}"{if $confirm_cart_clear == 'y' && $cart|@count > 0} onclick="javascript: confirmCartClear();"{/if}>Logout</a></li>
</ul>
</div>
