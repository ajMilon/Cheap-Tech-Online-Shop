using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheapShop
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setImageUrl();
            }

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            setImageUrl();
        }

        private void setImageUrl()
        {
            Random rand = new Random();
            int i = rand.Next(2, 8);
            Image1.ImageUrl = "~/Images/" + i.ToString() + ".jpg";
        }

    }
}