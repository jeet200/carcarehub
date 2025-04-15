<?php
// Include the database connection
include 'db.php';  // Make sure db.php is in the same directory or provide the full path

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect form data
    $name = $_POST['name'];
    $email = $_POST['email'];

    // Prepare and bind the query to insert data into the customers table
    $stmt = $conn->prepare("INSERT INTO customers (name, email) VALUES (?, ?)");
    $stmt->bind_param("ss", $name, $email);

    // Execute the query
    if ($stmt->execute()) {
        echo "Customer added successfully!";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
