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
public class Hotel {
    private int id;
    private String naziv;
    private String adresa;
    private String telefon;
    private String opis;
    private String slika;
    private int menadzer;

    public Hotel(int id, String naziv, String adresa, String telefon, String opis, String slika, int menadzer) {
        this.id = id;
        this.naziv = naziv;
        this.adresa = adresa;
        this.telefon = telefon;
        this.opis = opis;
        this.slika = slika;
        this.menadzer = menadzer;
    }

    public Hotel() {
    }

    public int getId() {
        return id;
    }

    public String getNaziv() {
        return naziv;
    }

    public String getAdresa() {
        return adresa;
    }

    public String getTelefon() {
        return telefon;
    }

    public int getMenadzer() {
        return menadzer;
    }

    public String getOpis() {
        return opis;
    }

    public String getSlika() {
        return slika;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setMenadzer(int menadzer) {
        this.menadzer = menadzer;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public void setSlika(String slika) {
        this.slika = slika;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }
}
