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
        string[] img = camera.Imagini.Split('|');
        Image1.ImageUrl = img[0];
        lblTip.Text = "Camera " + camera.Tip;
        lblVedere.Text = camera.Vedere;
        lblDetalii.Text = camera.Detalii;
        lblPret.Text = camera.Pret.ToString() + " RON";

        string[] fac = camera.Facilitati.Split('|');
        for (int i = 0; i < fac.Length; i++){
            Label lbl = new Label();
            Label l = new Label(){Text = "<br />"};
            lbl.Text = fac[i];
            lbl.CssClass = "CDescr";
            Panel1.Controls.Add(lbl);
            Panel1.Controls.Add(l);
        }
    }
    protected void btnRez_Click(object sender, EventArgs e)
    {
        Camera camera = (Camera)Session["Camera"];
        Rezervare rez = new Rezervare(camera.Id, Convert.ToDateTime(Session["Data1"]), Convert.ToDateTime(Session["Data2"]), txtNume.Text, txtCNP.Text, txtBuletin.Text, txtAdr.Text, txtTel.Text, txtMail.Text, null);
        Session["mail"] = txtMail.Text;
        lblRes.Text = Conexiune.Rezerva(rez);
    }
}