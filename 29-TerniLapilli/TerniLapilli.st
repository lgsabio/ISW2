!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:22:57'!
test001PositionTakenAfterPutX

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 1@1.
	self deny: (ternilaPilli isPossitonFreeAt: 1@1)! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:24:05'!
test002PositionFreeIfNotPutXInIt

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 1@1.
	self assert: (ternilaPilli isPossitonFreeAt: 0@0)! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:24:31'!
test003GameShouldStartPuttingX

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	self 
		should: [ternilaPilli putOAt: 1@1] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli notXStartErrorDescription.
			self assert: (ternilaPilli isPossitonFreeAt: 1@1)]
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:25:18'!
test004PuttingXAfterXShouldRaiseAnError

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 1@1.
	self 
		should: [ternilaPilli putXAt: 0@1] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli invalidTurnErrorDescription.
			self assert: (ternilaPilli isPossitonFreeAt: 0@1).
			self deny: (ternilaPilli isPossitonFreeAt: 1@1)]
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:25:42'!
test005PuttingOAfterOShouldRaiseAnError

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 1@1.
	ternilaPilli putOAt: 1@0.
	self 
		should: [ternilaPilli putOAt: 2@1] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli invalidTurnErrorDescription.
			self assert: (ternilaPilli isPossitonFreeAt: 2@1).
			self deny: (ternilaPilli isPossitonFreeAt: 1@0).
			self deny: (ternilaPilli isPossitonFreeAt: 1@1).]
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:26:25'!
test006CantPutOIntoATakenPosition

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 1@1.
	self 
		should: [ternilaPilli putOAt: 1@1] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli positionTakenErrorDescription.
			self deny: (ternilaPilli isPossitonFreeAt: 1@1)]
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:26:41'!
test007CantPutXIntoATakenPosition

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 1@1.
	ternilaPilli putOAt: 2@1.
	self 
		should: [ternilaPilli putXAt: 1@1] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli positionTakenErrorDescription.
			self deny: (ternilaPilli isPossitonFreeAt: 1@1)]
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:27:00'!
test008CantPutOutsideTheBoard

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 1@1.
	self 
		should: [ternilaPilli putOAt: 4@1] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli invalidPositionErrorDescription.
			self deny: (ternilaPilli isPossitonFreeAt: 1@1)]
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/27/2019 13:32:19'!
test009CantPutMoreThanMaximumChips

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 0@1.
	ternilaPilli putOAt: 1@0.
	ternilaPilli putXAt: 0@2.
	ternilaPilli putOAt: 1@2.
	ternilaPilli putXAt: 2@1.
	ternilaPilli putOAt: 2@2.
	self 
		should: [ternilaPilli putXAt: 2@0] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli cantPutAnotherChipErrorDescription]
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/27/2019 13:33:34'!
test010GameIsOverWhenCompleteARow

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 0@0.
	ternilaPilli putOAt: 1@0.
	ternilaPilli putXAt: 0@1.
	ternilaPilli putOAt: 1@2.
	ternilaPilli putXAt: 0@2.

	self 
		should: [ternilaPilli putOAt: 2@0] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli gameOverErrorDescription]
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:29:49'!
test011GameIsOverWhenCompleteDiagonal

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 0@0.
	ternilaPilli putOAt: 1@0.
	ternilaPilli putXAt: 1@1.
	ternilaPilli putOAt: 1@2.
	ternilaPilli putXAt: 2@2.

	self 
		should: [ternilaPilli putOAt: 2@0] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli gameOverErrorDescription]
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:31:16'!
test012NotTakenPostionAfterSlideFromOnePositionToAnother

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 0@1.
	ternilaPilli putOAt: 1@0.
	ternilaPilli putXAt: 0@2.
	ternilaPilli putOAt: 1@2.
	ternilaPilli putXAt: 2@1.
	ternilaPilli putOAt: 2@2.
	ternilaPilli slideFrom: 2@1 to: 2@0.
	self deny: (ternilaPilli isPossitonFreeAt: 2@0)
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:32:05'!
test013CantSlideAnOChipIfNotHisTurn

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 0@1.
	ternilaPilli putOAt: 1@0.
	ternilaPilli putXAt: 0@2.
	ternilaPilli putOAt: 1@2.
	ternilaPilli putXAt: 2@1.
	ternilaPilli putOAt: 2@2.
	self 
		should: [ternilaPilli slideFrom: 1@2 to: 1@1.] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli invalidTurnErrorDescription.
			self assert: (ternilaPilli isPossitonFreeAt: 1@1).]
	

	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:32:35'!
