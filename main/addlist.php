<?php
    session_start();
    require_once "../Database/Database.php";
    if($_SESSION['username'] == null){
    echo "<script>alert('Please login.')</script>";
    header("Refresh:0 , url = ../index.html");
    exit();

    }

    if($_POST['id'] != null && $_POST['nombre'] != null && $_POST['sede'] != null ){
        $sql = "INSERT INTO visitante (id,nombre,sede) VALUES ('". trim($_POST['id']). "','". trim($_POST['nombre']). "','". trim($_POST['sede']). "')";
        if($conn->query($sql)){
            echo "<script>alert('Success added')</script>";
            header("Refresh:0 , url = ../list.php");
            exit();

        }
        else{
            echo "<script>alert('Add failed')</script>";
            header("Refresh:0 , url = ../list.php");
            exit();

        }
    }
    else{
        echo "<script>alert('Please fill in information.')</script>";
        header("Refresh:0 , url = ../list.php");
        exit();

    }
    mysqli_close($conn);
?>