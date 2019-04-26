import UIKit
import MapKit
import CoreLocation

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    
    init(pinTitle: String, pinSubTitle: String,
         location: CLLocationCoordinate2D){
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
        
    }
    
}

class mapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    // CÓDIGO PARA MENÚ
    @IBOutlet var botonesMenu: [UIButton]!
    
    @IBAction func observarMenu(_ sender: UIButton) {
        manejoBotones()
    }
    
    func manejoBotones()
    {
        botonesMenu.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    enum nombreBotones : String {
        case rutaUno = "Ruta 1"
        case rutaDos = "Ruta 2"
        case rutaTres = "Ruta 3"
        case rutaCuatro = "Ruta 4"
        case rutaCinco = "Ruta 5"
        case rutaSeis = "Ruta 6"
        case rutaSiete = "Ruta 7"
        case rutaOcho = "Ruta 8"
        case rutaNueve = "Ruta 9"
        case rutaDiez = "Ruta 10"
        case rutaOnce = "Ruta 11"
        case rutaTrece = "Ruta 13"
        case regresar = "Regresar"
        
    }
    
    @IBAction func centrar(_ sender: UIButton) {
        
        let coordenada = self.locationManager.location?.coordinate
        let region = MKCoordinateRegion(center: coordenada ?? coordenada!, latitudinalMeters: 1000, longitudinalMeters: 1000)
        self.mapa.setRegion(region, animated: true)
        
    }
    
    @IBAction func botonSeleccionado(_ sender: UIButton) {
        guard let titulo = sender.currentTitle, let nombre = nombreBotones(rawValue: titulo) else {
            return
        }
        
        switch nombre {
        case .rutaUno:
            trazarRutaUno()
            break;
        case .rutaDos:
            trazarRutaDos()
            break;
        case .rutaTres:
            trazarRutaTres()
            break
        case .rutaCuatro:
            trazarRutaCuatro()
            break
        case .rutaCinco:
            trazarRutaCinco()
            break
        case .rutaSeis:
            trazarRutaSeis()
            break
        case .rutaSiete:
            trazarRutaSiete()
            break
        case .rutaOcho:
            trazarRutaOcho()
            break
        case .rutaNueve:
            trazarRutaNueve()
            break
        case .rutaDiez:
            trazarRutaDiez()
            break
        case .rutaOnce:
            trazarRutaOnce()
            break
        case .rutaTrece:
            trazarRutaTrece()
            break
        case .regresar:
            dismiss(animated: true, completion: nil)
        }
        manejoBotones()
    }
    //FIN DEL CÓDIGO PARA EL MENÚ
    
    /*
     Instancia de la clase coordenadasPuntos del archivo puntosRutas, donde se ubican las coordenadas de
     las paradas de cada ruta
     */
    var puntosRutas = coordenadasPuntos()
    /*
     Instancia de la clase puntosEstrategicos del archivo puntosEstrategicos, donde se ubican las coordenadas de
     los placeMarket
     */
    var placeMarket = puntosEstrategicos()
    
    @IBOutlet weak var mapa: MKMapView!
    private var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        self.mapa.showsUserLocation = true
        self.mapa.delegate = self
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }
    
    func limpiarPantalla ()
    {
        self.mapa.removeOverlays(self.mapa.overlays)
        self.mapa.removeAnnotations(self.mapa.annotations)
    }
    
    func dibujarPuntos(puntos : [[String : Any]])
    {
        for i in puntos{
            
            let ubicacion = CLLocationCoordinate2D(latitude: i["Latitude"] as! CLLocationDegrees, longitude: i["Longitude"] as! CLLocationDegrees)
            let pin = customPin(pinTitle: i["title"] as! String , pinSubTitle: "", location: ubicacion)
            self.mapa.addAnnotation(pin)
        }
    }
    func trazarCamino2(puntos : [MKPlacemark])
    {
        let sizeArray = puntos.count
        var refUno = 0
        var refDos = 0
        
        for i in 0...sizeArray - 1
        {
            if i != sizeArray - 1
            {
                refUno = i
                refDos = i + 1
            }
            else
            {
                refUno = i
                refDos = i
            }
            
            let directionRequest = MKDirections.Request()
            directionRequest.source = MKMapItem(placemark: puntos[refUno])
            directionRequest.destination = MKMapItem(placemark: puntos[refDos])
            directionRequest.transportType = .automobile
            
            let directions = MKDirections(request: directionRequest)
            directions.calculate {(response, error) in
                guard let directionResponse = response else {
                    
                    if let error = error {
                        print("There is a problem with getting directions: \(error.localizedDescription)")
                    }
                    return
                }
                
                let route = directionResponse.routes[0]
                self.mapa.addOverlay(route.polyline, level: .aboveRoads)
               
                
            }
            
        }
        
        let coordenada = self.locationManager.location?.coordinate
        let region = MKCoordinateRegion(center: coordenada ?? coordenada!, latitudinalMeters: 3000, longitudinalMeters: 3000)
        self.mapa.setRegion(region, animated: true)
    }
    func trazarBajoPuente(puntos : [MKPlacemark])
    {
        let sizeArray = puntos.count
        var refUno = 0
        var refDos = 0
        
        for i in 0...sizeArray - 1
        {
            if i != sizeArray - 1
            {
                refUno = i
                refDos = i + 1
            }
            else
            {
                refUno = i
                refDos = i
            }
            
            let directionRequest = MKDirections.Request()
            directionRequest.source = MKMapItem(placemark: puntos[refUno])
            directionRequest.destination = MKMapItem(placemark: puntos[refDos])
            directionRequest.transportType = .walking
            
            let directions = MKDirections(request: directionRequest)
            directions.calculate {(response, error) in
                guard let directionResponse = response else {
                    
                    if let error = error {
                        print("There is a problem with getting directions: \(error.localizedDescription)")
                    }
                    return
                }
                
                let route = directionResponse.routes[0]
                self.mapa.addOverlay(route.polyline, level: .aboveRoads)
                
                
            }
            
        }
        let coordenada = self.locationManager.location?.coordinate
        let region = MKCoordinateRegion(center: coordenada ?? coordenada!, latitudinalMeters: 3000, longitudinalMeters: 3000)
        self.mapa.setRegion(region, animated: true)
    }
    
    func trazarCamino(puntos : [MKPlacemark])
    {
        let sizeArray = puntos.count
        var refUno = 0
        var refDos = 0
        
        for i in 0...sizeArray - 1
        { 
            if i != sizeArray - 1
            {
                refUno = i
                refDos = i + 1
            }
            else
            {
                refUno = i
                refDos = 0
            }
            
            let directionRequest = MKDirections.Request()
            directionRequest.source = MKMapItem(placemark: puntos[refUno])
            directionRequest.destination = MKMapItem(placemark: puntos[refDos])
            directionRequest.transportType = .automobile
            
            let directions = MKDirections(request: directionRequest)
            directions.calculate {(response, error) in
                guard let directionResponse = response else {
                    
                    if let error = error {
                        print("There is a problem with getting directions: \(error.localizedDescription)")
                    }
                    return
                }
                
                let route = directionResponse.routes[0]
                self.mapa.addOverlay(route.polyline, level: .aboveRoads)
                

            }
            
        }
        let coordenada = self.locationManager.location?.coordinate
            let region = MKCoordinateRegion(center: coordenada ?? coordenada!, latitudinalMeters: 3000, longitudinalMeters: 3000)
            self.mapa.setRegion(region, animated: true)

    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
        mapView.setRegion(region, animated: true)
    }
    func trazarRutaUno()
    {
        limpiarPantalla()
        dibujarPuntos(puntos: puntosRutas.rutaUno)
        trazarCamino2(puntos: placeMarket.rutaUno)
        trazarBajoPuente(puntos: placeMarket.rutaUno2)
    }
    
    func trazarRutaDos()
    {
       limpiarPantalla()
       dibujarPuntos(puntos: puntosRutas.rutaDos)
       trazarCamino(puntos: placeMarket.rudaDos)
       trazarBajoPuente(puntos: placeMarket.rutaTres2)
        
    }
    
    func trazarRutaTres()
    {
        limpiarPantalla()
        dibujarPuntos(puntos: puntosRutas.rutaTres)
        trazarCamino2(puntos: placeMarket.rutaTres)
        trazarBajoPuente(puntos: placeMarket.rutaTres2)
        trazarCamino2(puntos: placeMarket.rutaTres3)
        trazarBajoPuente(puntos: placeMarket.rutaTresFinal)
    }
    
    func trazarRutaCuatro()
    {
        limpiarPantalla()
        dibujarPuntos(puntos: puntosRutas.rutaCuatro)
        trazarCamino(puntos: placeMarket.rutaCuatro)
    }
    
    func trazarRutaCinco()
    {
        limpiarPantalla()
        dibujarPuntos(puntos: puntosRutas.rutaCinco)
        trazarCamino2(puntos: placeMarket.rutaCinco)
        trazarBajoPuente(puntos: placeMarket.rutaCinco2)
    }
    
    func trazarRutaSeis()
    {
        limpiarPantalla()
        dibujarPuntos(puntos: puntosRutas.rutaSeis)
        trazarCamino2(puntos: placeMarket.rutaSeis)
        trazarBajoPuente(puntos: placeMarket.rutaOcho2)
    }
    
    func trazarRutaSiete()
    {
        limpiarPantalla()
        dibujarPuntos(puntos: puntosRutas.rutaSiete)
        trazarCamino2(puntos: placeMarket.rutaSiete)
        trazarBajoPuente(puntos: placeMarket.rutaOcho2)
    }
    
    func trazarRutaOcho()
    {
        limpiarPantalla()
        dibujarPuntos(puntos: puntosRutas.rutaOcho)
        trazarCamino2(puntos: placeMarket.rutaOcho)
        trazarBajoPuente(puntos: placeMarket.rutaOcho2)
    }
    
    func trazarRutaNueve()
    {
        limpiarPantalla()
        dibujarPuntos(puntos: puntosRutas.rutaNueve)
        trazarCamino(puntos: placeMarket.rutaNueve)
    }
    
    func trazarRutaDiez()
    {
        limpiarPantalla()
        dibujarPuntos(puntos: puntosRutas.rutadiez)
        trazarCamino2(puntos: placeMarket.rutaDiez)
        trazarBajoPuente(puntos: placeMarket.curvaPosgrado10)
    }
    
    func trazarRutaOnce()
    {
        limpiarPantalla()
        dibujarPuntos(puntos: puntosRutas.rutaOnce)
        trazarCamino2(puntos: placeMarket.rutaOnce)
        trazarCamino2(puntos: placeMarket.rutaOnce4)
        trazarCamino2(puntos: placeMarket.rutaOnce5)
        trazarBajoPuente(puntos: placeMarket.rutaOnce2)
        trazarBajoPuente(puntos: placeMarket.rutaOnce3)
    }
    func trazarRutaTrece()
    {
        limpiarPantalla()
        dibujarPuntos(puntos: puntosRutas.rutaTrece)
        trazarCamino2(puntos: placeMarket.rutaTrece)
        trazarBajoPuente(puntos: placeMarket.curvaPosgrado)
        trazarCamino2(puntos: placeMarket.RutaTrece2)
        
    }
}
// cambiar pin del userlocation

func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)-> MKAnnotationView? {
    
    var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
    
    if annotationView == nil{
        annotationView =  MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
    }
    if annotation.title == "Baños H/M"{
        annotationView?.image = UIImage(named: "iBañosH:M")
    }
    else if annotation.title == "Baños H"{
        annotationView?.image = UIImage(named: "iBañosH")
    }
    else if annotation.title == "Baños M"{
        annotationView?.image = UIImage(named: "iBañosM")
    }
    else if annotation.title == "Baños H/M+"{
        annotationView?.image = UIImage(named: "iBañosH:M+")
    }
    else if annotation.title == "Baños H/M D"{
        annotationView?.image = UIImage(named: "iWheelChair")
    }
    else if annotation === mapView.userLocation{
        annotationView?.image = UIImage(named: "iRunningM")
        
    }
    annotationView?.canShowCallout = true
    return annotationView
    
}
