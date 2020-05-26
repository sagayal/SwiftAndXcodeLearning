import UIKit

/// https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/LexicalStructure.html

/// Declaration Keywords
/// associatedtype: Gives a placeholder name to a type that is used as part of a protocol. The type is not specified until the protocol is adopted.
protocol Entertainment
{
    associatedtype MediaType
}
class Dance : Entertainment
{
    typealias MediaType = String //Could be any type to fit the need
}
/// class : A general-purpose, flexible construct that become the building blocks of your program’s code. Similar to struct, except that:
/// Inheritance enables one class to inherit the characteristics of another.
/// Type casting enables you to check and interpret the type of a class instance at runtime.
/// Deinitializers enable an instance of a class to free up any resources it has assigned.
/// Reference counting allows more than one reference to a class instance.

///. deinit: Called immediately before a class instance is deallocated.

class Person
{
    var name:String
    var age:Int
    var gender:String

    init() {
        name = ""
        age = 0
        gender = ""
    }

    deinit
    {
        //Deallocated from the heap, tear down things here
    }
}

/// enum : Defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code. In Swift, they are first-class types and can use features typically supported only by classes in other languages.

enum Gender
{
    case male
    case female
}

/// extension : Lets one add new functionality to an existing class, structure, enumeration, or protocol type.
extension Person
{
    func printInfo()
    {
        print("My name is \(name), I'm \(age) years old and I'm a \(gender).")
    }
}

/// fileprivate : An access control construct that restricts scope to only the defining source file.
class FilePrivatePerson
{
    fileprivate var jobTitle:String = ""
}

//This wouldn't compile in a new file
extension FilePrivatePerson
{
    func printJobTitle()
    {
        print("My job is \(jobTitle)") // 'jobTitle' is inaccessible due to 'fileprivate' protection level
    }
}

/// func : Self-contained chunks of code that perform a specific task.
func addNumbers(num1:Int, num2:Int) -> Int
{
    return num1+num2
}

/// import : Exposes a framework or application that is built and shipped as a single unit into the given binary.
import UIKit
//All of UIKit's code is now available

/// init : The process of preparing an instance of a class, structure, or enumeration for use.
class FirstPerson
{
    init()
    {
        //Set default values, prep for use, etc.
    }
}

/// inout : A value that is passed to a function and modified by it, and is passed back out of the function to replace the original value. Applies to both reference and value types.
func dangerousOp(_ error:inout NSError?)
{
    error = NSError(domain: "", code: 0, userInfo: ["":""])
}
var potentialError:NSError?
dangerousOp(&potentialError)
//Now potentialError is no longer nil and initialized

/// internal : An access control construct that allows entities to be used within any source file from its defining module, but not in any source file outside of it.
class InternalPerson
{
    internal var jobTitle:String = ""
}
let aPerson = InternalPerson()
aPerson.jobTitle = "This can set anywhere in the application"

/// let : Defines a variable as immutable.
let constantString = "This cannot be mutated going forward"

/// open : An access control construct that allows objects to be both accessible and subclassable outside of its defining module. For members, they are both accessible and overridable outside of its defining module.
//open var openName:String? //This can be overriden and accessible inside and outside of the app. Writing frameworks is a common use case for this access modifier

/// operator : A special symbol or phrase that you use to check, change, or combine values.
//The "-" unary operator decrements a single target
let oneNumber = 5
let anotherNumber = -oneNumber //anotherFoo now equals -5

//The "+" binary operator combines two values
let box = 5 + 3

let didPassCheckOne = false
let didPassCheckTwo = true
//The "&&" logical operator combines two boolean values
if didPassCheckOne && didPassCheckTwo {

}

let age = 35
//The ternary conditional operator considers three values
let isLegalDrinkingAgeInUS:Bool = age >= 21 ? true : false

/// private : An access control construct that allows entities to be scoped to its defining declaration.
class PrivatePerson
{
    private var jobTitle:String = ""
}
extension PrivatePerson
{
    //This won't compile, jobTitle is only available inside of PrivatePerson
    func printJobTitle()
    {
        print("My job is \(jobTitle)")
    }
}

