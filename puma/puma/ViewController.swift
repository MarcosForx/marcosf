
import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBAction func boton(_ sender: UIButton) {
        self.mapa.removeOverlays(self.mapa.overlays)
             self.mapa.removeAnnotations(self.mapa.annotations)
        let points = [
            ["title": "Camino Verde", "Latitude":19.3256510, "Longitude":-99.1821050],
            ["title": "Contaduria", "Latitude":19.3236290, "Longitude":-99.1848590],
            ["title": "IMAS", "Latitude":19.3306430, "Longitude":-99.1808200],
            ["title": "Estacionamiento 1", "Latitude":19.3336470, "Longitude":-99.1907350],
            ["title": "Posgrado", "Latitude":19.3271370, "Longitude":-99.1810110],
            ["title": "Centro Médico", "Latitude":19.3301220, "Longitude":-99.1881960],
            ["title": "Frontones", "Latitude":19.3304630, "Longitude":-99.1826980],
            ["title": "Invernadero", "Latitude":19.3290368, "Longitude":-99.1797775],
            ["title": "Trabajo Social", "Latitude":19.3232761, "Longitude":-99.1866688],
            ["title": "Estadio de práctica", "Latitude":19.3268006, "Longitude":-99.1880615],
            ["title": "MUCA", "Latitude":19.3300764, "Longitude":-99.1887646],
            ["title": "Estacionamiento 2", "Latitude":19.333441999999998, "Longitude": -99.193288],
            ["title": "Estacionamiento 3", "Latitude":19.332508999999998, "Longitude":  -99.194625],
            ["title": "Estacionamiento 6", "Latitude":19.330268, "Longitude": -99.193399],
            ["title": "Estacionamiento 7", "Latitude":19.329129, "Longitude": -99.192346],
            ["title": "Estacionamiento 8", "Latitude":19.330112, "Longitude": -99.19049],
            ["title": "Ingienería", "Latitude":19.3305490, "Longitude":-99.1846540]
        ]
        CreatAnnotacion(locations: points)
        // puntos de referencia
        let estaciopnamiento6Market = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.330268  ,longitude: -99.193399))
        let immasMarket = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3306430, longitude: -99.1808200) )
        let estadioMarket = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3336470, longitude: -99.1907350) )
        let caminoVerdePlace = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3256510 ,longitude: -99.1821050))
        let contaduriaMarket = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3236290, longitude: -99.1848590))
        let abajoDelPutoPuente = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.330456952111433, longitude: -99.18903819458063))
        let aLadoDelPuente = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.331602484303033, longitude: -99.18985906880202))
        let anotherPoint = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.331264741528884, longitude: -99.1898184064323))
        let yaCasi = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.331194871703076, longitude: -99.18988884799545))
        
        // linea 1
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = MKMapItem(placemark: estadioMarket)
        directionRequest.destination = MKMapItem(placemark: immasMarket)
        directionRequest.transportType = .automobile
        let direction = MKDirections(request: directionRequest)
        direction.calculate {
            (response, error) in guard let directionResonse = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route = directionResonse.routes[0]
            self.mapa.add(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
            
        }
        
        //linea 2
        let directionRequest1 = MKDirectionsRequest()
        directionRequest1.source = MKMapItem(placemark: immasMarket)
        directionRequest1.destination = MKMapItem(placemark: caminoVerdePlace)
        directionRequest1.transportType = .automobile
        
        let direction1 = MKDirections(request: directionRequest1)
        direction1.calculate {
            (response, error) in guard let directionResonse1 = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route1 = directionResonse1.routes[0]
            self.mapa.add(route1.polyline, level: .aboveRoads)
            let rect1 = route1.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect1), animated: true)
            
        }
        //linea 3
        let directionRequest2 = MKDirectionsRequest()
        directionRequest2.source = MKMapItem(placemark: caminoVerdePlace)
        directionRequest2.destination = MKMapItem(placemark: abajoDelPutoPuente )
        directionRequest2.transportType = .automobile
        
        let direction2 = MKDirections(request: directionRequest2)
        direction2.calculate {
            (response, error) in guard let directionResonse2 = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route2 = directionResonse2.routes[0]
            self.mapa.add(route2.polyline, level: .aboveRoads)
            let rect2 = route2.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect2), animated: true)
            
        }
        //linea 4
        let directionRequest3 = MKDirectionsRequest()
        directionRequest3.source = MKMapItem(placemark: abajoDelPutoPuente)
        directionRequest3.destination = MKMapItem(placemark:aLadoDelPuente)
        directionRequest3.transportType = .automobile
        
        let direction3 = MKDirections(request: directionRequest3)
        direction3.calculate {
            (response, error) in guard let directionResonse3 = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route3 = directionResonse3.routes[0]
            self.mapa.add(route3.polyline, level: .aboveRoads)
            let rect3 = route3.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect3), animated: true)
            }
        //linea 5
        let directionRequest4 = MKDirectionsRequest()
        directionRequest4.source = MKMapItem(placemark: aLadoDelPuente)
        directionRequest4.destination = MKMapItem(placemark: anotherPoint)
        directionRequest4.transportType = .automobile
        
        let direction4 = MKDirections(request: directionRequest4)
        direction4.calculate {
            (response, error) in guard let directionResonse4 = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route4 = directionResonse4.routes[0]
            self.mapa.add(route4.polyline, level: .aboveRoads)
            let rect4 = route4.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect4), animated: true)
        }
        //linea 6
        let directionRequest5 = MKDirectionsRequest()
        directionRequest5.source = MKMapItem(placemark: anotherPoint)
        directionRequest5.destination = MKMapItem(placemark: estaciopnamiento6Market)
        directionRequest5.transportType = .walking
        
        let direction5 = MKDirections(request: directionRequest5)
        direction5.calculate {
            (response, error) in guard let directionResonse5 = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route5 = directionResonse5.routes[0]
            self.mapa.add(route5.polyline, level: .aboveRoads)
            let rect5 = route5.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect5), animated: true)
        }
        //linea
        let directionRequest6 = MKDirectionsRequest()
        directionRequest6.source = MKMapItem(placemark: estaciopnamiento6Market)
        directionRequest6.destination = MKMapItem(placemark: estadioMarket)
        directionRequest6.transportType = .walking
        
        let direction6 = MKDirections(request: directionRequest6)
        direction6.calculate {
            (response, error) in guard let directionResonse6 = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route6 = directionResonse6.routes[0]
            self.mapa.add(route6.polyline, level: .aboveRoads)
            let rect6 = route6.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect6), animated: true)
        }
      
        }
    //fuera ruta 8
    @IBAction func Ruta9Button(_ sender: UIButton) {
        self.mapa.removeOverlays(self.mapa.overlays)
        self.mapa.removeAnnotations(self.mapa.annotations)
        
        
        let points = [
            ["title": "Camino Verde", "Latitude":19.3256510, "Longitude":-99.1821050],
            ["title": "Contaduria", "Latitude":19.3236290, "Longitude":-99.1848590],
            ["title": "Metrobús CU", "Latitude":19.3241091, "Longitude":-99.1876891],
            ["title": "MUCA", "Latitude":19.3300764, "Longitude":-99.1887646],
            ["title": "Posgrado de ingeniería", "Latitude":19.3271370, "Longitude":-99.1810110],
            ["title": "Rectoría", "Latitude":19.3327336, "Longitude":-99.1892119],
            ["title": "Psicología", "Latitude":19.3344825, "Longitude":-99.1891358],
            ["title": "Invernadero", "Latitude":19.3290368, "Longitude":-99.1797775],
            ["title": "Trabajo Social", "Latitude":19.3232761, "Longitude":-99.1866688],
            ["title": "Estadio de práctica", "Latitude":19.3268006, "Longitude":-99.1880615],
            ["title": "Filosofía", "Latitude":19.3346334, "Longitude":-99.1877253],
            ["title": "Derecho", "Latitude":19.3350469, "Longitude": -99.1849220],
            ["title": "Economía", "Latitude":19.3351899, "Longitude":-99.1832728],
            ["title": "Odontología", "Latitude":19.3348216, "Longitude": -99.1812320],
            ["title": "Medicina", "Latitude":19.3330873, "Longitude":-99.1787526]
        ]
        CreatAnnotacion(locations: points)
        // puntos de referencia
        let medicinaMarket  = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3330873,longitude: -99.1787526))
        let estadioPMarket = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3268006, longitude: -99.1880615))
        let derechoMarket = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3350469, longitude: -99.1849220))
        
        // linea 1
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = MKMapItem(placemark: medicinaMarket)
        directionRequest.destination = MKMapItem(placemark: estadioPMarket)
        directionRequest.transportType = .automobile
        let direction = MKDirections(request: directionRequest)
        direction.calculate {
            (response, error) in guard let directionResonse = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route = directionResonse.routes[0]
            self.mapa.add(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
        //linea 2
        let directionRequest1 = MKDirectionsRequest()
        directionRequest1.source = MKMapItem(placemark: estadioPMarket)
        directionRequest1.destination = MKMapItem(placemark: derechoMarket)
        directionRequest1.transportType = .automobile
        
        let direction1 = MKDirections(request: directionRequest1)
        direction1.calculate {
            (response, error) in guard let directionResonse1 = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route1 = directionResonse1.routes[0]
            self.mapa.add(route1.polyline, level: .aboveRoads)
            let rect1 = route1.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect1), animated: true)
            
        }
        //linea 3
        let directionRequest2 = MKDirectionsRequest()
        directionRequest2.source = MKMapItem(placemark: derechoMarket)
        directionRequest2.destination = MKMapItem(placemark: medicinaMarket )
        directionRequest2.transportType = .automobile
        
        let direction2 = MKDirections(request: directionRequest2)
        direction2.calculate {
            (response, error) in guard let directionResonse2 = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route2 = directionResonse2.routes[0]
            self.mapa.add(route2.polyline, level: .aboveRoads)
            let rect2 = route2.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect2), animated: true)
            
        }
    
    }
    ////FUERA RUTA 9
    
    @IBAction func Boton4(_ sender: Any) {
        
        self.mapa.removeOverlays(self.mapa.overlays)
        self.mapa.removeAnnotations(self.mapa.annotations)
        let points = [
            ["title": "Contaduria", "Latitude":19.3236290, "Longitude":-99.1848590],
            ["title": "Trabajo Social", "Latitude":19.3232761, "Longitude":-99.1866688],
            ["title": "Metrobús CU", "Latitude":19.3241091, "Longitude":-99.1876891],
            ["title": "Estadio de práctica", "Latitude":19.3268006, "Longitude":-99.1880615],
        ]
        CreatAnnotacion(locations: points)
        
        let lugar1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3227840, longitude: -99.1945720))
        let lugar2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3257080, longitude: -99.1749300))
        let lugar3 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3273140, longitude: -99.1887560))
