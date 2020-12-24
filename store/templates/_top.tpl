{*if $view != 'landing'}
{redirect page=/landing}
{/if*}

{* SMARTY CONFIGURATION - DO NOT REMOVE *}
{config_load file="store.conf" scope="global"}
{assign var="template_section" value=$template_section|default:"default"}

{* Change enable to "y" to activate mobile site *}
{mobile_detection enable='y' force_full_tablet='y' force_full=$smarty.get.full}

<!DOCTYPE html>
<html lang="en">

    <!-- META TAGS/CSS/JS INCLUDES -->
    {strip}
        {include file="_meta.tpl"}
    {/strip}

    <body id="{$view}"><!-- LOADS ID FOR EACH PAGE VIEW (e.g., index, category, product) -->

        <div class="meta_pre_body">{$meta.pre_body}</div>

            <!-- TOP BANNER -->
            {include file="top_banner.tpl"}

        <div id="container" class="container"><!-- OUTER CONTAINER -->

            <!-- HEADER CONTENT -->
            {include file="header.tpl"}

            <div id="main" class="clearfix row"><!-- INNER CONTAINER -->
                <div id="content" class="clearfix col-sm-12 col-md-9 col-xs-12 carousel_rt"><!-- BEGIN MAIN CONTENT -->
                    {*{include file="breadcrumb.tpl"}*}
