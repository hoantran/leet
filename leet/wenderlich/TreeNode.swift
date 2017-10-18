//
//  TreeNode.swift
//  leet
//
//  Created by Hoan Tran on 10/18/17.
//  Copyright © 2017 Pego Consulting. All rights reserved.
//

import Foundation

class TreeNode<T> {
  weak var parent:TreeNode?
  let value: T
  var children = [TreeNode<T>]()
  
  init(value: T) {
    self.value = value
  }
  
  func add(_ child: TreeNode<T>) {
    self.children.append(child)
    child.parent = self
  }
  
}


extension TreeNode: CustomStringConvertible {
  var description: String {
    var s = "\(value)"
    
    if !children.isEmpty {
      s += " {" + children.map{$0.description}.joined(separator: ", ") + " }"
    }
    
    return s
  }
}

extension TreeNode where T: Equatable {
  func search (_ value: T) -> TreeNode? {
    if value == self.value {
      return self
    }
    for child in self.children {
      if let found = child.search(value) {
        return found
      }
    }
    return nil
  }
}

extension TreeNode {
  static func run() {
    let trunk = TreeNode<String>(value: "Trunk")
    let branchBlue = TreeNode<String>(value: "branch blue")
    let branchRed = TreeNode<String>(value: "branch red")
    trunk.add(branchBlue)
    trunk.add(branchRed)
    
    let twigSmall = TreeNode<String>(value: "twig_small")
    let twigLarge = TreeNode<String>(value: "twig_large")
    let twigSoft = TreeNode<String>(value: "twig_soft")
    let twigLoud = TreeNode<String>(value: "twig_loud")
    branchRed.add(twigSmall)
    branchRed.add(twigLarge)
    branchBlue.add(twigSoft)
    branchBlue.add(twigLoud)

    let leafBrown = TreeNode<String>(value: "leaf_brown")
    let leafYellow = TreeNode<String>(value: "leaf_yellow")
    let leafGreen = TreeNode<String>(value: "leaf_green")
    twigLarge.add(leafBrown)
    twigLoud.add(leafYellow)
    twigSoft.add(leafGreen)
    
    print(trunk)
    
    print(trunk.search("leaf_yellow") ?? "")
  }
}
