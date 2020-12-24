{config_load file="store.conf" scope="global"}
{if !$type && $var1}{assign var=type value=$var1}{/if}

{* Order Confirmation Subject *}
{if $type == 'email_confirmation'}
  {$store_name} Order Confirmation #{$order_id}

{* Catalog Request Subject *}
{elseif $type == 'catalog_request'}
  {$store_name} Catalog Request

{* Contact Form *}
{elseif $type == 'contact_form'}
  {$store_name} Contact Info

{* Newsletter Request *}
{elseif $type == 'newsletter_request'}
  {$store_name} Newsletter Request

{* Tell a Friend *}
{elseif $type == 'tell_a_friend'}
  Greetings from {$store_name}

{* Suggest a Recipe *}
{elseif $type == 'suggest_a_recipe'}
  Suggest a Recipe

{* Generic Forms *}
{elseif $type == 'generic_form'}
  {$form.name}
             
{* Vendor Email Confirmations *}
{elseif $type == 'vendor_email'}
  Order #{$order_id} from {$store_name}
      
{* Approve Affiliate *}
{elseif $type == 'approve_affiliate'}
  {$store_name} Affiliate Program

{* Delete Affiliate *}
{elseif $type == 'delete_affiliate'}
  {$store_name} Affiliate Program

{* Wholesale Order Confirmation *}
{elseif $type == 'wholesale_email_confirmation'}
  {$store_name} Wholesale Order Confirmation #{$order_id}

{* Send Wishlist To Friends*}
{elseif $type == 'send_wishlist'}
  {$store_name} Wishlist for {$info.first_name} {$info.last_name}
          
{* Member Registration *}
{elseif $type == 'member_register'}
  Membership Confirmation

{* New Member Request *}
{elseif $type == 'new_member_request'}
  New Member Request

{* Member Forgot Password *}
{elseif $type == 'member_forgot'}
  Here is your password reset

{/if}

