using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SiteTeste.Models;
using SiteTeste.Service;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SiteTeste.Controllers
{
    public class HomeController : Controller
    {
        private readonly DBService _dbservice;

        public HomeController(DBService dbservice)
        {
            _dbservice = dbservice;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult About()
        {
           return View();
        }

    }
}
