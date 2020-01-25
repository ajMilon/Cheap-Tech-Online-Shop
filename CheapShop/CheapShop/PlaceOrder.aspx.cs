using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace CheapShop
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("Id");
                dt.Columns.Add("product_name");
                dt.Columns.Add("product_price");
                dt.Columns.Add("quantity");
                dt.Columns.Add("product_image");
                dt.Columns.Add("totalprice");
                //   dt.Columns.Add("cost");
                //  dt.Columns.Add("totalcost");

                if (Request.QueryString["id"] != null)
                {
                    if (Session["Buyitems"] == null)
                    {

                        dr = dt.NewRow();
                        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["MaintabConnectionString"].ConnectionString);
                        scon.Open();
                        String myquery = "select * from Product where Id=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = 1;
                        dr["Id"] = ds.Tables[0].Rows[0]["Id"].ToString();
                        dr["product_name"] = ds.Tables[0].Rows[0]["product_name"].ToString();
                        dr["product_image"] = ds.Tables[0].Rows[0]["product_image"].ToString();
                        dr["product_price"] = ds.Tables[0].Rows[0]["product_price"].ToString();
                        //["quantity"] = ds.Tables[0].Rows[0]["quantity"].ToString();

                        dr["quantity"] = Request.QueryString["quantity"];


                        int price = Convert.ToInt16(ds.Tables[0].Rows[0]["product_price"].ToString());

                        //int quantity = Convert.ToInt16(ds.Tables[0].Rows[0]["quantity"].ToString());

                        int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["totalprice"] = totalprice;


                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        Session["buyitems"] = dt;

                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("Cart.aspx");
                    }
                    else
                    {

                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["MaintabConnectionString"].ConnectionString);
                        scon.Open();

                        String myquery = "select * from Product where Id=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = myquery;
                        cmd.Connection = scon;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = sr + 1;
                        dr["Id"] = ds.Tables[0].Rows[0]["Id"].ToString();
                        dr["product_name"] = ds.Tables[0].Rows[0]["product_name"].ToString();
                        dr["product_image"] = ds.Tables[0].Rows[0]["product_image"].ToString();
                        dr["product_price"] = ds.Tables[0].Rows[0]["product_price"].ToString();

                        dr["quantity"] = Request.QueryString["quantity"];

                        int price = Convert.ToInt16(ds.Tables[0].Rows[0]["product_price"].ToString());
                        int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["totalprice"] = totalprice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;

                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("Cart.aspx");

                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();

                    }

                }

            }


            Label2.Text = DateTime.Now.ToShortDateString();
            findorderid();




        }

       public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());

                i = i + 1;
            }
            return gtotal;
        }

        public void findorderid()
        {
            String pass = "abcdefghijklmnopqrstuvwxyz123456789";
            Random r = new Random();
            char[] mypass = new char[5];
            for (int i = 0; i < 5; i++)
            {
                mypass[i] = pass[(int)(35 * r.NextDouble())];

            }
            String orderid;
            orderid = "Order" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(mypass);

            Label1.Text = orderid;


        }

        public void saveaddress()
        {
            String updatepass = "insert into orderaddress(orderid,address,mobilenumber) values('" + Label1.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "')";
            SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["MaintabConnectionString"].ConnectionString);
            scon.Open();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = updatepass;
            cmd1.Connection = scon;
            cmd1.ExecuteNonQuery();
            scon.Close();
        }

        protected void placeOrder1_Click(object sender, EventArgs e)
        {

            DataTable dt;
            dt = (DataTable)Session["buyitems"];



            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                String updatepass = "insert into orderdetails(orderid,sno,productid,productname,price,quantity,dateoforder) values('" + Label1.Text + "'," + dt.Rows[i]["sno"] + "," + dt.Rows[i]["Id"] + ",'" + dt.Rows[i]["product_name"] + "'," + dt.Rows[i]["product_price"] + "," + dt.Rows[i]["quantity"] + ",'" + Label2.Text + "')";
                SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["MaintabConnectionString"].ConnectionString);
                scon.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = updatepass;
                cmd1.Connection = scon;
                cmd1.ExecuteNonQuery();
                scon.Close();

            }
            saveaddress();
            Response.Redirect("Home.aspx");
        }
    }
}