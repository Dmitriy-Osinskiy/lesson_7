import Foundation

struct Cells{
    var name: String
    var number: Int
    var storageProduct: String
    var volume: Double
    var storegeTime: Int
}

enum bankEror: Error{
    case noName
    case noStorage
}



class bank{
    var storage: [String: Cells]

    
    func add (name:String, cell: Cells)-> (Cells?){
        guard (storage.count + 1) <= 3 else {
            print ("Невозможно сдать предмет на хранение! Максимальное количество ячеек - 3шт!")
      return nil
        }
        storage.updateValue(cell, forKey: name)
        return cell
    }
    
    func printSelf() {
        for (name, cell) in storage{
         print("\(name) \(cell) ")
        }
    }
    
    func searthNames(name: String) throws{
        guard storage[name] != nil else {
            throw bankEror.noName
        }
        print("Клиент найден. \(storage[name]!)")
       
    }
    
//    func searchStorage(nameobject: String) {
////        let name = (storage as NSDictionary).allKeys(for: nameobject)
//        print ("Владелец \(name)")
//    }
    
    

    init(storage: [String: Cells]) {
        self.storage = storage
    }
}


//var q = bank()
var q = bank.init(storage: ["Дмитрий": .init(name: "Дмитрий", number: 1, storageProduct: "Часы", volume: 0.01, storegeTime: 21)])

q.add(name: "Алексей", cell: .init(name: "Алексею", number: 2, storageProduct: "Ручка", volume: 0.02, storegeTime: 12))
q.add(name: "Виктор", cell: .init(name: "Виктор", number: 3, storageProduct: "Золото", volume: 0.5, storegeTime: 40))
q.printSelf()
q.add(name: "Артём", cell: .init(name: "Артём", number: 4, storageProduct: "кружка", volume: 0.5, storegeTime: 40))




do{
   try q.searthNames(name: "Дмитри")
}catch bankEror.noName{
    print("ОШИБКА ОТСУТСТВУЕТ КЛИЕНТ С ТАКИМ ИМЕНЕМ")}

do{
   try q.searthNames(name: "Дмитрий")
}catch bankEror.noName{
    print("ОШИБКА ОТСУТСТВУЕТ КЛИЕНТ С ТАКИМ ИМЕНЕМ")}

//q.searchStorage(nameobject: "Часы")






//func add (name:String, cell: Cells)->  (Cells?){
//    guard (storage.count + 1) <= 3 else {
//        print ("Невозможно сдать предмет на хранение! Максимальное количество ячеек - 3шт!")
//  return nil
//    }
//    storage.updateValue(cell, forKey: name)
//    return cell
//}


