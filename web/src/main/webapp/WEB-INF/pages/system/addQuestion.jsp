<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/19/15
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<div class="right-content">
    <form class="form-horizontal padding-10" id="addNewsForm">
        <input type="hidden" name="id" value="${command.id}">
        <input type="hidden" name="surveyId" value="${command.surveyId}">
        <div class="form-group">
            <label class="col-sm-1 control-label no-padding-right">题目名称</label>
            <div class="col-sm-5 no-padding-right">
                <input type="text" name="question" class="form-control" data-validate="required" placeholder="题目名称" value="${command.question}">
            </div>
            <i class="notnull">*</i>
        </div>
        <div class="form-group">
            <label class="control-label no-padding-right col-sm-1">答题类型</label>
            <div class="col-sm-5 no-padding-right">
                <select name="type" class="width-100" id="roleSelector" data-validate="required">
                    <option value="0">单选</option>
                    <option value="1">多选</option>
                    <option value="2">文本</option>
                </select>
            </div>
            <i class="notnull">*</i>
        </div>
        <div id="answerFormDiv" class="form-group ${command.type==2?'hidden':''}">
            <label class="control-label no-padding-right col-sm-1">题目答案</label>
            <div class="col-sm-5 no-padding-right">
                <table class="detail-table2 table table-bordered content-table" id="answerTable">
                    <tbody>
                    <tr class="tr-tit">
                        <th class="hidden">1</th>
                        <th class="text-center">题目答案</th>
                        <th class="text-center">删除</th>
                    </tr>
                    <tr class="tr-tit text-center">
                        <td style="font-size: 16px;" colspan="2"><a href="javascript:void(0);" onclick="addTableTr($('#answerTable'),$(this));" style="padding: 5px 0;"><i class="fa fa-plus bigger-130 green"></i>添加</a></td>
                    </tr>
                    <c:forEach var="an" items="${command.answers}">
                    <tr class="tr-data">
                        <td class="text-center">
                            <input value="${an.answer}" data-anid="${an.id}" id="answer-${an.id}" type="text" class="form-control">
                        </td>
                        <td class="text-center">
                            <a title="删除" class="icon-action" onclick="removeTableTr(this);" href="javascript:void(0)"><span class="fa fa-remove red bigger-160"></span></a>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>


        <div class="clearfix form-actions clear">
            <div class="col-md-offset-3 col-md-9 btn-group">
                <button type="button" class="btn btn-primary" onclick="saveQuestion('${command.surveyId}');">
                    <span><i class="fa fa-save"></i>保存</span>
                </button>
                <button type="button" class="btn btn-default" onclick="ajaxReloadPage('descriptionExh','html/question/security/questionList/${command.surveyId}');">
                    <span><i class="fa fa-history"></i>返回</span>
                </button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $('#roleSelector').val('${command.type}')
    $('#roleSelector').chosen({
        no_results_text:'未找到相关项'
    }).change(function(){
        if($(this).val()==2){
            $('#answerFormDiv').hide();
        }else{
            $('#answerFormDiv').show();
        }
    });

</script>

