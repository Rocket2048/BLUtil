//
//  Array+BLExt.swift
//  BLUtil
//
//  Created by lin bo on 2019/3/19.
//  Copyright © 2018-2028 lin bo. All rights reserved.
//

extension Array where Element: Equatable {
  
    /// 删除  重复元素
    public func removedDuplicates() -> [Element] {
        
        return reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }

    /// 数组包含，全部包含:true，否则false
    public func contains(_ elements: [Element]) -> Bool {
        
        for item in elements {
            if contains(item) == false {
                return false
            }
        }
        return true
    }
}

public extension Collection {
    
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
