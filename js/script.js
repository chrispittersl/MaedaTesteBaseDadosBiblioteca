$(document).ready(function(){
    $(document).on("click",".livro", function(){
        var livro = $(this).attr("id"),
            data = {livro: livro}
        $.ajax({
            url: "delete.php",
            method: "POST",
            data: data,
            success: function(resposta){
                if(resposta == "sucesso"){
                    alert("Empréstimo deletado com sucesso!")
                }else{
                    alert("Erro ao deletar o empréstimo, favor contactar o Departamento de TI")
                }
            }
        })
    })
    $(document).on("click","#btn-add", function(){
        adicionar()
    })
    $(document).on("click","#btn-edit", function(){
        editar()
    })
})


function adicionar(){
    var livro = $('#addLivro').val(),
        associado = $('#addAssociado').val(),
        data = {
            associado: associado,
            livro: livro
        }
    $.ajax({
        url: "add.php",
        method: "POST",
        data: data,
        success: function(resposta){
            if(resposta == "sucesso")
                alert("Empréstimo adicionado com sucesso!")
            else
                alert("Erro ao adicionar o empréstimo!")
        }
    })
}
function editar(){
    var livro = $("#editLivro").val(),
        associado = $("#editAssociado").val(),
        data = {
            livro: livro,
            associado: associado
        }
    $.ajax({
        url: "edit.php",
        method: "POST",
        data: data,
        success: function(resposta){
            if(resposta == "sucesso")
                alert("Empréstimo editado com sucesso!")
            else
                alert("Erro ao editar o empréstimo")
        }
    })
}