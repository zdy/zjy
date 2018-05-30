<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <script src="js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/utf8-jsp/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">
        function checkInput() {
            var content = document.form1.x.value;
            if(content != null){
                alert("输入内容为空");
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
<form name="form1" action="./modify_xudai.do" method="post" onsubmit="return checkInput()" enctype="multipart/form-data">
    <textarea id="container" name="container" style="width: 900px; height: 500px; margin: 0 auto;">
        ${xudai}
    </textarea>
    <input type="submit" value="提交" class="btn" style="margin-left: 630px;margin-top: 70px"/>
</form>
<script type="text/javascript">
    <!-- 实例化编辑器 -->
    var ue = UE.getEditor('container',{
        toolbars: [
            [
                'undo', //撤销
                'redo', //重做
                'link', //超链接
                'unlink', //取消链接
                'formatmatch', //格式刷
                'fontfamily', //字体
                'fontsize', //字号
                'forecolor', //字体颜色
                'backcolor', //背景色
                'bold', //加粗
                'italic', //斜体
                'subscript', //下标
                'superscript', //上标
                'underline', //下划线
                'horizontal', //分隔线
                'strikethrough', //删除线
                'touppercase', //字母大写
                'tolowercase', //字母小写
                'lineheight', //行间距
                'indent', //首行缩进
                'justifyleft', //居左对齐
                'justifycenter', //居中对齐
                'justifyright', //居右对齐
                'justifyjustify', //两端对齐
                'removeformat', //清除格式
                'simpleupload', //单图上传
                'imageleft', 'imageright', 'imagecenter',
                'insertvideo', //视频

                'source', //源代码
                'blockquote', //引用
                'time', //时间
                'date', //日期
                'emotion', //表情
                'spechars', //特殊字符
                'insertorderedlist', //有序列表
                'insertunorderedlist', //无序列表
                'insertframe', //插入Iframe
                'inserttable', //插入表格
                'deletetable', //删除表格
                'selectall', //全选
                'help', //帮助
            ]
        ],
        initialFrameHeight:400,
        elementPathEnabled:false,
        catchRemoteImageEnable:false
    });
</script>
</body>

</html>