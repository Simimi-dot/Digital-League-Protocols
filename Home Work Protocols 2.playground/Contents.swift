import UIKit

// Энум для оплаты товаров на кассе, чтобы пользователь выбрал тот тип карты, который он имеет при себе
enum Cards: Int {
    case standartCard = 10_000
    case goldCard = 100_000
    case platinumCard = 1_000_000
}

protocol Cashier {
    // Название продукта
    var productName: String { get }
    // Полная стоимость продукта
    var productFullCost: Int { get }
    // Метод который считает какое количество сдачи надо выдать
    func cashChange()
}

class Human: Cashier {
    
    var productName: String
    var productFullCost: Int
    
    var cash: Int
    
    init(productName: String, productFullCost: Int, cash: Int) {
        self.productName = productName
        self.productFullCost = productFullCost
        self.cash = cash
    }
    
    func cashChange() {
        var change: Int = 0
        // если количество денег, которое вы дали продавцу хватило, то он выдаст чек и сдачу
        if cash >= productFullCost {
            change = cash - productFullCost
            print("У вас хватило средств для оплаты товара, сумма вашей сдачи - \(change)")
        } else {
            print("У вас не хватает средств для оплаты товаров")
        }
    }
}
let changeHuman = Human(productName: "Молоко", productFullCost: 80, cash: 100)
changeHuman.cashChange()




class Robot: Cashier {
    var productName: String
    var productFullCost: Int
    
    var card: Cards

    init(productName: String, productFullCost: Int, card: Cards) {
        self.productName = productName
        self.productFullCost = productFullCost
        self.card = card
    }

    func cashChange() {
        switch card {
        case .standartCard:
            print("Спасибо за покупку")
        case .goldCard:
            print("Спасибо за покупку")
        case .platinumCard:
            print("Спасибо за покупку")
        }
    }
}
let changeRobot = Robot(productName: "Сок", productFullCost: 200, card: .platinumCard)
changeRobot.cashChange()



struct Customer {
    func buySomethingInShop(with cashier: Cashier) {
        if cashier is Human {
            cashier.cashChange()
            print("Вам помогут собрать ваши покупки")
        } else if cashier is Robot {
            cashier.cashChange()
            print("На кассе самооблуживания покупатели сами собрают свои покупки")
        }
    }
}

let someChangeHuman = Human(productName: "Cнеки", productFullCost: 150, cash: 200)
let someChangeRobot = Robot(productName: "чипсы", productFullCost: 300, card: .goldCard)
let customer = Customer()
customer.buySomethingInShop(with: someChangeHuman)
customer.buySomethingInShop(with: someChangeRobot)


