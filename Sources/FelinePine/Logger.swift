// swiftlint:disable file_types_order

#if canImport(os)
  @preconcurrency import os.log
  /// Standard os.log Logger
  public typealias Logger = os.Logger
#else
  @preconcurrency import Logging
  /// swift-log Logging.Logger
  public typealias Logger = Logging.Logger
#endif
