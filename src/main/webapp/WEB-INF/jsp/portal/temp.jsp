<div class="container" style="margin-top: 85px;"><p style="font-size: 26px; font-weight: 500;color: #693293">Service Provider List</p>
</div>


<div class="container" style="margin-top: 10px;min-height: 70vh;background-color: #F6F6F6;">

    <div>

        <div class="row">

            <c:forEach var="data" items="${owners}">


                <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 a">
                    <div class="main-box-div " style="background-color: white">

                        <div class="col-xs-7-new left  ">

                            <a href="<%=request.getContextPath()%>/portal/servicedslist/${data.id}">
                                <div class="title-img">
                                    <img style="width:60%;margin-top: -15px;box-shadow: none;"
                                         src="<%=request.getContextPath()%>/${data.logoUrl}"
                                         onerror="this.src='<%=request.getContextPath()%>/assets/img/soon.png';">
                                </div>
                            </a>


                        </div>
                        <div class="col-xs-5-new  purpleHeader" style="background-color: #693293">

                            <c:if test="${data.serviceCount!=0}">

                                <a href="<%=request.getContextPath()%>/portal/servicedslist/${data.id}">
                                    <div class="title-div center-block">${data.nameEng}:${data.serviceCount}</div>
                                </a>
                            </c:if>

                        </div>


                    </div>
                </div>
            </c:forEach>


        </div>
    </div>


</div>