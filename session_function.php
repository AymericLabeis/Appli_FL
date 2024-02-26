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

    $timestamp = isset($_COOKIE['last_access']) ? intval($_COOKIE['last_access']) : 0;

    if (time() - $timestamp > 300) { 
        LogOut();
    }
}

function redirectWithError($errorPage) {
    header("Location: $errorPage");
    exit();
}
function checkAdminSession() {
    if ($_SESSION['role'] !== 'admin') {
        redirectWithError('error404.php');
    }
}

function LogOut() {
    session_unset();
    session_destroy();
    header("Location: connexion.php");
    exit();
}
?>
