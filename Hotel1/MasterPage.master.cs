using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] == "admin") {
            Label1.Visible = true;
        }
        //checked if as User is logged in
        if (Session["login"] != null)
        {
            lblLogare.Text = "welcome " + Session["login"].ToString();
            lblLogare.Visible = true;
            LinkButton1.Text = "Deconectare";
        }
        else
        {
            lblLogare.Visible = false;
            LinkButton1.Text = "Logare";
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (LinkButton1.Text == "Logare")
        {
            Response.Redirect("~/Pages/Logare.aspx");
        }
        else
        {
            Session.Clear();
            Response.Redirect("~/Pages/Home.aspx");
        }
    }
}
