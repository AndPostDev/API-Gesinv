using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DevSys.Gesinv.Entity
{
    public class Producto
    {
        public int ProductoId { get; set; }
        public string Nombre { get; set; } = string.Empty;  
        public int Codigo { get; set; }
        public int LineaId { get; set; }
        public int TipoId { get; set; }
        public int Unidad { get; set; }
        public int Caja { get; set; }
        public int GrupoId { get; set; }
        public bool Activo { get; set; }
        public bool Iva { get; set; }
        public bool Perecible { get; set; }
        public string Comentario { get; set; } = string.Empty;
        public DateTime FechaCaducidad { get; set; }
        public double Precio { get; set; }
    }
}
