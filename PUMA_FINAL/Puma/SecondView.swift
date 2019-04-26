//
//  SecondView.swift
//  Puma
//
//  Created by Andres Lopez on 11/27/18.
//  Copyright © 2018 Andres Lopez. All rights reserved.
//

import UIKit

/*Fuente del código para convertir de hex a UIColor: https://cocoacasts.com/from-hex-to-uicolor-and-back-in-swift*/

extension UIColor {
    
    // MARK: - Initialization
    
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt32 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let length = hexSanitized.characters.count
        
        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return nil }
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        } else {
            return nil
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }

}

class SecondView: UIViewController {

    @IBOutlet weak var rutas: UILabel!
    
    var timer = Timer()
    var contador = 0
    var nombreRutas = ["RUTA 1", "RUTA 2", "RUTA 3", "RUTA 4", "RUTA 5", "RUTA 6", "RUTA 7", "RUTA 8", "RUTA 9", "RUTA 10", "RUTA 11", "RUTA 13"]
    var colorRutas = ["#82e0aa", "#f4d03f", "#0e6655", "#4b4b4b", "#3498db", "#e67e22", "#d4ac0d", "#34495e", "#7b241c", "#000000", "#512e5f", "#e67e22"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rutas.text = nombreRutas[0]
        startTimer()
    }
    
    func startTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(mostrarRutas)), userInfo: nil, repeats: true)
    }
    
    @objc func mostrarRutas()
    {
        var nombre : String
        if contador < nombreRutas.count
        {
            nombre = nombreRutas[contador]
            let color = UIColor(hex: colorRutas[contador])
            rutas.text = nombre
            rutas.textColor = color
            contador += 1
        }
        else
        {
            contador = 0
        }
    }
}
