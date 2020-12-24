{config_load file="store.conf" scope="global"}
{assign var="template_section" value=$template_section|default:"default"}
<html>
{include file="_meta.tpl"}
   <body bgcolor="{#page_bg_color#}">
      <div align="center">{$meta.pre_body}</div>
      
<table width="670" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td id="area_middle_right" 
               bgcolor="{#bgcolor_col_2#}" valign="top">

