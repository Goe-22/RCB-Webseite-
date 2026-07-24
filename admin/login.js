<button class="login-button">

Anmelden

</button>const username = "admin";
const password = "rcb2020";

function login() {

    const user = document.getElementById("username").value;
    const pass = document.getElementById("password").value;

    if (user === username && pass === password) {

        window.location.href = "dashboard.html";

    } else {

        alert("Benutzername oder Passwort falsch.");

    }

}
