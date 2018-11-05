--Title: Assignment #5
-- Name:Lana ZahrEddin
--Course:ICS3C
--In this assignment,math questions are displayed.Each time u get an answer wrong u lose a heart and when u lose all hearts
--game over is displayed.If u get 5 right answers you win the game.
-----------------------------------------------------------------------------------------
--------------------------------------------------------------
--LOCAL VARIABLES
-------------------------------------------------------------


--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
local backgroundImage = display.newImageRect( "Images/background.jpg", display.contentWidth*2, display.contentHeight*2 )

--------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------

---The timer variables
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

--create other local variables 
local questionObject
local correctObject
local incorrectObject
local numericField
local gameOver
local lives = 3
local youWin


--create random numbers variables and operator
local randomNumber1
local randomNumber2
local randomNumber3
local randomNumber4
local randomOperator
-----------------------
local userAnswer
local incorrectAnswer
local correctAnswer
local correctText
----------------------
local pointsTextObject
local numberOfPoints = 0

--------------------------------------------------------
-- SOUNDS
--------------------------------------------------------

--Background sound
local gameoverSound = audio.loadSound("Sounds/gameover.mp3")
local gameoverSoundChannel

--Correct sound
local correctSound = audio.loadSound("Sounds/correct.mp3")
local correctSoundChannel

--Incorrect Sound
local incorrectSound = audio.loadSound("Sounds/incorrect.mp3")
local incorrectSoundChannel

--You win Sound
local youWinSound = audio.loadSound("Sounds/youwin.mp3")
local youWinSoundChannel


--------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------

local function UpdateHearts()
	if (lives == 3) then
   		heart1.isVisible = true
   		heart2.isVisible = true
   		heart3.isVisible = true
   		
	elseif (lives == 2) then
   			heart1.isVisible = true
   			heart2.isVisible = true
   			heart3.isVisible = false
   			
	elseif (lives == 1) then
   			heart1.isVisible = true
   			heart2.isVisible = false
   			heart3.isVisible = false
   
   elseif (lives == 0) then
   			heart1.isVisible = false
   			heart2.isVisible = false
   			heart3.isVisible = false

   			timerText.isVisible = false
   			incorrectObject.isVisible = false

   			gameOver.isVisible = true
   			gameoverSoundChannel = audio.play(gameoverSound)

   			numericField.isVisible = false
   			pointsTextObject.isVisible = false
   			questionObject.isVisible = false

   		end

end

---------------------------------------------
----------------
local function CheckPoints( )
		-- monitor points till they reach 5
	if (numberOfPoints == 5) then
		-- display the you win screen
		youWin.isVisible = true

		--make the the unneeded objets invisible
		timerText.isVisible = false
		pointsTextObject.isVisible = false
		questionObject.isVisible = false
		numericField.isVisible = false
		--play youwin sound
		youWinSoundChannel = audio.play(youWinSound)

	
	end
end
--------------------------------------------------------------
local function UpdateTime()
	-- decrement the number of sounds left
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		--reset the  number of seconds left 
		secondsLeft = totalSeconds
		lives = lives - 1

	   --call the function updathearts
   		UpdateHearts()
		
	end
end

---------------------------------------------------------------
--function that calls the timer
local function StartTime()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

---------------------------------------------------------------
-- local functions 
local function AskQuestion()
	--generate 2 random numbers between a max. and a min. number
	randomOperator = math.random(1,5)
	randomNumber1 = math.random(1,20)
	randomNumber2 = math.random(1,20)
	randomNumber3 = math.random(1,10)
	randomNumber4 = math.random(1,100)
	randomNumber5 = math.random(1,100)

 
 	if (randomOperator == 1) then
 		correctAnswer = randomNumber1 + randomNumber2
	
		--create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "


	elseif (randomOperator == 2) then
		if (randomNumber1 < randomNumber2) then
	 	    correctAnswer = randomNumber2 - randomNumber1
	 	    questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "

	 	elseif (randomNumber1 > randomNumber2) then
	 	    correctAnswer = randomNumber1 - randomNumber2
	 	    questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
	 	end    
	


	elseif (randomOperator == 3) then
	 	correctAnswer = randomNumber3 * randomNumber3

		--create question in text object
		questionObject.text = randomNumber3 .. " * " .. randomNumber3 .. " = "


	elseif (randomOperator == 4) then
		correctAnswer = randomNumber4 * randomNumber5 
		temp = randomNumber4
		randomNumber4 = correctAnswer
		correctAnswer = temp
		questionObject.text = randomNumber4 .. " / " .. randomNumber5 .. " = "
	end	

		
