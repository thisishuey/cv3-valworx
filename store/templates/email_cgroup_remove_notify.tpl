{******************************************************************
 * purpose:
 *    create the email(s) you would like to send to customers
 *    prior to being removed from the customer group
 *    You can define your email on the customer group edit page by 
 *    choosing "Remove customers from this group after X days" and 
 *    "Send notifications to customers, prior to removal."
 *
 * to use:
 *    create your email below this comment.  You can use
 *    HTML, smarty and/or plain text for your email. 
 *
 * variables available: 
 *    {$first_name} is the first name of the customer, if available
 *    {$last_name} is the last name of the customer, if available
 *    {$email} is the email address of the customer
 *    {$mar_id} is the marketing id of the customer
 *    {$num_days} is the number of days before the customer will be removed
 *    {$removeafter} is the number of days in the "Remove customers from this group after" option
 *    {$cgroup_id} is the id of the customer group 
 *    {$cgroup_name} is the name of the customer group 
 *    {$message_id} is the ID of the message you created on the customer group edit page
 *    {$message_name} is the name of the message you created on the customer group edit page
 *    {$message_subject} is the subject of the message you created on the customer group edit page
 *
 ********************************************************************}

