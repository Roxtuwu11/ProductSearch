//
//  APIClient.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 11/04/25.
//

import Foundation
import Alamofire

public enum ErrorServices__s: Error {
    case NullResponseError
    case NoDataError
    case ErrorUnknown
    case ErrorForReason(reason:String)
    case ErrorGetDeviceID
    case InvalidateSession
    case ErrorTimeOut
    case ErrorNotConnectedToInternet
    case ErrorCommunications
    case ErrorInvalidModule(id: String)
}

//extension ErrorServices__s: LocalizedError {
//    public var errorDescription: String? {
//        switch self {
//        case .NullResponseError:
//            return SharedSettingsConstants.LocalizableString.ErrorNullResponse
//        case .NoDataError:
//            return SharedSettingsConstants.LocalizableString.ErrorEmptyData
//        case .ErrorUnknown:
//            return SharedSettingsConstants.LocalizableString.ErrorUnknown
//        case .ErrorForReason(let reason):
//            return reason
//        case .ErrorGetDeviceID:
//            return SharedSettingsConstants.LocalizableString.ErrorGetDeviceID
//        case .InvalidateSession:
//            return SharedSettingsConstants.LocalizableString.InvalidateSession
//        case .ErrorTimeOut:
//            return SharedSettingsConstants.LocalizableString.ErrorTimeOut
//        case .ErrorNotConnectedToInternet:
//            return SharedSettingsConstants.LocalizableString.ErrorNotConnectedToInternet
//        case .ErrorCommunications:
//            return SharedSettingsConstants.LocalizableString.ErrorCommunications
//        case .ErrorInvalidModule(let id):
//            return SharedSettingsConstants.LocalizableString.ErrorInvalidModule + id
//        }
//    }
//}



class APIClient {
    static let shared = APIClient()
    var sessionManager: Session
    public init() {
        
      
        let configuration = APIClient.getAlamofireConfigure()
        
        self.sessionManager = Alamofire.Session(configuration: configuration)
    
    }
    private static func getAlamofireConfigure() -> URLSessionConfiguration{
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [AnyHashable : Any]()
        configuration.httpAdditionalHeaders!["Content-Type"] = "application/json"
        
    
        
        return configuration
    }
    public func getRequest<T,D>(url: URL,
                                    request: T?,
                                    responseType: D.Type,
                                    onSuccess success:@escaping ((_ result:D?)-> Void),
                                onFailure failure:@escaping ((_ error:Error)-> Void)) where D: Decodable, T: Encodable {
            let queue = DispatchQueue(label: "ProductServices",
                                      qos: .background,
                                      attributes: [.concurrent])
        queue.async {
            
            
            var urlToSend = url.absoluteString
            var requestUrl = ""
            
            if let req = request
            {
                let params = req.dictionary
                //    fecha=01/01/2023&pais=MEXICO
                
                params!.forEach{ info in
                    requestUrl = requestUrl + "\(info.key)" + "=" + "\(info.value)&"
                    
                }
                requestUrl.removeLast()
                
            }
            urlToSend = urlToSend + requestUrl
            var urlRequest = URLRequest(url: URL(string: urlToSend)!)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            urlRequest.setValue("APP_USR-3980890892821190-041316-6a135b7bcd33f714823d5ef6c37ac6b5-290788001", forHTTPHeaderField: "Authorization")
            
            
        
                self.sessionManager.request(urlRequest).response { (Response) in
                 
                    guard let response = Response.response else{
                        if let error = Response.error{
                            let errorDomain = error as NSError
                            guard errorDomain.code != -999 else{
                                ///   Analytics.logEvent(Events.ManInTheMiddleDetected, parameters: nil)
                                exit(0)
                            }
                            guard errorDomain.code == CFNetworkErrors.cfurlErrorTimedOut.rawValue else{
                                failure(ErrorServices__s.ErrorTimeOut)
                                return
                            }
                            guard errorDomain.code == CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue else{
                                failure(ErrorServices__s.ErrorNotConnectedToInternet)
                                return
                            }
                            failure(ErrorServices__s.ErrorCommunications)
                        }else{
                            failure(ErrorServices__s.NullResponseError)
                        }
                        return
                    }
                    if !( 200...299 ~= response.statusCode || response.statusCode == 400 || response.statusCode == 409) {
                        if let error = Response.error {
                            failure(error)
                        } else if let dataError = Response.data {
                            let decoder = JSONDecoder()
                            do{
                                let errorEntity = try decoder.decode(responseType,
                                                                     from: dataError)
                          
                            
                             
                             
                               
                            } catch {
                                failure(ErrorServices__s.ErrorCommunications)
                            }
                            return
                        }
                    }
                    let decoder = JSONDecoder()
                    do{
                        var dataToDecode:Data?
                        guard let dataResponse = Response.data else {
                            failure(ErrorServices__s.NoDataError)
                            return
                        }
                 
                    
                        dataToDecode = dataResponse
                     
                            
                        guard let NormalJsonData = dataToDecode else{
                            failure(ErrorServices__s.ErrorForReason(reason:  "Error al decodificar"))
                            return
                        }
                        
                        let genericResponse = try decoder.decode(responseType,
                                                                 from: NormalJsonData)
               
                        success(genericResponse)
                  
                    }
                    catch {
                        let err = error as NSError
                        failure(err)
                    }
                }
    }
   

}

}
extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
