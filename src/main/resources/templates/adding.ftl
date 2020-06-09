<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adding form</title>
    <link rel="stylesheet" href="/static/update.css">
</head>
<body>
<div class="container">
    <form name="addingForm" action="/adding" method="post">
        <h4>Add position</h4>
        <div class="inputDivs">
            <div class="error" id="incorrectTypeInput"><p></p></div>
            <label id="labels" for="type">Type:</label>
            <input id="type" type="text" placeholder="Type.." name="type" maxlength="12">
        </div>
        <div class="inputDivs">
            <div class="error" id="incorrectSubtypeInput"><p></p></div>
            <label id="labels" for="subtype">Subtype:</label>
            <input id="subtype" type="text" placeholder="Subtype.." name="subtype" maxlength="12">
        </div>
        <div class="inputDivs">
            <div class="error" id="incorrectClassNameInput"><p></p></div>
            <label id="labels" for="className">Class:</label>
            <input id="className" type="text" placeholder="Class.." name="className" maxlength="12">
        </div>
        <div class="inputDivs">
            <div class="error" id="incorrectNameInput"><p></p></div>
            <label id="labels" for="name">Name:</label>
            <input id="name" type="text" placeholder="Name.." name="name" maxlength="12">
        </div>
        <div class="inputDivs">
        <div class="error" id="incorrectSizeInput"><p></p></div>
            <label id="labels" for="size">Size:</label>
            <input id="size" type="text" placeholder="Size.." name="size" maxlength="12">
        </div>
        <div class="inputDivs">
            <div class="error" id="incorrectPriceInput"><p id="float"></p></div>
            <label id="labels" for="price">Price:</label>
            <input id="price" type="text" placeholder="Price.." name="price" maxlength="9">
        </div>
        <div class="inputDivs">
            <div class="error" id="incorrectQuantityInput"><p></p></div>
            <label id="labels" for="quantity">Quantity:</label>
            <input id="quantity" type="text" placeholder="Quantity.." name="quantity" maxlength="6">
        </div>
        <div class="inputDivs">
            <div class="error" id="incorrectStoreInput"><p></p></div>
            <label id="labels" for="store">Store:</label>
            <input id="store" type="text" placeholder="Store.." name="store" maxlength="6">
        </div>
        <input type="hidden" value="${id}" name="id">
        <div class="btnDiv">
            <button id="saveBtn" type="submit">Save</button>
            <button type="submit" formaction="/" formmethod="get">Cancel</button>
        </div>
    </form>
</div>
<script>
    document.getElementById("saveBtn").addEventListener("click", checkUpdateValues);

    function checkUpdateValues() {
    let v = document.forms["addingForm"]["type"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectTypeInput").innerHTML = "Type value is not present.";
        document.getElementById("incorrectTypeInput").style.display = "block";
        event.preventDefault();
    }

    v = document.forms["addingForm"]["subtype"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectSubtypeInput").innerHTML = "Subtype value is not present.";
        document.getElementById("incorrectSubtypeInput").style.display = "block";
        event.preventDefault();
    }

    v = document.forms["addingForm"]["className"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectClassNameInput").innerHTML = "Class value is not present.";
        document.getElementById("incorrectClassNameInput").style.display = "block";
        event.preventDefault();
    }

    v = document.forms["addingForm"]["name"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectNameInput").innerHTML = "Name value is not present.";
        document.getElementById("incorrectNameInput").style.display = "block";
        event.preventDefault();
    }

    v = document.forms["addingForm"]["size"].value;
    if (v == null || v == "") {
        document.getElementById("incorrectSizeInput").innerHTML = "Size value is not present.";
        document.getElementById("incorrectSizeInput").style.display = "block";
        event.preventDefault();
    }

    v = document.forms["addingForm"]["price"].value;
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

    v = document.forms["addingForm"]["quantity"].value;
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

    v = document.forms["addingForm"]["store"].value;
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