

import UIKit
import AVFoundation
//
public class AppsOnAirCoreServices : NSObject, NetworkServiceDelegate {
    
    public static let shared = AppsOnAirCoreServices()
    private var appId: String = ""
    public var isNetworkConnected: Bool = false
    private var window: UIWindow?
    private var errorMessage:String = "AppsOnAir Appid is Not initialized for more details: \n https://documentation.appsonair.com"
    var networkService: NetworkService = ReachabilityNetworkService()

    public func getAppId()->  String{
      // To fetch appId once id set then again not read from Info plist . 
      /*   if self.appId != "" {
            return self.appId
        }else{
            self.appId = Bundle.main.infoDictionary?["appId"] as? String ?? "";
        } */
        self.appId = Bundle.main.infoDictionary?["appId"] as? String ?? "";
        if self.appId == "" {
            #if DEBUG
            print(MyError.runtimeError(errorMessage))
            exit(-1)
            #else
            print(MyError.runtimeError(errorMessage))
            #endif
        }
        else {
            return self.appId
        }
    }
   
    public func isConnectedNetwork()-> Bool{
        return isNetworkConnected
    }
    
    func networkStatusDidChange(status: Bool) {
        isNetworkConnected = status
        networkStatusChangeHandler?(status)
    }
    // Closure type for network status change handler
    public typealias NetworkStatusChangeHandler = (Bool) -> Void
    private var networkStatusChangeHandler: NetworkStatusChangeHandler?
      
      // Method to set the network status change handler
    public func networkStatusListenerHandler(_ handler: @escaping NetworkStatusChangeHandler) {
        networkService.delegate = self
        networkService.startMonitoring()
        networkStatusChangeHandler = handler
      }
    //Throw Error
    enum MyError: Error {
        case runtimeError(String)
    }
}
