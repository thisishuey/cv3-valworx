{***********************************************************************
 * purpose: affiliate report that is emailed to affiliates
 * to use: edit the section below this comment using html and smarty 
 * possible values:
 *   {$name} = affiliate name
 *   {$code} = affiliate code
 *   {$commission} = affiliate commission rate
 *   {$email} = affiliate email address
 *   {$send_report} = flag for sending email report
 *   {$start_date} = period start date
 *   {$end_date} = period end date
 *   {$stats.click_date} = date of last visit
 *   {$stats.num_visits} = number of visits
 *   {$stats.num_orders} = number of orders placed
 *   {$stats.value} = total value of the orders placed
 *   {$stats.num_catreq} = number of catalog requests
 *   {$stats.avg_visit} = avg dollar amount received per visit
 *   {$stats.commission} = total commission for time period
 *   {$stats.avg_order} = avg order value
 ************************************************************************}

<html>
<body>
{$name},<br /><br />

These are your stats for {$start_date} to {$end_date}:<br />
Visits: {$stats.num_visits}<br />
Orders: {$stats.num_orders}<br />
Total Order Value: ${$stats.value}<br />
Avg Order Value: ${$stats.avg_order}<br />
Catalog Requests: {$stats.num_catreq}<br />
Avg Per Visit: ${$stats.avg_visit}<br /><br />

Total Commission for Period: ${$stats.commission}

</body>
</html>