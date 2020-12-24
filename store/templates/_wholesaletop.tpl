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

        <div id="container" class="container"><!-- OUTER CONTAINER -->

            <!-- HEADER CONTENT -->
            <header id="header" class="clearfix">
                <div class="row">
                    <div class="col-md-12 col-xs-12 text-right">
                        <nav class="checkout_hide">
                            <a href="/" title="{#store_name#}'s Retail Site">Go to Retail Site</a>
                        </nav>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4 col-md-4 col-xs-12">
                        <figure class="figure_align">
                            <a href="/" title="{#store_name#}"><img src="{$img_prefix}/images/logo.png" alt="{#store_name#}" title="{#store_name#}" /></a>
                            <!--<figcaption>Tag Line for store.</figcaption> -->
                        </figure>
                    </div>
                    <div class="col-sm-8 col-md-8 col-xs-12">&nbsp;</div>
                </div>
            </header>
            <!-- Navigation -->
            <div class="row nav-wdmanage">
                <nav id="horizontal" class="navbar navbar-default" role="navigation">

                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-menu-container">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse padd_0 col-sm-8 col-md-8 col-xs-12" id="nav-menu-container">
                        <ul class="nav navbar-nav">
                            <li><a href="/wholesale_order_form" class="iefix" title="Create an Order {#store_name#}">Create An Order</a></li>
                            <li><a href="/wholesale_history" class="iefix" title="View Order History {#store_name#}">View Order History</a></li>
                            <li><a href="/wholesale_info" class="iefix" title="Update Account {#store_name#}">Update Account</a></li>
                            <li><a href="/wholesale_address" class="iefix" title="{#store_name#} Shipping Addresses">Edit Shipping Addresses</a></li>
                            <li><a href="/wholesale_pw" class="iefix" title="{#store_name#} Change Password">Change Password</a></li>
                            <li><a href="/wholesale_login/1" class="iefix" title="{#store_name#} Log Out">Log Out</a></li>
                        </ul>
                        <!--search_end-->
                    </div><!-- /.navbar-collapse -->
                </nav>
            </div>

            <div id="main" class="clearfix row"><!-- INNER CONTAINER -->
                <div id="content" class="clearfix col-sm-12 col-md-12 col-xs-12 carousel_rt"><!-- BEGIN MAIN CONTENT -->
                    {include file="breadcrumb.tpl"}