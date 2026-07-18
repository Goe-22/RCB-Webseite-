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
    const closeButton = document.querySelector(".mobile-close");

    /* ==========================================
       Menü öffnen
    ========================================== */

    if (menuButton) {

        menuButton.addEventListener("click", () => {

            mobileMenu.classList.add("active");
            overlay.classList.add("active");

        });

    }

    /* ==========================================
       Menü schließen
    ========================================== */

    function closeMenu() {

        mobileMenu.classList.remove("active");
        overlay.classList.remove("active");

    }

    if (overlay) {

        overlay.addEventListener("click", closeMenu);
        if (closeButton) {

    closeButton.addEventListener("click", closeMenu);

}

    }

    /* ==========================================
       Untermenüs
    ========================================== */

    const submenuButtons = document.querySelectorAll(".submenu-arrow");

    submenuButtons.forEach(button => {

        button.addEventListener("click", function(e) {

            e.preventDefault();
            e.stopPropagation();

            const submenu =
                this.parentElement.nextElementSibling;

            submenu.classList.toggle("active");

            this.classList.toggle("active");

        });

    });

});