using System;
using System.Web.UI;

namespace DbAssignment
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nothing on initial load
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Member C will handle saving to the database
            lblMessage.Text = "Registration successful!";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            // Clear fields
            txtUsername.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}