test014CantSlideFromAnInvalidPosition

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 0@1.
	ternilaPilli putOAt: 1@0.
	ternilaPilli putXAt: 0@2.
	ternilaPilli putOAt: 1@2.
	ternilaPilli putXAt: 2@1.
	ternilaPilli putOAt: 2@2.
	self 
		should: [ternilaPilli slideFrom: 0@0 to: 1@1.] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli invalidInitialPositionSlideErrorDescription]
	

	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:33:00'!
test015CantSlideToAnInvalidFinalPosition

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 0@1.
	ternilaPilli putOAt: 1@0.
	ternilaPilli putXAt: 0@2.
	ternilaPilli putOAt: 1@2.
	ternilaPilli putXAt: 2@1.
	ternilaPilli putOAt: 2@2.
	self 
		should: [ternilaPilli slideFrom: 0@1 to: 2@0.] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli invalidFinalPositionSlideErrorDescription]
	

	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:33:21'!
test016CantSlideWhenGameIsOver

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 0@0.
	ternilaPilli putOAt: 0@2.
	ternilaPilli putXAt: 1@1.
	ternilaPilli putOAt: 1@2.
	ternilaPilli putXAt: 0@1.
	ternilaPilli putOAt: 2@2.
	self 
		should: [ternilaPilli slideFrom: 1@1 to: 2@1] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli gameOverErrorDescription.
			self deny: (ternilaPilli isPossitonFreeAt: 1@1).
			self assert: (ternilaPilli isPossitonFreeAt: 2@1) ]
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/26/2019 19:33:58'!
test017CantSlideWithoutAllTheChipsInBoard

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 0@0.
	ternilaPilli putOAt: 1@0.
	ternilaPilli putXAt: 1@1.
	ternilaPilli putOAt: 1@2.
	ternilaPilli putXAt: 2@1.

	self 
		should: [ternilaPilli slideFrom: 1@2 to: 0@2] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli slideWithoutCompleteBoardErrorDescription.
			self deny: (ternilaPilli isPossitonFreeAt: 1@2).
			self assert: (ternilaPilli isPossitonFreeAt: 0@2) ]
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/27/2019 13:34:45'!
test018GameIsOverWhenCompleteColumn

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 0@0.
	ternilaPilli putOAt: 1@1.
	ternilaPilli putXAt: 1@0.
	ternilaPilli putOAt: 1@2.
	ternilaPilli putXAt: 2@0.

	self 
		should: [ternilaPilli putOAt: 0@1] 
		raise:  Error 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TerniLapilli gameOverErrorDescription]
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/27/2019 13:35:48'!
test019GameIsOverInSlidingStage

	| ternilaPilli |
	ternilaPilli := TerniLapilli start.
	ternilaPilli putXAt: 1@1.
	ternilaPilli putOAt: 1@0.
	ternilaPilli putXAt: 0@0.
	ternilaPilli putOAt: 2@2.
	ternilaPilli putXAt: 0@1.
	ternilaPilli putOAt: 2@1.
	ternilaPilli slideFrom: 0@1 to: 0@2.
	ternilaPilli slideFrom: 2@1 to: 2@0.
	ternilaPilli slideFrom: 1@1 to: 0@1.	
	self assert: ternilaPilli isGameOver ! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'board nextChip rules'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'initialization' stamp: 'LGS 5/24/2019 23:10:56'!
initialize

	board := Dictionary new.
	nextChip := self xChip.
	self initializeRules
		
	! !

!TerniLapilli methodsFor: 'initialization' stamp: 'LGS 5/24/2019 22:31:29'!
initializeRules
	
	rules := (self ruleClasses collect: [:aRuleClass | aRuleClass for: self ]) asSortedCollection: [:aRule :anotherRule | aRule order < anotherRule order]! !

