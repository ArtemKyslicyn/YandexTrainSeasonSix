//
//  main.swift
//  PostfixRecord
//
//  Created by Artem Kislitsyn on 17.11.2024.
//



import Foundation

/* В постфиксной записи (или обратной польской записи) операция записывается после двух операндов. Например, сумма двух чисел A и B записывается как A B +. Запись B C + D * обозначает привычное нам (B + C) * D, а запись A B C + D * + означает A + (B + C) * D. Достоинство постфиксной записи в том, что она не требует скобок и дополнительных соглашений о приоритете операторов для своего чтения.
 Формат ввода

 В единственной строке записано выражение в постфиксной записи, содержащее цифры и операции +, -, *. Цифры и операции разделяются пробелами. В конце строки может быть произвольное количество пробелов.
 */

func evaluatePostfixExpression(expression: String) -> Int {
    var stack = [Int]() // Стек для вычислений
    let tokens = expression.split(separator: " ") // Разделение строки на токены

    for token in tokens {
        if let number = Int(token) {
            // Если токен - число, добавляем его в стек
            stack.append(number)
        } else {
            // Если токен - оператор, выполняем соответствующую операцию
            guard stack.count >= 2 else {
                fatalError("Неверное выражение: недостаточно операндов для операции \(token)")
            }
            let b = stack.removeLast() // Второй операнд
            let a = stack.removeLast() // Первый операнд
            
            switch token {
            case "+":
                stack.append(a + b)
            case "-":
                stack.append(a - b)
            case "*":
                stack.append(a * b)
            default:
                fatalError("Неверный оператор: \(token)")
            }
        }
    }
    
    // В конце в стеке должен остаться один элемент — результат
    guard stack.count == 1 else {
        fatalError("Неверное выражение: остаточные элементы в стеке")
    }
    return stack[0]
}

// Чтение входных данных
if let input = readLine() {
    let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
    let result = evaluatePostfixExpression(expression: trimmedInput)
    print(result)
}
