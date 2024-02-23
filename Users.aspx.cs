using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Application
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                GridView1.PageSize = 5; // Default page size
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void ddlUsersPerPage_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.PageSize = Convert.ToInt32(ddlUsersPerPage.SelectedValue);
            BindData();
        }

        protected void PagerButtonClick(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            switch (btn.CommandArgument)
            {
                case "Prev":
                    if (GridView1.PageIndex > 0)
                    {
                        GridView1.PageIndex -= 1;
                    }
                    break;
                case "Next":
                    if (GridView1.PageIndex < GridView1.PageCount - 1)
                    {
                        GridView1.PageIndex += 1;
                    }
                    break;
            }
            BindData();
        }

        private void BindData()
        {
            Employee employee = new Employee();
            GridView1.DataSource = employee.GetUsers();
            GridView1.DataBind();

            // Set the text of lblPageNumber
            Label lblPageNumber = (Label)GridView1.BottomPagerRow.FindControl("lblPageNumber");
            lblPageNumber.Text = "Page " + (GridView1.PageIndex + 1) + " of " + GridView1.PageCount;
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