/// protocol : Defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.
protocol Blog
{
    var wordCount:Int { get set }
    func printReaderStats()
}
class TTIDGPost : Blog
{
    var wordCount:Int

    init(wordCount:Int)
    {
        self.wordCount = wordCount
    }
    func printReaderStats()
    {
        //Print out some stats on the post
    }
}

/// public : An access control construct that allows objects to be both accessible and subclassable but only inside of its defining module. For members, they are both accessible and overridable inside of its defining module.
public var foo:String? //This can be overriden and accessible anywhere inside of the app, but not outside of it.

/// static : Defines methods that are called on the type itself. Also used to define static members.
class StaticPerson
{
    var jobTitle:String?
    static func assignRandomName(_ aPerson:StaticPerson)
    {
        aPerson.jobTitle = "Some random job"
    }
}
let somePerson = StaticPerson()
StaticPerson.assignRandomName(somePerson)
//somePerson.jobTitle is now "Some random job"

/// struct : A general-purpose, flexible construct that become the building blocks of your program’s code and can also provide member wise initializers. Unlike a class, they are always copied when they are passed around in your code and as such, do not use automatic reference counting. In addition, they do not
/// Use inheritance.
/// Allow type casting at runtime.
/// Have, or use, deinitializers.
struct StructuralPerson
{
    var name:String
    var age:Int
    var gender:String
}

/// subscript : A shortcut for accessing the member elements of a collection, list, or sequence.
var postMetrics = ["Likes":422, "ReadPercentage":0.58, "Views":3409]
let postLikes = postMetrics["Likes"]

/// typealias : Introduces a named alias of an existing type into your program.
typealias JSONDictionary = [String: AnyObject]
func parseJSON(_ deserializedData:JSONDictionary){}

/// var : Defines a variable as mutable.
var mutableString = ""
mutableString = "Mutated"


/// Keywords in Statements

/// break : Ends program execution of a loop, an if statement, or a switch statement.
for idx in 0...3
{
    if idx % 2 == 0
    {
        //Exits the loop on the first even value
        break
    }
}

/// case : A statement that is evaluated and then compared with the provided patterns inside a switch case.
let switchBox = 1
switch switchBox
{
case 0:
    print("Box equals 0")
case 1:
    print("Box equals 1")
default:
    print("Box doesn't equal 0 or 1")
}

/// continue : Ends program execution of the current iteration of a loop statement but does not stop execution of the loop statement.
for idx in 0...3
{
    if idx % 2 == 0
    {
        //Immediately begins the next iteration of the loop
        continue
    }

    print("This code never fires on even numbers")
}

/// default : Used to cover any values that are not addressed explicitly in a case.
let defaultBox = 1
switch defaultBox
{
case 0:
    print("Box equals 0")
case 1:
    print("Box equals 1")
default:
    print("Covers any scenario that doesn't get addressed above.")
}

/// defer : Used for executing code just before transferring program control outside of the scope that it appears in.
func cleanUpIO()
{
    defer
    {
        print("This is called right before exiting scope")
    }
    print("This is called first")
    //Close out file streams,etc.
}

//do : Begins a statement to handle errors by running a block of code.

struct testData: Decodable {
  var title: String?
}

do {
  try JSONDecoder().decode(testData.self, from: Data(count: 10))
} catch _ as NSError {
  // handle error
}


/// else : Used in conjunction with an if statement, it executes one part of code when the condition is true and another part of code when the same condition is false.
let val = 5
if val > 1
{
    print("val is greater than 1")
}
else
{
    print("val is not greater than 1")
}

/// fallthrough : Explicitly allows execution to continue from one case to the next in a switch statement.
let fallthroughBox = 1
switch fallthroughBox
{
case 0:
    print("Box equals 0")
    fallthrough
case 1:
    print("Box equals 0 or 1")
default:
    print("Box doesn't equal 0 or 1")
}

/// for : Iterates over a sequence, such as ranges of numbers, items in an array, or characters in a string. *pairs with the in keyword
for _ in 0..<3 { print ("This prints 3 times") }

