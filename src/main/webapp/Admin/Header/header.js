
document.addEventListener('DOMContentLoaded', function () {
    let navLinks = document.querySelectorAll('header nav a');

    navLinks.forEach(link => {
        link.addEventListener('click', function (e) {
            e.preventDefault();

            let targetPage = this.getAttribute('href');
            window.location.href = targetPage;
        });
    });
});

const dropdown = document.querySelector('.dropdown');

dropdown.addEventListener('click', () => {
    dropdown.classList.toggle('active');
});

