using System;
using System.Web.UI;

namespace DbAssignment
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserInfo();
            }
        }

        private void LoadUserInfo()
        {
            if (Session["User"] != null)
            {
                lblWelcome.Text = "Welcome, " + Session["User"].ToString() + "!";
            }
            else
            {
                lblWelcome.Text = "Welcome, Guest!";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx"); // Redirect to login page
        }
    }
}