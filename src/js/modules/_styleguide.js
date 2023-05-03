// Gather all the shades
document.querySelectorAll('.shade-copy').forEach(function(shade) {

    // Add a listener
    shade.addEventListener('click', (event) => {

        // Copy the text
        navigator.clipboard.writeText(shade.textContent.trim());
    })
})