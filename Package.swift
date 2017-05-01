// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Avenues+Shallows",
    dependencies: [
        .Package(url: "https://github.com/dreymonde/Avenues.git", majorVersion: 0, minor: 1),
        .Package(url: "https://github.com/dreymonde/Shallows.git", majorVersion: 0, minor: 1),
    ]
)
