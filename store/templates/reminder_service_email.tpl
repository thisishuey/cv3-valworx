{*************************************************
 * Purpose: send reminder service emails
 * Available Fields:
 * {$event_name}
 * {$event_date}
 * {$email}
 * {$comments}
 **************************************************}
<html>
  <body>
    You have requested to be reminded of {$event_name} on {$event_date}. 
    <br /><br />
    {$comments|nl2br}
    <br /><br />
  </body>
</html>