!TerniLapilli methodsFor: 'initialization' stamp: 'LGS 5/24/2019 22:28:12'!
ruleClasses

	^self class ruleClasses! !


!TerniLapilli methodsFor: 'testing' stamp: 'LGS 5/24/2019 22:56:02'!
hasChipAt: aBoardPosition 
	
	^(self chipAt: aBoardPosition) notNil! !

!TerniLapilli methodsFor: 'testing' stamp: 'LGS 5/20/2019 20:59:46'!
isBoardComplete
	
	^board size = 6! !

!TerniLapilli methodsFor: 'testing' stamp: 'LGS 5/24/2019 21:09:28'!
isFirstMove
	^board isEmpty! !

!TerniLapilli methodsFor: 'testing' stamp: 'LGS 5/27/2019 13:59:51'!
isGameOver
	
	^self winningRows anySatisfy: [:row | (row allSatisfy: [:position | self xPositions includes: position]) or: [row allSatisfy: [:position | self oPositions includes: position]]]! !

!TerniLapilli methodsFor: 'testing' stamp: 'LGS 5/24/2019 21:12:55'!
isOTurn
	^nextChip = self oChip ! !

!TerniLapilli methodsFor: 'testing' stamp: 'LGS 5/24/2019 21:03:30'!
isPossitonFreeAt: aPoint 
	
	^(board at: aPoint ifAbsent: []) isNil
! !

!TerniLapilli methodsFor: 'testing' stamp: 'LGS 5/24/2019 22:47:02'!
isTurnOfChipAt: aBoardPosition
 
	^nextChip = (self chipAt: aBoardPosition)! !

!TerniLapilli methodsFor: 'testing' stamp: 'LGS 5/24/2019 20:55:31'!
isValidPosition: aBoardPosition 
	^(aBoardPosition between: 0@0 and: 2@2)! !

!TerniLapilli methodsFor: 'testing' stamp: 'LGS 5/24/2019 21:01:17'!
isXTurn
	
	^nextChip = self xChip ! !


!TerniLapilli methodsFor: 'turn' stamp: 'LGS 5/24/2019 23:19:43'!
changeTurn
	
	nextChip :=  self nextTurnFor: nextChip
	
	! !

!TerniLapilli methodsFor: 'turn' stamp: 'LGS 5/24/2019 22:55:31'!
chipAt: aBoardPosition 
	
	^board at: aBoardPosition ifAbsent: []! !

!TerniLapilli methodsFor: 'turn' stamp: 'LGS 5/24/2019 23:21:24'!
nextTurnFor: aChip

	^(Dictionary with: (self xChip->self oChip) with: (self oChip->self xChip)) at: aChip
	
	! !

!TerniLapilli methodsFor: 'turn' stamp: 'LGS 5/24/2019 21:02:07'!
oChip
	
	^$o! !

!TerniLapilli methodsFor: 'turn' stamp: 'LGS 5/27/2019 13:59:06'!
oPositions
	^self positionsOf: self oChip! !

!TerniLapilli methodsFor: 'turn' stamp: 'LGS 5/27/2019 13:54:39'!
positionsOf: aBoardChip
 
	^(board select: [:chip | chip = aBoardChip]) keys
	
	! !

!TerniLapilli methodsFor: 'turn' stamp: 'LGS 5/24/2019 20:59:43'!
xChip
	
	^$x! !

!TerniLapilli methodsFor: 'turn' stamp: 'LGS 5/27/2019 13:48:46'!
xPositions
	
	^self positionsOf: self xChip ! !


!TerniLapilli methodsFor: 'meeting' stamp: 'LGS 5/24/2019 23:40:21'!
validateRulesIn: aMovement
	
	|unfulfilledRules|
	unfulfilledRules := rules reject: [:aRule | aMovement meet: aRule].
	unfulfilledRules do:[:unfulfilledRule | unfulfilledRule notifyErrorOf: aMovement]! !


!TerniLapilli methodsFor: 'moving' stamp: 'LGS 5/24/2019 22:37:56'!
basicPutOAt: aBoardPosition 
	
	board at: aBoardPosition put: self oChip ! !

!TerniLapilli methodsFor: 'moving' stamp: 'LGS 5/24/2019 20:58:22'!
basicPutXAt: aBoardPosition 
	
	board at: aBoardPosition put: self xChip! !