/// guard : Used to transfer program control out of a scope if one or more conditions aren’t met, while also unwrapping any optional values provided.
private func printRecordFromLastName(userLastName: String?)
{
    guard let name = userLastName, userLastName != "Null" else
    {
        //Sorry Bill Null, find a new job
        return
    }
    //Party on
    print("Lets welcome \(name)")
}

/// if : Used for executing code based on the evaluation of one or more conditions.
if 1 < 2
{
    print("This will never execute")
}

/// in : Iterates over a sequence, such as ranges of numbers, items in an array, or characters in a string. *pairs with the for keyword
for _ in 0..<3 { print ("This prints 3 times") }

/// repeat : Performs a single pass through the loop block first, before considering the loop’s condition.
repeat
{
    print("Always executes at least once before the condition is considered")
}
while 1 > 2

/// return : Immediately breaks control flow out of the current context, and additionally returns a value supplied after it if one is present.
func doNothing()
{
    return //Immediately leaves the context
//    code below this will not be executed
//    let anInt = 0
//    print("This never prints \(anInt)")
}
//and
func returnName() -> String?
{
    return "xyz" //Returns the value of userName
}

/// switch : Considers a value and compares it against several possible matching patterns. It then executes an appropriate block of code, based on the first pattern that matches successfully.
let checkBox = 1
switch checkBox
{
case 0:
    print("Box equals 0")
    fallthrough
case 1:
    print("Box equals 0 or 1")
default:
    print("Box doesn't equal 0 or 1")
}

/// where : Requires that an associated type must conform to a certain protocol, or that certain type parameters and associated types must be the same. It’s also used to provide an additional condition within a pattern in cases that are considered to be matched to the control expression. *The where clause can be used in several contexts, these are examples of their primary use as a generic where clause and pattern matching.

protocol Nameable
{
    var name:String {get set}
}
func createdFormattedName<T:Nameable>(_ namedEntity:T) -> String where T:Equatable
{
    //Only entities that conform to Nameable which also conform to equatable can call this function
    return "This things name is " + namedEntity.name
}
//and
for i in 0 ... 3 where i % 2 == 0
{
    print(i) //Prints 0 and 2
}

/// while : Performs a set of statements until a condition becomes false.
let dec = 12
var startMonth = 1
while startMonth < dec
{
    print("Keeps going until the foo == bar")
    startMonth += 1
}

/// Expressions and Types Keywords

/// Any : Can be used to represent an instance of any type at all, including function types.
var anythingArrayOne = [Any]()
anythingArrayOne.append("Any Swift type can be added")
anythingArrayOne.append(0)
anythingArrayOne.append({(foo: String) -> String in "Passed in \(foo)"})

//// as : A type cast operator used to attempt to cast a value to a different, or an expected and specific, type.
var anythingArrayTwo = [Any]()
anythingArrayTwo.append("Any Swift type can be added")
anythingArrayTwo.append(0)
anythingArrayTwo.append({(foo: String) -> String in "Passed in \(foo)" })
let intInstance = anythingArrayTwo[1] as? Int
//or
var anythingArrayThree = [Any]()
anythingArrayThree.append("Any Swift type can be added")
anythingArrayThree.append(0)
anythingArrayThree.append({(foo: String) -> String in "Passed in \(foo)" })
for thing in anythingArrayThree
{
    switch thing
    {
    case 0 as Int:
        print("It's zero and an Int type")
    case let someInt as Int:
        print("It's an Int that's not zero but \(someInt)")
    default:
        print("Who knows what it is")
    }
}

/// catch : If an error is thrown by code in a do clause, it’s matched against a catch clause to determine how the error will be handled.
if let titleDate = Data(base64Encoded: "title") {
    do {
        try JSONDecoder().decode(testData.self, from:titleDate)
    } catch let error as NSError {
      // handle error
        print(error)
    }
}


/// false : One of two constant values Swift used to represent the logical type, Bool, as not being true.
let alwaysCheckFalse = false
let alwaysCheckTrue = true
if alwaysCheckFalse { print("Won't print, alwaysFalse is false 😉")}

