//
//  main.swift
//  ToolTestProject
//
//  Created by Uli Kusterer on 07.12.18.
//  Copyright © 2018 Uli Kusterer. All rights reserved.
//

import ObjectBox


class BusRoute: Entity {
    var id: Id<BusRoute> = 0
    var idTwo: Id<BusRoute> = 0 // objectbox: objectID

    required init() {}
}

func main(_ args: [String]) throws -> Int32 {
    _ = BusRoute()
    
    return 0
}
