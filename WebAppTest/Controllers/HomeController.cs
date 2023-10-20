using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using WebAppTest.DataLayer;
using WebAppTest.Filters;
using WebAppTest.Infrastructure;

namespace WebAppTest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        private readonly SessionsManager _sessionsManager;
        private readonly List<ServiceProperties> _servicesProperties;

        public HomeController(SessionsManager sessionsManager, IOptions<List<ServiceProperties>> servicesProperties)
        {
            _sessionsManager = sessionsManager;
            _servicesProperties = servicesProperties.Value;
        }

        [HttpGet]
        [Route("geoCodingServicesList")]
        [TypeFilter(typeof(SessionsStartAttribute))]
        public async Task<IActionResult> GeoCodingServicesList()
        {
            return Ok();
        }
    }
}
