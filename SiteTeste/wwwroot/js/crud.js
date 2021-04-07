
var CrudHelper = {

    LimparForm: function () {
        $("#Nome").val('');
        $("#Sexo").val('');

        $("#Rg").val('');
        $("#CPF").val('');
        $("#Telefone").val('');

        $("#Logradouro").val('');
        $("#Endereco").val('');
        
        $("#Bairro").val('');
        $("#Cidade").val('');
        $("#Estado").val('');

        $("#Email").val('');
    },
    ValidarForm: function () {

        var msg = '';
        
        if ($("#Nome").val() == '')
            msg = '* O campo Nome é obrigatório.<br/>';

        if ($("#Sexo").val() == '')
            msg += '* O campo Sexo é obrigatório.<br/>';

        if ($("#Rg").val() == '')
            msg += '* O campo RG é obrigatório.<br/>';

        if ($("#CPF").val() == '')
            msg += '* O campo CPF é obrigatório.<br/>';

        if ($("#Telefone").val() == '')
            msg += '* O campo Telefone é obrigatório.<br/>';

        if ($("#Logradouro").val() == '')
            msg += '* O campo Logradouro é obrigatório.<br/>';

        if ($("#Endereco").val() == '')
            msg += '* O campo Endereço é obrigatório.<br/>';

        if ($("#Bairro").val() == '')
            msg += '* O campo Bairro é obrigatório.<br/>';

        if ($("#Cidade").val() == '')
            msg += '* O campo Cidade é obrigatório.<br/>';

        if ($("#Estado").val() == '')
            msg += '* O campo Estado é obrigatório.<br/>';

        if ($("#Email").val() == '')
            msg += '* O campo Email é obrigatório.<br/>';

        return msg;

    },
    Serializar: function () {
        return {
            Id: $("#Id").val(),
            IdSexo: $("#Sexo").val(),
            Nome: $("#Nome").val(),
            
            IdLogradouro: $("#Logradouro").val(),            		
            Endereco: $("#Endereco").val(),

            Bairro: $("#Bairro").val(),
            Cidade: $("#Cidade").val(),
            IdUF: $("#Estado").val(),

            Rg: $("#Rg").val(),
            CPF: $("#CPF").val(),
            Telefone: $("#Telefone").val(),

            Email: $("#Email").val()
        };
    },
    Carregar: function (linha) {
        
        $("#Id").val(linha.id);
        $("#Nome").val(linha.nome);
        $("#Sexo").val(linha.idSexo);

        $("#Rg").val(linha.rg);
        $("#CPF").val(linha.cpf);
        $("#Telefone").val(linha.telefone);

        $("#Logradouro").val(linha.idLogradouro);
        $("#Endereco").val(linha.endereco);

        $("#Bairro").val(linha.bairro);
        $("#Cidade").val(linha.cidade);
        $("#Estado").val(linha.idUF);

        $("#Email").val(linha.email);
        
    },
    Salvar: function () {
        CrudHelper.LimparMensagemModal();
        var msg = CrudHelper.ValidarForm();

        if (msg != '') {
            CrudHelper.ExibirMensagemModalErro(msg);
            return;
        }

        $.ajax({
            type: 'post',
            url: "/salvar-pessoa",
            data: CrudHelper.Serializar(),
            success: function (data) {
                if (data.id > 0) {
                    CrudHelper.ExibirMensagemModalSucesso(data.nome);
                    setTimeout(function () {
                        window.location.href = '/Home/Crud';
                    }, 3000);
                }
                else
                    CrudHelper.ExibirMensagemModalErro(data.Nome);

            },
            error: function (response) {
                alert(response);
            },
        });
    },

    LimparMensagem: function() {
        $("#modelMsg").html('');
        $("#modalAlerta").removeClass("alert-success");
        $("#modalAlerta").removeClass("alert-danger");
        $("#modalAlerta").hide();
    },
    ExibirMensagemSucesso: function (msg) {
        $("#modalAlerta").addClass("alert-success");
        $("#modelMsg").html(msg);
        $("#modalAlerta").show();
    },
    ExibirMensagemErro: function (msg) {
        $("#modalAlerta").addClass("alert-danger");
        $("#modelMsg").html(msg);
        $("#modalAlerta").show();
    },

    LimparMensagemModal: function() {
        $("#modelCadatroMsg").html('');
        $("#modalCadastroAlerta").removeClass("alert-success");
        $("#modalCadastroAlerta").removeClass("alert-danger");
        $("#modalCadastroAlerta").hide();
    },
    ExibirMensagemModalSucesso: function (msg) {        
        $("#modalCadastroAlerta").addClass("alert-success");
        $("#modelCadatroMsg").html(msg);
        $("#modalCadastroAlerta").show();
    },
    ExibirMensagemModalErro: function (msg) {
        $("#modalCadastroAlerta").addClass("alert-danger");
        $("#modelCadatroMsg").html(msg);
        $("#modalCadastroAlerta").show();
    },
}


$(document).ready(function () {

    setInputFilter(document.getElementById("CPF"), function (value) {
        return /^\d*?\d*$/.test(value);
    });
    setInputFilter(document.getElementById("Rg"), function (value) {
        return /^\d*?\d*$/.test(value);
    });
    setInputFilter(document.getElementById("Telefone"), function (value) {
        return /^\d*?\d*$/.test(value);
    });
    

});

function CriarPessoa() {
    CrudHelper.LimparForm();
    $('#modalPessoa').show();
}

function CriarContato() {
    CrudHelper.LimparForm();
    $('#modalPessoa').show();
}

function Excluir(id) {

    if (confirm("Confirma a exclusão do registro?")) {
        $.ajax({
            type: 'delete',
            url: "/excluir-pessoa",
            data: { Id: id },
            success: function (data) {
                if (data.id > 0) {
                    CrudHelper.ExibirMensagemSucesso(data.nome);
                    setTimeout(function () {
                        window.location.href = '/Home/Crud';
                    }, 3000);
                }
                else
                    CrudHelper.ExibirMensagemErro(data.Nome);
            },
            error: function (response) {
                alert(response);
            },
        }); 
    }    
}

function Alterar(id) {

    CrudHelper.LimparForm();
    $('#modalPessoa').show();

    $.ajax({
        type: 'get',
        url: "/carregar-pessoa",
        data: { Id: id },
        success: function (data) {
            
            if (data.id > 0) {
                CrudHelper.Carregar(data)
            }
            else
                CrudHelper.ExibirMensagemModalErro(data.Nome);

        },
        error: function (response) {
            alert(response);
        },
    }); 
     
}