using Dapper;
using Microsoft.Extensions.Configuration;
using SiteTeste.Models;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace SiteTeste.Service
{
    public class DBService
    {
        private readonly IConfiguration _config;
        public DBService(IConfiguration config)
        {
            _config = config;
        }


        public Contato CarregarContato(int Id)
        {
            return ListarContato(Id, null, null).FirstOrDefault();
        }

        public Base ExcluirContato(int Id)
        {
            using (IDbConnection db = new SqlConnection(_config.GetConnectionString("DefaultConnection")))
            {
                string readSp = "SPC_DEL_CONTATO";
                var parameters = new DynamicParameters();
                parameters.Add("@IdContato", Id);
                return db.Query<Base>(readSp, parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
        }

        public List<Base> ListarTipoContato()
        {
            using (IDbConnection db = new SqlConnection(_config.GetConnectionString("DefaultConnection")))
            {
                string readSp = "SPC_LISTA_TIPO_CONTATO";
                return db.Query<Base>(readSp, null, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public List<Contato> ListarContato(int? IdContato, int? TipoContato, string nome)
        {
            using (IDbConnection db = new SqlConnection(_config.GetConnectionString("DefaultConnection")))
            {
                string readSp = "SPC_LISTA_CONTATO";
                var parameters = new DynamicParameters();
                parameters.Add("@IdContato", IdContato);
                parameters.Add("@TipoContato", TipoContato);
                parameters.Add("@nome", nome);                

                return db.Query<Contato>(readSp, parameters, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public List<Contato> VerificarTelefone(string telefone)
        {
            using (IDbConnection db = new SqlConnection(_config.GetConnectionString("DefaultConnection")))
            {
                string readSp = "SPC_LISTA_CONTATO_VALIDA_TELEFONE";
                var parameters = new DynamicParameters();
                parameters.Add("@Telefone", telefone);                

                return db.Query<Contato>(readSp, parameters, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public Base InserirContato(Contato contato)
        {
            using (IDbConnection db = new SqlConnection(_config.GetConnectionString("DefaultConnection")))
            {
                string readSp = "SPC_INS_CONTATO";
                var parameters = new DynamicParameters();
                parameters.Add("@Nome", contato.Nome);
                parameters.Add("@Telefone", contato.Telefone);
                parameters.Add("@Email", contato.Email);
                parameters.Add("@TipoContato", contato.TpContato);

                return db.Query<Base>(readSp, parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
        }

        public Base AtualizarContato(Contato contato)
        {
            using (IDbConnection db = new SqlConnection(_config.GetConnectionString("DefaultConnection")))
            {
                string readSp = "SPC_UPD_CONTATO";
                var parameters = new DynamicParameters();
                parameters.Add("@IdContato", contato.IdContato);
                parameters.Add("@Nome", contato.Nome);
                parameters.Add("@Telefone", contato.Telefone);
                parameters.Add("@Email", contato.Email);
                parameters.Add("@TipoContato", contato.TpContato);
                return db.Query<Base>(readSp, parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
        }
        
    }
}
