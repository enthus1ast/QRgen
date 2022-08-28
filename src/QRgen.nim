## # The main QRgen API
##
## The main QRgen API provides a single procedure to create qr codes, `newQR`
## and another procedure to print them to an output format, `print`.
##
## It does also provide the required Types and Defects you may need to
## store the result of both procedures or to pass them arguments.
## You can find those in the `export section<#19>`_.
##
## # Usage example
##
## Here is a basic example to generate a QR code of an URL and show it
## in your terminal:

runnableExamples:
  let urlQR = newQR("https://my-url.domain")
  urlQR.print dpTerminal

import QRgen/private/[QRCode, EncodedQRCode, DrawedQRCode, Drawing, qrTypes]

export QRCode.DataSizeDefect
export DrawedQRCode.DrawedQRCode
export Drawing.DrawingPrint
export qrTypes

proc newQR*(data: string,
            mode: QRMode,
            version: QRVersion,
            ecLevel: QRECLevel = qrECL
           ): DrawedQRCode =
  ## Create a new DrawedQRCode with the specified `mode`, `version` and
  ## `ecLevel` (`qrECL` by default).
  ##
  ## Note: The mode is not checked so make sure to use the correct one.
  ## It's recommended to use another proc which sets the mode automatically
  ## unless you know what you are doing.
  ##
  ## Note: The data size is checked to see if it fits in the specified version
  ## and ecLevel.
  newQRCode(data, mode, version, ecLevel).encode.draw

proc newQR*(data: string,
            version: QRVersion,
            ecLevel: QRECLevel = qrECL
           ): DrawedQRCode =
  ## Create a new DrawedQRCode with the specified `version` and `ecLevel`
  ## (`qrECL` by default).
  ##
  ## Note: The data size is checked to see if it fits in the specified version
  ## and ecLevel.
  newQRCode(data, version, ecLevel).encode.draw

proc newQR*(data: string,
            mode: QRMode,
            ecLevel: QRECLevel = qrECL
           ): DrawedQRCode =
  ## Create a new DrawedQRCode with the specified `mode` and `ecLevel`
  ## (`qrECL` by default).
  ##
  ## Note: The mode is not checked so make sure to use the correct one.
  ## It's recommended to use another proc which sets the mode automatically
  ## unless you know what you are doing.
  newQRCode(data, mode, ecLevel).encode.draw

proc newQR*(data: string,
            ecLevel: QRECLevel = qrECL
           ): DrawedQRCode =
  ## Create a new DrawedQRCode with the specified `ecLevel`
  ## (`qrECL` by default).
  newQRCode(data, ecLevel).encode.draw

proc print*(self: DrawedQRCode, output: DrawingPrint) =
  ## Print a DrawedQRCode to the specified output format.
  ##
  ## Check `DrawingPrint<Drawing.html#DrawingPrint>`_
  ## to see the ones available.
  self.drawing.print output
