// swiftlint:disable file_types_order

#if canImport(os)
  import os.log
  /// Standard os.log Logger
  public typealias Logger = os.Logger
#else
  import Logging
  /// swift-log Logging.Logger
  public typealias Logger = Logging.Logger
#endif