/// is : A type check operator used to determine whether an instance is of a certain subclass type.
class ProfessionalPerson {}
class ProgrammerProfessional : ProfessionalPerson {}
class Nurse : ProfessionalPerson {}
let people = [ProgrammerProfessional(), Nurse()]
for aPerson in people
{
    if aPerson is ProgrammerProfessional
    {
        print("This person is a dev")
    }
    else if aPerson is Nurse
    {
        print("This person is a nurse")
    }
}

/// nil : Represents a stateless value for any type in Swift. *Different from Objective-C’s nil, which is a pointer to a nonexistent object.
class EmptyPerson{}
struct Place{}
//Literally any Swift type or instance can be nil
var statelessPerson:EmptyPerson? = nil
var statelessPlace:Place? = nil
var statelessInt:Int? = nil
var statelessString:String? = nil

/// rethrows : Indicates that the function throws an error only if one of its function parameters throws an error.
func networkCall(onComplete:() throws -> Void) rethrows
{
    do
    {
        try onComplete()
    }
    catch let error as NSError
    {
        throw error
    }
}

/// super : Exposes access to the superclass version of a method, property, or subscript.
class SuperPerson
{
    var name: String?

    func printName()
    {
        print("Printing a name. ")
    }
    init(name: String) {
        self.name = name
    }
}
class Programmer : SuperPerson
{
    override func printName()
    {
        super.printName()
        print("Hello World!")
    }
    override init(name: String) {
        super.init(name: name)
    }
}
let aDev = Programmer(name: "Martin")
aDev.printName() //"Printing a name. Hello World!"

/// self : An implicit property that every instance of a type has, which is exactly equivalent to the instance itself. Also very useful for distinguishing between a parameter name and a property name.
class SelfishPerson
{
    func printSelf()
    {
        print("This is me: \(self)")
    }
}
let aSelfishPerson = SelfishPerson()
aSelfishPerson.printSelf() //"This is me: Person"

/// Self : In protocols, represents the type that will eventually conform to the given protocol.
protocol Printable
{
    func printTypeTwice(otherMe:Self)
}
struct PrintableStructure : Printable
{
    func printTypeTwice(otherMe: PrintableStructure)
    {
        print("I am me plus \(otherMe)")
    }
}
let aPrintableStructure = PrintableStructure()
let anotherPrintableStructure = PrintableStructure()
aPrintableStructure.printTypeTwice(otherMe: anotherPrintableStructure) //I am me plus PrintableStructure()

/// throw : Used to explicitly throw an error from the current context.
enum WeekendError: Error
{
    case Overtime
    case WorkAllWeekend
}
func workOvertime () throws
{
    throw WeekendError.Overtime
}

/// throws : Indicates that a function, method, or initializer can potentially throw an error.
enum WorkError: Error
{
    case Overtime
    case WorkAllWeekend
}
func workingOvertime() throws
{
    throw WorkError.Overtime
}

func notWorkingOvertime() throws
{
}

//"throws" indicates in the function's signature that I need use try, try? or try!
try? workingOvertime()

/// true One of two constant values Swift used to represent the logical type, Bool, as being true.
let alwaysFalse = false
let alwaysTrue = true
if alwaysTrue { print("Always prints")}

/// try : Indicates that the following function could potentially throw an error. Can be used three different ways: try, try? and try!.
try notWorkingOvertime() //Handle it, or propagate it
let anotherWorkingOvertime: () = try! notWorkingOvertime() //This could trap
if let optionalWorkingOvertime = try? notWorkingOvertime() //Unwrap the optional
{
    print("unwrapped \(optionalWorkingOvertime)")
}

/// Keywords Using Patterns

/// _ : A wilcard pattern that matches and ignores any value.
for _ in 0..<3
{
    print("Just loop 3 times, index has no meaning")
}
//another use
let _ = String() //Ignore value or unused variable

/// Keywords Using #

/// #available : A condition of an if, while, and guard statement to query the availability of APIs at runtime, based on specified platforms arguments.
if #available(iOS 10, *)
{
    print("iOS 10 APIs are available")
}

/// #colorLiteral : A playground literal which brings up an interactive color picker to assign to a variable.
let aColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1) // #colorLiteral Brings up color picker

