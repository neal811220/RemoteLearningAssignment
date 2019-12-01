import UIKit

//let oddNumber = {
//    (number: Int) -> Bool in
//    if number % 2 == 0 {
//        return false
//    }else{
//        return true
//    }
//}
//
//oddNumber(9)
//oddNumber(10)
let url = URL(string: "http://httpbin.org/post")!
var request = URLRequest(url: url)

request.httpMethod = "Get"
