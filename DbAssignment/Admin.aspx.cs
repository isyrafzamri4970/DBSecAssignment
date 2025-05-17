using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace DbAssignment
{
    public partial class Admin : Page
    {
        private static string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadEmployees();
                LoadCustomers();
            }
        }

        private void LoadEmployees()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Employees", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvEmployees.DataSource = dt;
                gvEmployees.DataBind();
            }
        }

        private void LoadCustomers()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Customers", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvCustomers.DataSource = dt;
                gvCustomers.DataBind();
            }
        }

        protected void btnAddEmployee_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Employees (Name, Email, Department) VALUES (@Name, @Email, @Department)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", txtEmployeeName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmployeeEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Department", txtEmployeeDepartment.Text.Trim());
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            LoadEmployees();
        }

        protected void btnDeleteEmployee_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtEmployeeID.Text.Trim(), out int employeeID))
            {
                lblMessage.Text = "Please enter a valid Employee ID.";
                lblMessage.Visible = true;
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Employees WHERE EmployeeID = @EmployeeID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            LoadEmployees();
        }

        protected void btnEditEmployee_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtEmployeeID.Text.Trim(), out int employeeID))
            {
                lblMessage.Text = "Please enter a valid Employee ID.";
                lblMessage.Visible = true;
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Employees SET Name = @Name, Email = @Email, Department = @Department WHERE EmployeeID = @EmployeeID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
                cmd.Parameters.AddWithValue("@Name", txtEmployeeName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmployeeEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Department", txtEmployeeDepartment.Text.Trim());
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            LoadEmployees();
        }

        protected void btnAddCustomer_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Customers (Name, Email, Phone) VALUES (@Name, @Email, @Phone)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", txtCustomerName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtCustomerEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Phone", txtCustomerPhone.Text.Trim());
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            LoadCustomers();
        }

        protected void btnDeleteCustomer_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtCustomerID.Text.Trim(), out int customerID))
            {
                lblCustomerMessage.Text = "Please enter a valid Customer ID.";
                lblCustomerMessage.Visible = true;
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Customers WHERE CustomerID = @CustomerID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CustomerID", customerID);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            LoadCustomers();
        }

        protected void btnEditCustomer_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtCustomerID.Text.Trim(), out int customerID))
            {
                lblCustomerMessage.Text = "Please enter a valid Customer ID.";
                lblCustomerMessage.Visible = true;
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Customers SET Name = @Name, Email = @Email, Phone = @Phone WHERE CustomerID = @CustomerID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CustomerID", customerID);
                cmd.Parameters.AddWithValue("@Name", txtCustomerName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtCustomerEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Phone", txtCustomerPhone.Text.Trim());
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            LoadCustomers();
        }

        protected void btnExportEmployees_Click(object sender, EventArgs e)
        {
            LoadEmployees();
        }

        protected void btnExportCustomers_Click(object sender, EventArgs e)
        {
            LoadCustomers();
        }
    }
}
