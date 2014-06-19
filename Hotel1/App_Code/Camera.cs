using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Camera
{
    public int Id { get; set; }
    public string Tip { get; set; }
    public string Detalii { get; set; }
    public string Facilitati { get; set; }
    public string Vedere { get; set; }
    public string Imagini { get; set; }
    public int Pret { get; set; }
    public int Nr { get; set; }
    public int NrO { get; set; }

    public Camera()
    {
    }

	public Camera(int id, string tip, string detalii, string facilitati, string vedere, string imagini, int pret, int nr, int nrO)
	{
        Id = id;
        Tip = tip;
        Pret = pret;
        Vedere = vedere;
        Detalii = detalii;
        Nr = nr;
        NrO = nrO;
        Imagini = imagini;
        Facilitati = facilitati;
	}

    public Camera(string tip, string detalii, string facilitati, string vedere, string imagini, int pret, int nr, int nrO)
    {
        Tip = tip;
        Pret = pret;
        Vedere = vedere;
        Detalii = detalii;
        Nr = nr;
        NrO = nrO;
        Imagini = imagini;
        Facilitati = facilitati;
    }
}