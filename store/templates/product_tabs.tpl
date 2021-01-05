{assign var="tpClassificationID" value="VALWORX_1588279872"}
{assign var="tpPartID" value=""}
{assign var="tpPartNumber" value="551802"}

{assign var="tpStart" value=$product.cust_7|strpos:"tpPartID:"}
{if $tpStart > -1}
  {assign var="tpString" value=$product.cust_7|substr:$tpStart+9}
  {assign var="tpEnd" value=$tpString|strpos:" -->"}
  {assign var="tpPartID" value=$tpString|substr:0:$tpEnd}
{/if}

<div class="clearfix"></div>
<div id="product_tabs">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    {if $product.prod_description}<li id='section1_tab' role="presentation" class='active'><a href="#section1_tab_{$product.prod_id}" role="tab" data-toggle="tab">Description</a></li>{/if}
      {if $product.cust_5}<li id='section2_tab' role="presentation"><a href="#section2_tab_{$product.prod_id}" role="tab" data-toggle="tab">Specifications</a></li>{/if}
      {if $product.additional_prods|@count > 0 && $product.cust_17 !=''}<li id='section3_tab' role="presentation"><a href="#section3_tab_{$product.prod_id}" role="tab" data-toggle="tab">Accessories</a></li>{/if}
      {if $product.cust_6}<li id='section4_tab' role="presentation"><a href="#section4_tab_{$product.prod_id}" role="tab" data-toggle="tab">Data Sheets</a></li>{/if}
      {if $product.cust_7}<li id='section5_tab' role="presentation"><a href="#section5_tab_{$product.prod_id}" role="tab" data-toggle="tab">{if $tpPartID == ""}CAD{else}3D CAD{/if}</a></li>{/if}
      {if $product.cust_8}<li id='section6_tab' role="presentation"><a href="#section6_tab_{$product.prod_id}" role="tab" data-toggle="tab">Video</a></li>{/if}
      {if $product.additional_prods|@count > 0 && $product.cust_12 !=''}<li id='section7_tab' role="presentation"><a href="#section7_tab_{$product.prod_id}" role="tab" data-toggle="tab">Repair Parts</a></li>{/if}
  </ul>

  <!-- Tab panes -->
  <div class="tab-content tab_data_container">
    <div role="tabpanel" class="tab-pane active" id="section1_tab_{$product.prod_id}">
      {if $product.prod_description}{$product.prod_description}{/if}
    </div>
    {if $product.cust_5}
      <div role="tabpanel" class="tab-pane" id="section2_tab_{$product.prod_id}">
        {assign var=customfive value="<BR><BR>"|explode:$product.cust_5}
        <div id="spectable">
          {assign var='rowcounter' value="oddrow"}
          {foreach from=$customfive key=key item=fiveinfo}
            <div class="{$rowcounter} row">
              <div class="col-xs-4 col-sm-3"><strong>{$fiveinfo|replace:"|":"</div><div class='col-xs-8 col-sm-9'></strong>"}</div>
            </div>
            {if $rowcounter == "oddrow"}
              {assign var=rowcounter value="evenrow"}
            {else}
              {assign var=rowcounter value="oddrow"}
            {/if}
          {/foreach}
        </div>
      </div>
    {/if}
    {if $product.additional_prods|@count > 0 && $product.cust_17 !=''}
      <div role="tabpanel" class="tab-pane" id="section3_tab_{$product.prod_id}">
       {include file="display_product_group_additional.tpl" label="Additional Products" products=$product.additional_prods max=10 fromoption="additionalproducts" mainpId=$product.prod_id}
      </div>
    {/if}
    {if $product.cust_6}
      <div role="tabpanel" class="tab-pane" id="section4_tab_{$product.prod_id}">
        {$product.cust_6}
      </div>
    {/if}
    {if $product.cust_7}
      <div role="tabpanel" class="tab-pane" id="section5_tab_{$product.prod_id}">
        {if $tpPartID == ""}

          {$product.cust_7}

        {else}

          <div style="float: left; width: 100%; padding-top: 0px;">
            <div class="catalog-left" style="float: left; width: 55%;">

              <div class="btn-group" role="group" aria-label="..." id="tpView">
                <a id="image" onclick="changeView(this);" title="Image View" class="btn btn-default"><span class="glyphicon glyphicon-picture" aria-hidden="true"></span></a>
                <a id="3d" onclick="changeView(this);" title="3D View" class="btn btn-primary"><span class="glyphicon glyphicon-move" aria-hidden="true"></span></a>
              </div>

              <div id="panel_3d" style="height: 350px;">
                <iframe id="ifCad3d" style="position: relative; width: 100%; min-height: 300px;" src="https://www.traceparts.com/els/helioz/en/api/viewer/3d?SupplierID={$tpClassificationID}&DisplayLogo=false&Product={$tpPartID}" scrolling="no" frameborder="0">
                </iframe>
                <div class="panel3dbuttons">
                  <span style="display: inline-block; color: #979797; line-height: 1.5rem; font-size: .6875rem;">&nbsp;</span>
                  <button class="btn btn-primary" style="float: right;" onClick="openFullScreen(); return false;" id="fullscreenBtn" title="Expand"><span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span></button>
                </div>
              </div>

              <div id="panel_image" style="display: none; height: 350px;">
                <div class="model-productImgBox" style="text-align: center;">
                  <img src="${img_prefix}/main/product/image.jpg" style="width: 80%; padding-top: 0px; text-align: center;" id="valworx_image">
                </div>
              </div>

            </div>

            <br>

            <div id="cad_container" style="display: block; padding-top: 0; float: left; width: 45%;">

              <h5 class="titleDownload" style="font-size: 18px; font-weight: bold; color: #333333;">Download CAD files</h5>

              <div class="CADformat" style="float: left; font-size: 15px; color: #747474; padding-top: 5px; width: 60%;">
                <div style="color: #333333;">CAD Format:</div>
                <select id="cad_format" class="form-control" style="width: 96%;" required><option value="">Select a Format</option></select>
              </div>

              <div class="download_cad" style="float: left; padding-top: 26px;">
                <button class="btn btn-primary" id="cad_download_btn" title="Download CAD files" onclick="onDownloadClick(); return false;">DOWNLOAD</button>
              </div>

              <div id="cad_download_link" style="font-size: 14px; width: 100%; color: #333333; padding-top: 12px; padding-bottom: 10px; float: left;"></div>

            </div>
          </div>
          <div class="clearfix"></div>

          <div id="cad_modal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title">Customer Info</h4>
                </div>
                <div class="modal-body">
                  <form>
                    <div class="form-group">
                      <label class="control-label" for="tpFirstName"><span class="req">*</span> First Name</label>
                      <input type="text" class="form-control" id="tpFirstName" required>
                    </div>
                    <div class="form-group">
                      <label class="control-label" for="tpLastName"><span class="req">*</span> Last Name</label>
                      <input type="text" class="form-control" id="tpLastName" required>
                    </div>
                    <div class="form-group">
                      <label class="control-label" for="tpEmailAddress"><span class="req">*</span> Email Address</label>
                      <input type="email" class="form-control" id="tpEmailAddress" required>
                    </div>
                    <div class="form-group">
                      <label class="control-label" for="tpCompany"><span class="req">*</span> Company</label>
                      <input type="text" class="form-control" id="tpCompany" required>
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" onclick="onDownloadFormSubmit();">Save changes</button>
                </div>
              </div>
            </div>
          </div>


        {/if}

        <script src="/HeliozTrace.js"></script>

        <script>
          const tpClassificationID = "{$tpClassificationID}";
          const tpPartID = "{$tpPartID}";
          const tpPartNumber = "{$tpPartNumber}";
          const userEmail = "huey+traceparts@carpetelam.com";
          let isCadDownloadInProgress = false;
          {literal}
            const $ = jQuery;
            function onDownloadClick () {
              const select = document.getElementById("cad_format");
              const CADFormatID = select.value;
              if (isCadDownloadInProgress || CADFormatID === "") {
                return false;
              }
              $("#cad_modal").modal("show");
            }
            function onDownloadFormSubmit () {
              let formComplete = true;
              $("#cad_modal").find(".form-group").removeClass("has-error");
              if ($("#tpFirstName").val() === "") {
                $("#tpFirstName").closest(".form-group").addClass("has-error");
                formComplete = false;
              }
              if ($("#tpLastName").val() === "") {
                $("#tpLastName").closest(".form-group").addClass("has-error");
                formComplete = false;
              }
              if ($("#tpEmailAddress").val() === "") {
                $("#tpEmailAddress").closest(".form-group").addClass("has-error");
                formComplete = false;
              }
              if ($("#tpCompany").val() === "") {
                $("#tpCompany").closest(".form-group").addClass("has-error");
                formComplete = false;
              }
              if (isCadDownloadInProgress || !formComplete) {
                return false;
              }
              $("#cad_modal").modal("hide");
              isCadDownloadInProgress = true;
              const select = document.getElementById("cad_format");
              const CADFormatID = select.value;
              document.getElementById("cad_download_link").innerHTML = "Preparing the file for download...";
              heliozTraceDownloadCADPath({
                ClassificationID: tpClassificationID,
                PartNumber: tpPartNumber,
                UserEmail: userEmail,
                CADFormatID: CADFormatID,
                Version: 2,
                SaveAssemblyAsPart: 1
              },
              (data) => {
                isCadDownloadInProgress = false;
                document.getElementById("cad_download_link").innerHTML = `Your file is ready for download. Please click <a href="${data.filesPath[0].path}" download style="text-decoration:underline">here</a>.`;
              });
            }
            function changeView (event) {
              $("[id^=panel_]").hide();
              $(`#panel_${event.id}`).show();
              $("#tpView .btn-primary").removeClass("btn-primary").addClass("btn-default");
              $(event).removeClass("btn-default").addClass("btn-primary");
            }
            $(() => {
              heliozTraceDownloadOptions({
                ClassificationID: tpClassificationID,
                PartNumber: tpPartNumber
              }, document.getElementById("cad_format"));
              document.getElementById("section5_tab").addEventListener("click", () => {
                document.getElementById("ifCad3d").src = `https://www.traceparts.com/els/helioz/en/api/viewer/3d?SupplierID=${tpClassificationID}&DisplayLogo=false&Product=${tpPartID}`;
              })
            });
            function openFullScreen() {
              const element = document.getElementById("ifCad3d");
              if (element.requestFullscreen) {
                element.requestFullscreen();
              } else if (element.mozRequestFullScreen) {
                element.mozRequestFullScreen();
              } else if (element.webkitRequestFullscreen) {
                element.webkitRequestFullscreen();
              } else if (element.msRequestFullscreen) {
                element.msRequestFullscreen();
              }
            }
          {/literal}
        </script>
      </div>
    {/if}
    {if $product.cust_8}
      <div role="tabpanel" class="tab-pane video" id="section6_tab_{$product.prod_id}">
        <div id="video">{$product.cust_8}</div>
      </div>
    {/if}
    {if $product.additional_prods|@count > 0 && $product.cust_12 !=''}
      <div role="tabpanel" class="tab-pane" id="section7_tab_{$product.prod_id}">
        {include file="display_product_group_additional.tpl" label="Related Additional Products" products=$product.additional_prods max=10 fromoption="additionalproductsforrepairparts" mainpId=$product.prod_id}
      </div>
    {/if}
  </div>
</div>
{*** TAB JS MOVED TO extra-js.tpl ***}