import UIKit


// Object-OrientedSwift
//    1.Declare a class ​Animal​ with property ​gender​ and method ​eat()​. The data type ofgender should be enum Gender as below and when you call eat() method, it will printI eat everything!

enum Gender {
    case male
    case female
    case undefined
}

class Animal {
    var gender: Gender!
    func eat() {
        print("eat everything!")
    }
}
var animal = Animal()
animal.eat()


//    2.Declare three classes: ​Elephant​, ​Tiger​, ​Horse​ that inheriting from Animal andoverride the eat method to print what they usually eat.

class Elephant: Animal {
    override func eat() {
        print("eat Tree leaf")
    }
}
var elephant = Elephant()
elephant.eat()

class Tiger: Animal {
    override func eat() {
        print("eat meat")
    }
}
var tiger = Tiger()
tiger.eat()

class Horse: Animal {
    override func eat() {
        print ("eat grass")
    }
}
var horse = Horse()
horse.eat()


//    3.Declare a class ​Zoo​ with a property ​weeklyHot​ which means the most popular one inthe zoo this week. The codes below can’t work correctly, please find what data typeshould A be and solve the problem. Be ​noticed that ​tiger​, ​elephant​, ​horse​ areinstances of class Tiger, Elephant and Horse.

class Zoo {
    var weeklyHot: Animal!
    init(weeklyHot: Animal) {
        
    }
}
let zoo = Zoo(weeklyHot: Tiger())

zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse

