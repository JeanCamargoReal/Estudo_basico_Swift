import UIKit

var str = "Goodbye"


// Anotações de tipo ============================
var nome: String = "Jean Camargo"
let valor: Int = 1
let valor_double: Double = 2.0

//-----------------------------------------------------------------------------------


// Arrays =======================================
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
// Com anotação de tipo
let beatles_2: [String] = [john, paul, george, ringo]

print(beatles[1])
print(beatles[0])

//-----------------------------------------------------------------------------------

// Set (Conjuntos) =======================================

// Sets são coleções de valores assim como matrizes, exceto que têm duas diferenças:
//  1 - Os itens não são armazenados em nenhuma ordem. Eles são armazenados no que é
//efetivamente uma ordem aleatória.
//  2 - Nenhum item pode aparecer duas vezes em um set. Todos os itens devem ser unicos.
//  3 - Como eles são desordenados, você não pode ler valores de um conjunto usando
//posições númericas como faz com matrizes.
let colors = Set(["red", "green", "blue"])
print(colors)

//-----------------------------------------------------------------------------------


// Tuplas =======================================

//  1 - Você não pode adicionar ou remover itens de uma tupla, eles são fixos sem tamanho.
//  2 - Você não pode alterar o tipo de itens em uma tupla, eles sempre têm os mesmos tipos
//com os quais foram ccriados.
//  3 - Você pode acessar itens em uma tupla usando posições numéricas ou nomeando-os, mas
// o Swift não permite que você leia números ou nomes que não existem.
var name = (first: "Taylor", last: "Swift")
print(name.0)
print(name.last)

//-----------------------------------------------------------------------------------

// Dicionários =======================================

// Dicionarios são coleções de valores como arrays, mas em vez de armazenar coisa com uma posicão inteira, você pode acessá-los usando o que quiser.
//  1 - Como os cojuntos, os dicinários não armazenam nossos itens com uma ordem específica,
//portanto otimizam  a maneira como armazenam os itens para recuperação rápido.
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

print(heights["Taylor Swift", default: 0])

//----------------------------------------------------------------------------------

// Criação de coleções vazias =======================================

//Dicionario
var teams = [String: String]()
var results = [Int]()

//adicionando valor
teams["Jean"] = "Black"

print(teams["Jean", default: "sem cor"])

//Set (Conjunto)
var words = Set<String>()
var numbers = Set<Int>()

//----------------------------------------------------------------------------------

// Enumerações =======================================
// Enumeracções, geralmente chamadas apenas enums, são uma forma de definir grupos de valores
//relacionados de uma maneira que os torna mais fáceis de usar.
enum Result {
    case success
    case failure
}

let result4 = Result.failure
print(result4)

// Enum com valores associados
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")
print(talking)

//----------------------------------------------------------------------------------

// Operador ternário =======================================
//  Ele trabalha com três valores ao mesmo tempo, daí vem seu nome:
//verifica uma condição espcificada no primeiro valor, e se for verdadeiro
//retorna o segundo valor, mas se for falso retorna o terceiro valor.
let firstCard = 11
let secondCard = 10
print(firstCard == secondCard ? "Cards are the same" : "Cars are different")

//----------------------------------------------------------------------------------

// LOOPS =======================================

// For =======================================
let count = 1...10

for number in count {
    print("Number is \(number)")
}

//--------------------------------------

let albuns = ["Red", "1989", "Reputation"]

for album in albuns {
    print("\(album) is on Apple Music")
}

// Se não for usar o constante for fornecida pelos loops, deverá usar
//um sublinhado para que o Swift não crie valores desnecessários:
for _ in 1...5  {
    print("play")
}


// Loop Repeat =======================================
// - É idêntico a um while loop, exceto que a condição para verificar vem no final.
// - Ao contrário do while, como a condição vem no final, o código dentro do loop
//sempre será executado pelo menos uma vez.

var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

//----------------------------------------------------------------------------------

// Funcoes =======================================

//  * Funcoes com parametros
func square(number: Int) {
    print(number * number)
}

square(number: 2)

//  * Funcoes retornando valores
func square2(number: Int) -> Int {
    return number * number
}

