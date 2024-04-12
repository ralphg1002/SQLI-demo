<?php
/*
    WARNING: This is a demo for SQLi vulnerability. Use with caution!
    tautology: username: hithere password: something' or '1' = '1
    blind (time): username: alm470' -SLEEP(1) or '1' = '1 password: anything
    error-based: username: test' password: w
    union: username: hiagain password: w' or '1' = '1' union select * from employees where '1'='1
*/

// Parameters
$username = $_POST['username'];
$password = $_POST['pswd'];

try {
    // Start connection
    $con = mysqli_connect('server-address', 'username', 'password', 'database_name', 'port'); // Replace with your own credentials

    if (mysqli_connect_errno()) {
        throw new Exception("Failed to connect to MySQL: " . mysqli_connect_error());
    }

    $sql = "SELECT * FROM `users` where username = '$username' and password = '$password'";

    if ($result = mysqli_query($con, $sql)) {
        $resultArray = array();
        $tempArray = array();

        while ($row = $result->fetch_object()) {
            $tempArray = $row;
            array_push($resultArray, $tempArray);
        }

        if (!empty($resultArray)) {
            // Display user information from db
            foreach ($resultArray as $user) {
                echo "<h3>Name: " . $user->name . "</h3>";
                echo "Username: " . $user->username . "<br>";
                echo "Password: " . $user->password . "<br>";
                echo "Date of Birth: " . $user->DOB . "<br>";
                echo "Email: " . $user->email . "<br>";
                echo "Phone Number: " . $user->phoneNumber . "<br>";
                echo "Address: " . $user->address . "<br>";
            }
        } else {
            echo "User does not exist!";
        }
    } else {
        echo json_encode(array('message' => 'Query failed'));
    }

    // Close connection
    mysqli_close($con);

// To show error-based SQLi
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>
