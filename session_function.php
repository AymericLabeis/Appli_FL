<?php
function startSession() {
    session_start();
}

function updateLastAccess() {
    setcookie('last_access', strval(time()), time() + 300, '/');
}

function checkSession() {
    if (empty($_SESSION['id'])) {
        redirectWithError('error404.php');
    }

    $timestampDernierAcces = isset($_COOKIE['last_access']) ? intval($_COOKIE['last_access']) : 0;

    if (time() - $timestampDernierAcces > 300) { 
        LogOut();
    }
}

function redirectWithError($errorPage) {
    header("Location: $errorPage");
    exit();
}

function LogOut() {
    session_unset();
    session_destroy();
    header("Location: connexion.php");
    exit();
}
?>
