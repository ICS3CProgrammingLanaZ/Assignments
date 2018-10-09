-------------------------------------------------------------------------------------------
--Title: AnimatingImages
--Name:Lana ZahrEddin
--Course:ICS3C
--This program displays images that move in different ways and directions.
-----------------------------------------------------------------------------------------

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables
local backgroundImage = display.newImageRect("Images/space.png", 2048, 1536)
local astronaut = display.newImageRect("Images/astronaut.png", 400, 400)
local earth = display.newImageRect("Images/earth.png", 300, 300)
local star = display.newImageRect("Images/star 2.png", 200, 200)
local scrollSpeed1 = 4
local scrollSpeed2 = 5

--set only the earth to be transparent
earth.alpha = 0
astronaut.alpha = 1
star.alpha = 0

--set the initial x and y position of the earth and the astronaut
earth.x = display.contentWidth
earth.y = display.contentHeight*2/3

astronaut.x = 0
astronaut.y = display.contentHeight / 3

star.x = 0
star.y = 0

--Function: MoveEarth 
--Input: this function accepts an event listener
--output: none
--Description: This Function adds the scroll speed to the x-value of the earth
local function MoveEarth(event)
	--add the scroll speed to the x-value of the earth 
	earth.x = earth.x - scrollSpeed1
	--change the transparency of the earth evey time it so it fades out
	earth.alpha = earth.alpha + 0.01
	earth:scale(0.995, 0.995)
end

--MoveEarth will be called over and over again 
Runtime:addEventListener("enterFrame", MoveEarth)

--Function: MoveAstronaut
--Input: this function accepts an event listener
--output: none
--Description: This Function adds the scroll speed to the x-value of the astronaut
local function MoveAstronaut(event)
	--add the scroll speed to the x-value of the earth 
	astronaut.x = astronaut.x + scrollSpeed2
	--change the transparency of the astronaut every time so it fade out
	astronaut.alpha = astronaut.alpha - 0.0000000009
end
Runtime:addEventListener("enterFrame", MoveAstronaut)

--Function: MoveStar
--Input: this function accepts an event listener
--output: none
--Description: This Function adds the scroll speed to the x-value of the star
local function MoveStar(event)
	--add the scroll speed to the x-value of the star
	star.x = star.x + scrollSpeed1
	star.y = star.y + scrollSpeed1
	--change the transparency of the star every time so it fade in
	star.alpha = star.alpha + 0.01
end
Runtime:addEventListener("enterFrame", MoveStar)

--display text on screen that says "Hello Miss Raffin"
textObjectSignature = display.newText("Hello Miss Raffin", 500, 500, nil, 50)