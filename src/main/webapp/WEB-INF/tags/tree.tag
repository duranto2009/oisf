<%@ attribute name="list" type="java.util.ArrayList<com.revesoft.springboot.web.menumanagement.Node>" required="true" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="myTags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${!empty list}">
    <ul>
        <c:forEach var="node" items="${list}">
            <li style="position: relative; margin-left: 10px;"><c:out value="${node.data.getNameBng()}"/></li>

            <li id="Employee">
                <a href="#"><span class="gen-office1"></span><span class="title"> Employee  </span><span
                        class="arrow "></span></a>
                <ul class="sub-menu">

                    <li id="add">
                        <a href="<%=request.getContextPath()%>/empadd"><i class="fa fa-edit"></i> Employee Add </a>
                    </li>

                    <li id="list">
                        <a href="<%=request.getContextPath()%>/empshow"><i class="fa fa-edit"></i> Employee List</a>
                    </li>


                </ul>
            </li>
            <myTags:tree list="${node.children}"/>
        </c:forEach>
    </ul>
</c:if>