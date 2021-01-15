<?php
    include_once "conexao.php";
    $livro = $_POST['livro'];
    $stmt = $pdo->prepare("UPDATE livro set id_associado = NULL where titulo like '$livro'");
    $stmt->execute();
?>