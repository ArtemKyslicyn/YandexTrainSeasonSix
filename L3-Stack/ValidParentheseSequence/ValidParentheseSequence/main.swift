//
//  main.swift
//  ValidParentheseSequence
//
//  Created by Artem Kislitsyn on 17.11.2024.
//

import Foundation

print("Hello, World!")
/*
 Рассмотрим последовательность, состоящую из круглых, квадратных и фигурных скобок. Программа должна определить, является ли данная скобочная последовательность правильной. Пустая последовательность является правильной. Если A — правильная, то последовательности (A), [A], {A} — правильные. Если A и B — правильные последовательности, то последовательность AB — правильная.
 Формат ввода

 В единственной строке записана скобочная последовательность, содержащая не более 100000 скобок.
 Формат вывода

 Если данная последовательность правильная, то программа должна вывести строку "yes", иначе строку "no".
 */

func isBalanced(_ sequence: String) -> String {
    var stack: [Character] = []

    for char in sequence {
        switch char {
        case "(", "[", "{":
            // Если это открывающая скобка, добавляем её в стек
            stack.append(char)
        case ")":
            // Если это закрывающая скобка, проверяем соответствие последней открывающей
            if stack.isEmpty || stack.removeLast() != "(" {
                return "no"
            }
        case "]":
            if stack.isEmpty || stack.removeLast() != "[" {
                return "no"
            }
        case "}":
            if stack.isEmpty || stack.removeLast() != "{" {
                return "no"
            }
        default:
            break
        }
    }
    
    // Если стек пустой после обработки всей строки, последовательность правильная
    return stack.isEmpty ? "yes" : "no"
}

// Чтение входной строки
if let input = readLine() {
    print(isBalanced(input))
}
