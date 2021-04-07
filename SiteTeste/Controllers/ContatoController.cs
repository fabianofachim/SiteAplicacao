using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SiteTeste.Models;
using SiteTeste.Service;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SiteTeste.Controllers
{

    public class ContatoController : Controller
    {
        private readonly DBService _dbservice;
        public ContatoController(DBService dbservice)
        {
            _dbservice = dbservice;
        }



        public IActionResult Index(ContatoFiltro contato)
        {
            ViewBag.TipoContato = _dbservice.ListarTipoContato();
            ViewBag.Contato = _dbservice.ListarContato(null, contato.TipoContato, contato.busca);
            return View();
        }

        [HttpPost]
        [Route("salvar-contato")]
        public JsonResult SalvarContato(Contato contato)
        {
            Base _resultado = new Base();

            if (contato.IdContato > 0)
                _resultado = _dbservice.AtualizarContato(contato);
            else
            {
                List<Contato> validaTelefone = new List<Contato>();
                validaTelefone = _dbservice.VerificarTelefone(contato.Telefone);
                if (validaTelefone.Count > 0)
                {
                    _resultado.Id = -1;
                    _resultado.Nome = "Telefone já cadastrado!";
                }
                else
                {
                    _resultado = _dbservice.InserirContato(contato);
                }
            }
            return Json(_resultado);
        }


        [HttpDelete]
        [Route("excluir-contato")]
        public async Task<JsonResult> ExcluirContato(int Id)
        {
            Base _resultado = _resultado = _dbservice.ExcluirContato(Id);
            return Json(_resultado);
        }

        [HttpGet]
        [Route("carregar-contato")]
        public JsonResult CarregarContato(int Id)
        {
            Contato _contato = _dbservice.CarregarContato(Id);
            return Json(_contato);
        }

    }
}