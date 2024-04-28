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

# Data Sources
This app uses two data sources to populate the `ListView`
However both data sources use [Cat as a service](https://cataas.com/) to fetch the image for each item in the List and Detail page

## API

This project uses [Cat as a service](https://cataas.com/) in order to showcase state and data-fetching and `/api/cats` to fetch the List data

## JSON

This project uses a provided [JSON](https://github.com/vitorjmoriya/ListDetail/blob/main/ListDetail/Data/data.json) for the initial List data