//    4.What’s the difference between ​Struct​ and ​Class​ ?
//      Ans: 1.Class 是 Reference type. Struct 是Value type.
//           2.Class 可以繼承，Struct不能
//           3.Class 在宣告屬性時一定要先初始化給初始值或者使用 init() 方法初始化屬性， Struct 在宣告屬性時不需先給初始值，
//           系統會自動生成相同於屬性名稱的參數名稱
//           4.常數建立的Class物件，可以修改物件內的屬性內容， 常數建立的Struct的物件則不能修改物件內的屬性內容
//           5.Class內宣告的方法可以直接存取物件屬性，Struct內宣告的方法若要存取屬性則必須在方法前面加上 mutating 才可以存取
//
//    5.What’s the difference between ​instance method​ and ​type method​ ?
//
//      Ans: 1.instance method 需要建立一個物件後才能存取宣告的方法及屬性。 type method 需要在宣告屬性或方法時前面加上 static，系統將會認為是型別方法或屬性。
//           2.instance method 可以被繼承覆寫， type method 加上static 不能被繼承覆寫 除非前面換成 class 宣告才能被繼承覆寫
//
//    6.What does ​Initilizer​ do in class and struct ?
//      Ans: 1.class: 在class裡宣告屬性必須先初始化，初始化有三種方式:
//              1.宣告時給定初始值  2.將屬性設定為optional  3.使用init() 方法初始化
//              ex: init() {                    init(name: String, age: Int) {
//                  var name = "Neal"               self.name = name
//                  var age = 20                    self.age = age
//                }                             }
//              (使用init()屬性初始化)             (使用init()傳遞參數初始化)
//          2. struct: 在struct宣告屬性後不需先給定初始值，struct 有memberwish initializer，在宣告屬性時就已經完成初始化，
//                     並能夠依照宣告的屬性名稱作為自動生成的參數名稱，但若自行設定init()方法，memberwish initializer 將失去自動生成功能
//              總結： init()在class 及srtuct裡可以幫助屬性完成初始化也可設定傳遞參數
//    7.What does ​self​ mean in an instance method and a type method ?
//       Ans: 在instance method 中，若存取屬性時前面加上self 代表要存取物件自己的屬性的意思，存取屬性時self可加可不加，
//            如果在物件中，屬性名稱與方法參數名稱一樣時，若要在方法中存取自身屬性的話必須要加上self，才能區分出是屬性還是參數。
//            在type method中，若要存取其他型別方法時可上加self，因為此時的self代表的是型別本身
//
//    8.What’s the difference between ​reference type​ and ​value type​ ?
//       Ans:  value type:
//                  當設定value type的變數或常數時，若將一變數等於另一變數的話，將會把變數內容複製到另一變數的記憶體空間，
//                  等同是兩個記憶體空間，之後兩變數若各自修改內容則互不影響
//
//             reference type:
//                  當設定reference type的變數或常數，若將一變數等於另一變數的話，它們將會儲存在同一個記憶體，兩個變數都指向同一個資料，
//                  若修改其中一個變數內容，另一個也跟著修改
//
//Enumerations and Optionals in Swift
//
//    1.There are several gasoline types, 92, 95, 98, and diesel that we can use enum tomodel them.
//
//        ●Please create enum named ​Gasoline​ to model gasoline.
//      Ans:  enum Gasoline {
//             case gasoline92
//             case gasoline95
//             case gasoline98
//        }
//        ●Every kind of gasoline has its price. Please create a method named ​getPricein Gasoline enum that will return different price depending on differentgasoline.
//
//     Ans:  extension Gasoline {
//            func getPrice() {
//                if self == .gasoline92 {
//                    print(92)
//                }else if self == .gasoline95 {
//                    print(95)
//                }else {
//                    print(98)
//                }
//            }
//        }
//
//        ●Please establish ​raw values​ for ​Gasoline​. The data type of raw value shouldbe String. For example, ​Gasoline.oil92.rawValue​ should be “92”.
//
//     Ans:   enum Gasoline: String {
//            case gasoline92 = "92"
//            case gasoline95 = "95"
//            case gasoline98 = "98"
//          }
//
//        ●Please explain what is enum ​associate value​ and how it works
//
//     Ans: associated value是在設定enum成員時可以加入自定義的型別相關值。
//          可以在enum宣告的成員後面加上()，在()內設定參數名稱及其型別(或只設定型別)，之後再存取enum成員時可傳入參數值，
//          也可以搭配switch case 使用(let 常數名稱)或(var 變數名稱)，取出相關值作使用
//
//    2.Optional is a very special data type in Swift. Take ​​var​ a: ​Int​? = ​10​​​for example, thevalue of ​a​ will be ​nil​ or ​Int​. You should learn how to deal with optional data type.
//
//        ●People would like to have pets, but not everyone could have one. Declare aclass ​Pet​ with ​name​ property and a class ​People​ with ​pet​ property which willstore a Pet instance or nil​. Please try to figure out what data type is suitablefor these properties in Pet and People.
//      Ans:  class Pet {           class People {
//          var name: String?           var pet: Pet?
//        }                         }
//
//        ●Please create a People instance and use ​guard let​ to unwrap the ​petproperty.
//      Ans:  var people = People()
//              guard let peoplePet = people.pet else{return}
//        ●Please create another People instance and use ​if let​ to unwrap the ​petproperty
//      Ans: var people = People()
//           if let peoplePet = people.pet {
//                  print(peoplePet)
//               }
//
// Protocol in Swift
//
//    1.Declare a struct ​Person​ with a ​name​ property type String and a protocol namePoliceMan​. There is only one method ​arrestCriminals​ with no argument and returnvoid in the protocol.
//
//      Ans: struct Person {        protocol PoliceMan {
//          var name: String           func arrestCriminals() -> Void
//        }                         }
//
//    2.Make struct ​Person​ conformto ​PoliceMan​ protocol.
//      Ans: struct Person: PoliceMan {
//          var name: String
//          func arrestCriminals() {
//            }
//        }
//    3.Declare a protocol ​ToolMan​ with a method ​fixComputer​ that no argument and returnvoid.
//
//      Ans:  protocol ToolMan {
//                func fixComputer() -> Void
//              }
//    4.Add a property ​toolMan​ to the struct Person with data type ​ToolMan​.
//      Ans:  struct Person: PoliceMan {
//            var name: String
//            var toolMan: ToolMan
//            func arrestCriminals() {
//             }
//        }
//
//    5.Declare a struct named ​Engineer​ that conforming to the ​ToolMan​ protocol.
//      Ans:  struct Engineer: ToolMan{
//               func fixComputer() {
//                    }
//                }
//
//    6.Create a Person instance with the name Steven and also create the relative data youneed to declare this instance.
//      Ans:  var engineer = Engineer()
//            var steven = Person(name: "Neal", toolMan: engineer)
//
// Error Handling in Swif
//
//    enum​ GuessNumberGameError {
//        case​ wrongNumber
//    }
//
//    class​ GuessNumerGame {
//        var​ targetNumber = ​10
//        func​ guess(number: ​Int​) ​throws​ {
// ​       ​  guard​ number == ​targetNumber​ ​else​ {
//            throw​ ​GuessNumberGameError​.wrongNumber
//        }
//        print​(​"Guess the right number: ​\​(​targetNumber​)"​)
//    }
//
// }
//    Read the code above first and paste it in the playground file, there is an error inside thecode.Please solve the error ​by adding additional code​ in the file. Do not remove or modifythe code above. Call ​guess(number:)​ and pass 20 as the argument after you fix theproblem.
//
//      Ans:  enum GuessNumberGameError: Error {
//                  case wrongNumber
//                }
//
//            class GuessNumberGame {
//              var targetNumber = 10
//              func guess(number: Int) throws {
//              guard number == targetNumber else {
//              throw GuessNumberGameError.wrongNumber
//             }
//              print("Guess the right number: \(targetNumber)")
//          }
//      }
//
//              var guess = GuessNumberGame()
//              try guess.guess(number: 20)
//
// Simple App
//
//    Please implement the app. The image below is app’s design.(Size measured in pixel)
//
// UI Requirement:
//
//    Label on the top:
//    Top: 100, Leading: 40, Font size: 16, Font Color: White
//
//    Label in the middle:
//    Top: 100, Leading: 40, Trailing: 40, Font size: 16, Font Color: White
//
//    Button:
//    Bottom: 50, Leading: 40, Trailing: 40, Font size: 16, Font Color: White
//
// Functional Requirement:
//
//    Each time user hint the button, the background color and text should change randomly.We give the text below. There are 7 sentances in the array. You can choose 7 kinds ofcolor to cooperate with it. For example, you can take the colors of rainbow as your colorset.
//
//
// Hint:
//    1.Hex color in swift
//    2.Random number in swift
//    3.IBAction, IBOutlet
//
//    let​ text = [
//        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus."​,
//        ​​"Contrary to popular belief, Lorem Ipsum is not simply random text."​,
//        ​​"Richard McClintock, a Latin professor at Hampden-Sydney College in "​,
//        ​​"looked up one of the more obscure Latin words, consectetur"​,
//        ​​"from a Lorem Ipsum passage, and going through the cites of the word"​,
//        ​​"This book is a treatise on the theory of ethics, very popular during the."​,
//        ​​"The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.."​,]

