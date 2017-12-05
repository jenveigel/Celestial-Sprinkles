<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <jsp:include page="bootstrapHeader.jsp"></jsp:include>
  <link rel="stylesheet" href="css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error Page</title>
</head>
<body>
    <h1>${errorMsg}</h1>
    <img src="${errorImg}" />
<jsp:include page="bootstrapFooter.jsp"></jsp:include>
</body>
</html>
