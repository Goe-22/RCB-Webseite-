/*
==========================================================
RC Bande Zwickau e.V.
Version 1.0
app.js
==========================================================
*/

document.addEventListener("DOMContentLoaded", () => {

    /* ==========================================
       Elemente
    ========================================== */

    const menuButton = document.querySelector(".menu-toggle");
    const mobileMenu = document.querySelector(".mobile-menu");
    const overlay = document.querySelector(".mobile-overlay");

    /* ==========================================
       Menü öffnen
    ========================================== */

    if (menuButton && mobileMenu && overlay) {

        menuButton.addEventListener("click", () => {

            mobileMenu.classList.add("active");
            overlay.classList.add("active");

        });

    }

    /* ==========================================
       Menü schließen
    ========================================== */

    if (overlay) {

        overlay.addEventListener("click", () => {

            mobileMenu.classList.remove("active");
            overlay.classList.remove("active");

        });

    }

});