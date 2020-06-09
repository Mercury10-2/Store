<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Store</title>
    <link rel="stylesheet" href="/static/style.css">
</head>
<body>
<br>
<br>
<div>
    <div style="float: left">
        <table>
            <thead>
            <tr>
                <th id="id">Id</th>
                <th>Type</th>
                <th style="width: 100px">Subtype</th>
                <th style="width: 100px">Class</th>
                <th style="width: 100px">Name</th>
                <th>Info</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>At store</th>
            </tr>
            </thead>
            <tbody>
        <#list filtered as item>
        <tr>
            <td id="id">${item.id}</td>
            <td>${item.type.name}</td>
            <td>${item.subtype.name}</td>
            <td>${item.className}</td>
            <td>${item.name}</td>
            <td>${item.info}</td>
            <td>${item.price}$</td>
            <td>${item.quantity}</td>
            <td>${item.atStore}</td>
        </tr>
        </#list>
            </tbody>
        </table>
    </div>
    <div style="float: left">
        <form action="/" method="post">
            <div style="float: left">
                <label for="type" style="margin-left: 20px">Type: </label>
                <select id="type" name="type">
                    <option value="any" selected>Any</option>
                    <#list types as type>
                        <#if type.name == curType>
                            <option value="${type.name}" selected>${type.name}</option>
                        <#else>
                            <option value="${type.name}">${type.name}</option>
                        </#if>
                    </#list>
                </select>
            </div>
            <div style="float: left">
                <label for="subtype" style="margin-left: 20px">Subtype: </label>
                <select id="subtype" name="subtype">
                    <option value="any">Any</option>
                    <#list subtypes as subtype>
                        <#if subtype.name == curSubtype>
                            <option value="${subtype.name}" selected>${subtype.name}</option>
                        <#else>
                            <option value="${subtype.name}">${subtype.name}</option>
                        </#if>
                    </#list>
                </select>
            </div>
            <div style="float: left">
                <label for="class" style="margin-left: 20px">Class: </label>
                <select id="class" name="class">
                    <option value="any" selected>Any</option>
                    <#list classes as item>
                        <#if item == curClass>
                            <option value="${item}" selected>${item}</option>
                        <#else>
                            <option value="${item}">${item}</option>
                        </#if>
                    </#list>
                </select>
            </div>
            <button type="submit" style="margin-left: 20px">Filter</button>
        </form>
    </div>
</div>
</body>
</html>