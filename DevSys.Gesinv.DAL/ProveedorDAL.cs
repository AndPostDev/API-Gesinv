using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DevSys.Gesinv.Entity;

namespace DevSys.Gesinv.DAL
{
    public class ProveedorDAL
    {

        public static List<Proveedor> ObtenerProveedores()
        {
            List<Proveedor> lstProveedores = new List<Proveedor>();
            string connectionString = "Data Source=Web-inst;Initial Catalog=DbInventario;Integrated Security=True;";
            SqlConnection _sqlConnection = new SqlConnection(connectionString);
            _sqlConnection.Open();
            SqlCommand _sqlCommand = new SqlCommand("uspProveedores", _sqlConnection);
            _sqlCommand.CommandType = CommandType.StoredProcedure;
            SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();

            while (_sqlDataReader.Read())
            {
                Proveedor proveedor = new Proveedor
                {
                    ProveedorId = Convert.ToInt32(_sqlDataReader["ProveedorId"]),
                    EmpresaId = Convert.ToInt32(_sqlDataReader["EmpresaId"]),
                    RazonSocial = _sqlDataReader["RazonSocial"].ToString(),
                    Codigo = Convert.ToInt32(_sqlDataReader["Codigo"]),
                    Contacto = _sqlDataReader["Contacto"].ToString(),
                    TipoProveedorId = Convert.ToInt32(_sqlDataReader["TipoProveedorId"]),
                    Direccion = _sqlDataReader["Direccion"].ToString(),
                    Telefono = _sqlDataReader["Telefono"].ToString(),
                    Correo = _sqlDataReader["Correo"].ToString(),
                    Plazo = Convert.ToDateTime(_sqlDataReader["Plazo"]),
                    Ruc = _sqlDataReader["Ruc"].ToString(),
                    ProvinciaId = Convert.ToInt32(_sqlDataReader["ProvinciaId"]),
                    EstadoId = Convert.ToInt32(_sqlDataReader["EstadoId"]),
                    TipoPersona = Convert.ToInt32(_sqlDataReader["TipoPersona"]),
                    PaginaWeb = _sqlDataReader["PaginaWeb"].ToString()
                };

                lstProveedores.Add(proveedor);
            }

            return lstProveedores;
        }
    }
}
