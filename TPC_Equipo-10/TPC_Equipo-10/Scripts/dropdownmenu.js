function toggleDropdownMenu(event) {
    var dropdown = document.getElementById('dropdownMenu');
    dropdown.classList.toggle('show');
    event.stopPropagation();
}

document.addEventListener('click', function (event) {
    var dropdown = document.getElementById('dropdownMenu');
    if (dropdown && !document.getElementById('UserIcon').contains(event.target) && !dropdown.contains(event.target)) {
        dropdown.classList.remove('show');
    }
});

function logout() {
    window.location.href = 'Default.aspx?logout=true';
}