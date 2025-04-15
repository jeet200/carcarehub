<?php
// Include the database connection
include('db.php');

// Get POST data
$username = $_POST['username'];
$password = $_POST['password'];

// Initialize response array
$response = array('success' => false, 'message' => 'Invalid credentials');

// Simple input sanitization
$username = htmlspecialchars($username);
$password = htmlspecialchars($password);

// Database Query (using prepared statements for security)
$query = "SELECT * FROM users WHERE username = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();
    
    // Verify password (Assume you stored password hashes in the database)
    if (password_verify($password, $user['password'])) {
        $response['success'] = true;
        $response['message'] = 'Login successful!';
    } else {
        $response['message'] = 'Incorrect password!';
    }
} else {
    $response['message'] = 'No user found with that username!';
}

// Return JSON response
echo json_encode($response);
?>
