const venuesSelect = document.getElementById("venues");

setVenuesOptions();

async function setVenuesOptions() {
    const venues = await fetch('/venues').then(res => res.json());
    console.log(venues);
    for(let ven of venues) {
        let opt = document.createElement("option");
        opt.value = ven['name'];
        opt.text = ven['name']
        venuesSelect.appendChild(opt);
    }
}

async function updateDetails() {
    const {matches, error} = await postRequest("/matches", {venue: venuesSelect.value});
    if(matches) updateTable(matches);
    if(error) alert(error.sqlMessage);
}

async function postRequest(url, body) {
    return fetch(url, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(body)
    })
    .then(res => res.json())
    .catch((err) => console.log(err));
}

function objToTable(obj) {
    //var tbody = document.getElementById('tbody');
    //for (let i = 0; i < obj.length; i++) {
        //let tr = "<tr>";
    //}
    const matchesDiv = document.getElementById("matches");
    matchesDiv.textContent = JSON.stringify(obj);
}

function updateTable(listOfObj) {
    //Removes existing table
    let tableHTML = document.getElementById('tbody');
    tableHTML.innerHTML = "";
    if(listOfObj.length === 0){
        tableheaders = [];
    }
    else {
        //create header
        createHeader(tableHTML, Object.keys(listOfObj[0]));
        //create content
        listOfObj.forEach((item) => createRow(tableHTML, item));
    }
}

//create header
function createHeader(tableHTML, tableheaders) {
    const tablerow = document.createElement("tr");
    tableheaders.forEach( key => {
        const tabledata = document.createElement("th");
        tabledata.innerText = key;
        tablerow.appendChild(tabledata);
    });
    tableHTML.appendChild(tablerow);
}

//create row
function createRow(tableHTML, data) {
    const tablerow = document.createElement("tr");

    Object.values(data).forEach( value => {
        const tabledata = document.createElement("td");
        tabledata.innerText = value;
        tablerow.appendChild(tabledata);
    });
    tableHTML.appendChild(tablerow);
}
