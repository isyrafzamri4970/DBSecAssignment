using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace DbAssignment
{
    public partial class Employee : Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Restrict access to logged-in employees
            if (Session["Role"] == null || Session["Role"].ToString() != "Employee")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadEmployeeInfo();
            }
        }

        private void LoadEmployeeInfo()
        {
            if (Session["User"] != null)
            {
                lblEmployeeName.Text = "Welcome, " + Session["User"].ToString() + "!";
            }
            else
            {
                lblEmployeeName.Text = "Welcome, Guest!";
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
