!classDefinition: #NotValidCommand category: #'Mars Rover'!
Error subclass: #NotValidCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!


!classDefinition: #MarsRoverTest category: #'Mars Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover headingNorthAtOriginPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverTest methodsFor: 'setUp/tearDown' stamp: 'LGS 5/13/2019 13:38:43'!
setUp

	headingNorthAtOriginPosition  := NorthHeading at: 0@0.
	marsRover := MarsRover on: headingNorthAtOriginPosition
	
	! !


!MarsRoverTest methodsFor: 'testing' stamp: 'LGS 5/12/2019 17:01:28'!
test07ExecuteRotateLeftAndMoveForward

	marsRover executeCommands: 'lf'.
	self assert: marsRover position equals: (WestHeading at: -1@0) 
	
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LGS 5/12/2019 17:02:09'!
test08ExecuteRotateRightAndMoveForward

	marsRover executeCommands: 'rf'.
	self assert: marsRover position equals: (EastHeading at: 1@0) 
	
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LGS 5/12/2019 17:02:51'!
test09ExecuteRotateLeftAndMoveBackward

	marsRover executeCommands: 'lb'.
	self assert: marsRover position equals: (WestHeading at: 1@0) 
	
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LGS 5/12/2019 17:06:02'!
test10ExecuteRotateRightAndMoveBackward

	marsRover executeCommands: 'rb'.
	self assert: marsRover position equals: (EastHeading at: -1@0) 
	
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LGS 5/12/2019 17:06:43'!
test11ExecuteMoveBackwardAndRotateRight

	marsRover executeCommands: 'br'.
	self assert: marsRover position equals: (EastHeading at: 0@-1)
	
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LGS 5/12/2019 17:07:19'!
test12ExecuteMoveForwardAndRotateRight

	marsRover executeCommands: 'fr'.
	self assert: marsRover position equals: (EastHeading at: 0@1)
	
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LGS 5/12/2019 17:07:48'!
test13ExecuteMoveForwardAndRotateLeft

	marsRover executeCommands: 'fl'.
	self assert: marsRover position equals: (WestHeading at: 0@1)
	
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LGS 5/12/2019 17:09:11'!
test14ExecuteMoveBackwardAndRotateLeft

	marsRover executeCommands: 'bl'.
	self assert: marsRover position equals: (WestHeading at: 0@-1)
	
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LGS 5/12/2019 17:15:20'!
test15ExecuteTwoBackwardMovements

	marsRover executeCommands: 'bb'.
	self assert: marsRover position equals: (NorthHeading at: 0@-2)	
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LGS 5/12/2019 17:15:51'!
test16ExecuteBackwardAndForward

	marsRover executeCommands: 'bf'.
	self assert: marsRover position equals: (NorthHeading at: 0@0)	
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LGS 5/12/2019 17:16:25'!
test17ExecuteForwardAndBackward

	marsRover executeCommands: 'fb'.
	self assert: marsRover position equals: (NorthHeading at: 0@0)	
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'LGS 5/12/2019 17:16:41'!
test18ExecuteManyRotateCommands

	marsRover executeCommands: 'llrrllrl'.
	self assert: marsRover position equals: (SouthHeading at: 0@0)	
	! !


!MarsRoverTest methodsFor: 'tdd' stamp: 'LGS 5/13/2019 13:38:43'!
test00ExecuteEmptyCommandDontMoveNorRotate

	marsRover executeCommands: ''.
	self assert: marsRover position equals: headingNorthAtOriginPosition.
	
	! !

!MarsRoverTest methodsFor: 'tdd' stamp: 'LGS 5/12/2019 17:12:41'!
test01ExecuteForwardMoveForward

	marsRover executeCommands: 'f'.
	self assert: marsRover position equals: (NorthHeading at: 0@1).
	
	! !

!MarsRoverTest methodsFor: 'tdd' stamp: 'LGS 5/12/2019 16:55:24'!
test02ExecuteLeftRotateToLeft

	marsRover executeCommands: 'l'.
	self assert: marsRover position equals: (WestHeading at: 0@0)
	
	! !

!MarsRoverTest methodsFor: 'tdd' stamp: 'LGS 5/12/2019 16:55:24'!
test03ExecuteRightRotateToRight

	marsRover executeCommands: 'r'.
	self assert: marsRover position equals: (EastHeading at: 0@0)
	
	! !

!MarsRoverTest methodsFor: 'tdd' stamp: 'LGS 5/12/2019 16:55:25'!
test04ExecuteBackwardMovesBackward

	marsRover executeCommands: 'b'.
	self assert: marsRover position equals: (NorthHeading at: 0@-1)
	! !

