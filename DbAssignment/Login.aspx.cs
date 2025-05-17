using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace DbAssignment
{
    public partial class Login : Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                lblMessage.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ValidateLogin", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);  // SQL Server handles encryption!

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        Session["User"] = reader["CustomerID"] != DBNull.Value ? reader["CustomerID"].ToString() : reader["UserID"].ToString();
                        Session["Role"] = reader["Role"].ToString();

                        string role = reader["Role"].ToString();
                        if (role == "Admin")
                            Response.Redirect("Admin.aspx");
                        else if (role == "Employee")
                            Response.Redirect("Employee.aspx");
                        else
                            Response.Redirect("Customer.aspx");
                    }
                    else
                    {
                        lblMessage.Visible = true;
                        lblMessage.Text = "Invalid username or password.";
                    }
                }
            }
        }
    }
}
