-------------------------------------------------------------------------------------------
--Title: AnimatingImages
--Name:Lana ZahrEddin
--Course:ICS3C
--This program images that move in different ways and directions.
-----------------------------------------------------------------------------------------

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables
local backgroundImage = display.newImageRect("Images/space.png", 2048, 1536)
local astronaut = display.newImageRect("Images/astronaut.png", 400, 300)
local earth = display.newImageRect("Images/earth.png", 500, 500)
local scrollSpeed = 4