let result = square2(number: 5)
print(result)

//  * Funcoes com expressões (codigo de uma lina) nao necessita de return
func doMoreMath() -> Int {
    5+5
}

print(doMoreMath())

//  * Funcoes com expressões (codigo de uma lina) nao necessita de return,
// usando ternário (obs.: se tiver conficoes necessita de return)
func greet(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow" : "Hello, \(name)"
}

//  * Funcoes retornando dois ou mais valores
func getUser() -> (first: String, last: String) {
    (first: "Taylor", last: "Swift")
}

let user = getUser()

print(user.first)

//  * Funcao com rótulos de parâmetro
func sayHello(to name: String) {
    print("Hello, \(name)!")
}
// - O parâmetro é chamado to name, o que significa que externamente é
//chamado to, mas internamente é chamado name. Isso dá às variáveis
//um nome lógico dentro da função, mas significa que chamar a função lê
//naturalmente:
sayHello(to: "Taylor")

//  * Funcoes variáveis
// - Você pode tornar qualquer parâmetro variável escrevendo ... após seu tipo.
//Portanto, um parâmetro Int é um único inteiro, enquanto Int... são zero ou mais
//inteiros, potencialmente centenas.
// - Dentro da função, o Swift converte os valores que foram passados em uma matriz
// de inteiros, para que você possa fazer um loop sobre eles conforme necessário.
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)

//  * Funcoes com throw
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if  password == "password" {
        throw PasswordError.obvious
    }
    return true
}


do {
    try checkPassword("password")
    print("This is a good password!")
} catch {
    print("You can't user this password")
}

//----------------------------------------------------------------------------------

// Closures =======================================

// - Isso cria efetivamente uma função sem um nome e atribui essa função
//a driving.
let driving = {
    print("I'm driving in my car")
}
//Agora vc pode chamar driving() cmo se fosse uma função regular:
driving()


//  * Aceitando parâmetros em um closure
let driving2 = { (place: String) in
    print("I'll go to \(place) with my car")
}
// Uma das diferenças entre funções de clousures é que você não usa
//rótulos de parâmetro ao executa-las
driving2("London")


//  * Retornando valores de um closure
let drivingWithReturn = { (place: String) -> String in
    return "I'll go to \(place) with my car"
}

let message = drivingWithReturn("São Paulo")
print(message)

// * Retornando um valor de uma closure que
//nao possui parâmetro
let payment = { () -> Bool in
    print("Paying an anonymous person...")
    return true
}

//  * Closures como parâmetros
func travel(action:() -> Void) {
    print("I'm read")
    action()
    print("I'm going!")
}

travel(action: driving)

//----------------------------------------------------------------------------------

// Estruturas =======================================
struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

//  * Propriedades computadas
struct Sport_2 {
    var name: String
    var isOlympicSport: Bool
    // propriedade computada
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport_2(name: "Chessboxing", isOlympicSport: false)

print(chessBoxing.isOlympicSport)


//----------------------------------------------------------------------------------

// Observadores de propriedade =======================================
//  - Os obseradores de propriedade permitem que você execute código antes
//ou depois de quaisquer alterações de propriedade.

//Rastria uma tarefa e uma porcentagem de conclusão
//O que queremos que aconteça é que o Swift imprima uma mensagem toda vez
//que amount mudar, e podemos usar um observador didSet.
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Reading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100
//Também pode ser usado willSet para executar uma ação antes de uma alteração de propriedade,
//mas isso raramente é usado.

//-----------------------------------------------------------------------------------

// =============== Métodos mutantes ===============

// - Quando vc cria a estrutura, o Swift não tem ideia se vai usá-la cmo constantes
//ou variáveis, portanto, por padrão, ela adota uma abordagem segura, o Swift não
//permite escrever métodos que alteram propriedades, a menos que vc especificamente
// solicite usando a palavra-chave mutating
struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Ananymous"
    }
}
// Por alterar proprieade, o Swift só permitirá que esse método seja chamado em
//instâncias de classe Person que são variáveis:
var person = Person(name: "Jean")
person.makeAnonymous()

