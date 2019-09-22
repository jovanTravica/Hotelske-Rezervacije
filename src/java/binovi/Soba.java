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
public class Soba {
    private int id;
    private int idHotela;
    private int tipSobe;
    private String opis;
    private int ukupnoSoba;
    private int slobodneSobe;
    private float cena;
    private String slika;

    public Soba() {
    }

    public Soba(int id, int idHotela, int tipSobe, String opis, int ukupnoSoba, int slobodneSobe, float cena, String slika) {
        this.id = id;
        this.idHotela = idHotela;
        this.tipSobe = tipSobe;
        this.opis = opis;
        this.ukupnoSoba = ukupnoSoba;
        this.slobodneSobe = slobodneSobe;
        this.cena = cena;
        this.slika = slika;
    }

    public int getId() {
        return id;
    }

    public int getIdHotela() {
        return idHotela;
    }

    public int getSlobodneSobe() {
        return slobodneSobe;
    }

    public int getUkupnoSoba() {
        return ukupnoSoba;
    }

    public int getTipSobe() {
        return tipSobe;
    }

    public float getCena() {
        return cena;
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

    public void setIdHotela(int idHotela) {
        this.idHotela = idHotela;
    }

    public void setTipSobe(int tipSobe) {
        this.tipSobe = tipSobe;
    }

    public void setUkupnoSoba(int ukupnoSoba) {
        this.ukupnoSoba = ukupnoSoba;
    }

    public void setSlobodneSobe(int slobodneSobe) {
        this.slobodneSobe = slobodneSobe;
    }

    public void setCena(float cena) {
        this.cena = cena;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public void setSlika(String slika) {
        this.slika = slika;
    }
}
