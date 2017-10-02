<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String json = "{\"total\":42,\"data\":[  {\"id\":1,\"name\":\"Java课件\"}," +
            "{\"id\":3,\"name\":\"UI课件\"}" +
            "]}";
    out.println(json);
%>
