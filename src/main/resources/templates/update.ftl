<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update page</title>
    <link rel="stylesheet" href="/static/update.css">
    <script type="text/javascript" src="scripts.js"></script>
</head>
<body>
    <div class="container">
        <form name="editForm" action="/update" method="post">
            <h4>Edit position</h4>
            <div class="inputDivs">
                <div class="error" id="incorrectTypeInput"><p></p></div>
                <label id="labels" for="type">Type:</label>
                <input id="type" type="text" value="${item.type.name}" name="type" maxlength="12">
            </div>
            <div class="inputDivs">
                <div class="error" id="incorrectSubtypeInput"><p></p></div>
                <label id="labels" for="subtype">Subtype:</label>
                <input id="subtype" type="text" value="${item.subtype.name}" name="subtype" maxlength="12">
            </div>
            <div class="inputDivs">
                <div class="error" id="incorrectClassNameInput"><p></p></div>
                <label id="labels" for="className">Class:</label>
                <input id="className" type="text" value="${item.getClassName()}" name="className" maxlength="12">
            </div>
            <div class="inputDivs">
                <div class="error" id="incorrectNameInput"><p></p></div>
                <label id="labels" for="name">Name:</label>
                <input id="name" type="text" value="${item.name}" name="name" maxlength="12">
            </div>
            <div class="inputDivs">
            <div class="error" id="incorrectSizeInput"><p></p></div>
                <label id="labels" for="size">Size:</label>
                <input id="size" type="text" value="${item.size}" name="size" maxlength="12">
            </div>
            <div class="inputDivs">
                <div class="error" id="incorrectPriceInput"><p id="float"></p></div>
                <label id="labels" for="price">Price:</label>
                <input id="price" type="text" value="${item.price}" name="price" maxlength="9">
            </div>
            <div class="inputDivs">
                <div class="error" id="incorrectQuantityInput"><p></p></div>
                <label id="labels" for="quantity">Quantity:</label>
                <input id="quantity" type="text" value="${item.quantity}" name="quantity" maxlength="6">
            </div>
            <div class="inputDivs">
                <div class="error" id="incorrectStoreInput"><p></p></div>
                <label id="labels" for="store">Store:</label>
                <input id="store" type="text" value="${item.atStore}" name="store" maxlength="6">
            </div>
            <input type="hidden" value="${id}" name="id">
            <div class="btnDiv">
                <button id="saveBtn" type="submit">Save</button>
                <button type="submit" formaction="/delete" formmethod="get">Delete</button>
            </div>
            <div class="deleteBtn"><button type="submit" formaction="/" formmethod="get">Cancel</button></div>
        </form>
    </div>
<script>
    document.getElementById("saveBtn").addEventListener("click", checkUpdateValues);

    function checkUpdateValues() {
    let v = document.forms["editForm"]["type"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectTypeInput").innerHTML = "Type value is not present.";
        document.getElementById("incorrectTypeInput").style.display = "block";
        event.preventDefault();
    }

    v = document.forms["editForm"]["subtype"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectSubtypeInput").innerHTML = "Subtype value is not present.";
        document.getElementById("incorrectSubtypeInput").style.display = "block";
        event.preventDefault();
    }

    v = document.forms["editForm"]["className"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectClassNameInput").innerHTML = "Class value is not present.";
        document.getElementById("incorrectClassNameInput").style.display = "block";
        event.preventDefault();
    }

    v = document.forms["editForm"]["name"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectNameInput").innerHTML = "Name value is not present.";
        document.getElementById("incorrectNameInput").style.display = "block";
        event.preventDefault();
    }

    v = document.forms["editForm"]["size"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectSizeInput").innerHTML = "Size value is not present.";
        document.getElementById("incorrectSizeInput").style.display = "block";
        event.preventDefault();
    }

    v = document.forms["editForm"]["price"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectPriceInput").innerHTML = "Price value is not present.";
        document.getElementById("incorrectPriceInput").style.display = "block";
        event.preventDefault();
    }
    v = v.replace(",", ".");
    if (isNaN(Number(v))) {
        document.getElementById("incorrectPriceInput").innerHTML = "Should be a number.";
        document.getElementById("incorrectPriceInput").style.display = "block";
        event.preventDefault();
    }

    v = document.forms["editForm"]["quantity"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectQuantityInput").innerHTML = "Quantity value is not present.";
        document.getElementById("incorrectQuantityInput").style.display = "block";
        event.preventDefault();
    }
    if (isNaN(Number(v))) {
        document.getElementById("incorrectQuantityInput").innerHTML = "Should be a number.";
        document.getElementById("incorrectQuantityInput").style.display = "block";
        event.preventDefault();
    }

    v = document.forms["editForm"]["store"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectStoreInput").innerHTML = "Store value is not present.";
        document.getElementById("incorrectStoreInput").style.display = "block";
        event.preventDefault();
    }
    if (isNaN(Number(v))) {
        document.getElementById("incorrectStoreInput").innerHTML = "Should be a number.";
        document.getElementById("incorrectStoreInput").style.display = "block";
        event.preventDefault();
    }
    setTimeout(function() {
            document.getElementById("incorrectTypeInput").style.display = "none";
            document.getElementById("incorrectSubtypeInput").style.display = "none";
            document.getElementById("incorrectClassNameInput").style.display = "none";
            document.getElementById("incorrectNameInput").style.display = "none";
            document.getElementById("incorrectSizeInput").style.display = "none";
            document.getElementById("incorrectPriceInput").style.display = "none";
            document.getElementById("incorrectQuantityInput").style.display = "none";
            document.getElementById("incorrectStoreInput").style.display = "none";
        }, 3000);
    return true;
}
</script>
</body>
</html>