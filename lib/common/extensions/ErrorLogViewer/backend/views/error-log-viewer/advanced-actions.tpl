<div class="or_box_head">{$smarty.const.TEXT_DESCRIPTION}</div>
<div class="row_or_wrapp" style="font-size: small; color: #424242;">
    <div class="row_or">
        <b>{$smarty.const.TEXT_DATE}:</b> <span style="color: dimgrey"><i><b>{$log->date}</b></i></span><br>
    </div>
    <div class="row_or">
        <b>{$smarty.const.EXT_ELV_TEXT_IP}:</b> <span style="color: dimgrey"><i><b>{$log->ip}</b></i></span><br>
    </div>
    <div class="row_or">
        <b>{$smarty.const.EXT_ELV_TEXT_ERROR_LEVEL}:</b> <span style="color: dimgrey"><i><b>{$log->level}</b></i></span><br>
    </div>
    <div class="row_or">
        <b>{$smarty.const.EXT_ELV_TEXT_CATEGORY}:</b> <span style="color: dimgrey"><i><b>{$log->category}</b></i></span><br>
    </div>
    <br>
    <div class="btn-toolbar btn-toolbar-order">
        <a class="btn btn-no-margin" href="{$app->urlManager->createUrl('error-log-viewer')}?by={$log->source}">{$smarty.const.IMAGE_BACK}</a>
        <button class="btn btn-delete btn-no-margin" onclick="deleteLog()">{$smarty.const.IMAGE_DELETE}</button>
{*        <button class="btn btn-no-margin" onclick="viewAsText()"><i class="icon-file-text-alt"></i> {$smarty.const.EXT_ELV_TEXT_VIEW_AS_TEXT}</button>*}
        <button id="btn_modal" class="btn btn-no-margin" data-toggle="modal" data-target="#elv_modal">{$smarty.const.IMAGE_DETAILS}</button>
    </div>


</div>
<br>

<div id="elv_modal" class="modal fade bd-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document" style="width: 80vw">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" style="font-size: large;">{$log->file}</span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="color: #424242">
                <b>{$smarty.const.TEXT_DATE}:</b> <i><b>{$log->date}</b></i><br>
                <b>{$smarty.const.EXT_ELV_TEXT_IP}:</b> <i><b>{$log->ip}</b></i><br>
                <b>{$smarty.const.EXT_ELV_TEXT_ERROR_LEVEL}:</b> <i><b>{$log->level}</b></i><br>
                <b>{$smarty.const.EXT_ELV_TEXT_CATEGORY}:</b> <i><b>{$log->category}</b></i><br>
                <br>
                <b>{$smarty.const.TEXT_DESCRIPTION}:</b>
                <textarea rows="30" style="resize: none; cursor: pointer;" readonly="readonly">{$log->text}
                    {$log->description}
                </textarea>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function viewAsText()
    {
        window.open("{$app->urlManager->createUrl('error-log-viewer/view-as-text')}?file={$log->file}", "_blank");
    }

    function deleteLog()
    {
        var file = "{$log->file}"

        bootbox.dialog({
            message: "{$smarty.const.EXT_ELV_DELETE_INTRO}".replace('%s', file),
            title: "{$smarty.const.EXT_ELV_DELETE_TITLE}",
            buttons: {
                confirm: {
                    label: "{$smarty.const.TEXT_YES}",
                    className: "btn-delete",
                    callback: function() {
                        $.post("{$app->urlManager->createUrl('error-log-viewer/logs-delete')}", { 'logs' : file }, function(data, status){
                            if(status == "success")
                            {
                                window.location.href = "{$app->urlManager->createUrl('error-log-viewer')}?by={$log->source}";
                            }else{
                                alert("{$smarty.const.EXT_ELV_ERR_REQUEST}");
                            }
                        },"html");
                    }
                },
                cancel: {
                    label: "{$smarty.const.IMAGE_CANCEL}",
                    className: "btn-cancel",
                    callback: function() {
                    }
                }
            }
        });
    }
</script>
