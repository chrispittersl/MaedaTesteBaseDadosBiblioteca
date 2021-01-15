$(document).ready(function(){
    $(document).on("click",".livro", function(e){
        e.preventDefault()
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
                window.location.href = "#"
            }
        })
    })
    $(document).on("click","#btn-add", function(e){
        e.preventDefault()
        adicionar()
    })
    $(document).on("click","#btn-edit", function(e){
        e.preventDefault()
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
        dataType: 'json',
        success: function(resposta){
            if(resposta == "sucesso")
                alert("Empréstimo editado com sucesso!")
            else
                alert("Erro ao editar o empréstimo")
            window.location.href = "#"
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
            window.location.href = "#"
        }
    })
}