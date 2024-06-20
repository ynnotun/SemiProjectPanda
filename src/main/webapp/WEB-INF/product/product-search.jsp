<%--
  Created by IntelliJ IDEA.
  User: minseok
  Date: 24. 6. 13.
  Time: 오전 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <title></title>
</head>
<body>
<div class="bg-white  text-gray-950  min-h-screen">
    <div class="container mx-auto px-4 md:px-6 py-8 md:py-12">
        <div class="flex flex-col min-h-screen">
            <section class="py-8 px-6 md:px-8">
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-2xl font-bold"><a href="">"${keyword}" 검색 결과</a></h2>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6" id="result">
                    <c:forEach items="${searchResults}" var="ele">
                        <a href="<c:url value="/product/detail?productnum=${ele.productnum}"/>">
                            <div class="rounded-lg border bg-card text-card-foreground shadow-sm">
                                <img src="https://kr.object.ncloudstorage.com/semi/panda/${ele.coverimage}" width="300"
                                     height="200" alt="Product"
                                     class="rounded-t-lg object-cover w-full h-48"
                                     style="aspect-ratio:300/200;object-fit:cover"/>
                                <div class="p-4">
                                    <h3 class="text-lg font-medium mb-2 truncate">${ele.producttitle}</h3>
                                    <div class="mb-2">
                                        <span class="text-gray-500 mr-1">${ele.productprice}원</span>
                                        <span class="text-gray-500">${ele.productstatus}</span>
                                    </div>
                                        <span class="text-gray-500 truncate">${ele.productaddress}</span>
                                </div>
                            </div>
                        </a>

                    </c:forEach>

                </div>
            </section>
        </div>
    </div>
</div>
<script>

</script>

</body>
</html>