!MarsRoverTest methodsFor: 'tdd' stamp: 'LGS 5/12/2019 21:18:02'!
test05ExecuteInvalidCommandRaiseExceptionAndStopExecuting

	self
		should: [marsRover executeCommands: 'rbpr'] 
		raise: NotValidCommand
		withExceptionDo: [:exception |
			self assert: marsRover position equals: (EastHeading at: -1@0)
			]
	
	
	
	! !

!MarsRoverTest methodsFor: 'tdd' stamp: 'LGS 5/12/2019 17:03:40'!
test06ExecuteTwoForwardCommands

	marsRover executeCommands: 'ff'.
	self assert: marsRover position equals: (NorthHeading at: 0@2)
	
	! !

!MarsRoverTest methodsFor: 'tdd' stamp: 'LGS 5/12/2019 17:18:48'!
test19ExecuteManyMovementCommands

	marsRover executeCommands: 'fbfffffffffffbbbbffbbff'.
	self assert: marsRover position equals: (NorthHeading at: 0@9)
	
	! !

!MarsRoverTest methodsFor: 'tdd' stamp: 'LGS 5/12/2019 17:17:07'!
test20ExecuteManyMovementAndRotateCommands

	marsRover executeCommands: 'fbrfbrfbrfbrllll'.
	self assert: marsRover position equals: (NorthHeading at: 0@0)
	
	! !


!classDefinition: #MarsRover category: #'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'LGS 5/10/2019 21:18:04'!
initializeOn: aMarsRoverPosition
	
	position := aMarsRoverPosition! !


!MarsRover methodsFor: 'command' stamp: 'LGS 5/12/2019 21:20:45'!
executeCommand: commandDescription
	
	commandDescription = $f ifTrue:[^self moveForward].
	commandDescription = $b ifTrue:[^self moveBackward].
	commandDescription = $l ifTrue:[^self rotateLeft].
	commandDescription = $r ifTrue:[^self rotateRight].
	NotValidCommand signal: self class incorrectCommandErrorDescription ! !

!MarsRover methodsFor: 'command' stamp: 'LGS 5/12/2019 21:16:44'!
executeCommands: commandString
	
	commandString do: [:commandDescription | self executeCommand: commandDescription]! !


!MarsRover methodsFor: 'accessing' stamp: 'LGS 5/6/2019 19:47:54'!
position
	
	^position! !


!MarsRover methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:25:14'!
moveBackward
	
	position moveBackward: self! !

!MarsRover methodsFor: 'movement' stamp: 'LGS 5/10/2019 21:50:59'!
moveForward
	
	position moveForward: self! !

!MarsRover methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:02:52'!
moveTo: aMarsRoverPosition 
	position := aMarsRoverPosition! !

!MarsRover methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:11:04'!
rotateLeft
	
	position rotateLeft: self ! !

!MarsRover methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:24:57'!
rotateRight
	
	position rotateRight: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Mars Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LGS 5/10/2019 21:50:11'!
on: aMarsRoverPosition 
	
	^self new initializeOn: aMarsRoverPosition! !


!MarsRover class methodsFor: 'Error Description' stamp: 'LGS 5/6/2019 21:14:16'!
incorrectCommandErrorDescription
	^'Comando erroneo'! !


!classDefinition: #MarsRoversPosition category: #'Mars Rover'!
Object subclass: #MarsRoversPosition
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoversPosition methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:09:39'!
= aMarsRoverPosition

	^self class = aMarsRoverPosition class and: [aMarsRoverPosition isAt: position]! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'MGS 5/12/2019 16:15:40'!
abscissaStep
	
	^self abcissaVersor * self step! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'LGS 5/12/2019 16:58:35'!
advanceInAbscissa
	
	position := position + self abscissaStep! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'LGS 5/12/2019 16:59:16'!
advanceInOrdinate
	
	position := position + self ordinateStep! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'LGS 5/12/2019 17:00:00'!
goBackInAbscissa
	
	position := position - self abscissaStep! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'LGS 5/12/2019 17:00:24'!
goBackInOrdinate
	
	position := position - self ordinateStep! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:08:24'!
hash

	^self class hash xor: position hash! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'LGS 5/9/2019 14:03:30'!
moveBackward: aMarsRover 

	self subclassResponsibility ! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'LGS 5/9/2019 14:03:16'!
moveForward: aMarsRover 

	self subclassResponsibility ! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'MGS 5/12/2019 16:12:08'!
ordinateStep

	^self ordinateVersor * self step! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'LGS 5/12/2019 17:13:08'!
printOn: aStream

	self class printOn: aStream.
	aStream space; nextPutAll: 'at:';space.
	position printOn: aStream! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'LGS 5/9/2019 14:03:05'!
