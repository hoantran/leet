//
//  TreeHouseGenerics.swift
//  leet1
//
//  Created by Hoan Tran on 3/6/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

func duplicate<T>(item: T, numberOfTimes: Int) -> [T] {
    return (1...numberOfTimes).map{ _ in item }
}

//duplicate(item: 0.5, numberOfTimes: 2)

func map<T,U>(array: [T], transformation: (T)->U) -> [U] {
    return array.map{transformation($0)}
}

func square(_ input: Int) -> Int {
    return input * input
}

func IntToString(_ input: Int) -> String {
    return String(input) + " : LALA"
}

//map(array: [1,2,3], transformation: square)
//map(array: [1,2,3], transformation: IntToString)

func largest<T:Comparable>(in set: [T]) -> T? {
    return set.reduce(set[0], {result, next in
        if next > result {
            return next
        } else {
            return result
        }
    })
}


//largest(in: [1,2,3])
//largest(in: ["one", "two", "zebra", "yellow"])

// ----------------------
// doubly-linked-list

class LinkedListNode<Key> {
    let key: Key
    
    var next: LinkedListNode?
    weak var prev: LinkedListNode?
    
    init(_ key: Key){
        self.key = key
        self.next = nil
        self.prev = nil
    }
}

class LinkList<Element>{
    typealias Node = LinkedListNode<Element>
    
    private var head: Node?
    
    var first: Node? {
        return head
    }
    
    var last: Node?  {
        if var node = head {
            while node.next != nil {
                node = node.next!
            }
            return node
        } else {
            return nil
        }
    }
    
    func append(_ key: Element) -> Node {
        let el = LinkedListNode(key)
        if let omega = self.last {
            omega.next = el
            el.prev = omega
        } else {
            self.head = el
        }
        return el
    }
    
    func delete(_ el: Node) {
        if let prev = el.prev {
            prev.next = el.next
            if let next = el.next {
                next.prev = el.prev
            } else {
                prev.next = nil
            }
        } else {
            if let next = el.next {
                next.prev = nil
                self.head = next
            } else {
                self.head = nil
            }
        }
        el.next = nil
        el.prev = nil
    }
}


//let ll = LinkList<Int>()
//let a = ll.append(3)
//let b = ll.append(5)
//
//print (a.key)
//ll.delete(a)
//ll.delete(b)
//ll.delete(a)


// ---------------
import Foundation

struct Queue<Element> {
    var array: [Element] = Array<Element>()
    
    var isEmpty:Bool {
        return self.array.count == 0
    }
    
    var count: Int {
        return self.array.count
    }
    
    mutating func enqueue(_ el: Element) {
        array.append(el)
    }
    
    mutating func dequeue() -> Element?{
        if self.count > 0 {
            let el = self.array.first
            self.array.removeFirst()
            return el
        } else {
            return nil
        }
    }
}


//var q = Queue<Int>()
//
//q.enqueue(5)
//q.dequeue()
//q.dequeue()
//q.enqueue(15)
//q.dequeue()
//q.dequeue()


