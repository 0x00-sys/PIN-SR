using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Web_Application
{
    public partial class Shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load data into GridView during the first load of the page
                BindGrid();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string description = txtDescription.Text.Trim();

            if (IsProductNameExists(name))
            {
                lblErrorMessage.Text = "Product with the same name already exists.";
                lblErrorMessage.Visible = true;
            }
            else
            {
                // Save the product to the database
                SaveProduct(name, description);

                // Refresh GridView after saving
                BindGrid();

                // Clear input fields after saving
                ClearInputFields();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Delete product from the database
            int productId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["Id"]);
            DeleteProduct(productId);

            // Refresh GridView after deletion
            BindGrid();
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            // Retrieve the data source from ViewState.
            DataTable dataTable = ViewState["DataSource"] as DataTable;

            if (dataTable != null)
            {
                // Sort the data.
                dataTable.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }

        private bool IsProductNameExists(string productName)
        {
            // Check if the product name already exists in the database
            using (SqlConnection connection = new SqlConnection(ConnectionStringProvider.ConnectionString))
            {
                connection.Open();
                string query = "SELECT COUNT(*) FROM Products WHERE Name = @ProductName";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ProductName", productName);
                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        private void SaveProduct(string name, string description)
        {
            // Save the product to the database
            using (SqlConnection connection = new SqlConnection(ConnectionStringProvider.ConnectionString))
            {
                connection.Open();
                string query = "INSERT INTO Products (Name, Description) VALUES (@Name, @Description)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Description", description);
                    command.ExecuteNonQuery();
                }
            }
        }

        private void DeleteProduct(int productId)
        {
            // Delete product from the database
            string connectionString = ConnectionStringProvider.ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "DELETE FROM Products WHERE Id = @Id";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", productId);
                    command.ExecuteNonQuery();
                }
            }
        }

        private void BindGrid()
        {
            // Bind the GridView with data
            string connectionString = ConnectionStringProvider.ConnectionString;
            string query = "SELECT Id, Name, Description FROM Products";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
                {
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    // Store the data source in ViewState for sorting.
                    ViewState["DataSource"] = dataTable;

                    GridView1.DataSource = dataTable;
                    GridView1.DataBind();
                }
            }
        }

        private string GetSortDirection(string column)
        {
            // By default, set the sort direction to ascending.
            string sortDirection = "ASC";

            // Retrieve the last column that was sorted.
            string sortExpression = ViewState["SortExpression"] as string;

            if (sortExpression != null)
            {
                // Check if the same column is being sorted.
                // If so, reverse the sort direction.
                if (sortExpression == column)
                {
                    string lastDirection = ViewState["SortDirection"] as string;
                    if ((lastDirection != null) && (lastDirection == "ASC"))
                    {
                        sortDirection = "DESC";
                    }
                }
            }

            // Store the new sort expression and direction.
            ViewState["SortExpression"] = column;
            ViewState["SortDirection"] = sortDirection;

            return sortDirection;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                string sortExpression = ViewState["SortExpression"] as string;
                string sortDirection = ViewState["SortDirection"] as string;

                if (sortExpression != null)
                {
                    foreach (TableCell cell in e.Row.Cells)
                    {
                        if (cell.HasControls())
                        {
                            // Check if the cell contains a link button for sorting.
                            LinkButton button = cell.Controls[0] as LinkButton;
                            if (button != null && button.CommandArgument == sortExpression)
                            {
                                // Add the sorting indicator to the cell.
                                Label label = new Label();
                                label.Text = (sortDirection == "ASC") ? " ▲" : " ▼";
                                cell.Controls.Add(label);
                            }
                        }
                    }
                }
            }
        }

        private void ClearInputFields()
        {
            // Clear input fields
            txtName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            lblErrorMessage.Text = string.Empty;
            lblErrorMessage.Visible = false;
        }
    }
}