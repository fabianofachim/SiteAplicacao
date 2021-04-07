using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiteTeste.Models
{
    public class Contato
    {
        public int IdContato { get; set; }
        public string Nome { get; set; }

        public string Telefone { get; set; }

        public string Email { get; set; }

        public int TpContato { get; set; }
    }
}
