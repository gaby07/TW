using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Rezervare
{
    public int Id { get; set; }
    public int IdCam { get; set; }
    public DateTime Data1 { get; set; }
    public DateTime Data2 { get; set; }
    public string Nume { get; set; }
    public string CNP { get; set; }
    public string Buletin { get; set; }
    public string Adresa { get; set; }
    public string Telefon { get; set; }
    public string Mail { get; set; }
    public string Stare { get; set; }

	public Rezervare(int id, int idCam, DateTime data1, DateTime data2, string nume, string cnp, string buletin, string adresa, string tel, string mail, string stare)
	{
        Id = id;
        IdCam = idCam;
        Data1 = data1;
        Data2 = data2;
        Nume = nume;
        CNP = cnp;
        Buletin = buletin;
        Adresa = adresa;
        Telefon = tel;
        Mail = mail;
        Stare = stare;
	}

    public Rezervare(int idCam, DateTime data1, DateTime data2, string nume, string cnp, string buletin, string adresa, string tel, string mail, string stare)
    {
        IdCam = idCam;
        Data1 = data1;
        Data2 = data2;
        Nume = nume;
        CNP = cnp;
        Buletin = buletin;
        Adresa = adresa;
        Telefon = tel;
        Mail = mail;
        Stare = stare;
    }
}