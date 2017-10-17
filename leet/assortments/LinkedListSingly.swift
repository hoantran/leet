//
//  LinkedListSingly.swift
//  leet1
//
//  Created by Hoan Tran on 8/18/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import Foundation

class LinkedListSinglyNode {
    var value: String
    var next: LinkedListSinglyNode?
    
    init(value: String) {
        self.value = value
    }
}

extension LinkedListSinglyNode: CustomStringConvertible {
    public var description: String {
        return self.value
    }
}


class LinkedListSingly {
    var head: LinkedListSinglyNode?
    var tail: LinkedListSinglyNode?
    
    func append(value: String) {
        let newNode = LinkedListSinglyNode(value: value)
        if let _ = self.tail {
            self.tail?.next = newNode
            self.tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
    }
    
    func delete(node: LinkedListSinglyNode) {
        
    }
    
    func node(at: Int) -> LinkedListSinglyNode? {
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
        let list = LinkedListSingly()
        print(list)
        list.append(value: "hello")
        list.append(value: "world")
        print(list)
        print(list.node(at: 0) ?? "")
        print(list.node(at: 1) ?? "")
    }
}

extension LinkedListSingly: CustomStringConvertible {
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
