using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Camera
{
    public int Id { get; set; }
    public string Tip { get; set; }
    public int Pret { get; set; }
    public string AC { get; set; }
    public string Vedere { get; set; }
    public string Imagine { get; set; }

    public Camera()
    {
    }

	public Camera(int id, string tip, int pret, string ac, string vedere, string imagine)
	{
        Id = id;
        Tip = tip;
        Pret = pret;
        AC = ac;
        Vedere = vedere;
        Imagine = imagine;
	}

    public Camera(string tip, int pret, string ac, string vedere, string imagine)
    {
        Tip = tip;
        Pret = pret;
        AC = ac;
        Vedere = vedere;
        Imagine = imagine;
    }
}