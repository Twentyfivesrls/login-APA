<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="robots" content="noindex, nofollow">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
        <style type="text/css">
            <#include "resources/css/login.css">
        </style>
        <title><#nested "title"></title>

    </head>

    <body>
        <#nested "header">

                <#nested "form">

    </body>
    </html>
</#macro>