!TerniLapilli methodsFor: 'moving' stamp: 'LGS 5/24/2019 22:50:53'!
basicSlideFrom: startBoardPosition to: finalBoardPosition 
	
	board 
		at: finalBoardPosition put: (self chipAt: startBoardPosition);
		removeKey: startBoardPosition.! !

!TerniLapilli methodsFor: 'moving' stamp: 'LGS 5/24/2019 23:06:58'!
make: aMovement 
	
	self validateRulesIn: aMovement.
	aMovement applyIn: self.
	self changeTurn! !

!TerniLapilli methodsFor: 'moving' stamp: 'LGS 5/24/2019 23:06:38'!
putOAt: aBoardPosition 
	
	self make: (PutOMovement in: aBoardPosition)! !

!TerniLapilli methodsFor: 'moving' stamp: 'LGS 5/24/2019 23:06:46'!
putXAt: aBoardPosition 
	
	self make: (PutXMovement in: aBoardPosition)! !

!TerniLapilli methodsFor: 'moving' stamp: 'LGS 5/24/2019 23:06:00'!
slideFrom: initialPosition to: finalPosition 

	self make: (SlideMovement from: initialPosition to: finalPosition)! !

!TerniLapilli methodsFor: 'moving' stamp: 'LGS 5/20/2019 19:26:41'!
winningRows
	^self class winningRows! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'instance creation' stamp: 'LGS 5/20/2019 17:57:41'!
start
	^self new! !


!TerniLapilli class methodsFor: 'error handling' stamp: 'LGS 5/24/2019 23:38:21'!
cantPutAnotherChipErrorDescription
	^'El tablero está completo, no se pueden agregar más piezas'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'LGS 5/20/2019 19:16:37'!
gameOverErrorDescription
	^'El juego ha terminado'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'LGS 5/20/2019 18:06:34'!
invalidChipErrorDescription
	^'La ficha ingresada no es valida'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'LGS 5/20/2019 20:36:22'!
invalidFinalPositionSlideErrorDescription
	
	^'La posición final del slide es invalida'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'LGS 5/20/2019 20:29:17'!
invalidInitialPositionSlideErrorDescription
	^'La posición inicial del slide es invalida'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'LGS 5/20/2019 18:46:41'!
invalidPositionErrorDescription
	^'Invalid position.'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'LGS 5/20/2019 18:21:32'!
invalidTurnErrorDescription
	
	^'Turno incorrecto'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'LGS 5/20/2019 18:01:30'!
notXStartErrorDescription
	^'La primera pieza tiene que ser "x"'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'LGS 5/20/2019 18:45:50'!
positionTakenErrorDescription
	^'Position taken.'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'LGS 5/20/2019 20:57:07'!
slideWithoutCompleteBoardErrorDescription
	^'No se puede hacer slide si no esta el tablero con todas las fichas'! !


!TerniLapilli class methodsFor: 'meeting' stamp: 'LGS 5/24/2019 22:29:42'!
ruleClasses

	^TerniLapilliRule allSubclasses! !


!TerniLapilli class methodsFor: 'moving' stamp: 'LGS 5/20/2019 19:34:40'!
winningRows
	
	^{{0@0. 0@1. 0@2.}.{1@0. 1@1. 1@2.}.{2@0. 2@1. 2@2.}.
	{0@0. 1@0. 2@0.}.{0@1. 1@1. 2@1.}.{0@2. 1@2. 2@2.}.
	{0@0. 1@1. 2@2.}.{0@2. 1@1. 2@0.}.}! !


!classDefinition: #TerniLapilliMovement category: #TerniLapilli!
Object subclass: #TerniLapilliMovement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliMovement methodsFor: 'testing' stamp: 'LGS 5/24/2019 23:45:56'!
hasPositionTakenIn: aTerniLapilli 

	self subclassResponsibility ! !


!TerniLapilliMovement methodsFor: 'error handling' stamp: 'LGS 5/24/2019 23:45:32'!
completeBoardErrorDescription

	self subclassResponsibility ! !


