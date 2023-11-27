<p align="center">
    <img alt="FelinePine" title="FelinePine" src="Sources/FelinePine/Documentation.docc/Resources/FelinePine.svg" height="250">
</p>
<h1 align="center">FelinePine</h1>

Type-wide **cat**egorized **log**ging.

[![SwiftPM](https://img.shields.io/badge/SPM-Linux%20%7C%20iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-success?logo=swift)](https://swift.org)
[![Twitter](https://img.shields.io/badge/twitter-@brightdigit-blue.svg?style=flat)](http://twitter.com/brightdigit)
![GitHub](https://img.shields.io/github/license/brightdigit/FelinePine)
![GitHub issues](https://img.shields.io/github/issues/brightdigit/FelinePine)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/brightdigit/FelinePine/FelinePine.yml?label=actions&logo=github&?branch=main)

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbrightdigit%2FFelinePine%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/brightdigit/FelinePine)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbrightdigit%2FFelinePine%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/brightdigit/FelinePine)


[![Codecov](https://img.shields.io/codecov/c/github/brightdigit/FelinePine)](https://codecov.io/gh/brightdigit/FelinePine)
[![CodeFactor Grade](https://img.shields.io/codefactor/grade/github/brightdigit/FelinePine)](https://www.codefactor.io/repository/github/brightdigit/FelinePine)
[![codebeat badge](https://codebeat.co/badges/6e03bfba-8c8c-4865-9ea2-4df9a2b94bf4)](https://codebeat.co/projects/github-com-brightdigit-felinepine-main)
[![Code Climate maintainability](https://img.shields.io/codeclimate/maintainability/brightdigit/FelinePine)](https://codeclimate.com/github/brightdigit/FelinePine)
[![Code Climate technical debt](https://img.shields.io/codeclimate/tech-debt/brightdigit/FelinePine?label=debt)](https://codeclimate.com/github/brightdigit/FelinePine)
[![Code Climate issues](https://img.shields.io/codeclimate/issues/brightdigit/FelinePine)](https://codeclimate.com/github/brightdigit/FelinePine)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)

# Table of Contents

* [Introduction](#introduction)
   * [Requirements](#requirements)
   * [Installation](#installation)
* [Usage](#usage)
   * [Getting Started](#getting-started)
   * [Using the Loggable type](#using-the-loggable-type)
   * [Further Documentation](#further-documentation)
* [License](#license)

# Introduction

**FelinePine** provides an easy to use API for setting up logging and log categories across your architecture.

## Requirements 

**Apple Platforms**

- Xcode 14.3.1 or later
- Swift 5.8 or later
- macOS 12 or later deployment targets

**Linux**

- Ubuntu 18.04 or later
- Swift 5.8 or later

## Installation

Use the Swift Package Manager to install this library via the repository url:

```
https://github.com/brightdigit/FelinePine.git
```

Use version up to `1.0.0`.

# Usage

## Getting Started

Create a `LoggingSystem` which defines the categories:

```swift
public enum BushelLogging: LoggingSystem {
  public enum Category: String, CaseIterable {
    case library
    case data
    case view
    case machine
    case application
    case observation
    case market
  }
}
```

The `Category` enum inside must have a `RawType` of `String`.
Additionally if you wish to take advantage of automatically created `Logger` object, 
then you should also have to implment `CaseIterable`.

Now to use your new `LoggingSystem` in any type:

1. Implement `Feline` and `Pine` 
2. Define your `LoggingSystem`
3. Define the `LoggingSystem.Category`

```swift
internal struct VirtualMachine: Loggable {
  internal typealias LoggingSystemType = BushelLogging

  internal static let loggingCategory: BushelLogging.Category = .machine
  
  func run () {
    Self.logger.debug("Starting Run")
    ...
  }
  ...
}
```

## Using the `Loggable` type

You can simplify by using the `Loggable` protocol to create protocol to use throughout your codebase:

```swift
public protocol BushelLoggable: FelinePine.Loggable where Self.LoggingSystemType == BushelLogging {}
```

Now you can simply use the _new_ `Loggable` type:

```swift
internal struct VirtualMachine: BushelLoggable {
  internal static let loggingCategory: BushelLogging.Category = .machine
  
  func run () {
    Self.logger.debug("Starting Run")
    ...
  }
}
```

## Further Documentation

Further documentation is available at [the Swift Package Index.](https://swiftpackageindex.com/brightdigit/FelinePine/1.0.0/documentation/FelinePine)

# License 

This code is distributed under the MIT license. See the [LICENSE](https://github.com/brightdigit/FelinePine/LICENSE) file for more info.
