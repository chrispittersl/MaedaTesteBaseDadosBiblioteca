<?php
    try{
        $pdo = new PDO("mysql:host=localhost;dbname=teste_maeda_bd","root","",array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
        $pdo->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );

    }catch(PDOException $e){
        echo $e->getMessage();
    }
?>