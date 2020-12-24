{include file="_top.tpl"}

<h1>Reminder Service</h1>

<div class="form-container col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
<form method="post" action="index.php" style="margin:0px;padding:0px;" role="form"> 
<input type="hidden" name="action" value="MemberReminderService" />
  <h2>Scheduled Reminders</h2>
   <div class="table-responsive">
   <table class="table table-hover">
      <thead>
      <th>Event</th>
      <th class="more_col">Email</th>
      <th class="more_col">Event Date</th>
      <th class="more_col">Reminder Date</th>
      <th id="remove_col">Remove</th>
      </thead>
{foreach from=$scheduled_reminders item=reminder}
   <tr>
      <td>{$reminder.event_name}</td>
      <td class="more_col">{$reminder.email}</td>
      <td class="more_col">{$reminder.date_of_event}</td>
      <td class="more_col">{$reminder.reminder_date}</td>
      <td><input type="checkbox" name="remove[]" value="{$reminder.id}"/></td>
   </tr>
{/foreach}
   </table>
</div>
{if $smarty.session.mobile}<div class="btn btn-default" onclick="showMoreCol()">Show/Hide Info</div>{/if}
<div class="row mar_top10">
   <div class="col-xs-6">{if $smarty.session.mobile}<a class="btn btn-default" href="#remove_col">Scroll across table</a>{/if}</div>
   <div class="col-xs-6"><input type="submit" name="submit" value="Remove Reminders" class="btn btn-default pull-right" /></div>
</div>

{if $valid.return == "1"}
 <div class="errors">
    <p><em>There has been an error. Please double check any fields that show an '<font color="#ff0000">X</font>'</em></p>
  </div>
{/if}
<h3>Add Reminder</h3>
{*Events are not being stored yet, need to add that functionality if you want to be able to select from a list of events and not just create a new one*}
<div class="form-group {if $valid.return and $valid.select_event == ''} error{/if}">
  <label for="select_event">Select Event:</label>
  <select class="form-control" name="select_event" id="select_event" class="formtext" onchange="toggleBlock('select_event','create_event','create_event','block');">
    <option value="">--- Select Event ---</option>
    <option value="create_event" {if $valid.return and $valid.select_event == 'create_event'}selected{/if}>Create New Event</option>
    {foreach from=$events key="event_id" item="event_name"}
      <option value="{$event_id}" {if $valid.return and $valid.select_event == $event_id}selected{/if}>{$event_name}</option>
    {/foreach}
  </select>
</div>

<div name="create_event" id="create_event" style="display:{if $valid.return and $valid.select_event == 'create_event'}block{else}none{/if};">

<div class="form-group {if $valid.return and $valid.select_event == 'create_event' and $valid.event_name == ''} error{/if}">
  <label for="event_name">Event Name:</label>
  <input class="form-control" type="text" name="event_name" value='{$valid.event_name}' class="formtext" size="30" />
</div>

<div class="form-group {if $valid.return and $valid.select_event == 'create_event' and ($valid.event_month == '' or $valid.event_year == '' or $valid.event_day == '' or $valid.event_past='y')} error{/if}">
  <label for="event_date">Event Date:</label>
  <div class="form-inline">
   <select class="form-control" name="event_month" class="formtext">
    {html_options options=$options.date.month selected=$valid.event_month}
  </select>
  <select class="form-control" name="event_day" class="formtext">
    {html_options options=$options.date.day selected=$valid.event_day}
  </select>
  <select class="form-control" name="event_year" class="formtext">
    {html_options options=$options.date.year selected=$valid.event_year}
  </select>
   </div>
</div>

</div>

<div class="form-group {if $valid.return and $valid.select_reminder == ''} error{/if}">
  <label for="select_reminder">Select Reminder:</label>
  <select class="form-control formtext" name="select_reminder" id="select_reminder" style="display:inline;" onchange="toggleBlock('select_reminder','choose_reminder','choose_reminder','block');">
    <option value="">--- Select Reminder ---</option>
    <option value="choose_reminder" {if $valid.return and $valid.select_reminder == 'choose_reminder'}selected{/if}>Choose Date</option>
    <option value="1" {if $valid.return and $valid.select_reminder == '1'}selected{/if}>1 day prior</option>
    <option value="7" {if $valid.return and $valid.select_reminder == '7'}selected{/if}>1 week prior</option>
    <option value="14" {if $valid.return and $valid.select_reminder == '14'}selected{/if}>2 weeks prior</option>
    <option value="21" {if $valid.return and $valid.select_reminder == '21'}selected{/if}>3 weeks prior</option>
    <option value="30" {if $valid.return and $valid.select_reminder == '30'}selected{/if}>1 month prior</option>
    <option value="60" {if $valid.return and $valid.select_reminder == '60'}selected{/if}>2 months prior</option>
  </select>
</div>

<div name="choose_reminder" id="choose_reminder" style="display:{if $valid.return and $valid.select_reminder == 'choose_reminder'}block{else}none{/if};">

<div class="form-group">
  <label for="reminder_date">Choose Date:</label>
  <select class="form-control formtext" name="reminder_month">
    {html_options options=$options.date.month selected=$valid.reminder_month}
  </select>
  <select class="form-control formtext" name="reminder_day">
    {html_options options=$options.date.day selected=$valid.reminder_day}
  </select>
  <select class="form-control formtext" name="reminder_year">
    {html_options options=$options.date.year selected=$valid.reminder_year}
  </select>
</div>

</div>

<div class="form-group {if $valid.return and $valid.email == ''} error{/if}">
  <label for="email">Reminder Email Address:</label>
  <input class="form-control" type="text" name="email" value="{$memberinfo.email}" />
</div>

<div class="form-group">
  <label for="comments">Comments:</label>
  <textarea class="form-control formtext" name="comments" rows="5" cols="40">{$valid.comments}</textarea>
</div>

<div class="buttonrow">
  <input type="submit" name="submit" value="Add Reminder" class="btn btn-default" />
</div>
</form>
</div>
<div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
   {include file="member_links.tpl"}
</div>
{include file="_bottom.tpl"}