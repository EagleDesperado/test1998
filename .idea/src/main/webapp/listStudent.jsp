<%--
  Created by IntelliJ IDEA.
  User: 刃牙
  Date: 2021/8/9
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() +"://"+request.getServerName()
            +":"+request.getServerPort()+ request.getContextPath()+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(function(){
            loadStudentData();

            $("#btnLoader").click(function(){

            })
        })
        function loadStudentData(){
            $.ajax({
                url:"student/queryStudent.do",
                type:"get",
                dataType:"json",
                success:function (resp) {
                    // alert("data="+data);
                    $.each(resp,function(i,n){
                        $("#info").append("<tr>")
                            .append("<td>"+n.id+"</td>")
                            .append("<td>"+n.name+"</td>")
                            .append("<td>"+n.age+"</td>")
                            .append("<tr>")

                    })
                }
            })
        }
    </script>
</head>
<body>
    <div align="centerr">
        <table>
            <thead>
                <tr>
                    <td>学号</td>
                    <td>姓名</td>
                    <td>年龄</td>
                </tr>
            </thead>
            <tbody id="info">

        </table>
        <input type="button" id="btnLoader" value="查询数据">
        </tbody>
    </div>
</body>
</html>
