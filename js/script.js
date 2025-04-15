document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault();

    // Get input values
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;

    // Simple validation
    if (username === "" || password === "") {
        document.getElementById("errorMessage").textContent = "Both fields are required!";
    } else {
        // Send form data to server (you can later use AJAX for a more sophisticated approach)
        fetch('login.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `username=${username}&password=${password}`
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                window.location.href = "dashboard.html"; // Redirect to a dashboard or success page
            } else {
                document.getElementById("errorMessage").textContent = data.message;
            }
        })
        .catch(error => console.error('Error:', error));
    }
});