!TerniLapilliMovement methodsFor: 'moving' stamp: 'LGS 5/24/2019 23:45:06'!
applyIn: aTerniLapilli 
	
	self subclassResponsibility ! !


!TerniLapilliMovement methodsFor: 'meeting' stamp: 'LGS 5/24/2019 23:46:28'!
meet: aTerniLapilliRule 
	self subclassResponsibility.! !


!classDefinition: #PutMovement category: #TerniLapilli!
TerniLapilliMovement subclass: #PutMovement
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PutMovement methodsFor: 'initializing' stamp: 'LGS 5/23/2019 20:00:38'!
initializeIn: aBoardPosition

	position := aBoardPosition ! !


!PutMovement methodsFor: 'error handling' stamp: 'LGS 5/24/2019 23:37:55'!
completeBoardErrorDescription

	^TerniLapilli cantPutAnotherChipErrorDescription! !


!PutMovement methodsFor: 'testing' stamp: 'LGS 5/24/2019 22:36:43'!
hasPositionTakenIn: aTerniLapilli 
	
	^(aTerniLapilli isPossitonFreeAt: position) not! !

!PutMovement methodsFor: 'testing' stamp: 'LGS 5/24/2019 20:54:50'!
isMovingToAValidPositionIn: aTerniLapilli 
	
	^aTerniLapilli isValidPosition: position! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PutMovement class' category: #TerniLapilli!
PutMovement class
	instanceVariableNames: ''!

!PutMovement class methodsFor: 'instance creation' stamp: 'LGS 5/23/2019 19:59:53'!
in: aBoardPosition 
	
	^self new initializeIn: aBoardPosition ! !


!classDefinition: #PutOMovement category: #TerniLapilli!
PutMovement subclass: #PutOMovement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PutOMovement methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:05:02'!
meet: aTerniLapilliRule 
	
	^aTerniLapilliRule isFullfilledByPutOMovement: self! !


!PutOMovement methodsFor: 'moving' stamp: 'LGS 5/24/2019 22:35:26'!
applyIn: aTerniLapilli 
	
	aTerniLapilli basicPutOAt: position! !


!classDefinition: #PutXMovement category: #TerniLapilli!
PutMovement subclass: #PutXMovement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PutXMovement methodsFor: 'meeting' stamp: 'LGS 5/24/2019 20:38:48'!
meet: aTerniLapilliRule 
	
	^aTerniLapilliRule isFullfilledByPutXMovement: self! !


!PutXMovement methodsFor: 'moving' stamp: 'LGS 5/24/2019 22:35:18'!
applyIn: aTerniLapilli 
	
	aTerniLapilli basicPutXAt: position! !


!classDefinition: #SlideMovement category: #TerniLapilli!
TerniLapilliMovement subclass: #SlideMovement
	instanceVariableNames: 'startPosition finalPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!SlideMovement methodsFor: 'initializing' stamp: 'LGS 5/24/2019 21:27:20'!
initializeFrom: startBoardPosition to: finalBoardPosition 
	
	startPosition := startBoardPosition.
	finalPosition := finalBoardPosition ! !


!SlideMovement methodsFor: 'meeting' stamp: 'LGS 5/24/2019 23:37:38'!
completeBoardErrorDescription

	^TerniLapilli slideWithoutCompleteBoardErrorDescription! !

!SlideMovement methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:33:45'!
hasPositionTakenIn: aTerniLapilli 
	
	^aTerniLapilli isPossitonFreeAt: finalPosition ! !

!SlideMovement methodsFor: 'meeting' stamp: 'LGS 5/24/2019 22:55:05'!
isValidInitialPositionIn: aTerniLapilli 
	
	^(aTerniLapilli isValidPosition: startPosition) and: [aTerniLapilli hasChipAt: startPosition] ! !

!SlideMovement methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:28:43'!
meet: aTerniLapilliRule 
	
	^aTerniLapilliRule isFullfilledBySlideMovement: self! !


!SlideMovement methodsFor: 'testing' stamp: 'LGS 5/24/2019 22:45:29'!
isCorrectTurnIn: aTerniLapilli 
	^(aTerniLapilli isTurnOfChipAt: startPosition) ! !

