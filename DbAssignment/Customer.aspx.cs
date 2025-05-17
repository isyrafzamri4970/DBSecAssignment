using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace DbAssignment
{
    public partial class Customer : Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Customer")
            {
                Response.Redirect("Login.aspx");
                return;
            }
            // Allow unrestricted access (no forced login)
            if (!IsPostBack)
            {
                LoadCustomerInfo();
                LoadOrders();
            }
        }

        private void LoadCustomerInfo()
        {
            if (Session["User"] != null)
            {
                int customerId;
                if (int.TryParse(Session["User"].ToString(), out customerId))
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = "SELECT Name, Email, Phone FROM Customers WHERE CustomerID = @CustomerID";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@CustomerID", customerId);

                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            lblCustomerName.Text = "Welcome, " + reader["Name"].ToString() + "!";
                            lblCustomerEmail.Text = "Email: " + reader["Email"].ToString();
                            lblCustomerPhone.Text = "Phone: " + reader["Phone"].ToString();
                        }
                        else
                        {
                            lblCustomerName.Text = "Welcome, Guest!";
                        }

                        reader.Close();
                    }
                }
                else
                {
                    lblCustomerName.Text = "Invalid Customer ID!";
                }
            }
            else
            {
                lblCustomerName.Text = "Welcome, Guest!";
            }
        }

        private void LoadOrders()
        {
            // Simulated order data (Replace with actual database query if needed)
            var orders = new[]
            {
                new { OrderID = 101, ProductName = "Laptop", OrderDate = "2024-05-01" },
                new { OrderID = 102, ProductName = "Smartphone", OrderDate = "2024-05-10" }
            };

            gvOrders.DataSource = orders;
            gvOrders.DataBind();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx"); // Redirect to home page
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx"); // Redirect to login page
        }
    }
}
