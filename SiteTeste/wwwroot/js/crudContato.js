
var CrudHelper = {

    LimparForm: function () {
        $("#Nome").val('');
        $("#Telefone").val('');
        $("#Email").val('');
        $("#TpContato").val('');
    },
    ValidarForm: function () {

        var msg = '';

        if ($("#Nome").val() == '')
            msg = '* O campo Nome é obrigatório.<br/>';

        if ($("#Telefone").val() == '')
            msg += '* O campo Telefone é obrigatório.<br/>';


        if ($("#Email").val() == '')
            msg += '* O campo Email é obrigatório.<br/>';

        if ($("#TpContato").val() == '')
            msg += '* O campo Tipo Contato é obrigatório.<br/>';


        
        return msg;

    },
    Serializar: function () {
        console.log("ser");
        console.log($("#TpContato").val());
        console.log($("#Nome").val());
        console.log("teste2");
        console.log(document.getElementsByName("TpContato").value);
        return {
            IdContato: $("#IdContato").val(),
            Nome: $("#Nome").val(),
            Telefone: $("#Telefone").val(),
            Email: $("#Email").val(),
            TpContato: $("#TpContato").val(),
        };
    },
    Carregar: function (linha) {
        console.log(linha);
        $("#Id").val(linha.idContato);
        $("#TpContato").val(linha.tpContato);
        $("#Nome").val(linha.nome);
        $("#Telefone").val(linha.telefone);
        $("#Email").val(linha.email);
    },
    Salvar: function () {
        console.log("ebtrei");
        CrudHelper.LimparMensagemModal();
        var msg = CrudHelper.ValidarForm();

        if (msg != '') {
            CrudHelper.ExibirMensagemModalErro(msg);
            return;
        }

        $.ajax({
            type: 'post',
            url: "/salvar-contato",
            data: CrudHelper.Serializar(),
            success: function (data) {
                if (data.id > 0) {
                    
                    setTimeout(function () {
                        window.location.href = '/Cadastro/Index';
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

    LimparMensagem: function () {
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

    LimparMensagemModal: function () {
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

function Salvar() {
    
    CrudHelper.LimparMensagemModal();
    var msg = CrudHelper.ValidarForm();

    if (msg != '') {
        CrudHelper.ExibirMensagemModalErro(msg);
        return;
    }
    
    $.ajax({
        type: 'post',
        url: "/salvar-contato",
        data: CrudHelper.Serializar(),
        success: function (data) {
            console.log(data);
            if (data.id > 0) {
                $("#modalCadastroAlerta").addClass("alert-success");
                $("#modelCadatroMsg").html(data.nome);
                $("#modalCadastroAlerta").show();
                setTimeout(function () {
                    window.location.href = '/Contato/Index';
                }, 3000);
            }
            else {
                $("#modalCadastroAlerta").addClass("alert-danger");
                $("#modelCadatroMsg").html(data.nome);
                $("#modalCadastroAlerta").show();
            }
        },
        error: function (response) {
            alert(response);
        },
    });


    //LimparMensagem: function() {
    //    $("#modelMsg").html('');
    //    $("#modalAlerta").removeClass("alert-success");
    //    $("#modalAlerta").removeClass("alert-danger");
    //    $("#modalAlerta").hide();
    //},
    //ExibirMensagemSucesso: function (msg) {
    //    $("#modalAlerta").addClass("alert-success");
    //    $("#modelMsg").html(msg);
    //    $("#modalAlerta").show();
    //},
    //ExibirMensagemErro: function (msg) {
    //    $("#modalAlerta").addClass("alert-danger");
    //    $("#modelMsg").html(msg);
    //    $("#modalAlerta").show();
    //},

    //LimparMensagemModal: function() {
    //    $("#modelCadatroMsg").html('');
    //    $("#modalCadastroAlerta").removeClass("alert-success");
    //    $("#modalCadastroAlerta").removeClass("alert-danger");
    //    $("#modalCadastroAlerta").hide();
    //},
    //ExibirMensagemModalSucesso: function (msg) {
    //    $("#modalCadastroAlerta").addClass("alert-success");
    //    $("#modelCadatroMsg").html(msg);
    //    $("#modalCadastroAlerta").show();
    //},
    //ExibirMensagemModalErro: function (msg) {
    //    $("#modalCadastroAlerta").addClass("alert-danger");
    //    $("#modelCadatroMsg").html(msg);
    //    $("#modalCadastroAlerta").show();
    //},
}


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
            url: "/excluir-contato",
            data: { Id: id },
            success: function (data) {
                if (data.id > 0) {
                    CrudHelper.ExibirMensagemSucesso(data.nome);
                    setTimeout(function () {
                        window.location.href = '/Contato/Index';
                    }, 3000);
                }
                else
                    CrudHelper.ExibirMensagemErro(data.Nome);
            },
            error: function (response) {
                alert('Ocorreu um erro tente novamente');
            },
        });
    }
}

function mphone(v) {
    var r = v.replace(/\D/g, "");
    r = r.replace(/^0/, "");
    if (r.length > 10) {
        r = r.replace(/^(\d\d)(\d{5})(\d{4}).*/, "($1) $2-$3");
    } else if (r.length > 5) {
        r = r.replace(/^(\d\d)(\d{4})(\d{0,4}).*/, "($1) $2-$3");
    } else if (r.length > 2) {
        r = r.replace(/^(\d\d)(\d{0,5})/, "($1) $2");
    } else {
        r = r.replace(/^(\d*)/, "($1");
    }
    return r;
}

function mask(o, f) {
    setTimeout(function () {
        var v = mphone(o.value);
        if (v != o.value) {
            o.value = v;
        }
    }, 1);
}


function Alterar(id) {

    CrudHelper.LimparForm();
    $('#modalPessoa').show();
    
    $.ajax({
        type: 'get',
        url: "/carregar-contato",
        data: { Id: id },
        success: function (data) {
            console.log(data);
            if (data.idContato > 0) {

                console.log(data);
                $("#IdContato").val(data.idContato);
                $("#TpContato").val(data.tpContato);
                $("#Nome").val(data.nome);
                $("#Telefone").val(data.telefone);
                $("#Email").val(data.email);

            }
            else {
                alert('erro');
                CrudHelper.ExibirMensagemModalErro(data.Nome);
            }

        },
        error: function (response) {
            alert(response);
        },
    });

}