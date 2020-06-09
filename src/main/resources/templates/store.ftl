<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Store</title>
    <link rel="stylesheet" href="/static/style.css">
    <script type="text/javascript" src="scripts.js"></script>
</head>
<body>
<br>
<h2 style="text-align: center">Create, update, delete, search, filter and sort functionality with error checking, pop-up messages and highlights.</h2>
<div class="container">
    <div>
        <table id="table">
            <thead>
            <tr>
                <th onclick="sort(0, true)" id="id">Id</th>
                <th onclick="sort(1, false)">Type</th>
                <th onclick="sort(2, false)" style="width: 100px">Subtype</th>
                <th onclick="sort(3, false)" style="width: 80px">Class</th>
                <th onclick="sort(4, false)" style="width: 90px">Name</th>
                <th onclick="sort(5, true)" style="width: 55px">Size</th>
                <th onclick="sort(6, true)" style="width: 70px">Price ($)</th>
                <th onclick="sort(7, true)" style="width: 70px">Quantity</th>
                <th onclick="sort(8, true)" style="width: 65px">Store</th>
            </tr>
            </thead>
            <tbody>
                <#list filtered as item>
                <tr>
                    <form action="/update" method="get">
                        <input type="hidden" value="${item.id}" name="id">
                        <td id="id"><button id="idBtn" type="submit">${item.id}</button></td>
                    </form>
                    <td>${item.type.name}</td>
                    <td>${item.subtype.name}</td>
                    <td>${item.className}</td>
                    <td>${item.name}</td>
                    <td>${item.size} <#if item.type.name == "drinks">l<#else>p</#if></td>
                    <td>${item.price}</td>
                    <td>${item.quantity}</td>
                    <td>${item.atStore}</td>
                </tr>
                </#list>
            </tbody>
        </table>
    </div>
    <div>
        <div class="formsDiv">
            <form id="searchForm" action="/search" method="post">
                <input id="searchInput" type="text" name="search" placeholder="Search.." maxlength="12"></input>
            </form>
            <form id="filterForm" action="/" method="post">
                <div id="title"><label>Filter list</label></div>
                <div>
                    <label id="filterLabel" for="type">Type: </label>
                    <select id="type" name="type">
                        <option value="any" selected>All</option>
                        <#list types as type>
                            <#if type.name == curType>
                                <option value="${type.name}" selected>${type.name}</option>
                            <#else>
                                <option value="${type.name}">${type.name}</option>
                            </#if>
                        </#list>
                    </select>
                </div>
                <div>
                    <label id="filterLabel" for="subtype">Subtype: </label>
                    <select id="subtype" name="subtype">
                        <option value="any">All</option>
                        <#list subtypes as subtype>
                            <#if subtype.name == curSubtype>
                                <option value="${subtype.name}" selected>${subtype.name}</option>
                            <#else>
                                <option value="${subtype.name}">${subtype.name}</option>
                            </#if>
                        </#list>
                    </select>
                </div>
                <div>
                    <label id="filterLabel" for="class">Class: </label>
                    <select id="class" name="class">
                        <option value="any" selected>All</option>
                        <#list classes as item>
                            <#if item == curClass>
                                <option value="${item}" selected>${item}</option>
                            <#else>
                                <option value="${item}">${item}</option>
                            </#if>
                        </#list>
                    </select>
                </div>
                <div>
                    <label id="filterLabel" for="name">Name: </label>
                    <select id="name" name="name">
                        <option value="any" selected>All</option>
                        <#list names as name>
                            <#if name == curName>
                                <option value="${name}" selected>${name}</option>
                            <#else>
                                <option value="${name}">${name}</option>
                            </#if>
                        </#list>
                    </select>
                </div>
                <div>
                    <label id="filterLabel" for="size">Size: </label>
                    <select id="size" name="size">
                        <option value="any" selected>All</option>
                        <#list sizes as size>
                            <#if size == curSize>
                                <option value="${size}" selected>${size} l</option>
                            <#else>
                                <option value="${size}">${size} l</option>
                            </#if>
                        </#list>
                    </select> 
                </div>
                <div class="addingBody" style="margin-bottom: 12px">
                    <button class="btn" id="filterButton" type="submit">Filter</button>
                    <button class="btn" id="clearButton" type="submit" formmethod="get">Clear</button>
                </div>
            </form>
            <form id="addingForm" action="/adding" method="get">
                <button id="adding" type="submit">Add new position</button>
            </form>
        </div>
    </div>
</div>
<br>
<br>
<p id="message" style="font-size: small; margin-left: 10vh"></p>
</body>
<script>
function checkValueType(val) {
    if (val != null)
        searchHighlight(val);
    else
        return "* Search highlights do work for numbers only. " +
        "For some reason string search value doesn't reach view, while numbers and undefined do."
    return "";
}
document.getElementById("message").innerHTML = checkValueType(${search}); 
</script>
</html>