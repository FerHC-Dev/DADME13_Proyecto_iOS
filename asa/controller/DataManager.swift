import Foundation
import CoreData

class DataManager : NSObject {
    
    func obtenResponsables() {
        if let laURL = URL(string: "https://ruta/ejemplo.json") {
            let sesion = URLSession(configuration: .default)
            let tarea = sesion.dataTask(with:URLRequest(url:laURL)) { data, response, error in
                if error != nil {
                    print ("no se pudo descargar el feed de responsables \(error?.localizedDescription ?? "")")
                    return
                }
                do {
                    let tmp = try JSONDecoder().decode([Notice].self, from:data!)
                }
                catch { print ("no se obtuvo un JSON en la respuesta") }
            }
            tarea.resume()
        }
    }
}
