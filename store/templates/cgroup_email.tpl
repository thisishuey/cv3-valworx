{* This is the template to edit for sending an email to the customer when they are added 
   to a customer group.  Here are the variables you can use in this email:
  {$email} = email address for the customer
  {$first_name} = first name of the customer (if available)
  {$last_name} = last name of the customer (if available)
  {$cgid} = customer group id.  You can use this to add information specific to one customer group.  
            For instance, you could use the following smarty code to tell the customer what type of
            group they have been added to:
              {if $cgid == '4'}
                You will get 20% off of your next order.
              {elseif $cgid == '6'}
                You will get $10 off of shipping.
              {/if}

  Please contact support@commercev3.com if you need assistance setting up your email.
*}

    
You have been added to a customer group.

{if $cgid == '13'}
   I hope this came from SendGrid! Check it one two
{/if}