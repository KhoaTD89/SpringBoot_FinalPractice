<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
        .header {
            border-bottom: 1px solid black;
        }

        .content {
            height: 1000px;
        }

        .sidenav {
            border-right: 1px solid black;
            height: 1000px;
        }

    </style>
</head>
<body>
<div class="text-center p-5">
    <h2>FRESHER MANAGEMENT WEB APPLICATION</h2>
</div>
<div class="container-fluid">
    <div class="row content">
        <div class="col-sm-3 sidenav">
            <h4>Menu</h4>
            <ul>
                <li><a>Add a Fresher</a></li>
                <li><a>Freshers List</a></li>
            </ul>
        </div>
        <div class="col-sm-9 p-5">
            <h3 class="text-center">Fresher Details</h3>

            <form:form action="/save-fresher" method="post" modelAttribute="fresher" onsubmit="return validation()">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-6">
                        <form:input path="name" type="text" class="form-control" id="name"/>
                        <br>
                        <span class="err" hidden style="color: red">Name should not be null</span>
                    </div>
                </div>

                <%--                <fieldset class="form-group row">--%>
                <%--                    <label class="col-sm-2 col-form-label">Gender</label>--%>
                <%--                    <div class="col-sm-6 ">--%>
                <%--                        <div class="form-check">--%>
                <%--                            <label class="form-check-label">--%>
                <%--                                <form:radiobutton path="gender" class="form-check-input radio-inline"--%>
                <%--                                                  name="gridRadios"--%>
                <%--                                                  id="male" value="1" checked="true"/>--%>
                <%--                                Male</label>--%>
                <%--                            <label class="form-check-label">--%>
                <%--                                <form:radiobutton path="gender" class="form-check-input radio-inline"--%>
                <%--                                                  name="gridRadios"--%>
                <%--                                                  id="female" value="2"/>--%>
                <%--                                Female</label>--%>
                <%--                        </div>--%>
                <%--                </fieldset>--%>

                <div class="form-group row birthdate">
                    <label class="col-sm-2 col-form-label">Birth date</label>
                    <div class="col-sm-6">
                        <form:input path="birthdate" type="text" class="form-control" id="birthdate"
                                    placeholder="mm/dd/yyyy"/>
                        <br>
                        <span class="err" hidden style="color: red">Date format is MM/dd/yyyy</span>
                    </div>

                </div>

                <div class="form-group row clazz">
                    <label class="col-sm-2 col-form-label">Class</label>
                    <div class="col-sm-6">
                        <form:select path="clazz" class="form-select form-select-lg mb-3 form-control"
                                     aria-label=".form-select-lg example">
                            <form:option label="Select" value=""/>
                            <form:options items="${clazzes}" itemValue="id" itemLabel="className"/>
                        </form:select>
                        <br>
                        <span class="err" hidden style="color: red">Select your class</span>
                    </div>
                </div>

                <%--                <fieldset class="form-group row">--%>
                <%--                    <label class="col-sm-2 col-form-label">Other infomation</label>--%>
                <%--                    <div class="col-sm-6 ">--%>
                <%--                        <div class="form-check">--%>
                <%--                            <label class="form-check-label">--%>
                <%--                                <form:radiobutton path="fromCampusLink" class="form-check-input radio-inline"  name="gridRadios"--%>
                <%--                                       id="hasSalary" value="1" />--%>
                <%--                                Has Salary</label>--%>
                <%--                            <label class="form-check-label">--%>
                <%--                                <form:radiobutton path="fromCampusLink" class="form-check-input radio-inline" name="gridRadios"--%>
                <%--                                       id="campusLink" value="2" />--%>
                <%--                                From Campus link</label>--%>
                <%--                        </div>--%>
                <%--                </fieldset>--%>

                <div class="form-group row">
                    <div class="col-sm-6">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form:form>

        </div>

    </div>

</div>

<script>
    function validation() {
        let errQty = 0;

        let name = $("#name").val().trim();
        if (name === null || name === "") {
            $(".form-group span").show();
            errQty++;
        } else {
            $(".form-group span").hide();
        }

        let clazzValue = $("form select").val();
        if (clazzValue === "" || clazzValue === null) {
            $('.clazz span').show();
            errQty++;
        } else {
            $('.clazz span').hide();
        }

        let date_regex = /^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$/;
        let birthdate = $('#birthdate').val();
        if (!date_regex.test(birthdate) || birthdate==null) {
            $('.birthdate span').show();
            errQty++;
        } else {
            $('.birthdate span').hide();
        }

        if(errQty>0){
            return false;
        }else{
            alert("Save fresher successfully!");
        }
    }
</script>

</body>
</html>