/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package binovi;

/**
 *
 * @author jocas
 */
public class Korisnik {
    private int id;
    private String korisnickoIme;
    private String email;
    private String lozinka;
    private String telefon;
    private float poeni;
    private String tipKorisnika;

    public Korisnik() {
    }

    public Korisnik(int id, String korisnickoIme, String email, String lozinka, String telefon, float poeni, String tipKorisnika) {
        this.id = id;
        this.korisnickoIme = korisnickoIme;
        this.email = email;
        this.lozinka = lozinka;
        this.telefon = telefon;
        this.poeni = poeni;
        this.tipKorisnika = tipKorisnika;
    }

    public float getPoeni() {
        return poeni;
    }
    
    public int getId() {
        return id;
    }

    public String getKorisnickoIme() {
        return korisnickoIme;
    }

    public String getEmail() {
        return email;
    }

    public String getLozinka() {
        return lozinka;
    }

    public String getTelefon() {
        return telefon;
    }

    public String getTipKorisnika() {
        return tipKorisnika;
    }

    public void setKorisnickoIme(String korisnickoIme) {
        this.korisnickoIme = korisnickoIme;
    }

    public void setLozinka(String lozinka) {
        this.lozinka = lozinka;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public void setTipKorisnika(String tipKorisnika) {
        this.tipKorisnika = tipKorisnika;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPoeni(float poeni) {
        this.poeni = poeni;
    }
}
