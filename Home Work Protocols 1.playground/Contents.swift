import UIKit

// Создаем структуру студент с именем и фамилией
struct Student: Equatable, Comparable {
    let firstName: String
    let lastName: String
    
    static func < (lhs: Student, rhs: Student) -> Bool {
        lhs.lastName < rhs.lastName
    }
}
// Создаем список студентов в виде массива
let listOfStudents = [
    Student(firstName: "Артем", lastName: "Мартиросян"),
    Student(firstName: "Сергей", lastName: "Коньков"),
    Student(firstName: "Никита", lastName: "Чирухин"),
    Student(firstName: "Ерлан", lastName: "Омаров"),
    Student(firstName: "Светлана", lastName: "Кривобородова"),
    Student(firstName: "Егор", lastName: "Астахов")
]
// Создаем экземпляр структуры для проверки студента
let studentToCheck = Student(firstName: "Егор", lastName: "Астахов")
// Далее мы проверям имеется ли такой студент в нашем списке
// Но так как мы не можем просто сравнить два экземпляра структуры, то структуру надо подписать под протокол Equatable - сопоставимый
for student in listOfStudents {
    if student == studentToCheck {
        print("Студент есть в списке")
    }
}
// Также мы можем отсортировать, к примеру, по фамилиям список студентов и распечатать его. Но для этого нам необходимо подписать структуру под протокол Comparable - сравнение
let sortedListOfStudents = listOfStudents.sorted {
    $0 < $1
}
for student in sortedListOfStudents {
    print(student.lastName)
}