!SlideMovement methodsFor: 'testing' stamp: 'LGS 5/24/2019 23:24:18'!
isValidFinalPositionIn: aTerniLapilli 
	^(aTerniLapilli isValidPosition: finalPosition) and:[self isValidMovement]! !

!SlideMovement methodsFor: 'testing' stamp: 'LGS 5/24/2019 23:26:11'!
isValidMovement

	^(finalPosition - startPosition) abs <= (1@1)

	! !


!SlideMovement methodsFor: 'moving' stamp: 'LGS 5/24/2019 22:49:01'!
applyIn: aTerniLapilli 
	aTerniLapilli basicSlideFrom: startPosition to: finalPosition! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlideMovement class' category: #TerniLapilli!
SlideMovement class
	instanceVariableNames: ''!

!SlideMovement class methodsFor: 'instance creation' stamp: 'LGS 5/24/2019 21:26:18'!
from: startBoardPosition to: finalBoardPosition 
	
	^self new initializeFrom: startBoardPosition to: finalBoardPosition ! !


!classDefinition: #TerniLapilliRule category: #TerniLapilli!
Object subclass: #TerniLapilliRule
	instanceVariableNames: 'terniLapilli'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliRule methodsFor: 'initialization' stamp: 'LGS 5/24/2019 20:33:31'!
initializeWith: aTerniLapilli 
	
	terniLapilli := aTerniLapilli ! !


!TerniLapilliRule methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:05:23'!
isFullfilledByPutOMovement: aPutOMovement 
	self subclassResponsibility ! !

!TerniLapilliRule methodsFor: 'meeting' stamp: 'LGS 5/24/2019 20:39:21'!
isFullfilledByPutXMovement: aPutXMovement 
	self subclassResponsibility ! !

!TerniLapilliRule methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:29:05'!
isFullfilledBySlideMovement: aSlideMovement 
	self subclassResponsibility ! !


!TerniLapilliRule methodsFor: 'error handling' stamp: 'LGS 5/24/2019 22:02:50'!
errorDescription

	self subclassResponsibility ! !

!TerniLapilliRule methodsFor: 'error handling' stamp: 'LGS 5/24/2019 23:35:30'!
errorDescriptionOf: aTerniLapilliMovement

	^self errorDescription ! !

!TerniLapilliRule methodsFor: 'error handling' stamp: 'LGS 5/24/2019 23:42:25'!
notifyErrorOf: aTerniLapilliMovement 
	
	Error signal: (self errorDescriptionOf: aTerniLapilliMovement)! !

!TerniLapilliRule methodsFor: 'error handling' stamp: 'LGS 5/24/2019 22:23:06'!
order

	^self class order! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliRule class' category: #TerniLapilli!
TerniLapilliRule class
	instanceVariableNames: ''!

!TerniLapilliRule class methodsFor: 'instance creation' stamp: 'LGS 5/24/2019 20:32:41'!
for: aTerniLapilli 
	^self new initializeWith: aTerniLapilli ! !

!TerniLapilliRule class methodsFor: 'instance creation' stamp: 'LGS 5/24/2019 22:23:49'!
order
	
	self subclassResponsibility ! !


!classDefinition: #CorrectSlideFinalPosition category: #TerniLapilli!
TerniLapilliRule subclass: #CorrectSlideFinalPosition
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!CorrectSlideFinalPosition methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:10:21'!
isFullfilledByPutOMovement: aPutOMovement 
	^true! !

!CorrectSlideFinalPosition methodsFor: 'meeting' stamp: 'LGS 5/24/2019 20:50:46'!
isFullfilledByPutXMovement: aPutXMovement 
	^true! !

!CorrectSlideFinalPosition methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:35:22'!
isFullfilledBySlideMovement: aSlideMovement 
	^aSlideMovement isValidFinalPositionIn: terniLapilli! !


!CorrectSlideFinalPosition methodsFor: 'error handling' stamp: 'LGS 5/24/2019 22:05:26'!
errorDescription

	^terniLapilli class invalidFinalPositionSlideErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CorrectSlideFinalPosition class' category: #TerniLapilli!
CorrectSlideFinalPosition class
	instanceVariableNames: ''!

!CorrectSlideFinalPosition class methodsFor: 'as yet unclassified' stamp: 'LGS 5/24/2019 22:26:16'!
order

	^6! !


