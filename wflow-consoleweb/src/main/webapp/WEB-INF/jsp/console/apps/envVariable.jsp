<%@ include file="/WEB-INF/jsp/includes/taglibs.jsp" %>

<commons:popupHeader bodyCssClass=" builder-popup no-header" />
<div id="main-body-content">
    <div id="variable">
        <ui:jsontable url="${pageContext.request.contextPath}/web/json/console/app/${appId}/${appVersion}/envVariable/list?${pageContext.request.queryString}"
           var="JsonVariableDataTable"
           divToUpdate="variableList"
           jsonData="data"
           rowsPerPage="15"
           width="100%"
           sort="id"
           desc="false"
           href="${pageContext.request.contextPath}/web/console/app/${appId}/${appVersion}/envVariable/edit"
           hrefParam="id"
           hrefQuery="false"
           hrefDialog="true"
           hrefDialogTitle=""
           checkbox="${protectedReadonly != 'true'}"
           checkboxButton1="console.app.envVariable.create.label"
           checkboxCallback1="environmentVariableCreate"
           checkboxOptional1="true"
           checkboxButton2="general.method.label.delete"
           checkboxCallback2="envVariableDelete"
           searchItems="filter|Filter"
           fields="['id','value','remarks']"
           column1="{key: 'id', label: 'console.app.envVariable.common.label.id', sortable: true}"
           column2="{key: 'value', label: 'console.app.envVariable.common.label.value', sortable: true}"
           column3="{key: 'remarks', label: 'console.app.envVariable.common.label.remarks', sortable: false}"
           />
    </div>
    
    <script>
        <ui:popupdialog var="variableCreateDialog" src="${pageContext.request.contextPath}/web/console/app/${appId}/${appVersion}/envVariable/create"/>
        
        $(document).ready(function(){
            $('#JsonVariableDataTable_searchTerm').hide();
            <c:if test="${protectedReadonly == 'true'}">
                $(".ui-tabs-panel button").hide();
            </c:if>
        });
        
        function environmentVariableCreate(){
            variableCreateDialog.init();
        } 
        
        function envVariableDelete(selectedList){
            if (confirm('<ui:msgEscJS key="console.app.envVariable.delete.label.confirmation"/>')) {
               parent.UI.blockUI();
               var callback = {
                   success : function() {
                       filter(JsonVariableDataTable, '&filter=', $('#JsonVariableDataTable_searchCondition').val());
                       JsonVariableDataTable.clearSelectedRows();
                       parent.UI.unblockUI();
                   }
               }
               var request = ConnectionManager.post('${pageContext.request.contextPath}/web/console/app/<c:out value="${appId}"/>/${appVersion}/envVariable/delete', callback, 'ids='+selectedList);
           }
        }
        
        function closeDialog() {
            variableCreateDialog.close();
        }
    </script>
</div>  
<commons:popupFooter />
