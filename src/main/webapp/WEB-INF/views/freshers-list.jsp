<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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

        th {
            background-color: darkcyan;
            color: white;
        }
    </style>
</head>
<body>
<div class="text-center p-5 header">
    <h2>FRESHER MANAGEMENT WEB APPLICATION</h2>
</div>
<div class="container-fluid">
    <div class="row content">
        <div class="col-sm-3 sidenav">
            <h4>Menu</h4>
            <ul>
                <li><a href="/show-add-fresher-form">Add a Fresher</a></li>
                <li><a href="/show-freshers">Freshers List</a></li>
            </ul>
        </div>
        <div class="col-sm-9 p-5">
            <h3 class="text-center">Freshers list</h3>
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                <tr>
                    <th style="width: 7%">Fresher ID</th>
                    <th style="width: 20%">Fresher Name</th>
                    <th style="width: 10%">Gender</th>
                    <th style="width: 10%">Birthdate</th>
                    <th style="width: 10%">Class name</th>
                    <th style="width: 10%">Has salaty</th>
                    <th style="width: 10%">From CampusLink</th>
                    <th style="width: 10%"></th>
                    <th style="width: 10%"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${freshers}" var="f" varStatus="x" >
                    <tr>
                        <td>${f.id}</td>
                        <td>${f.name}</td>
                        <td>
                            <c:choose>
                                <c:when test="${f.gender=='1'}">
                                    Male
                                </c:when>
                                <c:otherwise>
                                    Female
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${f.birthdate}</td>
                        <td>${f.clazz.className}</td>
                        <td>
                            <c:choose>
                                <c:when test="${f.hasSalary=='1'}">
                                    YES
                                </c:when>
                                <c:otherwise>
                                    NO
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${f.fromCampusLink=='1'}">
                                    YES
                                </c:when>
                                <c:otherwise>
                                    NO
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><a href="/show-update-form?id=${f.id}">Update</a></td>
                        <td><a href="/delete-fresher?id=${f.id}">Delete</a></td>
                    </tr>
                </c:forEach>

                <tr>
                    <td>total</td>
                    <td>${freshers.size()}</td>
                </tr>
                </tbody>
            </table>


        </div>

    </div>

</div>

</body>
</html>