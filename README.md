# KKBOX Open-API Swift SDK Promises Extension

Copyright 2018-2019 KKBOX Technologies Limited

Use KKBOX's Swift SDK in a promising way.

[![Actions Status](https://github.com/KKBOX/OpenAPI-Swift-Promises/workflows/Build/badge.svg)](https://github.com/KKBOX/OpenAPI-Swift-Promises/actions)

## Introduction

The project extends [KKBOX's Open API Swift SDK](https://github.com/KKBOX/OpenAPI-Swift) by adopting Google's [Promisises library](https://github.com/google/promises). it provides an alternative way to do aynchronized API calls.

## Installation

You can only install the extension with Swift Package Manager right now. Please add

``` swift
// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "YourTargetName",
    products: [
        .executable(name: "YourTargetName", targets: ["YourTargetName"])
    ],
    dependencies: [
        .package(url: "https://github.com/KKBOX/OpenAPI-Swift-Promises", .upToNextMinor(from: "1.0.0"))
    ],
    targets: [
        .target(name: "YourTargetName", dependencies: ["KKBOXOpenAPISwift"], path: "./Path/To/Your/Sources")
    ]
)
```

into your `Package.swift` file. And then run `swift package update` under command line.

## Usage

While working with KKBOX's Open API Swift SDK, you may write code with nested callback handling like this:

``` swift
_ = try? self.API.fetchAccessTokenByClientCredential { result in
    switch result {
    case .error(let error):
        print("\(error.localizedDescription)")
    case .success(_):
        _ = try? self.API.fetch(track: "4kxvr3wPWkaL9_y3o_") { result in
            switch result {
            case .error(let error):
                print("\(error.localizedDescription)")
            case .success(let track):
                print("\(track)")
            }
        }
    }
}
```

Promises fix the callback hells. After adding the extension, you can make the code above like this:

``` swift
self.API.fetchAccessTokenByClientCredential().then { _ in
    return self.API.fetch(track: "4kxvr3wPWkaL9_y3o_")
} .then { track in
    print("\(track)")
} .catch { error in
    print("\(error.localizedDescription)")
}
```

## License

Copyright 2018-2019 KKBOX Technologies Limited

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
