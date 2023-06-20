function validateForm(form) {
    if(form.email.value && form.forename.value && form.surname.value)
        createPlayer({ player: {
            email: form.email.value,
            forename: form.forename.value,
            middlenames: form.middlenames.value,
            surname: form.surname.value,
            date_of_birth: form.date_of_birth.value,
        }});
    else alert("Enter email, forename, surname and date of birth");
    return false;
}

function validatePhoneForm(form) {
    if(form.email.value && !isNaN(form.phone_number.value) && form.phone_type.value)
        createPlayerPhone({ player_phone: {
            email: form.email.value,
            phone_number: form.phone_number.value,
            phone_type: form.phone_type.value
        }});
    else alert("All fields are required!");
    return false;
}

async function createPlayerPhone(data) {
    const {player_phone, error} = await postRequest("/player_phone", data);
    if(player_phone) {
        alert("Phone number stored");
        console.log(player_phone);
    }
    if(error) {
        alert(error.sqlMessage);
        console.log(error);
    };
}

async function createPlayer(data) {
    const {player, error} = await postRequest("/player", data);
    if(player) {
        alert("player created");
        console.log(player);
    }
    if(error) {
        alert(error.sqlMessage);
        console.log(error);
    };
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
