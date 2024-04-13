# ListDetail

Showcases a simple list -> detail example using `MVVM-C` and `SwiftUI`

## Minimum deployment target

iOS 15.0

## Setup

### Prerequisites

- [XCode](https://developer.apple.com/xcode/) -> Apple's IDE
  - [Swift Package Manager](https://www.swift.org/package-manager/) -> Pre-installed with XCode, package manager for iOS libraries
    - [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing) -> Library for snapshot testing
- [Homebrew](https://brew.sh/) -> Package manager for MacOS
  - [SwiftLint](https://github.com/realm/SwiftLint)

### Install dependencies

The only dependency not automatically installed should be `SwiftLint`, in order to install using `Homebrew`:

```bash
brew install swiftlint
```

## API

This project uses [Cat as a service](https://cataas.com/) in order to showcase state and data-fetching
