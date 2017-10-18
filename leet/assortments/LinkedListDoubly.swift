//
//  LinkedListDoubly.swift
//  leet
//
//  Created by Hoan Tran on 8/18/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import Foundation

class LinkedListDoublyNode {
    var value: String
    var next: LinkedListDoublyNode?
    var prev: LinkedListDoublyNode?
    
    init(value: String) {
        self.value = value
    }
}

extension LinkedListDoublyNode: CustomStringConvertible {
    public var description: String {
        return self.value
    }
}


class LinkedListDoubly {
    var head: LinkedListDoublyNode?
    var tail: LinkedListDoublyNode?
    
    func append(value: String) {
        let newNode = LinkedListDoublyNode(value: value)
        if let _ = self.tail {
            newNode.prev = self.tail
            self.tail?.next = newNode
        } else {
            head = newNode
        }
        self.tail = newNode
    }
    
    func remove(node: LinkedListDoublyNode) {
    }
    
    func node(at: Int) -> LinkedListDoublyNode? {
        if at >= 0 {
            var node = self.head
            var i = at
            
            while node != nil {
                if i == 0 { return node}
                i -= 1
                node = node?.next
            }
        }
        return nil
    }
    
    static func run() {
        let list = LinkedListDoubly()
        print(list)
        list.append(value: "hello")
        list.append(value: "world")
        print(list)
        print(list.node(at: 0) ?? "")
        print(list.node(at: 1) ?? "")
    }
}

extension LinkedListDoubly: CustomStringConvertible {
    public var description: String {
        var text = "[ "
        
        var node = self.head
        
        while node != nil {
            text += "\(node!.value)"
            node = node?.next
            if node != nil {
                text += ", "
            }
        }
        
        return text + " ]"
    }
}