!classDefinition: #CorrectSlideInitialPosition category: #TerniLapilli!
TerniLapilliRule subclass: #CorrectSlideInitialPosition
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!CorrectSlideInitialPosition methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:11:26'!
isFullfilledByPutOMovement: aPutOMovement 
	^true! !

!CorrectSlideInitialPosition methodsFor: 'meeting' stamp: 'LGS 5/24/2019 20:49:58'!
isFullfilledByPutXMovement: aPutXMovement 
	^true! !

!CorrectSlideInitialPosition methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:36:51'!
isFullfilledBySlideMovement: aSlideMovement 
	^aSlideMovement isValidInitialPositionIn: terniLapilli ! !


!CorrectSlideInitialPosition methodsFor: 'error handling' stamp: 'LGS 5/24/2019 22:05:49'!
errorDescription

	^terniLapilli class invalidInitialPositionSlideErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CorrectSlideInitialPosition class' category: #TerniLapilli!
CorrectSlideInitialPosition class
	instanceVariableNames: ''!

!CorrectSlideInitialPosition class methodsFor: 'as yet unclassified' stamp: 'LGS 5/24/2019 22:52:38'!
order

	^2! !


!classDefinition: #CorrectStageOfGame category: #TerniLapilli!
TerniLapilliRule subclass: #CorrectStageOfGame
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!CorrectStageOfGame methodsFor: 'meeting' stamp: 'LGS 5/24/2019 22:08:44'!
isFullfilledByPutOMovement: aPutOMovement 
	^terniLapilli isBoardComplete not! !

!CorrectStageOfGame methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:56:58'!
isFullfilledByPutXMovement: aPutXMovement 
	^terniLapilli isBoardComplete not! !

!CorrectStageOfGame methodsFor: 'meeting' stamp: 'LGS 5/24/2019 22:39:44'!
isFullfilledBySlideMovement: aSlideMovement 
	^terniLapilli isBoardComplete ! !


!CorrectStageOfGame methodsFor: 'error handling' stamp: 'LGS 5/24/2019 23:36:35'!
errorDescriptionOf: aTerniLapilliMovement

	^aTerniLapilliMovement completeBoardErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CorrectStageOfGame class' category: #TerniLapilli!
CorrectStageOfGame class
	instanceVariableNames: ''!

!CorrectStageOfGame class methodsFor: 'as yet unclassified' stamp: 'LGS 5/24/2019 22:24:30'!
order

	^1! !


!classDefinition: #CorrectTurn category: #TerniLapilli!
TerniLapilliRule subclass: #CorrectTurn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!CorrectTurn methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:12:25'!
isFullfilledByPutOMovement: aPutOMovement 
	^terniLapilli isOTurn! !

!CorrectTurn methodsFor: 'meeting' stamp: 'LGS 5/24/2019 20:49:34'!
isFullfilledByPutXMovement: aPutXMovement 
	
	^terniLapilli isXTurn ! !

!CorrectTurn methodsFor: 'meeting' stamp: 'LGS 5/24/2019 22:41:36'!
isFullfilledBySlideMovement: aSlideMovement 
	
	^aSlideMovement isCorrectTurnIn: terniLapilli ! !


!CorrectTurn methodsFor: 'error handling' stamp: 'LGS 5/24/2019 22:06:09'!
errorDescription

	^terniLapilli class invalidTurnErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CorrectTurn class' category: #TerniLapilli!
CorrectTurn class
	instanceVariableNames: ''!

!CorrectTurn class methodsFor: 'as yet unclassified' stamp: 'LGS 5/24/2019 22:52:29'!
order

	^7! !


!classDefinition: #GameIsNotOver category: #TerniLapilli!
TerniLapilliRule subclass: #GameIsNotOver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!GameIsNotOver methodsFor: 'meeting' stamp: 'LGS 5/24/2019 22:09:34'!
isFullfilledByPutOMovement: aPutOMovement 
	
	^terniLapilli isGameOver not! !

!GameIsNotOver methodsFor: 'meeting' stamp: 'LGS 5/24/2019 22:00:00'!
isFullfilledByPutXMovement: aPutXMovement 
	^terniLapilli isGameOver not! !

