using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Inregistrare : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnInreg_Click(object sender, EventArgs e)
    {
        Utilizator utiliz = new Utilizator(txtNume.Text, txtParola.Text, txtEmail.Text, "user");
        lblRez.Text = Conexiune.Inregistrare(utiliz);
    }
}