rotateLeft: aMarsRover 

	self subclassResponsibility ! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'LGS 5/9/2019 14:02:58'!
rotateRight: aMarsRover 

	self subclassResponsibility ! !

!MarsRoversPosition methodsFor: 'movement' stamp: 'MGS 5/12/2019 16:15:01'!
step
	"This should be asked to some sort of MarsRoverConfiguration, to simplify the exercise step will be 1"
	^1! !


!MarsRoversPosition methodsFor: 'initialization' stamp: 'LGS 5/10/2019 21:48:25'!
initializeWith: aPostionPoint 
	
	position := aPostionPoint! !


!MarsRoversPosition methodsFor: 'testing' stamp: 'LGS 5/10/2019 22:10:41'!
isAt: aPosition 
	
	^position = aPosition! !


!MarsRoversPosition methodsFor: 'geometry constant' stamp: 'MGS 5/12/2019 16:16:08'!
abcissaVersor
	
	^1@0! !

!MarsRoversPosition methodsFor: 'geometry constant' stamp: 'MGS 5/12/2019 16:13:02'!
ordinateVersor
	
	^0@1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoversPosition class' category: #'Mars Rover'!
MarsRoversPosition class
	instanceVariableNames: 'instance'!

!MarsRoversPosition class methodsFor: 'instance creation' stamp: 'LGS 5/10/2019 21:49:33'!
at: aPositionPoint

	^self new initializeWith: aPositionPoint ! !


!classDefinition: #EastHeading category: #'Mars Rover'!
MarsRoversPosition subclass: #EastHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!EastHeading methodsFor: 'movement' stamp: 'LGS 5/12/2019 17:00:00'!
moveBackward: aMarsRover 
	aMarsRover moveTo: self goBackInAbscissa! !

!EastHeading methodsFor: 'movement' stamp: 'LGS 5/12/2019 16:58:35'!
moveForward: aMarsRover 
	aMarsRover moveTo: self advanceInAbscissa ! !

!EastHeading methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:14:14'!
rotateLeft: aMarsRover 
	aMarsRover moveTo: (NorthHeading at: position)! !

!EastHeading methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:15:16'!
rotateRight: aMarsRover 
	aMarsRover moveTo: (SouthHeading at: position)! !


!classDefinition: #NorthHeading category: #'Mars Rover'!
MarsRoversPosition subclass: #NorthHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!NorthHeading methodsFor: 'movement' stamp: 'LGS 5/12/2019 17:00:25'!
moveBackward: aMarsRover 
	aMarsRover moveTo: self goBackInOrdinate ! !

!NorthHeading methodsFor: 'movement' stamp: 'LGS 5/12/2019 16:59:16'!
moveForward: aMarsRover 
	aMarsRover moveTo: self advanceInOrdinate! !

!NorthHeading methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:15:37'!
rotateLeft: aMarsRover 
	aMarsRover moveTo: (WestHeading at: position)! !

!NorthHeading methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:15:55'!
rotateRight: aMarsRover 
	aMarsRover moveTo: (EastHeading at: position)! !


!classDefinition: #SouthHeading category: #'Mars Rover'!
MarsRoversPosition subclass: #SouthHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!SouthHeading methodsFor: 'movement' stamp: 'LGS 5/12/2019 16:59:16'!
moveBackward: aMarsRover 
	aMarsRover moveTo: self advanceInOrdinate! !

!SouthHeading methodsFor: 'movement' stamp: 'LGS 5/12/2019 17:00:25'!
moveForward: aMarsRover 
	aMarsRover moveTo: self goBackInOrdinate! !

!SouthHeading methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:16:26'!
rotateLeft: aMarsRover 
	aMarsRover moveTo: (EastHeading at: position)! !

!SouthHeading methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:16:42'!
rotateRight: aMarsRover 
	aMarsRover moveTo: (WestHeading at: position)! !


!classDefinition: #WestHeading category: #'Mars Rover'!
MarsRoversPosition subclass: #WestHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!WestHeading methodsFor: 'movement' stamp: 'LGS 5/12/2019 16:58:35'!
moveBackward: aMarsRover 
	aMarsRover moveTo: self advanceInAbscissa ! !

!WestHeading methodsFor: 'movement' stamp: 'LGS 5/12/2019 17:00:00'!
moveForward: aMarsRover 
	aMarsRover moveTo: self goBackInAbscissa! !

!WestHeading methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:17:21'!
rotateLeft: aMarsRover 

	aMarsRover moveTo: (SouthHeading at: position)! !

!WestHeading methodsFor: 'movement' stamp: 'LGS 5/10/2019 22:17:30'!
rotateRight: aMarsRover 

	aMarsRover moveTo: (NorthHeading at: position)! !
