using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Logare : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Utilizator utliz = Conexiune.Logare(txtLogare.Text, txtParola.Text);
        if (utliz != null)
        {
            Session["login"] = utliz.Nume;
            Session["type"] = utliz.Tip;
            Response.Redirect("~/Pages/Home.aspx");
        }
        else
        {
            lblEr.Text = "Login failed";
        }
    }
}