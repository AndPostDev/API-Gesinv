using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DevSys.Gesinv.Entity
{
    public class Proveedor
    {
        public int ProveedorId { get; set; }
        public int EmpresaId { get; set; }
        public string RazonSocial { get; set; } = null!;
        public int Codigo { get; set; }
        public string Contacto { get; set; } = null!;
        public int TipoProveedorId { get; set; }
        public string Direccion { get; set; } = null!;
        public string Telefono { get; set; } = null!;
        public string Correo { get; set; } = null!;
        public DateTime Plazo { get; set; }
        public string Ruc { get; set; } = null!;
        public int ProvinciaId { get; set; }
        public int EstadoId { get; set; }
        public int TipoPersona { get; set; }
        public string PaginaWeb { get; set; }
    }
}