///LINEA 1
        let direccionrequest1 = MKDirectionsRequest()
        direccionrequest1.source = MKMapItem(placemark: lugar2)
        direccionrequest1.destination = MKMapItem(placemark: lugar3)
        direccionrequest1.transportType = .automobile
        
        let direccion1 = MKDirections(request: direccionrequest1)
        direccion1.calculate {
            (response,error ) in guard let direccionresonse1 = response else {
                if let error = error {
                    print ("error")
                }
                return
            }
            let rutaida1 = direccionresonse1.routes[0]
            self.mapa.add(rutaida1.polyline, level: .aboveRoads)
            let rectaida1 = rutaida1.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rectaida1), animated: true)
        }
        ////LINEA 2
        let direccionrequest2 = MKDirectionsRequest()
        direccionrequest2.source = MKMapItem(placemark: lugar3)
        direccionrequest2.destination = MKMapItem(placemark: lugar1)
        direccionrequest2.transportType = .automobile
        
        let direccion2 = MKDirections(request: direccionrequest2)
        direccion2.calculate {
            (response,error ) in guard let direccionresonse2 = response else {
                if let error = error {
                    print ("error")
                }
                return
            }
            let rutaida2 = direccionresonse2.routes[0]
            self.mapa.add(rutaida2.polyline, level: .aboveRoads)
            let rectaida2 = rutaida2.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rectaida2), animated: true)
        }
