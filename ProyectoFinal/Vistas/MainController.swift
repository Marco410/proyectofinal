//
//  MainController.swift
//  ProyectoFinal
//
//  Created by Marco Castañeda on 11/01/21.
//

import UIKit
import FirebaseAuth

class MainController: UIViewController {
    
    @IBOutlet weak var txtExp: UITextField!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPaciente: UILabel!
    var email : String? = ""
    var idPaciente : String = ""
    var nombre : String =  ""
    var apellido_p :String = ""
    var apellido_m : String = ""
    var exp : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelEmail.text = "Bienvenido: \(FirebaseAuth.Auth.auth().currentUser?.email! ?? "Sin Inicar Sesion")"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCerrarSesion(_ sender: UIBarButtonItem) {
        do{
            try FirebaseAuth.Auth.auth().signOut()
            self.transitiontoLogin()
            print("Sesion cerrada correctamente")
        }catch {
            
            print("Ocurrio un error")
            
        }
    }
    
    func transitiontoLogin(){
        let loginView = storyboard?.instantiateViewController(identifier: "loginView") as? ViewController
        
        view.window?.rootViewController = loginView
        view.window?.makeKeyAndVisible()
    }
    @IBAction func btnBuscar(_ sender: UIButton) {
        
        let urlString = "https://megasalud.com.mx/sistema/pacientes/buscar/MX005122P2?token=M2021int01kx"
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!){ (data,response,error ) in

            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do
                {
                let paciente = try decoder.decode(Datamega.self, from: data!)
                    self.idPaciente = paciente.data[0].id
                    self.nombre = paciente.data[0].nombre
                    self.apellido_p = paciente.data[0].apellido_p
                    self.apellido_m = paciente.data[0].apellido_m
                    self.exp = paciente.data[0].clave_bancaria
                }
                catch {
                    print("Error en el JSON Parsin\(error)")
                }
            }
        }
        dataTask.resume()
        labelPaciente.text = "Encontramos a:\n \(nombre) \(apellido_p) \(apellido_m) \n ID:\(idPaciente) Expediente: \(exp) "
        
    }
    
    @IBAction func btnContinuar(_ sender: UIButton) {
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "continue" {
            let destino = segue.destination as! PacienteViewController
            
            destino.idPaciente = idPaciente
            destino.nombre = nombre
            destino.apellido_p = apellido_p
            destino.apellido_m = apellido_m
        }
    }
    
    

}
