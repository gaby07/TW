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
        Camera camera = (Camera)Session["Camera"];
        Image1.ImageUrl = camera.Imagine;
        lblTip.Text = "Camera " + camera.Tip;
        lblVedere.Text = "Vesere la " + camera.Vedere;
        lblAC.Text = "Aer conditionat " + camera.AC;
        lblPret.Text = camera.Pret.ToString() + "RON";
    }
    protected void btnRez_Click(object sender, EventArgs e)
    {
        Camera camera = (Camera)Session["Camera"];
        Rezervare rez = new Rezervare(camera.Id, Convert.ToDateTime(Session["Data1"]), Convert.ToDateTime(Session["Data2"]), txtNume.Text, txtCNP.Text, txtBuletin.Text, txtAdr.Text, txtTel.Text, txtMail.Text);
        lblRes.Text = Conexiune.Rezerva(rez);
    }
}