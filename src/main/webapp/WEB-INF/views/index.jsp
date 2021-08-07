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
        .header{
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
            <h3 class="text-center">Welcome to our website</h3>


        </div>

    </div>

</div>

</body>
</html>