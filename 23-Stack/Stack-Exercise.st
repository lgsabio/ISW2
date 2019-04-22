!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'sentenceFinder ooStack ooStackToCompare threeSentencesWithTwoAnswerForFirstPrefix threeSentencesWithTwoAnswerForSecondPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MGS 4/21/2019 23:30:49'!
test01FindSentencesInAnEmptyStackReturnsEmptyCollection

	self assert: (sentenceFinder sentencesBy: 'algo') isEmpty! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MGS 4/22/2019 11:18:59'!
test02FindSentencesWithExistentPrefixReturnsOneSentences
	
	self pushInStack: self answerSentenceForFirstPrefix.
	self assert: (sentenceFinder sentencesBy: self firstPrefix) equals: { self answerSentenceForFirstPrefix.} asOrderedCollection
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MGS 4/22/2019 11:22:10'!
test03FindSentencesWithExistentPrefixReturnsTwoSentences
	
	self pushInStack: self answerSentenceForFirstPrefix;
		pushInStack: self anotherAnswerSentenceForFirstPrefix.
	self assert: (sentenceFinder sentencesBy: self firstPrefix) 
		equals: { self answerSentenceForFirstPrefix. self anotherAnswerSentenceForFirstPrefix.} asOrderedCollection

	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LGS 4/22/2019 13:47:28'!
test04FindSentencesWithExistentPrefixReturnsTwoSentencesInMoreSentencesStack
	
	self pushAllInStack: threeSentencesWithTwoAnswerForFirstPrefix.
	self assert: (sentenceFinder sentencesBy: self firstPrefix) 
		equals: { self answerSentenceForFirstPrefix. self anotherAnswerSentenceForFirstPrefix.} asOrderedCollection! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LGS 4/22/2019 13:43:03'!
test05FindSentencesWithExistentPrefixReturnsOnlySameCaseSentences
	
	self 
		pushInStack:  'esto es una prueba en minuscula';
		pushInStack:  self anotherAnswerSentenceForFirstPrefix.
	self assert: (sentenceFinder sentencesBy: self firstPrefix) equals: {self anotherAnswerSentenceForFirstPrefix.} asOrderedCollection
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LGS 4/22/2019 13:47:45'!
test06FindSentencesWithEmptyPrefixRaiseEmptyPrefixError
	
	self pushAllInStack: threeSentencesWithTwoAnswerForFirstPrefix.
	self should: [sentenceFinder sentencesBy: ''] raise: Error description: SentenceFinderByPrefix  emptyPrefixDescription
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'MGS 4/22/2019 11:37:15'!
test07FindSentencesWithNotExistentPrefixReturnsEmptyCollection
	
	self 
		pushInStack: self answerSentenceForFirstPrefix;
		pushInStack: self anotherAnswerSentenceForFirstPrefix.
	self assert: (sentenceFinder sentencesBy: 'Otro') isEmpty
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LGS 4/22/2019 13:48:00'!
test08FindSentencesWithSpacedPrefixRaisePrefixWithSpacesError
	
	self pushAllInStack: threeSentencesWithTwoAnswerForFirstPrefix.
	self should: [sentenceFinder sentencesBy: 'Algo con espacios'] raise: Error description: SentenceFinderByPrefix  prefixWithSpacesDescription
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LGS 4/22/2019 13:48:26'!
test09FindSentencesWithExistentsPrefixReturnsTwoSentencesInMoreSentencesStack
	
	self pushAllInStack: threeSentencesWithTwoAnswerForFirstPrefix , threeSentencesWithTwoAnswerForSecondPrefix.
	self assert: (sentenceFinder sentencesBy: self firstPrefix) 
		equals: { self answerSentenceForFirstPrefix. self anotherAnswerSentenceForFirstPrefix.} asOrderedCollection.
	self assert: (sentenceFinder sentencesBy: self secondPrefix) 
		equals: { self answerSentenceForSecondPrefix. self anotherAnswerSentenceForSecondPrefix.} asOrderedCollection! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LGS 4/22/2019 13:48:37'!
