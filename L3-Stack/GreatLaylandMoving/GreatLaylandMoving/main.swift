//
//  main.swift
//  GreatLaylandMoving
//
//  Created by Artem Kislitsyn on 17.11.2024.
//

import Foundation

print("Hello, World!")

 /*
  Лайнландия представляет собой одномерный мир, состоящий из N городов, пронумерованных от 0 до N-1.
  Направление к меньшим номерам городов — западное, к большим номерам — восточное.

  Жители переселяются из текущего города на восток до первого города с более низкой средней ценой проживания.
  Если такого города нет, жители отправляются в "Восточное Бесконечное Ничто".

  Входные данные:
  1. В первой строке задано число городов N (2 ≤ N ≤ 10^5).
  2. Во второй строке задан массив `a` из N элементов, где `a[i]` — средняя цена проживания в городе i (0 ≤ a[i] ≤ 10^9).

  Выходные данные:
  Для каждого города i (0 ≤ i < N) выведите номер города, в который переселятся его жители. Если такого города нет, выведите -1.
 */
 
import Foundation

func findMigrationCities(_ n: Int, _ prices: [Int]) -> [Int] {
    var result = Array(repeating: -1, count: n)  // Инициализируем массив с ответами -1
    var stack: [Int] = []  // Стек для хранения индексов городов

    
    for i in stride(from: n - 1, through: 0, by: -1) {
        // Убираем из стека все города с ценой проживания >= текущей
        while !stack.isEmpty && prices[stack.last!] >= prices[i] {
            stack.removeLast()
        }

       
        if !stack.isEmpty {
            result[i] = stack.last!
        }

        
        stack.append(i)
    }

    return result
}

if let n = Int(readLine()!), let prices = readLine()?.split(separator: " ").map({ Int($0)! }) {
    let result = findMigrationCities(n, prices)
    print(result.map(String.init).joined(separator: " "))
}
