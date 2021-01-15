<?php
    include_once "conexao.php";
    $livro = $_POST["livro"];
    $stmt = $pdo->prepare("SELECT * FROM livro where titulo like '$livro'");
    $dados = $stmt->fetch(PDO::FETCH_ASSOC);
    $rows = $stmt->rowCount();
    $erro = 0;
    if($dados['id_associado']){
        if($rows > 0){
            $associado = $_POST["associado"];
            $stmt = $pdo->prepare("SELECT * FROM associado where nome like '$associado'");
            $dados = $stmt->fetch(PDO::FETCH_ASSOC);
            $id_associado = $dados['id'];
            $rows = $stmt->rowCount();
            if($rows > 0){
                try{
                    $stmt = $pdo->prepare("UPDATE livro set id_associado = $id_associado where titulo like '$livro'");
                    $stmt->execute()
                }
                catch(Exception $e){
                    $erro = 1;
                }
            }else{
                $erro = 1
            }
        }else{
            $erro = 1;
        }
    }
    else{
        $erro = 1;
    }
    if($erro == 0)
        echo json_encode("sucesso");
    else
        echo json_encode("falha");
?>