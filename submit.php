<?php
// Include the database connection
include 'db.php';  // Make sure db.php is in the same directory or provide the full path

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect form data
    $name = $_POST['name'];
    $email = $_POST['email'];
    $service = $_POST['service'];
    $service_date = $_POST['service_date'];
    $special_request = $_POST['special_request'];

    // Prepare and bind the query to insert data
    $stmt = $conn->prepare("INSERT INTO bookings (name, email, service, service_date, special_request) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $name, $email, $service, $service_date, $special_request);

    // Execute the query
    if ($stmt->execute()) {
        echo "Booking successful!";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
