import Foundation
import MapKit

class puntosEstrategicos
{
    //RUTA 1
    let rutaUno = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.325887 , longitude: -99.174763)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.330409, longitude: -99.188841)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.330301, longitude: -99.178976)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.322455, longitude: -99.177059)),
    ]
    let rutaUno2 = [
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.322455, longitude: -99.177059)),
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.3241227 , longitude: -99.1748419)),
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.325887 , longitude: -99.174763))
    ]
    
    //RUTA 2
    let rudaDos = [
     MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.325659 , longitude: -99.174948)),
     MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.324177 , longitude: -99.187892)),
    ]
    //RUTA 3
    let rutaTres = [
     MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.325681 , longitude: -99.174930)),
     MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.318529 , longitude: -99.186742)),
     MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.308173 , longitude: -99.180223)),
    ]
    //RUTA 3 CAMINANDO
    let rutaTres2 = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.308173 , longitude: -99.180223)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.313993 , longitude: -99.178986)),
    
        ]
    let rutaTres3 = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.313993 , longitude: -99.178986)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.313979 , longitude: -99.180555)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.315609 , longitude: -99.186111)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.323186 , longitude: -99.175649)),
    ]
    let rutaTresFinal = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.323186 , longitude: -99.175649)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.325681 , longitude: -99.174930)),
    ]
 
    //RUTA 4
    let rutaCuatro = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3227840, longitude: -99.1945720)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3257080, longitude: -99.1749300)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3273140, longitude: -99.1887560))
    ]
    //RUTA 5
    let rutaCinco = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.325451, longitude: -99.174825)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.334557, longitude: -99.189453)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.330285, longitude:  -99.178939)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.322236, longitude:  -99.178306)),
        //MISMO ERROR QUE 3
    ]
    let rutaCinco2 = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.322236, longitude:  -99.178306)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.323173, longitude: -99.175636)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.325451, longitude: -99.174825)),
    ]
    
    //RUTA 6
    let rutaSeis = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3336470, longitude: -99.1907350) ),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3227840, longitude: -99.1945720)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3297100, longitude: -99.1791070)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3256510 ,longitude: -99.1821050)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.331264741528884, longitude: -99.1898184064323)),
    ]
    //RUTA 7
    let rutaSiete = [
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3336470, longitude: -99.1907350) ),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.334005, longitude: -99.178820)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.331264741528884, longitude: -99.1898184064323))
    ]

 
   //RUTA 8
    let rutaOcho = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3336470, longitude: -99.1907350) ),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3306430, longitude: -99.1808200) ),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3256510 ,longitude: -99.1821050) ),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.330456952111433, longitude: -99.18903819458063)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.331264741528884, longitude: -99.1898184064323)),
       
    ]
    //RUTA 8 ABAJO DEL PUENTE
    let rutaOcho2 = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.331264741528884, longitude: -99.1898184064323)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.330268  ,longitude: -99.193399)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3336470, longitude: -99.1907350) )

    ]
    //RUTA 9
    let rutaNueve = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3256510, longitude: -99.1821050)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3344825, longitude: -99.1891358)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3330873,longitude: -99.1787526)),
     
    ]
    //RUTA 10
    let rutaDiez = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  19.310697, longitude: -99.186630)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.309250, longitude: -99.186103)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.309011, longitude: -99.179987)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.317287, longitude: -99.183108)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.317592, longitude: -99.176610)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.322726, longitude: -99.192444)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.317943, longitude:  -99.188757)),

    ]
    
    let curvaPosgrado10 = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.317927, longitude: -99.188801)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.311711, longitude: -99.186743)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.310733, longitude: -99.186641)),
        ]
   
    // RUTA 11
    let rutaOnce = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.331194871703076, longitude: -99.18988884799545)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3350216, longitude: -99.1929935)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3232688, longitude: -99.1922320)),
    ]
    //RUTA 11 DEBAJO DEL PUENTO
    let rutaOnce2 = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.331264741528884, longitude: -99.1898184064323)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.331194871703076, longitude: -99.18988884799545))
    ]
    //RUTA 11 AJUSTE
    let rutaOnce3 = [
      MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3232688, longitude: -99.1922320)),
      MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.325083, longitude:  -99.189017)),
      MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.323676, longitude: -99.187971)),
      MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.32315660108801, longitude: -99.18730343446123)),
      MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.326800, longitude: -99.1880615))

    ]
    let rutaOnce4 = [
           MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3232688, longitude: -99.1922320)),
            MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3237563, longitude: -99.1879700))
                ]
    let rutaOnce5 = [
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3268006, longitude: -99.1880615)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.330456952111433, longitude: -99.18903819458063)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.331264741528884, longitude: -99.1898184064323)),
      
    ]
    //RUTA 13
    let rutaTrece = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.335005, longitude: -99.185543)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.326102, longitude: -99.181704)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.317927, longitude: -99.188801)),
       // MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.311711, longitude: -99.186743)),
      //  MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.308040, longitude: -99.184758)),
    ]
    let curvaPosgrado = [
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.317927, longitude: -99.188801)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.311711, longitude: -99.186743)),
        MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.310733, longitude: -99.186641)),
    ]
    let RutaTrece2 = [
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.310733, longitude: -99.186641)),
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.308411, longitude: -99.185295)),
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.309278, longitude: -99.180109)),
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.314025, longitude: -99.181092)),
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.320296, longitude: -99.176242)),
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.320646, longitude: -99.188101)),
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.326694, longitude: -99.188126)),
         MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.335005, longitude: -99.185543)),
    ]
}

