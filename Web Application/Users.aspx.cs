using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Web_Application
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Employee employee = new Employee();
                GridView1.DataSource = employee.GetUsers();
                GridView1.DataBind();
            }
        }
    }

    internal class Employee
    {
        public DataTable GetUsers()
        {
            string connectionString = ConnectionStringProvider.ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.users ORDER BY ID", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }
}