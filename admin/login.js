// ==========================================================
// RC Bande Zwickau
// Admin Login (Entwicklung)
// Wird später durch PHP ersetzt
// ==========================================================

const loginForm = document.getElementById("loginForm");

const loginError = document.getElementById("loginError");

loginForm.addEventListener("submit", function(event){

    event.preventDefault();

    const username = document.getElementById("username").value.trim();

    const password = document.getElementById("password").value;

    // ============================================
    // Testzugang
    // ============================================

    if(username === "admin" && password === "rcb2026"){

        window.location.href = "dashboard.html";

    }

    else{

        loginError.textContent = "Benutzername oder Passwort ist falsch.";

    }

});