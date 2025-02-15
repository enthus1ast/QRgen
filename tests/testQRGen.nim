import
  "."/[myTestSuite],
  QRgen

benchmarkTest "Minimal test":
  let qr = newQR("https://github.com/aruZeta/QRgen")
  qr.printTerminal

benchmarkTest "Testing svg":
  let qr = newQR("https://github.com/aruZeta/QRgen")
  echo qr.printSvg

benchmarkTest "Testing svg with colors":
  let qr = newQR("https://github.com/aruZeta/QRgen")
  echo qr.printSvg("#1d2021", "#98971a")

benchmarkTest "Testing rounded svg":
  let qr = newQR("https://github.com/aruZeta/QRgen")
  echo qr.printSvg("#1d2021", "#98971a", alRad = 2)

benchmarkTest "Testing very rounded svg":
  let qr = newQR("https://github.com/aruZeta/QRgen")
  echo qr.printSvg("#1d2021", "#98971a", alRad = 3.5, moRad = 0.4)
