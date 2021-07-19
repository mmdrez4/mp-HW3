import Foundation
import Darwin

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

class Category{
    static var categories = [Category]()
    var name: String
    var todos = [Todo]()
    init(name: String) {
        self.name = name
        Category.categories.append(self)
    }
    
    static func getByName(name: String) -> Category? {
        for category in categories {
            if category.name == name {
                return category
            }
        }
        return nil
    }
    
    func remove(title: String) -> () {
       self.todos.removeAll(where: { (td: Todo) -> Bool in
           return td.title == title
       })
   }
    
    func getTodos() -> [Todo] {
        return self.todos
    }
    
    func addTodos(Ids: [String]) -> () {
        for todoId in Ids {
            let todo = Todo.findTodo(title: todoId)
            if !self.todos.contains(where:{ (td: Todo) -> Bool in return td.title == todoId}) {
                todo!.addCategory(category: self)
                self.todos.append(todo!)
            }
        }
    }
    
}

class Todo{
    static var todoList = [Todo]()
    var title: String
    var content: String
    var priority: Int
    var id : Int
    static var start = 0
    var categories = [Category]()
    
    init(title: String, content: String, priority: Int) {
        self.title = title
        self.content = content
        self.priority = priority
        self.id = Todo.start
        Todo.todoList.append(self)
        Todo.start += 1
    }
    
    
    static func findTodo(title: String) -> Todo? {
        for todo in todoList {
            if todo.title == title {
                return todo
            }
        }
        return nil
    }

    func addCategory(category: Category) -> () {
        self.categories.append(category)
    }
    
    func change(name: String, parameter: String, changedParameter: String) -> Bool {
        switch parameter {
        case "1":
            Todo.findTodo(title: name)!.title = changedParameter
            return true
        case "2":
            Todo.findTodo(title: name)!.content = changedParameter
            return true
        case "3":
            if changedParameter.isInt {
                Todo.findTodo(title: name)!.priority = Int(changedParameter) ?? Todo.findTodo(title: name)!.priority
                return true
            }else{
                return false
            }
        default:
            return false
        }
        
    }
    
     static func remove(title: String) -> () {
        let myTitle = title
        for category in Todo.findTodo(title: title)!.categories {
            category.remove(title: myTitle)
        }
        
        Todo.todoList.removeAll(where: { (td: Todo) -> Bool in
            return td.title == title
        })
    }
    
    static func sort(parameter: String) -> ([Todo]) {
        var tempArray = todoList
        if parameter == "1" {
            return(tempArray)
        }else if parameter == "2"{
            tempArray = tempArray.sorted(by: { $0.title < $1.title })
        }else if parameter == "3"{
            tempArray = tempArray.sorted(by: { $0.priority < $1.priority })
        }
        return (tempArray)
    }
    
}


while true{
    var listOfTodos : [Todo]
    print("choose the Menu: \n1.add new todo \n2.show Todo List \n3.change \n4.delete \n5.sort \n6.create a category \n7.add todos to the categories \n8.show category \n9.exit")
    if let myInput = readLine() {
        let menu = Int(myInput)
        if menu == 1 {
            print("Input the title: ", terminator: "")
            let todoTitle = readLine()
            print("Input the content: ")
            let todoContent = readLine()
            print("Input the priority: ")
            let todoPriority = readLine()
            let myTodo = Todo.findTodo(title: todoTitle ?? "nothing")
            if myTodo == nil {
                if (todoPriority!.isInt) {
                    _ = Todo(title: todoTitle!, content: todoContent!, priority: Int(todoPriority ?? "1")!)
                    print("you successfully add a new Todo")
                }else{
                    print("Priority should be integer!")
                }
            }else{
                print("There is a todo with the same title! you have to choose a unique title.")
            }
            
        } else if menu == 2{
            var i = 1
            for todo in Todo.todoList {
                print("\(i). \(todo.title) \(todo.content) \(todo.priority)")
                i+=1
            }
        } else if menu == 3{
            print("enter the title: ", terminator: "")
            let myTitle = readLine()
            let myTodo = Todo.findTodo(title: myTitle ?? "nothing")
            if myTodo != nil {
                print("enter the parameter you want to change:\n1.title 2.content 3.priority")
                let parameter = readLine()
                print("enter the alternative \(parameter ?? "the parameter").")
                let changedParameter = readLine()
                if ((myTodo?.change(name: myTitle! ,parameter: parameter!, changedParameter: changedParameter!)) != nil) {
                    print("you successfully changed the parameter")
                }else{
                    print("invalid input!")
                }
            } else{
                print("There is no todo with this title!")
            }
        } else if menu == 4{
            print("enter the title: ", terminator: "")
            let myTitle = readLine()
            Todo.remove(title: myTitle!)
            print("you successfully removed the Todo")
        } else if menu == 5{
            print("enter the parameter you want to be sorted by: 1.time 2.title 3.priority: ", terminator: "")
            let parameter = readLine()
            if parameter == "1" || parameter == "2" || parameter == "3" {
                print("enter the method you want to sort: 1.ascending 2.descending: ", terminator: "")
                let method = readLine()
                if method == "1" || method == "2"  {
                    listOfTodos = Todo.sort(parameter: parameter ?? "1")
                    if method == "2" {
                        listOfTodos.reverse()
                    }
                    var i = 1
                    for todo in listOfTodos {
                        print("\(i). \(todo.title) \(todo.content) \(todo.priority)")
                        i+=1
                    }
                }else{
                    print("input a number from 1 to 2!")
                }
            }else{
                print("input a number from 1 to 3!")
            }
        } else if menu == 6{
            print("enter the name of the category: ")
            let categoryName = readLine()
            let myCategory = Category.getByName(name: categoryName ?? "nothing")
            if myCategory == nil {
                _ = Category(name: categoryName!)
                print("you successfully create a new category!")
            }else{
                print("There is a todo with the same title! you have to choose a unique title.")
            }
            
        } else if menu == 7{
            print("enter the name of the category: ")
            let categoryName = readLine()
            let category = Category.getByName(name: categoryName!)
            if category != nil {
                print("titles and contents of the Todos:")
                var i = 1
                for todo in Todo.todoList {
                    print("\(i). \(todo.title) \(todo.content)")
                    i+=1
                }
                print("enter the titles you want to add (seperated by a white space): ")
                let str = readLine()
                let ids = str?.components(separatedBy: " ")
                var flag = 0
                for todoId in ids! {
                    if Todo.findTodo(title: todoId) == nil {
                        flag = 1
                        break
                    }
                }
                if flag == 0 {
                    category!.addTodos(Ids: ids!)
                    print("have been added successfully!")
                }else{
                    print("please input the existing titles!!")
                }
                
            }else{
                print("we don't have a category with name of \(categoryName ?? "your input")")
            }

        } else if menu == 8{
            print("enter the name of the category: ")
            let categoryName = readLine()
            let category = Category.getByName(name: categoryName!)
            if category != nil {
                var i = 1
                print("\(categoryName!): ")
                for todo in category!.getTodos() {
                    print("   \(i). \(todo.title)")
                    i+=1
                }
            }else{
                print("we don't have a category with name of \(categoryName ?? "your input")")
            }
        }else if menu == 9{
            exit(0)
        }else{
            print("please input a valid menu")
        }
        print("\n")
    }
}
