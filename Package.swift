// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasMediationBigo",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasMediationBigo", targets: ["Yodo1MasMediationBigoTarget"]),
        .library(name: "Yodo1MasMediationBigo-AppLovinMediationBigoAdsAdapter", targets: ["Yodo1MasMediationBigo-AppLovinMediationBigoAdsAdapterTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
        .package(url: "https://github.com/bigo-ads/BigoADS-Swift-Package.git", exact: "6.1.0"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "5.0.0-beta.5"),
    ],
    targets: [
        // ==================== Yodo1MasMediationBigo ====================
        .target(
            name: "Yodo1MasMediationBigoTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationBigo"),
                .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
                .product(name: "BigoADS", package: "BigoADS-Swift-Package"),
            ],
            path: "Sources/Yodo1MasMediationBigoTarget",
            resources: [.copy("Yodo1MasBigo.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasMediationBigo",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationBigo/Yodo1MasMediationBigo-5.0.0-beta.5.zip",
            checksum: "50fd39da27a4c521bde22552efed644fec2b8700df7c1664ee2558d87f7bbef4"
        ),
        // ==================== Yodo1MasMediationBigo-AppLovinMediationBigoAdsAdapter ====================
        .target(
            name: "Yodo1MasMediationBigo-AppLovinMediationBigoAdsAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationBigoTarget"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .target(name: "AppLovinMediationBigoAdsAdapter"),
            ],
            path: "Sources/Yodo1MasMediationBigo-AppLovinMediationBigoAdsAdapterTarget"
        ),
        .binaryTarget(
            name: "AppLovinMediationBigoAdsAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationBigo/AppLovinMediationBigoAdsAdapter-5.0.0-beta.5.zip",
            checksum: "e1f1c9772e0104b43d08d37c354994e388c0a4e8b99223931a6a56df92298c7f"
        ),
    ]
)
