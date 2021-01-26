//
//  PacienteViewController.swift
//  ProyectoFinal
//
//  Created by Marco Castañeda on 18/01/21.
//

import UIKit

class PacienteViewController: UIViewController {
    
    @IBOutlet weak var labelPaciente: UILabel!
    var idPaciente: String = ""
    var nombre : String = ""
    var apellido_p : String = ""
    var apellido_m : String = ""
    var exp : String = "" 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelPaciente.text =  "Paciente: \(nombre) \(apellido_p) \(apellido_m)"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDatos(_ sender: UIButton) {
        
    }
    @IBAction func btnNotas(_ sender: UIButton) {
        
    }
    @IBAction func btnCitas(_ sender: UIButton) {
        
    }
    @IBAction func btnPedidos(_ sender: UIButton) {
        
    }
    @IBAction func btnLinea(_ sender: UIButton) {
        
    }
    @IBAction func btnSucursal(_ sender: UIButton) {
        
    }
}