/// #column : A special literal expression that returns the column number in which it begins.
class PersonInfo
{
    func printInfo()
    {
        print("Some person info - on column \(#column)")
    }

    init() {
    }
}
let aColumnPerson = PersonInfo()
aColumnPerson.printInfo() //Some person info - on column 53

/// #else : A conditional compiler control statement that allows the program to conditionally compile some given code. Used in conjunction with an #if statement, it executes one part of code when the condition is true and another part of code when the same condition is false.
#if os(iOS)
    print("Compiled for an iOS device")
#else
    print("Not on an iOS device")
#endif

/// #elseif : A conditional compiler control statement that allows the program to conditionally compile some given code. Used in conjunction with an #if statement, it executes one part of code when the given condition is true.
#if os(iOS)
    print("Compiled for an iOS device")
#elseif os(macOS)
    print("Compiled on a mac computer")
#endif

/// #endif : A conditional compiler control statement that allows the program to conditionally compile some given code. Used for marking the end of conditionally compiled code.
#if os(iOS)
    print("Compiled for an iOS device")
#endif

/// #file : A special literal expression that returns the name of the file in which it appears.
class FilePerson
{
    func printInfo()
    {
        print("Some person info - inside file \(#file)")
    }
}
let aFilePerson = FilePerson()
aFilePerson.printInfo() //Some person info - inside file /*file path to the Playground file I wrote it in*/

/// #fileReference : A playground literal which brings up a picker to select a file which returns as a NSURL instance.
//#fileLiteral(resourseName)  Brings up file picker

/// #function : A special literal expression which returns the name of a function, inside a method it is the name of that method, inside a property getter or setter it is the name of that property, inside special members like init or subscript it is the name of that keyword, and at the top level of a file it is the name of the current module.
class FunctionalPerson
{
    func printInfo()
    {
        print("Some person info - inside function \(#function)")
    }
}
let aFunctionalPerson = FunctionalPerson()
aFunctionalPerson.printInfo() //Some person info - inside function printInfo()

/// #if : A conditional compiler control statement that allows the program to conditionally compile some given code. Used for executing code based on the evaluation of one or more conditions.
#if os(iOS)
    print("Compiled for an iOS device")
#endif

/// #imageLiteral : A playground literal which brings up a picker to select an image which returns as aUIImage instance.
// #imageLiteral Brings up a picker to select an image inside the playground file

/// #line : A special literal expression which returns the line number on which it appears.
class LinePerson
{
    func printInfo()
    {
        print("Some person info - on line number \(#line)")
    }
}
let aLinePerson = LinePerson()
aLinePerson.printInfo() //Some person info - on line number 5

/// #selector : An expression that forms the Objective-C selector which uses static checking to ensure that the method exists and that it’s also exposed to Objective-C.
//Static checking occurs to make sure doAnObjCMethod exists
//control.sendAction(#selector(doAnObjCMethod), to: target, forEvent: event)

class RefreshPerson
{
    var button: UIButton!

    init() {
        button = UIButton()
    }

