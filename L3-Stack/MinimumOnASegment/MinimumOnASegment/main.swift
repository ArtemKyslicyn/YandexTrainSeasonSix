//
//  main.swift
//  MinimumOnASegment
//
//  Created by Artem Kislitsyn on 17.11.2024.
//

import Foundation

print("Hello, World!")

/*
 Задача: Минимум в скользящем окне

 Рассмотрим последовательность целых чисел длины n. По ней с шагом 1 двигается «окно» длины k. То есть сначала в «окне» видны первые k чисел, на следующем шаге в «окне» уже будут находиться k чисел, начиная со второго, и так далее до конца последовательности. Необходимо для каждого положения окна определить минимум в нём.

 Входные данные:
 1. В первой строке содержатся два натуральных числа n и k (n ≤ 150000, k ≤ 10000, k ≤ n) — длины последовательности и «окна», соответственно.
 2. Во второй строке находятся n чисел — сама последовательность.

 Выходные данные:
 Для каждого положения окна вывести минимум из чисел, находящихся в нём, всего n - k + 1 строк.
 
 Пример:
 Ввод:
 8 3
 1 3 2 4 5 3 1 2
 Вывод:
 1
 2
 2
 3
 1
 1

 Алгоритм решения:
 1. Инициализируем очередь (или другой контейнер), чтобы хранить индексы элементов текущего окна.
 2. Проходим по всем элементам массива, добавляем их в очередь так, чтобы в очереди всегда был минимум на текущем отрезке.
 3. Для каждого положения окна выводим минимальный элемент.
 
 Подход:
 - Для эффективного поиска минимума на каждом отрезке используем очередь, где элементы отсортированы по возрастанию. Это позволяет нам поддерживать минимум в пределах каждого окна за O(1) после предварительной обработки.

 Сложность:
 - Время: O(n) для обработки всех окон.
 - Пространство: O(k) для хранения индексов в очереди.
 
 Пример реализации:

*/

import Foundation


func slidingWindowMinimum(n: Int, k: Int, arr: [Int]) -> [Int] {
    var deque: [Int] = [] // Хранит индексы, которые могут быть минимумами
    var result: [Int] = [] // Результат с минимумами

    for i in 0..<n {
        // Удаляем элементы, которые вышли за пределы окна
        if !deque.isEmpty && deque.first! < i - k + 1 {
            deque.removeFirst()
        }
        
        // Удаляем из конца deque элементы, которые больше текущего
        while !deque.isEmpty && arr[deque.last!] > arr[i] {
            deque.removeLast()
        }
        
        // Добавляем текущий индекс
        deque.append(i)
        
        // Минимум окна — первый элемент в deque
        if i >= k - 1 {
            result.append(arr[deque.first!])
        }
    }
    
    return result
}

// Чтение входных данных
if let firstLine = readLine(), let secondLine = readLine() {
    let parameters = firstLine.split(separator: " ").compactMap { Int($0) }
    let n = parameters[0], k = parameters[1]
    let arr = secondLine.split(separator: " ").compactMap { Int($0) }
    
    // Вычисление минимумов и вывод результата
    let result = slidingWindowMinimum(n: n, k: k, arr: arr)
    result.forEach { print($0) }
}
