<%@ page import="java.io.File" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Comparator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.test.java.utils" %>
<%
    // 디렉토리 탐색
    String path = application.getRealPath("/files");

    File dir = new File(path);
    File[] list = dir.listFiles();

    System.out.println(Arrays.toString(list));

    // list.sort();

    Arrays.sort(list, new Comparator<File>() {
        @Override
        public int compare(File o1, File o2) {
            return Long.compare(o2.lastModified(), o1.lastModified());
        }
    });

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="http://bit.ly/3WJ5ilK"/>
    <style>
        table > tr:nth-child(2) > td:first-child {
            text-align: left
        }
    </style>
</head>
<body>
<!-- ex19.jsp -->
    <h1>자료실 <small>탐색기</small></h1>

    <table>
        <tr>
            <th>파일명</th>
            <th>크기</th>
            <th>수정된 날짜</th>
            <th>삭제</th>
        </tr>
        <% for(File file : list) { %>
        <tr>
            <td>
                <div>
                    <span>
                        <img src="<%= utils.getIconPath(file.getName()) %>" width="20" />
                    </span>
                    <span><%= file.getName() %></span>
                </div>
            </td>
            <td><%= utils.formatFileSize(file.length()) %></td>
            <td><%= String.format("%tF %tT", file.lastModified(), file.lastModified())%></td>
            <td><span onclick="del()" style="cursor:pointer;" data-filename="<%= file.getName() %>">🗑️</span>
            </td>
        </tr>
        <% } %>
    </table>
    <hr>
    <form method="post" action="ex19ok.jsp" enctype="multipart/form-data">
        <div>파일: <input type="file" name="attach" required accept="*"></div>
        <div>
            <input type="submit" value=" 업로드 ">
        </div>
    </form>

<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
<script src="https://bit.ly/4cMuheh"></script>
<script>
    function del(){
        if(confirm(event.target.dataset['filename'] + " 삭제하시겠습니까?")){

            location.href = 'ex19del.jsp?filename=' + event.target.dataset['filename'];
        }

        // 이벤트 전파 방지
        event.stopPropagation();
        return false;
    }
</script>
</body>
</html>
