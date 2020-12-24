<div{if $valid.return and $field.req == 'y' and ((isset($form_error_data.$prod_id) and $form_error_data.$prod_id.$fieldname == '') || (empty($form_error_data) && $valid.$fieldname == ''))} class="error"{/if}>
   <fieldset data-role="controlgroup" id="fieldset{$field.id}">
    <label for="pickfile{$field.id}">{$field.label}</label>
    <input type="file" id="pickfile{$field.id}" name="pickfile{$field.id}" />
    <input type="hidden" id="{$fieldname}" name="{$fieldname}" class="setfile" />
    <div id="filestatus"><div id="progress_bar"><div class="percent">0%</div></div><span id="status"></span></div>
    <script type="text/javascript">
      document.getElementById('pickfile{$field.id}').addEventListener('change', handleFileSelect, false);
    </script>
   </fieldset>
</div>
