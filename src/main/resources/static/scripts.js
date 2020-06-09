document.getElementById("clearButton").addEventListener("click", clear);

function sort(column, isNum) {
    let table, rows, switching = true, i, x, y, shouldSwitch, direction = "asc", switchCount = 0; 
    table = document.getElementById("table");
    while (switching) {
        switching = false;
        rows = table.rows;
        for (i = 1; i < rows.length - 1; i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("TD")[column];
            y = rows[i + 1].getElementsByTagName("TD")[column];
            if (!isNum) {
                if (direction == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
                else if (direction = "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            else {
                if (direction == "asc") {
                    if (parseFloat(x.innerHTML.replace(",", ".")) > parseFloat(y.innerHTML.replace(",", "."))) {
                        shouldSwitch = true;
                        break;
                    }
                }
                else if (direction = "desc") {
                    if (parseFloat(x.innerHTML.replace(",", ".")) < parseFloat(y.innerHTML.replace(",", "."))) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
        }
        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
            switchCount++;
        }
        else {
            if (switchCount == 0 && direction == "asc") {
                direction = "desc";
                switching = true;
            }
        }
    }
}

function clear() {
    document.getElementById("type").value = "";
    document.getElementById("subtype").value = "";
    document.getElementById("class").value = "";
    document.getElementById("name").value = "";
    document.getElementById("size").value = "";
}

function searchHighlight(match) {
    //  alert(typeof(match) == "object");
    const table = document.getElementById("table").rows;
    let i, j, row, text, start, end, result;
    for (i = 1; i < table.length; i++) {
        row = table[i].cells;
        for (j = 1; j < row.length; j++) {
            text = row[j].innerText;
            if (text.includes(match)) {
                //  row[j].style.color = "#9933ff";
                start = text.indexOf(match);
                end = start + match.toString().length;
                result = text.substring(0, start)
                    + "<span style='background: lightblue'>"
                    + text.substring(start, end)
                    + "</span>"
                    + text.substring(end);
                row[j].innerHTML = result;
            }
        }
    }
}