end
------------------------------------------
local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end
------------------------------------------
local function HideIncorrect()
	incorrectObject.isVisible = false 
	AskQuestion()
end
------------------------------------------
local function NumericFieldListener( event )

	--User begins editing "numericFeild"
	if ( event.phase == "began" ) then

		--clear text field 
		event.target.text = "" 

	elseif (event.phase == "submitted") then

		-- when the answer is submitted (enter key is pressed) set user input bto user's answer
		userAnswer = tonumber(event.target.text)


		--if the user's answer and the correct answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
            secondsLeft = totalSeconds
			correctObject.isVisible = true 
			timer.performWithDelay(2000, HideCorrect)
			numberOfPoints = numberOfPoints + 1	
			correctSoundChannel = audio.play(correctSound)
			-- create increasing points in the text object
			pointsTextObject.text = "Points = ".. numberOfPoints
			CheckPoints()

		else
			incorrectObject.isVisible = true
			secondsLeft = totalSeconds
			lives = lives - 1
			UpdateHearts()
			timer.performWithDelay(2000, HideIncorrect)
			incorrectSoundChannel = audio.play(incorrectSound)
			incorrectObject.text = "Incorrect,the correct answer is " .. correctAnswer			
		end

		event.target.text = "" 
	end
end

------------------------------------------------------------
--OBJECT CREATION
------------------------------------------------------------

--create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 150,100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 150, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 150, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7



clockText = display.newText(secondsLeft, 750, 650, nil, 170)
clockText:setFillColor( 44/255, 34/255, 186/255 )

--create gameOver image
gameOver = display.newImageRect("Images/Gam.png", display.contentWidth, display.contentHeight)
gameOver.anchorX = 0
gameOver.anchorY = 0
gameOver.isVisible = false

--create youwin image
youWin = display.newImageRect("Images/youwin.jpg", display.contentWidth, display.contentHeight)
youWin.anchorX = 0
youWin.anchorY = 0
youWin.isVisible = false


-- create points box and make it visible
pointsTextObject = display.newText( "Correct *-* = ".. numberOfPoints, 200, 100, nil, 50 )
pointsTextObject:setTextColor(38/255, 13/255, 226/255)

-- display a question and sets the color 
questionObject = display.newText("", display.contentWidth/2, display.contentHeight/2, nil, 160)
questionObject:setTextColor(48/255, 48/255, 21/255)

-- create the correct  text object and make it invisible
correctObject = display.newText("Correct!", display.contentWidth/2, 250, nil, 60)
correctObject:setTextColor(0/255, 225/255, 29/255)
correctObject.isVisible = false

-- create the incorrect  text object and make it invisible
incorrectObject = display.newText("", display.contentWidth/2, 250, nil, 50)
incorrectObject:setTextColor(255/255, 24/255, 189/255)
incorrectObject.isVisible = false

--create timer text
timerText = display.newText( "Your sedond left = ", 330, 680, native.systemFontBold, 60)
timerText:setFillColor( 144/255, 50/255, 16/255 )

--create "The correct answer is ..." text
--correctText = display.newText("The correct answer is ".. correctAnswer, 800, 200, nil, 50)
--correctText:setTextColor(189/255, 200/255, 129/255)
--correctText.isVisible = true

-----------------------------------------------------------
-- CREATE THE NUMERIC FIELD 
------------------------------------------------------------

numericField = native.newTextField(display.contentWidth/2, display.contentHeight*2/3, 300, 100)
numericField.inputType = "default"

--add the event listener fo the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

---------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------
-- call the function to ask the Question
AskQuestion()
StartTime()