    func clickButton() {
        button.perform(#selector(refresh), with: nil, afterDelay: 0.1)
    }

    @objc func refresh() {
      print("Oh! Refreshed!")
    }
}

let refreshPerson = RefreshPerson()
refreshPerson.refresh()

/// #sourceLocation : A line control statement used to specify a line number and filename that can be different from the line number and filename of the source code being compiled. Useful for changing the source code location used by Swift for diagnostic and debugging purposes.
#sourceLocation(file:"foo.swift", line:6)
//Reports new values
print(#file)
print(#line)
//This resets the source code location back to the default values numbering and filename
#sourceLocation()
print(#file)
print(#line)

/// Keywords For Specific Context(s)

/// These keywords can actually be used as identifiers if they are used outside of their respective contexts.

/// associativity : Specifies how a sequence of operators with the same precedence level are grouped together in the absence of grouping parentheses by using left, right or none .
precedencegroup ComparisonPrecedence {
  associativity: left
  higherThan: NilCoalescingPrecedence
}
infix operator ~= : ComparisonPrecedence
let compareResult = 4 ~= 8
print(compareResult)

/// convenience : Secondary, supporting initializers for a class that eventually delegate initialization of the instance to a designated initializer.
class ConvenientPerson
{
    var name:String
    init(_ name:String)
    {
        self.name = name
    }
    convenience init()
    {
        self.init("No Name")
    }
}
let me = ConvenientPerson()
print(me.name)//Prints "No Name"

/// dynamic : Indicates that access to that member or function is never inlined or devirtualized by the compiler, which means access to that member is always dynamically dispatched (instead of statically) using the Objective-C runtime.
class DynamicPerson
{
    //Implicitly has the "objc" attribute now too
    //This is helpful for interop with libs or
    //Frameworks that rely on or are built
    //Around Obj-C "magic" (i.e. some KVO/KVC/Swizzling)
    dynamic var name:String?
}

/// didSet : A property observer that is invoked immediately after a value is stored on a property.
var data = [1,2,3]
{
    didSet
    {
        print("Data has been changed")
    }
}

/// final : Prevents a method, property, or subscript from being overridden.
final class FinalPerson {}
//class ProgrammerFromFinal : FinalPerson {} //Compile time error uncomment to see the error

/// get : Returns the given value for a member. Also used with computed properties to get other properties and values indirectly.
class GetterPerson
{
    var title:String?
    var name:String?
    var fullName:String?
    {
        get
        {
            if let title = self.title,
                let name = self.name {
                return "\(title) \(name)"
            }
            return ""
        }
        set (newValue)
        {
            if let fullName = newValue {
                self.fullName = fullName
            }
        }
    }
}

/// infix : Specifies that an operator is used between two targets. If a new global operator is defined as an infix operator, it also requires membership to a precedence group.
let twoIntsAdded = 2 + 3

/// indirect : Indicates that an enumeration has another instance of the enumeration as the associated value for one or more of the enumeration cases.
indirect enum Entertainments
{
    case eventType(String)
    case oneEvent(Entertainments)
    case twoEvents(Entertainments, Entertainments)
}
let dinner = Entertainments.eventType("Dinner")
let movie = Entertainments.eventType("Movie")
let dateNight = Entertainments.twoEvents(dinner, movie)

/// lazy : A property whose initial value is not calculated until the first time it is used.
class LazyPerson
{
    lazy var personalityTraits = {
        //Some crazy expensive database  hit
        return ["Nice", "Funny"]
    }()
}
let aLazyPerson = LazyPerson()
aLazyPerson.personalityTraits //Database hit only happens now once it's accessed for the first time

/// left : Specifies the associativity of an operator as left-to-right so operators with the same precedence level are grouped together correctly in the absence of grouping parentheses.
//The "-" operator's associativity is left to right
10-2-4 //Logically grouped as (10-2) - 4

/// mutating : Allows modification of the properties of a structure or enumeration within a particular method.
struct MutatingPerson
{
    var job = ""
    mutating func assignJob(newJob:String)
    {
        self = MutatingPerson(job: newJob)
    }
}
var aMutatingPerson = MutatingPerson()
aMutatingPerson.job //""
aMutatingPerson.assignJob(newJob: "iOS Engineer at Buffer")
aMutatingPerson.job //iOS Engineer at Buffer

/// none : Specifies that an operator has the absence of any associativity applied to it, which restricts operators of the same precedence level from appearing adjacent to each other.
//The "<" operator is a nonassociative operator
//1 < 2 < 3 //Won't compile

/// nonmutating : Indicates that a member’s setter doesn’t modify the containing instance, but rather has other intended consequences.
enum Paygrade
{
    case Junior, Middle, Senior, Master
    var experiencePay:String?
    {
        get
        {
            print("read from data store")
            return "Paygrade for \(String(describing:self))"
        }
        nonmutating set
        {
            if let newPay = newValue
            {
                print("Edit store for \(String(describing:self)) with newSalary:\(newPay)")
            }
        }
    }
}
let currentPay = Paygrade.Middle
//Updates Middle range pay to 45k, but doesn't mutate experiencePay
currentPay.experiencePay = "$45,000"

//optional : Used to declare optional methods in protocols. These requirements do not have to be implemented by types that conform to it.
@objc protocol PersonProtocol
{
    func requiredFunction()
    @objc optional func optionalFunction()
}
class ProtocolPerson : PersonProtocol
{
    func requiredFunction()
    {
        print("Conformance is now valid")
    }
}
/// override : Indicates that a subclass will provide its own custom implementation of an instance method, type method, instance property, type property, or subscript that it would otherwise inherit from a superclass.
class OverridingPerson
{
    func printInfo()
    {
        print("I'm just a person!")
    }
}
class OverridingProgrammer : OverridingPerson
{
    override func printInfo()
    {
        print("I'm a person who is a dev!")
    }
}
let aOverridingPerson = OverridingPerson()
let aOverridingDev = OverridingProgrammer()
aOverridingPerson.printInfo() //I'm just a person!
aOverridingDev.printInfo() //I'm a person who is a dev!

/// postfix : Specifies that an operator follows the target that it operates on.
var optionalStr:String? = "Optional"
print(optionalStr!)

/// precedence : Represents an operator’s higher priority than others; so that these operators are applied first.
precedencegroup MultiplicationPrecedence {
  associativity: left
  higherThan: LogicalConjunctionPrecedence
}
infix operator <| : MultiplicationPrecedence

/// prefix : Specifies that an operator precedes the target it operates on.
var anInt = 2
anInt = -anInt //anInt now equals -2

//required : Enforces the compiler to make sure that every subclass of the class must implement the given initializer.
class RequiredPerson
{
    var name:String?
    required init(_ name:String)
    {
        self.name = name
    }
}
class RequiredProgrammer : RequiredPerson
{
    //Excluding this init(name:String) would be a compiler error
    required init(_ name: String)
    {
        super.init(name)
    }
}

/// right : Specifies the associativity of an operator as right-to-left so operators with the same precedence level are grouped together correctly in the absence of grouping parentheses.
//The "??" operator's associativity is right to left
var packingBox:Int?
var adhesiveSolution:Int? = 2
let material:Int = packingBox ?? adhesiveSolution ?? 0 //material equals 2

/// set : Takes in a value for a member to set as its new value. Also used with computed properties to set other properties and values indirectly. If a computed property’s setter does not define a name for the new value to be set, a default name of newValue can be used implicitly.
class SetterPerson
{
    var title:String?
    var name:String?
    var fullName:String?
    {
        get
        {
            if let title = self.title,
                let name = self.name {
                return "\(title) \(name)"
            }
            return ""
        }
        set (newValue)
        {
            if let fullName = newValue {
                self.fullName = fullName
            }
        }
    }
}

//Type : Refers to the type of any type, including class types, structure types, enumeration types, and protocol types.
class Building {}
class Stadium : Building {}
let aStadium:Stadium.Type = Stadium.self

/// unowned : Enables one instance in a reference cycle to refer to the other instance without keeping a strong hold on it when the other instance has the same lifetime or a longer lifetime.
class UnownedPerson
{
    var occupation:Job?
}
//Here, a job never exists without a Person instance, and thus never outlives the Person who holds it.
class Job
{
    unowned let employee:UnownedPerson
    init(with employee:UnownedPerson)
    {
        self.employee = employee
    }
}

//weak : Enables one instance in a reference cycle to refer to the other instance without keeping a strong hold on it when the other instance has a shorter lifetime — that is, when the other instance can be deallocated first.
class WeakPerson
{
    var residence:House?
}
class House
{
    weak var occupant:WeakPerson?
}
var weakme:WeakPerson? = WeakPerson()
var myHome:House? = House()
weakme!.residence = myHome
myHome!.occupant = weakme
weakme = nil
myHome!.occupant //Is now nil

/// willSet : A property observer that is invoked right before a value is stored on a property.
class WilSetPerson
{
    var name:String?
    {
        willSet(newValue) {print("I've got a new name, it's \(newValue ?? "")")}
    }
}
let aWilSetPerson = WilSetPerson()
aWilSetPerson.name = "Jordan" //Prints out "I've got a new name, it's Jordan!" right before name is assigned to
