type
  QRMode* = enum
    qrNumericMode      = 0b0001,
    qrAlphanumericMode = 0b0010,
    qrByteMode         = 0b0100,
    # qrECIMode   = 0b0111 (Extended Channel Interpretation) not supported
    # qrKanjiMode = 0b1000                                   not supported

  QRErrorCorrectionLevel {.pure.} = enum
    l, #  7% data recovery
    m, # 15% data recovery
    q, # 25% data recovery
    h  # 30% data recovery

  QRCode* = ref object
    mode*: QRMode
    errorCorrectionLevel*: QRErrorCorrectionLevel
    data*: string
    sideSize*: uint8 # The QR code is a square, all sides have the same size
