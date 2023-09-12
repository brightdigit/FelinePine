#if canImport(os)
  import os.log
  public typealias Logger = os.Logger
#else
  import Logging
  public typealias Logger = Logging.Logger
#endif
