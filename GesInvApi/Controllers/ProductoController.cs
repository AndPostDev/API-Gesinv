using Microsoft.AspNetCore.Mvc;
using DevSys.Gesinv.Domain;
using DevSys.Gesinv.Entity;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace DevSys.Gesinv.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        // GET: api/<ProductoController>
        [HttpGet]
        public IEnumerable<Producto> Get()
        {
            ProductoDomain _productoDomain = new ProductoDomain();
            return _productoDomain.ObtenerProductos();
        }

        // GET api/<ProductoController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ProductoController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ProductoController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ProductoController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
