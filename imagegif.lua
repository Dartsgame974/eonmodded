if not fs.exists("package") then shell.run("pastebin get cUYTGbpb package") end
if not fs.exists("GIF") then shell.run("pastebin get 5uk9uRjC GIF") end
if not fs.exists("blittle") then shell.run("pastebin get ujchRSnU blittle") end

os.loadAPI("GIF")
os.loadAPI("blittle")

local fileName, backgroundCol = "image.gif", colours.white

local mon = peripheral.find("monitor")
mon.setTextScale(0.5)
mon.setBackgroundColour(backgroundCol)
mon.clear()

local x, y = mon.getSize()

local image = blittle.shrink(GIF.toPaintutils(GIF.loadGIF(fileName)), backgroundCol)

blittle.draw(image, math.floor((x-image.width)/2)+1, math.floor((y-image.height)/2)+1, mon)
