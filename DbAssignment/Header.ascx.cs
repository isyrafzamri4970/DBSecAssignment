using System;
using System.Web.UI;

namespace DbAssignment
{
    public partial class Header : UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetButtonVisibility();
            }
        }

        private void SetButtonVisibility()
        {
            // Only show certain buttons based on user role
            if (Session["Role"] == null)
            {
                btnHome.Visible = false;
                btnEmployee.Visible = false;
                btnAdmin.Visible = false;
                btnCreditCard.Visible = false;
                btnCustomer.Visible = false;
                btnLogout.Visible = false;
                btnLogin.Visible = true;
                btnRegister.Visible = true;
            }
            else if (Session["Role"].ToString() == "Customer")
            {
                btnHome.Visible = false;
                btnCustomer.Visible = true;
                btnEmployee.Visible = false;
                btnAdmin.Visible = false;
                btnCreditCard.Visible = false;
                btnLogout.Visible = true;
                btnLogin.Visible = false;
                btnRegister.Visible = false;
            }

            else if (Session["Role"].ToString() == "Employee")
            {
                btnHome.Visible = false;
                btnEmployee.Visible = true;
                btnAdmin.Visible = false;
                btnCreditCard.Visible = false;
                btnCustomer.Visible = false;
                btnLogout.Visible = true;
                btnLogin.Visible = false;
                btnRegister.Visible = false;
            }
            else if (Session["Role"].ToString() == "Admin")
            {
                btnHome.Visible = false;
                btnEmployee.Visible = true;
                btnAdmin.Visible = true;
                btnCreditCard.Visible = true;
                btnCustomer.Visible = true;
                btnLogout.Visible = true;
                btnLogin.Visible = false;
                btnRegister.Visible = false;
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee.aspx");
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }

        protected void btnCreditCard_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreditCard.aspx");
        }

        protected void btnCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}
