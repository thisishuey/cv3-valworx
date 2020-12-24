{*
  Customize your auto reminder e-mail below.

  Various options are available for customization:
    {$name}       - Customer's full name.
    {$first_name} - Customer's first name.
    {$last_name}  - Customer's last name.
    {$cgroups}    - Array of which customer groups the customer is in.
                  - Keyed by customer group id.
    {$reminder}   - Contains various things about the reminder itself:
                  - {$reminder.id} - ID of the reminder.
                  - {$reminder.name} - Name of the reminder.
                  - And more.  All of these can be used to customize your e-mail message.
                  - To see a list of all available items in this array, include the following in your test e-mail:
                    Reminder output:<br />
                    {foreach from=$reminder item="value" key="key"}
                      - {ldelim}$reminder.{$key}{rdelim} = {$value}<br />
                    {/foreach}

  The following apply only to "x days after last order" reminders:
    {$last_order_id}   - The ID of the customer's last order.
    {$last_order_date} - The date of the customer's last order.  This timestamp is in Unix format and can
                         be customized by the |date_format Smarty modifier.  Examples:
                         {$last_order_date|date_format}                 - Jan 1, 2011
                         {$last_order_date|date_format:"%D"}            - 01/01/2011
                         {$last_order_date|date_format:"%A, %B %e, %Y"} - Saturday, January 1, 2011
                         More info on using |date_format can be found here:
                         http://www.smarty.net/docs/en/language.modifier.date.format.tpl
*}

{* Content goes here. *}