////LINEA 3
        let direccionrequest3 = MKDirectionsRequest()
        direccionrequest3.source = MKMapItem(placemark: lugar1)
        direccionrequest3.destination = MKMapItem(placemark: lugar2)
        direccionrequest3.transportType = .automobile
        
        let direccion3 = MKDirections(request: direccionrequest3)
        direccion3.calculate {
            (response,error ) in guard let direccionresonse3 = response else {
                if let error = error {
                    print ("error")
                }
                return
            }
            let rutaida3 = direccionresonse3.routes[0]
            self.mapa.add(rutaida3.polyline, level: .aboveRoads)
            let rectaida3 = rutaida3.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rectaida3), animated: true)
        }

        
    }
////FIN RUTA 4
    
    @IBAction func button11(_ sender: UIButton) {
        self.mapa.removeOverlays(self.mapa.overlays)
        self.mapa.removeAnnotations(self.mapa.annotations)
        let points = [
            ["title": "Metrobús CU", "Latitude": 19.3241091, "Longitude": -99.1876891],
            ["title": "MUCA", "Latitude": 19.3300764, "Longitude": -99.1887646],
            ["title": "Relaciones laborales", "Latitude": 19.3342000, "Longitude": -99.1911170],
            ["title": "Obras y conservación", "Latitude": 19.3350216, "Longitude": -99.1929935],
            ["title": "UDUAL", "Latitude": 19.3325863, "Longitude": -99.1961933],
            ["title": "Pista de calentamiento", "Latitude": 19.3262513, "Longitude": -99.1948053],
            ["title": "Instituo de ecología", "Latitude":19.3213597, "Longitude": -99.1931370],
            ["title": "Campo de fútbol", "Latitude":19.3232688, "Longitude": -99.1922320],
            ["title": "Base 5", "Latitude": 19.3237563, "Longitude": -99.1879700],
            ["title": "Jardín botánico", "Latitude": 19.321373, "Longitude": -99.193106],
            ["title": "Estadio de práctica", "Latitude": 19.3268006, "Longitude": -99.1880615]
        ]
        CreatAnnotacion(locations: points)
        let jardinMarket = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.321373, longitude: -99.193106))
        let baseMarket = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.3237563, longitude: -99.1880615))
        let abajoDelPutoPuente = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 19.330456952111433, longitude: -99.18903819458063))
        
        // linea 1
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = MKMapItem(placemark: baseMarket)
        directionRequest.destination = MKMapItem(placemark: abajoDelPutoPuente)
        directionRequest.transportType = .automobile
        let direction = MKDirections(request: directionRequest)
        direction.calculate {
            (response, error) in guard let directionResonse = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route = directionResonse.routes[0]
            self.mapa.add(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
        //linea 2
        let directionRequest1 = MKDirectionsRequest()
        directionRequest1.source = MKMapItem(placemark: abajoDelPutoPuente)
        directionRequest1.destination = MKMapItem(placemark: abajoDelPutoPuente)
        directionRequest1.transportType = .automobile
        
        let direction1 = MKDirections(request: directionRequest1)
        direction1.calculate {
            (response, error) in guard let directionResonse1 = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route1 = directionResonse1.routes[0]
            self.mapa.add(route1.polyline, level: .aboveRoads)
            let rect1 = route1.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect1), animated: true)
            
        }
        //linea 6
        let directionRequest5 = MKDirectionsRequest()
        directionRequest5.source = MKMapItem(placemark: anotherPoint)
        directionRequest5.destination = MKMapItem(placemark: estaciopnamiento6Market)
        directionRequest5.transportType = .walking
        
        let direction5 = MKDirections(request: directionRequest5)
        direction5.calculate {
            (response, error) in guard let directionResonse5 = response else {
                if let error = error {
                    print("error")
                }
                return
            }
            let route5 = directionResonse5.routes[0]
            self.mapa.add(route5.polyline, level: .aboveRoads)
            let rect5 = route5.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegionForMapRect(rect5), animated: true)
        }
    }
    @IBOutlet weak var mapa: MKMapView!
    private let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapa.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        locationManager.startUpdatingLocation()
        
        self.mapa.showsUserLocation = true
    }
    
    // fuera del override
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
        
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer! {
        if (overlay is MKPolyline){
            let polylinRender = MKPolylineRenderer(overlay: overlay)
            polylinRender.strokeColor = UIColor.blue.withAlphaComponent(0.5)
            polylinRender.lineWidth = 5
            
            return polylinRender
            
        }
        return nil
    }
    func CreatAnnotacion(locations: [[String : Any]]){
        for location in locations{
            let annotacion = MKPointAnnotation()
            annotacion.title = location["title"] as? String
            annotacion.coordinate = CLLocationCoordinate2D(latitude: location["Latitude"] as! CLLocationDegrees, longitude: location["Longitude"] as! CLLocationDegrees)
            mapa.addAnnotation(annotacion)
        }
    }
    
    // fin de clase
}

