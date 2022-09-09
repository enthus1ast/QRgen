import QRgen
import QRgen/private/Drawing
import pixie

proc render(dr: DrawedQRCode, pixelSize = 512, bgColor = rgb(255, 255, 255), fgColor = rgb(0,0,0) ): Image =
  let ss = pixelSize div dr.drawing.size.int
  let wh = vec2(ss.float, ss.float)
  var image = newImage(pixelSize, pixelSize)
  image.fill(bgColor)
  let ctx = newContext(image)
  ctx.fillStyle = fgColor
  ctx.strokeStyle = fgColor
  for yy in 0 ..< dr.drawing.size.int:
    for xx in 0 ..< dr.drawing.size.int:
      if dr.drawing[xx.uint8, yy.uint8]:
        let pos = vec2((xx * ss).float, (yy * ss).float)
        let re = rect(pos, wh)
        echo re
        ctx.fillRect(rect(pos, wh))
  return image

when isMainModule:
  import os
  let urlQR = newQR("hallöäд")
  let img = urlQR.render()
  img.writeFile(getAppDir() / "img.png")