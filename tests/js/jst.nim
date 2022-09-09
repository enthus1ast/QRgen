import QRgen
import dom

proc qr*(str: string): cstring {.exportc.} =
  let urlQR = newQR(str)
  return urlQR.printSvg.cstring

document.addEventListener("DOMContentLoaded", proc (ev: Event) =
  var qq = document.createElement("div")
  qq.innerHtml = qr("https://nim-lang.org/")
  document.body.appendChild(qq)
)

