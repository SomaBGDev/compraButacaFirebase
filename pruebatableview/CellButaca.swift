//
//  CellButaca.swift
//  pruebatableview
//
//  Created by mulder on 13/02/2020.
//  Copyright © 2020 mulder. All rights reserved.
//

import UIKit
import Foundation
import Firebase



class CellButaca: UITableViewCell{
    
    //fila0
    @IBOutlet weak var btCero: UIButton!
    @IBOutlet weak var btUno: UIButton!
    @IBOutlet weak var btDos: UIButton!
    @IBOutlet weak var btTres: UIButton!
    @IBOutlet weak var btCuatro: UIButton!

    //fila1
    @IBOutlet weak var btUnoCero: UIButton!
    @IBOutlet weak var btUnoDos: UIButton!
    @IBOutlet weak var btUnoTres: UIButton!
    @IBOutlet weak var btUnoCuatro: UIButton!
    @IBOutlet weak var btUnoCinco: UIButton!
    
    //fila 2
    @IBOutlet weak var btDosCero: UIButton!
    @IBOutlet weak var btDosUno: UIButton!
    @IBOutlet weak var btDosDos: UIButton!
    @IBOutlet weak var btDosTres: UIButton!
    @IBOutlet weak var btDosCuatro: UIButton!
    
    //fila3
    
    @IBOutlet weak var btTresCero: UIButton!
    
    @IBOutlet weak var btTresUno: UIButton!
    @IBOutlet weak var btTresDos: UIButton!
    @IBOutlet weak var btTresTres: UIButton!
    @IBOutlet weak var btTresCuatro: UIButton!
    
    //fila4
    @IBOutlet weak var btCuatroCero: UIButton!
    
    @IBOutlet weak var btCuatroUno: UIButton!
    
    @IBOutlet weak var btCuatroDos: UIButton!
    @IBOutlet weak var btCuatroTres: UIButton!
    @IBOutlet weak var btCuatroCuatro: UIButton!
    
    var arrayButacas : [Int] = []
    
    //BOTON CONFIRMA COMPRA
    
    @IBOutlet weak var confirmaCompra: UIButton!
    
    var index: Int = 0
    
    
    let ref = Database.database().reference()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //fila 1
        btCero.setImage(UIImage(named: "asiento.png"),for: .normal)
        btDos.setImage(UIImage(named: "asiento.png"),for: .normal)
        btTres.setImage(UIImage(named: "asiento.png"),for: .normal)
        btCuatro.setImage(UIImage(named: "asiento.png"),for: .normal)
        btUno.setImage(UIImage(named: "asiento.png"),for: .normal)
        
        //fila 2
        btUnoCero.setImage(UIImage(named: "asiento.png"),for: .normal)
        btUnoDos.setImage(UIImage(named: "asiento.png"),for: .normal)
        btUnoTres.setImage(UIImage(named: "asiento.png"),for: .normal)
        btUnoCuatro.setImage(UIImage(named: "asiento.png"),for: .normal)
        btUnoCinco.setImage(UIImage(named: "asiento.png"),for: .normal)
        
        
        //fila3
        btDosCero.setImage(UIImage(named: "asiento.png"),for: .normal)
        btDosUno.setImage(UIImage(named: "asiento.png"),for: .normal)
        btDosDos.setImage(UIImage(named: "asiento.png"),for: .normal)
        btDosTres.setImage(UIImage(named: "asiento.png"),for: .normal)
        btDosCuatro.setImage(UIImage(named: "asiento.png"),for: .normal)
        
        //fila4
        btTresCero.setImage(UIImage(named: "asiento.png"),for: .normal)
        btTresUno.setImage(UIImage(named: "asiento.png"),for: .normal)
        btTresDos.setImage(UIImage(named: "asiento.png"),for: .normal)
        btTresTres.setImage(UIImage(named: "asiento.png"),for: .normal)
        btTresCuatro.setImage(UIImage(named: "asiento.png"),for: .normal)

        //fila5
        
        btCuatroCero.setImage(UIImage(named: "asiento.png"),for: .normal)
        btCuatroUno.setImage(UIImage(named: "asiento.png"),for: .normal)
        btCuatroDos.setImage(UIImage(named: "asiento.png"),for: .normal)
        btCuatroTres.setImage(UIImage(named: "asiento.png"),for: .normal)
        btCuatroCuatro.setImage(UIImage(named: "asiento.png"),for: .normal)
        
        
        
        cargaButacas()

    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    @IBAction func pulsaButaca(_ sender: UIButton) {
        sender.cambiaColor()
        
        //añadimos el valor del tag a una lista de butacas seleccionadas
        
        arrayButacas.append(sender.tag)
        

        
    }
    
