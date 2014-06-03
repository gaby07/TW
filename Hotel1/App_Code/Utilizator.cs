using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Utilizator
{
	public int Id { get; set; }
    public string Nume { get; set; }
    public string Parola { get; set; }
    public string Email { get; set; }
    public string Tip { get; set; }

    public Utilizator(int id, string nume, string parola, string email, string tip)
    {
        Id = id;
        Nume = nume;
        Parola = parola;
        Email = email;
        Tip = tip;
    }

    public Utilizator(string nume, string parola, string email, string tip)
    {
        Nume = nume;
        Parola = parola;
        Email = email;
        Tip = tip;
    }
}