//-----------------------------------------------------------------------------------

// =============== Propriedades e métodos de string ===============

let string = "Do or do not, the is no try."

// * Ler números de caracteres
print(string.count)

// * Retorna verdadeiro se a string começar com letras específicas:
print(string.hasPrefix("Do"))

// * Coloca uma string em maiúsculas
print(string.uppercased())

// * Classifica as letras da string uma uma matriz
print(string.sorted())

//-----------------------------------------------------------------------------------

// =============== Propriedades e métodos de matrizes ===============

var toys = ["Woody"]

// * Número de itens
print(toys.count)

// * Adicionar um novo item
toys.append("Buzz")

// * Localizar qualquer item dentro de uma matriz
toys.firstIndex(of: "Buzz")

// * Classisficar os itens da matriz em ordem alfabética
print(toys.sorted())

// * Remover um item
toys.remove(at: 0)
print(toys)

// - Verificar se uma string está vazia, deve ser escrito isto:
if string.isEmpty {
    //code here
}

//E não este:
if string.count == 0 {
    //code here
}

//-----------------------------------------------------------------------------------

// =============== Inicializadores ===============

// * Inicializadores são métodos especiais que fornecem maneiras diferentes de criar
//sua estrutura. Todas as estruturas vêm com uma por padrão, chamdo seu inicializador
//de membro. Isso pede que você forneça um valor para cada propriedade ao criar uma
//estrutura.

//struct User {
//    var username: String
//}
//
//var user_1 = User(username: "SuricatoTI")

//Podemos fornecer nosso próprio inicializador para substituir o padrão.
struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
// Não se escreve func antes de inicializadores.

var user_1 = User()
user_1.username = "SuricatoTI"

// * O Swift Remove o inicializador memberwise se vc criar um inicializador próprio.
//Portanto, assim que vc adiciona um inicializador personalizado para sua estrutura,
//o inicalizador de membro padrão desaparece. Se vc quiser que ele permaneça, mova
//seu inicializador personalizado pra uma extensão, assim:
struct Employee {
    var name: String
    var yearsActive = 0
}

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee...")
    }
}

//creating a named employee now works
let roslin = Employee(name: "Jean Camargo")

//as does creating an anonymoys employee
let anon = Employee()

//-----------------------------------------------------------------------------------

// =============== Propriedades lazys ===============
//  * Como uma otimização de desempenho, o Swift permite criar alguma propriedade
// apenas quando forem necessárias.

struct FamilyTree {
    init() {
        print("Creating family tree")
    }
}


//Mas se nem sempre precisássemos da ávore genealógica para uma pesa em particular?
//Se adicionarmos a palavra-chave lazy à propriedade familyTree, o Swift só criará
//a FamilyTree quando for acessada pela primeira vez:
struct Person_1 {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = Person_1(name: "Jean")
// Se vc quiser ver a mensagem "Creating family tree", vc precisa acessar a propriedade
//pelo menos uma vez:
ed.familyTree

//-----------------------------------------------------------------------------------

// =============== Propriedades e métodos estáticos ===============

struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

print(Student.classSize)

//-----------------------------------------------------------------------------------

// =============== Controle de acesso ===============

//  * Private

struct Person_2 {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
}

let person_2 = Person_2(id: "1111")

//person_2.id nao funciona
// Agora, apenas os métodos internos de Person_2 podem ler a propriedade id

// * Public
// Permite que todos os outros códigos usem a propriedade ou método.

//-----------------------------------------------------------------------------------

// =============== Criando suas próprias classes ===============

//  * 1º diferença entre classes e structs é que as classes nunca vêm com um
//inicializador de membro. Isso significa que se vc tiver propriedade em sua
//classe, deve sempre criar seu próprio inicializador.
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

//-----------------------------------------------------------------------------------

// =============== Herença de classe ===============

//  * 2ª diferença entre classes e estruturas é que vc pode criar uma classe com
//base e uma classe existente. Ela herda todas as propriedades e métodos da classe
//original e pode adicionar seus próprios por cima. (HERANÇA !!!)
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}