test10StackDoesNotChangeAfterFindingSenteces
	
	self pushAllInStack: threeSentencesWithTwoAnswerForFirstPrefix.
	sentenceFinder sentencesBy: self firstPrefix.
	self assertStackDoesntChange ! !


!SentenceFinderByPrefixTest methodsFor: 'setUp/tearDown' stamp: 'LGS 4/22/2019 13:46:49'!
setUp

	ooStack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix with: ooStack.
	ooStackToCompare := OOStack new.
	threeSentencesWithTwoAnswerForFirstPrefix := {self answerSentenceForFirstPrefix. 'Otra Oración'. self anotherAnswerSentenceForFirstPrefix}.
	threeSentencesWithTwoAnswerForSecondPrefix := {self answerSentenceForSecondPrefix. 'Otra cosa'. self anotherAnswerSentenceForSecondPrefix}! !

!SentenceFinderByPrefixTest methodsFor: 'setUp/tearDown' stamp: 'MGS 4/21/2019 23:24:20'!
tearDown

	self assertStackDoesntChange! !


!SentenceFinderByPrefixTest methodsFor: 'assertions' stamp: 'LGS 4/19/2019 14:52:52'!
assertStackDoesntChange

	self assert: ooStack size equals: ooStackToCompare size.
	[ooStack isEmpty] whileFalse:[self assert: ooStack pop equals: ooStackToCompare pop].

	! !


!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'MGS 4/22/2019 11:21:46'!
anotherAnswerSentenceForFirstPrefix

	^'Esto es otra prueba'! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'MGS 4/22/2019 11:46:51'!
anotherAnswerSentenceForSecondPrefix

	^'Una ultima sentencia'! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'MGS 4/22/2019 11:19:30'!
answerSentenceForFirstPrefix

	^'Esto es una prueba'! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'MGS 4/22/2019 11:46:01'!
answerSentenceForSecondPrefix
	
	^'Una primera sentencia'! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'MGS 4/22/2019 11:20:03'!
firstPrefix

	^'Esto'! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'MGS 4/22/2019 11:53:39'!
pushAllInStack: anOrderedCollectionOfSentences

	anOrderedCollectionOfSentences do: [:eachSentence | self pushInStack: eachSentence]! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'LGS 4/19/2019 14:51:52'!
pushInStack: aSentence

	ooStack push: aSentence.
	ooStackToCompare  push: aSentence! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'MGS 4/22/2019 11:43:53'!
secondPrefix

	^'Una'! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'collection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'comparing' stamp: 'LGS 4/15/2019 21:36:02'!
initialize
	
	collection := OrderedCollection new! !

!OOStack methodsFor: 'comparing' stamp: 'LGS 4/15/2019 21:21:48'!
isEmpty
	
	^collection  isEmpty! !


!OOStack methodsFor: 'stack' stamp: 'LGS 4/15/2019 21:37:11'!
pop
	
	^self state popFrom: self! !

!OOStack methodsFor: 'stack' stamp: 'LGS 4/15/2019 21:38:19'!
popNotEmptyStack
	
	^collection removeLast

	! !

!OOStack methodsFor: 'stack' stamp: 'LGS 4/15/2019 21:36:36'!
push: anElement

	collection add: anElement! !

!OOStack methodsFor: 'stack' stamp: 'LGS 4/15/2019 21:09:40'!
size
	
	^collection size! !

!OOStack methodsFor: 'stack' stamp: 'LGS 4/15/2019 21:37:47'!
state
	
	^OOStackState of: self! !

!OOStack methodsFor: 'stack' stamp: 'LGS 4/15/2019 21:40:48'!
top
	
	^self state topOf: self! !

!OOStack methodsFor: 'stack' stamp: 'LGS 4/15/2019 21:24:45'!
topNotEmptyStack
	^collection last! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackState category: #'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackState class' category: #'Stack-Exercise'!
OOStackState class
	instanceVariableNames: ''!

!OOStackState class methodsFor: 'as yet unclassified' stamp: 'LGS 4/15/2019 21:34:34'!
isStateOf: anOOStack

	self subclassResponsibility ! !

