// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum Alert {
    internal enum Error {
      /// Error
      internal static let title = L10n.tr("Localized", "alert.error.title")
      internal enum Button {
        /// Okay
        internal static let title = L10n.tr("Localized", "alert.error.button.title")
      }
    }
  }

  internal enum Calculator {
    internal enum Error {
      internal enum Message {
        /// There was a problem getting the value in dollars. Try again later.
        internal static let genericBitcoinDolarValue = L10n.tr("Localized", "calculator.error.message.generic_bitcoin_dolar_value")
        /// There was a problem getting the location info. Try again later.
        internal static let genericLocationInfo = L10n.tr("Localized", "calculator.error.message.generic_location_info")
        /// There is not internet connection.
        internal static let noInternet = L10n.tr("Localized", "calculator.error.message.no_internet")
      }
    }
    internal enum Loading {
      /// Loading...
      internal static let message = L10n.tr("Localized", "calculator.loading.message")
    }
    internal enum Screen {
      internal enum Error {
        /// Error
        internal static let message = L10n.tr("Localized", "calculator.screen.error.message")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
