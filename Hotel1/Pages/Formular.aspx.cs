using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Formular : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRez_Click(object sender, EventArgs e)
    {
        Rezervare rez = new Rezervare(Convert.ToInt32(Session["idcam"]), Convert.ToDateTime(Session["data1"]), Convert.ToDateTime(Session["data2"]), txtNume.Text, txtCNP.Text, txtBuletin.Text, txtAdr.Text, txtTel.Text, txtMail.Text);
        lblRes.Text = Conexiune.Rezerva(rez);
    }
}