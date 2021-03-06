import Alamofire

class AlamofireLoginService: RemoteLoginService {

    func get(url: String, credentials: Credentials, callback: @escaping ((Any?) -> Void)) {
        let parameters = [
            "username": credentials.username,
            "password": credentials.password
        ]

        Alamofire.request(url, method: .post, parameters: parameters)
            .validate()
            .responseJSON { callback($0.data) }
    }
}
