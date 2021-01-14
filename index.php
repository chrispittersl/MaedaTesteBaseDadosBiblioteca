<!-- Conectando com o banco de dados -->
<?php require "conexao.php"; ?>
<!DOCTYPE html>
<html lang="pt-br">

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Biblioteca</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
        <div class="container">
            <a class="navbar-brand h1 mb-0" href="#">Biblioteca</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item" id="home-nav">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item" id="about-nav">
                        <a class="nav-link" href="#">Sobre</a>
                    </li>
                    <li class="nav-item" id="services-nav">
                        <a class="nav-link" href="#">Serviços</a>
                    </li>
                    <li class="nav-item" id="contact-nav">
                        <a class="nav-link" href="#">Contato</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center order-1">
				<h1 class="mt-5">Empréstimos de Livros</h1>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-sm-12">
				<table class="indent table table-hover">
					<thead class="thead-dark">
						<tr>
							<th>Livro</th>
							<th>Associado</th>
							<th>Autor</th>
							<th>Assunto</th>
							<th>Biblioteca</th>
							<th>Ação</th>
						</tr>
					</thead>
					<tbody>
					<?php
						$stmt = $pdo->prepare("SELECT L.titulo, Assoc.nome AS nome_associado, Au.nome AS nome_autor, 
						Assun.descricao AS assunto_descricao, B.descricao AS biblio_descricao from livro AS L 
						INNER JOIN associado AS Assoc ON Assoc.matricula = L.id_associado INNER JOIN biblioteca AS 
						B ON B.id = L.id_biblioteca INNER JOIN producao AS P ON P.id_livro = isbn INNER JOIN categoria 
						AS C ON C.id_livro = isbn INNER JOIN autor AS Au ON Au.id = P.id_autor INNER JOIN assunto AS Assun 
						ON Assun.id = C.id_assunto");
						$stmt->execute();
                        while($row = $stmt->fetch(PDO::FETCH_ASSOC))
                        {
                	?>
                          <tr>
                              <td><?php echo $row['titulo'];?></td>
                              <td><?php echo $row['nome_associado'];?></td>
							  <td><?php echo $row['nome_autor'];?></td>
							  <td><?php echo $row['assunto_descricao'];?></td>
							  <td><?php echo $row['biblio_descricao'];?></td>
							  <td><a href="" class="btn btn-danger btn-block" id="del_emprestimo">X</a></td>
                          </tr>
                	<?php        
                        }
                	?>
					</tbody>
				</table>
			</div>
			<div class="d-flex justify-content-center align-items-center container ">
				<div class="row">
					<div class="col-lg-6">
						<form id="form-add">
							<div class="form-group">
								<input class="form-control mt-3" type="text"  id="addLivro" placeholder="Livro"/>
								<input class="form-control mt-3" type="text"  id="addAssociado" placeholder="Associado"/>
								<button form="form-add" class="btn btn-success mt-3 btn-block" id="btn-add">Fazer Empréstimo</button>
							</div>
						</form>
					</div>
					<div class="col-lg-6">
						<form id="form-edit">
							<div class="form-group">
								<input class="form-control mt-3" type="text" id="editLivro" placeholder="Livro"/>
								<input class="form-control mt-3" type="text"  id="editAssociado" placeholder="Associado"/>
								<button form="form-edit" class="btn btn-warning mt-3 btn-block" id="btn-edit">Editar Empréstimo</button>
							</div>
						</form>
					</div>
				</div>
        	</div>
		</div>
	</div>
	
	<!-- Bootstrap core JavaScript -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			const item_about = document.querySelector('#home-nav')
			item_about.classList.toggle('active')
		})
	</script>
</body>

</html>