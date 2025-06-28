import Foundation

struct Constants{
    
    struct Urls{
        static let asaHome = "https://www.gob.mx/asa"
        static let tariffs = ""
    }
    
    struct moduleName{
        static let home = "Inicio"
        static let services = "Servicios"
        static let contact = "Contacto"
        static let about = "Nosotros"
        static let directory = "Directorio"
        static let tariffs = "Tarifas"
        static let ciiasa = "CIIASA"
        static let servAerportes = "Serv. Aeroportuarios"
        static let servCombustibles = "Serv. de Combustible"
        static let servConsultoria = "Consultoria"
    }
    
    struct Titles{
        static let error = "Error"
        static let alert = "Hola!"
        static let warning = "Advertencia"
        static let emailNotSetup = "Correo no disponible"
        static let ok = "Aceptar"
        static let pdfNotFound = "No se encontró el archivo PDF"
        static let cancel = "Cancelar"
        static let connectionError = "No se pudo conectar"
    }
    
    struct PDFS{
        static let privacidad = "privacidad.pdf"
        static let aeropuertos = "aeropuertos.pdf"
        static let ciiasa_renta = "ciiasa_renta.pdf"
        static let combustibles = "combustibles.pdf"
        static let consultoria = "consultoria.pdf"
        static let terminos = "terminos.pdf"
    }
    
    struct PDFViewController{
        static let privacidad = "Aviso de privacidad"
        static let aeropuertos = "Servicios Aeroportunarios"
        static let ciiasa_renta = "Renta de aulas"
        static let combustibles = "Combustibles"
        static let consultoria = "Consult., asesoria y sust."
        static let terminos = "Terminos y condiciones"
    }
    
    struct Email{
        static let destination = "ejemplo@ejemplo.com"
        static let subject = "Prueba de envio de correo"
        static let sendOk = "Correo enviado"
        static let sendError = "No se pudo enviar el correo. Inténtelo más tarde."
        static let notEmail = "Configura una cuenta de correo en tu dispositivo."
        static func message(_ name:String,_ phone:String,_ email:String,_ body:String) -> String{
            return "Se solicita el apoyo para: \(name)\n\nTeléfono: \(phone)\n\nEmail: \(email)\n\nMensaje: \(body)"
        }
    }
    
    struct ContactView{
        static let messagePlaceholder = "Escribe aquí tu mensaje..."
        static let invalideEmail = "Favor de ingresar un email valido por favor."
        static let invalidePhone = "Ingresa un número de contacto valido por favor."
        static let isEmptyMessage = "Favor de llenar todos los campos."
        
    }
    
    struct DirectoryView{
        static let phone = "1234567891"
        static let callError = "No se puede realizar la llamada desde este dispositivo."
    }
    
}