    func cargaButacas(){
        
        index = ViewController.lista.ind
    
                //referenciar desde la pelicula en concreto
        ref.child("Cartelera").observe( .value) { (snapshot) in
                        //iteramos las butacas
            for c in snapshot.childSnapshot(forPath: String(self.index)).childSnapshot(forPath: "butacas").childSnapshot(forPath: "0").children.allObjects as! [DataSnapshot]{
                            
                            var col: Int
                            col = Int(c.key)!
                            
                            let valorButaca = c.value as! Bool
                            
                            //metemos los valores de la fila correspondiente en el array bidimensional
                            
                            switch (col){
                                        case 0:
                                            if(valorButaca){
                                                self.btCero.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                                
                                                self.btCero.isEnabled = false
                                            }
                                        case 1:
                                            if(valorButaca){
                                                self.btUno.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                                
                                                self.btUno.isEnabled = false
                                            }
                                        case 2:
                                            if(valorButaca){
                                                self.btDos.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                                self.btDos.isEnabled = false
                                            }
                                        case 3:
                                            if(valorButaca){
                                                self.btTres.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                                self.btTres.isEnabled = false
                                            }
                                        case 4:
                                            if(valorButaca){
                                                self.btCuatro.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                                self.btCuatro.isEnabled = false
                                            }
        
                                //fila 1
                                        case 5:
                                            if(valorButaca){
                                                self.btUnoCero.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                                self.btUnoCero.isEnabled = false
                                            }
                                        case 6:
                                            if(valorButaca){
                                                self.btUnoDos.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                                self.btUnoDos.isEnabled = false
                                            }
                                        case 7:
                                            if(valorButaca){
                                                self.btUnoTres.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                                self.btUnoTres.isEnabled = false
                                            }
                                        case 8:
                                            if(valorButaca){
                                                self.btUnoCuatro.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                                self.btUnoCuatro.isEnabled = false
                                            }
                                        case 9:
                                            if(valorButaca){
                                                self.btUnoCinco.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                                self.btUnoCinco.isEnabled = false
                                            }
                                //fila 2
                                case 10:
                                    if(valorButaca){
                                        self.btDosCero.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btDosCero.isEnabled = false
                                    }
                                case 11:
                                    if(valorButaca){
                                        self.btDosUno.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btDosUno.isEnabled = false
                                    }
                                case 12:
                                    if(valorButaca){
                                        self.btDosDos.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btDosDos.isEnabled = false
                                    }
                                case 13:
                                    if(valorButaca){
                                        self.btDosTres.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btDosTres.isEnabled = false
                                    }
                                case 14:
                                    if(valorButaca){
                                        self.btDosCuatro.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btDosCuatro.isEnabled = false
                                    }
                                
                                //fila 3
                                case 15:
                                    if(valorButaca){
                                        self.btTresCero.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btTresCero.isEnabled = false
                                    }
                                case 16:
                                    if(valorButaca){
                                        self.btTresUno.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btTresUno.isEnabled = false
                                    }
                                case 17:
                                    if(valorButaca){
                                        self.btTresDos.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btTresDos.isEnabled = false
                                    }
                                case 18:
                                    if(valorButaca){
                                        self.btTresTres.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btTresTres.isEnabled = false
                                    }
                                case 19:
                                    if(valorButaca){
                                        self.btTresCuatro.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btTresCuatro.isEnabled = false
                                    }
                                
                                //fila 3
                                case 20:
                                    if(valorButaca){
                                        self.btCuatroCero.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btCuatroCero.isEnabled = false
                                    }
                                case 21:
                                    if(valorButaca){
                                        self.btCuatroUno.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btCuatroUno.isEnabled = false
                                    }
                                case 22:
                                    if(valorButaca){
                                        self.btCuatroDos.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btCuatroDos.isEnabled = false
                                    }
                                case 23:
                                    if(valorButaca){
                                        self.btCuatroTres.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btCuatroTres.isEnabled = false
                                    }
                                case 24:
                                    if(valorButaca){
                                        self.btCuatroCuatro.setImage(UIImage(named: "asientoOcu.png"),for: .normal)
                                        self.btCuatroCuatro.isEnabled = false
                                    }
                                
                                

                                    
                            default:
                                print("adios")
                            }
                            

                            
                            
                        }


    }
    
    }
        
    
    @IBAction func insertaBd(_ sender: Any){
    
        for i in arrayButacas{
            ref.child("Cartelera").child(String(self.index)).child("butacas").child("0").child(String(i)).setValue(true)
        }
        
    }
    
}
