<?php
function connectDB() {
    return new PDO('mysql:host=localhost;dbname=projet_fl', 'root', '');
}
?>
