-----------------------------------------------------------------------------------------
--DisplayShapes
--Name: Lana ZahrEddin
--course: ICS3C
--This program displays multiple shapes and their names
-----------------------------------------------------------------------------------------

--Create my local variables
local textSize = 30
local textObject
local areaText
local myRoundedRect
local myPolygon
local widthOfRoundedRectangle = 150
local heighOfRoundedRectangle = 300
local heighOfTriangle = 10
local baseOfTriangle = 7
local myTriangle
local myQuadrilateral
local areaOfRoundedRectangle
local areaOfTriangle
local areaOfPentagon
local sideOfPentagon = 1
--vertices of the polygon
local vertices = { -80,0, -60,80, 60,80, 80,0, 0,-90,  }
--vetices of the triangle
local triangleVertices = { 100,250, 50,500, 250,500, }
--vertices of the octagon
local quadrilateralVertices = { 290,250, 350,450, 590,650, 390,250,  }

--set the background colour of my screen.
display.setDefault("background", 170/255, 160/255, 200/225)

--to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- Create and display a rounded rectangle on the screen with a height of 150 and a width of 300
local myRoundedRect = display.newRoundedRect( 180, 110, heighOfRoundedRectangle, widthOfRoundedRectangle, 80 )
myRoundedRect.strokeWidth = 13
myRoundedRect:setFillColor( 100/255, 100,255, 100,255 )
myRoundedRect:setStrokeColor( 128/255, 135/255, 134/255 )

 --write the name of the first shape which is a rounded rectangle with a text size of 30
textObject = display.newText("Rounded Rectangle", 180, 220 , Arial, textSize)

--calculate the area of the rounded rectangle
local areaOfRoundedRectangle = 3.14 * 10 + widthOfRoundedRectangle * heighOfRoundedRectangle

--display the area of the rounded rectangle on the screen
areaText = display.newText("The area of this rounded rectangle\n with a width of " ..
	widthOfRoundedRectangle .. " and a heigh of " .. heighOfRoundedRectangle .. "\n is " ..
	areaOfRoundedRectangle .. " pixels² . " , 290, 290, Arial, textSize)

--set the color of the newText that says rounded rectangle
textObject:setTextColor (0, 0, 1)

--create and display a new shape on a screen which is a Pentagon
local myPolygon = display.newPolygon( 500, 110, vertices )
myPolygon.strokeWidth = 10
myPolygon:setFillColor( 247/255, 166/255, 4/255 )
myPolygon:setStrokeColor( 229/255, 187/255, 172/255 )

--write the name of the second shape which is a Pentagon with a text size of 30
textObject = display.newText("Regulare Pentagon", 730, 70 , Arial, textSize)

--set the color of the newText that says pentagon 
textObject:setTextColor (1, 0, 1)

--calculate the area of the regular pentagon
areaOfPentagon = 1/4 * math.sqrt( 5 * (5 + 2 * math.sqrt (5)) ) * sideOfPentagon * sideOfPentagon
areaText = display.newText ("The area of this regular\n pentagon\nwith a side of \n" ..
	sideOfPentagon .. " is " .. areaOfPentagon .. " pixels² . " , 800, 170, Arial, textSize)


--create and display a triangle 
local myTriangle = display.newPolygon ( 180, 500, triangleVertices)
myTriangle:setFillColor( 60/255, 20/255, 89/255)

--write the name of the third shape which is a triangle with a text size of 30
textObject = display.newText("triangle", 190, 660, Arial, textSize)
myTriangle.strokeWidth = 12
myTriangle:setStrokeColor(91/255, 74/255, 224/255)

--set the color of the newText that says quadrilateral
textObject:setTextColor (244/255, 212/255, 66/255)
--calculate the area of the triangle
areaOfTriangle = heighOfTriangle * baseOfTriangle / 2

-- display the area of the triangle on the screen
areaText = display.newText("The area  of this triangle with a base of \n" ..
	baseOfTriangle .. " and a heigh of " .. heighOfTriangle .. " is " ..
	areaOfTriangle .. " pixels² . " , 270, 720, Arial, textSize)

--create and display a new shape on the screen which is an quadrilateral
local myQuadrilateral = display.newPolygon ( 600, 550, quadrilateralVertices)
myQuadrilateral:setFillColor(79/255, 206/255, 41/255)
myQuadrilateral.strokeWidth = 13
myQuadrilateral:setStrokeColor(121/255, 175/255, 151/255)
--write the name of the fourth and the last shape which is a quadrilateral and display it on the screen with a text size of 30
textObject = display.newText("quadrilateral", 850, 600, Arial, textSize)

--set the color of the newText that says quadrilateral
textObject:setTextColor (190/255, 11/255, 10/255)
