using DevSys.Gesinv.DAL;
using DevSys.Gesinv.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DevSys.Gesinv.Domain
{
    public class ProductoDomain
    {
        public List<Producto> ObtenerProductos()
        {
            return ProductoDAL.ObtenerProductos();
        }
    }
}
