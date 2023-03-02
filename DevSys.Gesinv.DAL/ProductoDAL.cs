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
    public class ProductoDAL
    {
        //public IConfiguration Configuration { get; }

        //public ProductoDAL(IConfiguration configuration)
        //{
        //    Configuration = configuration;
        //}
        public static List<Producto> ObtenerProductos()
        {
            List<Producto> lstProductos = new List<Producto>();
            string connectionString = "Data Source=Web-inst;Initial Catalog=DbInventario;Integrated Security=True;";
            SqlConnection _sqlConnection = new SqlConnection(connectionString);
            _sqlConnection.Open();
            SqlCommand _sqlCommand = new SqlCommand("uspProductos",_sqlConnection);
            _sqlCommand.CommandType = CommandType.StoredProcedure;
            SqlDataReader _sqlDataReader = _sqlCommand.ExecuteReader();

            while (_sqlDataReader.Read())
            {
                Producto producto = new Producto()
                {
                    ProductoId = Convert.ToInt32(_sqlDataReader["ProductoId"]),
                    Nombre = _sqlDataReader["Nombre"].ToString().Trim(),
                    Codigo = Convert.ToInt32(_sqlDataReader["Codigo"]),
                    LineaId = Convert.ToInt32(_sqlDataReader["LineaId"]),
                    TipoId = Convert.ToInt32(_sqlDataReader["TipoId"]),
                    Unidad = Convert.ToInt32(_sqlDataReader["Unidad"]),
                    Caja = Convert.ToInt32(_sqlDataReader["Caja"]),
                    GrupoId = Convert.ToInt32(_sqlDataReader["GrupoId"]),
                    Activo = Convert.ToBoolean(_sqlDataReader["Activo"]),
                    Iva = Convert.ToBoolean(_sqlDataReader["Iva"]),
                    Perecible = Convert.ToBoolean(_sqlDataReader["Perecible"]),
                    Comentario = _sqlDataReader["Comentario"].ToString().Trim(),
                    FechaCaducidad = Convert.ToDateTime(_sqlDataReader["FechaCaducidad"]),
                    Precio = Convert.ToDouble(_sqlDataReader["Precio"])
                };

                lstProductos.Add(producto);
            }

            return lstProductos;    
        }
     

    }
}
