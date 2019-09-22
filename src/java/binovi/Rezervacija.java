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
public class Rezervacija {
    private int idSobe;
    private float cenaRezervacije;
    private float poeni;
    private String datumDolaska;
    private String datumOdlaska;
    private String nazivHotela;
    private String status;
  
    private int idKorisnika;

    public Rezervacija() {
    }

    public Rezervacija(int idSobe, float cenaRezervacije, float poeni, String datumDolaska, String datumOdlaska, String nazivHotela, String status, int idKorisnika) {
        this.idSobe = idSobe;
        this.cenaRezervacije = cenaRezervacije;
        this.poeni = poeni;
        this.datumDolaska = datumDolaska;
        this.datumOdlaska = datumOdlaska;
        this.nazivHotela = nazivHotela;
        this.status = status;
     
        this.idKorisnika = idKorisnika;
    }

    public int getIdKorisnika() {
        return idKorisnika;
    }

    public String getNazivHotela() {
        return nazivHotela;
    }
    
    public int getIdSobe() {
        return idSobe;
    }

    public float getCenaRezervacije() {
        return cenaRezervacije;
    }

    public String getDatumDolaska() {
        return datumDolaska;
    }

    public String getDatumOdlaska() {
        return datumOdlaska;
    }

    public float getPoeni() {
        return poeni;
    }

    public String getStatus() {
        return status;
    }

   

    public void setIdSobe(int idSobe) {
        this.idSobe = idSobe;
    }

    public void setCenaRezervacije(float cenaRezervacije) {
        this.cenaRezervacije = cenaRezervacije;
    }

    public void setDatumDolaska(String datumDolaska) {
        this.datumDolaska = datumDolaska;
    }

    public void setDatumOdlaska(String datumOdlaska) {
        this.datumOdlaska = datumOdlaska;
    }

    public void setPoeni(float poeni) {
        this.poeni = poeni;
    }

    public void setStatus(String status) {
        this.status = status;
    }

   

    public void setNazivHotela(String nazivHotela) {
        this.nazivHotela = nazivHotela;
    }

    public void setIdKorisnika(int idKorisnika) {
        this.idKorisnika = idKorisnika;
    }
}