!GameIsNotOver methodsFor: 'meeting' stamp: 'LGS 5/24/2019 22:09:43'!
isFullfilledBySlideMovement: aSlideMovement 
	^terniLapilli isGameOver not! !


!GameIsNotOver methodsFor: 'error handling' stamp: 'LGS 5/24/2019 22:06:20'!
errorDescription

	^terniLapilli class gameOverErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameIsNotOver class' category: #TerniLapilli!
GameIsNotOver class
	instanceVariableNames: ''!

!GameIsNotOver class methodsFor: 'as yet unclassified' stamp: 'LGS 5/24/2019 22:26:29'!
order

	^8! !


!classDefinition: #GameStartPuttingX category: #TerniLapilli!
TerniLapilliRule subclass: #GameStartPuttingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!GameStartPuttingX methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:08:44'!
isFullfilledByPutOMovement: aPutOMovement 
	^terniLapilli isFirstMove not! !

!GameStartPuttingX methodsFor: 'meeting' stamp: 'LGS 5/24/2019 20:51:23'!
isFullfilledByPutXMovement: aPutXMovement 
	
	^true! !

!GameStartPuttingX methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:31:11'!
isFullfilledBySlideMovement: aSlideMovement 
	^true! !


!GameStartPuttingX methodsFor: 'error handling' stamp: 'LGS 5/24/2019 22:06:58'!
errorDescription

	^terniLapilli class notXStartErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameStartPuttingX class' category: #TerniLapilli!
GameStartPuttingX class
	instanceVariableNames: ''!

!GameStartPuttingX class methodsFor: 'as yet unclassified' stamp: 'LGS 5/24/2019 22:25:18'!
order

	^3! !


!classDefinition: #PositionIsNotTaken category: #TerniLapilli!
TerniLapilliRule subclass: #PositionIsNotTaken
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PositionIsNotTaken methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:43:45'!
isFullfilledByPutOMovement: aPutOMovement 
	^(aPutOMovement hasPositionTakenIn: terniLapilli) not! !

!PositionIsNotTaken methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:43:27'!
isFullfilledByPutXMovement: aPutXMovement 

	^(aPutXMovement hasPositionTakenIn: terniLapilli) not! !

!PositionIsNotTaken methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:32:54'!
isFullfilledBySlideMovement: aSlideMovement 
	
	^aSlideMovement hasPositionTakenIn: terniLapilli ! !


!PositionIsNotTaken methodsFor: 'error handling' stamp: 'LGS 5/24/2019 22:07:30'!
errorDescription

	^terniLapilli class positionTakenErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PositionIsNotTaken class' category: #TerniLapilli!
PositionIsNotTaken class
	instanceVariableNames: ''!

!PositionIsNotTaken class methodsFor: 'as yet unclassified' stamp: 'LGS 5/24/2019 22:25:36'!
order

	^5! !


!classDefinition: #PositionIsValid category: #TerniLapilli!
TerniLapilliRule subclass: #PositionIsValid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PositionIsValid methodsFor: 'meeting' stamp: 'LGS 5/24/2019 21:13:32'!
isFullfilledByPutOMovement: aPutOMovement 
	^aPutOMovement isMovingToAValidPositionIn: terniLapilli ! !

!PositionIsValid methodsFor: 'meeting' stamp: 'LGS 5/24/2019 20:53:38'!
isFullfilledByPutXMovement: aPutXMovement 
	
	^aPutXMovement isMovingToAValidPositionIn: terniLapilli ! !

!PositionIsValid methodsFor: 'meeting' stamp: 'LGS 5/24/2019 22:47:59'!
isFullfilledBySlideMovement: aSlideMovement 
	^true! !


!PositionIsValid methodsFor: 'error handling' stamp: 'LGS 5/24/2019 22:07:15'!
errorDescription

	^terniLapilli class invalidPositionErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PositionIsValid class' category: #TerniLapilli!
PositionIsValid class
	instanceVariableNames: ''!

!PositionIsValid class methodsFor: 'as yet unclassified' stamp: 'LGS 5/24/2019 22:25:27'!
order

	^4! !
