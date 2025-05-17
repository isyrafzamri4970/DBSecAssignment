using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace DbAssignment
{
    public partial class CreditCard : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCreditCards();
            }
        }

        private void LoadCreditCards()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM CreditCards", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptCreditCards.DataSource = dt;
                rptCreditCards.DataBind();
            }
        }

        protected void btnAddCard_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO CreditCards (CustID, CardType, CardNumber, ExpMonth, ExpYear) VALUES (@CustID, @CardType, @CardNumber, @ExpMonth, @ExpYear)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CustID", 1); // You may dynamically bind this later
                cmd.Parameters.AddWithValue("@CardType", txtCardType.Text.Trim());
                cmd.Parameters.AddWithValue("@CardNumber", txtCardNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@ExpMonth", txtExpMonth.Text.Trim());
                cmd.Parameters.AddWithValue("@ExpYear", txtExpYear.Text.Trim());

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = "Card added successfully!";
            LoadCreditCards();
        }

        protected void rptCreditCards_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int cardID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Delete")
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM CreditCards WHERE CardID = @CardID", conn);
                    cmd.Parameters.AddWithValue("@CardID", cardID);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadCreditCards();
            }
            // You can add "Edit" functionality here if needed
        }
    }
}
