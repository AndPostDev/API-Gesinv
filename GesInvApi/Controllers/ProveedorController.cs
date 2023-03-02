using Microsoft.AspNetCore.Mvc;
using DevSys.Gesinv.Domain;
using DevSys.Gesinv.Entity;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace DevSys.Gesinv.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProveedorController : ControllerBase
    {
        // GET: api/<ProvvedorController>
        [HttpGet]
        public IEnumerable<Proveedor> Get()
        {
            ProveedorDomain _proveedorDomain = new ProveedorDomain();
            return _proveedorDomain.ObtenerProveedores();
        }

        // GET api/<ProvvedorController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ProvvedorController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ProvvedorController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ProvvedorController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
