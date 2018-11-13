--Title: Company Logo Animation
--Name:Lana ZahrEddin
--Course:ICS3C
--This project animates the company logo on the screen
-----------------------------------------------------------------------------------------

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

--VARIABLES--
local scrollSpeed = 3
local scrollSpeed2 = 5
local textObject
local BarbieSound = audio.loadSound("Sounds/Barbie.mp3")
local BarbieSoundChannel

--create a backgrond image
local backgroundImage = display.newImageRect("Images/background.jpg", display.contentWidth*3, display.contentHeight*3)

--create Go Go Little Pink Subject abd set it's color
textObject = display.newText("Go Go Little Pink", 0, 100, nil, 80)
textObject:setTextColor(165/255, 0/255, 160/255)


--create the company logo and set its x and y of the logo
local companyLogo = display.newImageRect("Images/CompanyLogoLana@2x.png", 400, 500)
companyLogo.x = 1000
companyLogo.y = 570
--set the alphas of the the text object and the logo
companyLogo.alpha = 1
textObject.alpha = 0

--Functions:Move the company logo
--this function adds the scroll speed to the x-value of the logo
local function MoveLogo(event)
	--add the scroll speed to the x-value of the ship
	companyLogo.x = companyLogo.x - scrollSpeed
	--change the transparency of the ship every that it goes faster and fades out
	companyLogo.alpha = companyLogo.alpha - 0.0000000000000008
end

--Functions:Move the text object
--this function adds the scroll speed to the x-value of the text object
local function MoveText(event)
	--add the scroll speed to the x-value of the ship
	textObject.x = textObject.x + scrollSpeed2
	--change the transparency of the ship every that it goes faster and fades out
	textObject.alpha = textObject.alpha + 0.03
end

Runtime:addEventListener("enterFrame", MoveLogo)
Runtime:addEventListener("enterFrame", MoveText)
BarbieSoundChannel = audio.play(BarbieSound)