!OOStackState class methodsFor: 'as yet unclassified' stamp: 'LGS 4/21/2019 14:36:07'!
of: anOOStack
	
	|stateClass|
	stateClass := (self subclasses detect: [:each | each isStateOf: anOOStack] ifNone: [^self error: 'No existe un estado para ' , anOOStack printString]).
	^stateClass new! !


!classDefinition: #OOEmptyStackState category: #'Stack-Exercise'!
OOStackState subclass: #OOEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOEmptyStackState methodsFor: 'comparing' stamp: 'LGS 4/15/2019 21:11:02'!
isEmpty
	^true! !


!OOEmptyStackState methodsFor: 'stack' stamp: 'LGS 4/15/2019 21:25:48'!
popFrom: anOOStack 
	self error: anOOStack class stackEmptyErrorDescription! !

!OOEmptyStackState methodsFor: 'stack' stamp: 'LGS 4/15/2019 21:41:55'!
topOf: anOOStack 
	self error: anOOStack class stackEmptyErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOEmptyStackState class' category: #'Stack-Exercise'!
OOEmptyStackState class
	instanceVariableNames: ''!

!OOEmptyStackState class methodsFor: 'as yet unclassified' stamp: 'LGS 4/15/2019 21:35:02'!
isStateOf: anOOStack

	^anOOStack isEmpty! !


!classDefinition: #OONotEmptyStackState category: #'Stack-Exercise'!
OOStackState subclass: #OONotEmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OONotEmptyStackState methodsFor: 'Stack' stamp: 'LGS 4/15/2019 21:23:11'!
popFrom: anOOStack 
	
	^anOOStack popNotEmptyStack! !

!OONotEmptyStackState methodsFor: 'Stack' stamp: 'LGS 4/15/2019 21:24:16'!
topOf: anOOStack 
	^anOOStack  topNotEmptyStack! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OONotEmptyStackState class' category: #'Stack-Exercise'!
OONotEmptyStackState class
	instanceVariableNames: ''!

!OONotEmptyStackState class methodsFor: 'as yet unclassified' stamp: 'LGS 4/15/2019 21:35:27'!
isStateOf: anOOStack

	^anOOStack isEmpty not! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentencesStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'Operation' stamp: 'LGS 4/21/2019 15:55:58'!
copyStackElementsIn: aCollectionOfsentences
	
	[sentencesStack isEmpty not] whileTrue: [aCollectionOfsentences add: sentencesStack pop].
	aCollectionOfsentences reverseDo:[:sentence | sentencesStack push: sentence].! !

!SentenceFinderByPrefix methodsFor: 'Operation' stamp: 'LGS 4/21/2019 15:56:18'!
sentencesBeginingWith: aValidStringPrefix
	
	| sentences |
	sentences := OrderedCollection new.
	self copyStackElementsIn: sentences.
	^sentences reversed select: [:sentence | sentence beginsWith: aValidStringPrefix]! !

!SentenceFinderByPrefix methodsFor: 'Operation' stamp: 'LGS 4/21/2019 15:44:04'!
sentencesBy: aStringPrefix

	aStringPrefix  isEmpty ifTrue: [^Error signal: self class emptyPrefixDescription].
	(aStringPrefix  includes: Character space) ifTrue: [^Error signal: self class prefixWithSpacesDescription].
	^self sentencesBeginingWith: aStringPrefix! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'LGS 4/21/2019 15:02:43'!
initializeWith: anOOStack

	sentencesStack := anOOStack! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error handling' stamp: 'LGS 4/19/2019 16:09:15'!
emptyPrefixDescription

	^'El prefijo no puede ser vacío'! !

!SentenceFinderByPrefix class methodsFor: 'error handling' stamp: 'LGS 4/19/2019 16:10:25'!
prefixWithSpacesDescription

	^'El prefijo no puede contener espacios'! !

!SentenceFinderByPrefix class methodsFor: 'error handling' stamp: 'LGS 4/21/2019 15:04:40'!
with: anOOStack

	^self new initializeWith: anOOStack! !
