using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheapShop
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void showUserButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminView.aspx");

        }

        protected void uploadItemButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");

        }

        protected void showOrderButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowOrder.aspx");
        }
    }
}