!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 19:17:40'!
addAndSuspend: aCustomer in: aCustomerBook

	aCustomerBook addCustomerNamed: aCustomer.
	aCustomerBook suspendCustomerNamed: aCustomer
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 19:50:25'!
assertCustomerBook: aCustomerBook hasActiveCustomers: numberOfActiveCustomers suspendedCustomers: numberOfSuspendedCustomers customers: numberOfCustomers
	
	self assert: numberOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: numberOfCustomers equals: aCustomerBook numberOfCustomers

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 19:50:40'!
assertCustomerBook: customerBook hasNumberOfCustomers: numberOfCustomers andIncludesCustomerNamed: nameOfCustomer

	self assert: numberOfCustomers equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: nameOfCustomer) 
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 19:08:46'!
millisecondsToRun: aClosure

	| millisecondsAfterRunning millisecondsBeforeRunning |
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	^millisecondsBeforeRunning - millisecondsAfterRunning! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 19:23:45'!
millisecondsToRun: aClosure shouldNotLastLongerThan: aTimeMeasure

	
	self assert: (self millisecondsToRun: aClosure) < aTimeMeasure
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 19:21:06'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	self millisecondsToRun: [customerBook addCustomerNamed: 'John Lennon'] shouldNotLastLongerThan: 50 * millisecond
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 19:51:09'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	self millisecondsToRun: [customerBook removeCustomerNamed: paulMcCartney]  shouldNotLastLongerThan: 100 * millisecond
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 20:23:04'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	self should: [ customerBook addCustomerNamed: ''] 
		raise: Error 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 20:20:28'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	self should: [ customerBook removeCustomerNamed: 'Paul McCartney'] 
		raise: NotFound 
		withExceptionDo: [ :anError | 
			self assertCustomerBook: customerBook hasNumberOfCustomers: 1 andIncludesCustomerNamed: johnLennon]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 19:41:19'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	self addAndSuspend: paulMcCartney in: customerBook.
	self assertCustomerBook: customerBook hasActiveCustomers: 0 suspendedCustomers: 1 customers: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 19:41:19'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	self addAndSuspend: paulMcCartney in: customerBook.
	customerBook removeCustomerNamed: paulMcCartney.
	self assertCustomerBook: customerBook hasActiveCustomers: 0 suspendedCustomers: 0 customers: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 20:19:06'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	self should: [customerBook suspendCustomerNamed: 'Paul McCartney']  
		raise: CantSuspend  
		withExceptionDo: [ :anError | 
			self assertCustomerBook: customerBook hasNumberOfCustomers: 1 andIncludesCustomerNamed: johnLennon]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LGS 4/4/2019 20:21:54'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	self addAndSuspend: johnLennon in: customerBook.
	self should: [customerBook suspendCustomerNamed: johnLennon] 
		raise: CantSuspend 
		withExceptionDo: [ :anError | 
			self assertCustomerBook: customerBook hasNumberOfCustomers: 1 andIncludesCustomerNamed: johnLennon]! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'LGS 4/4/2019 19:52:19'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'LGS 4/4/2019 19:59:17'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'LGS 4/4/2019 20:02:17'!
removeCustomerNamed: aName 
 
	^active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [NotFound signal]]
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'LGS 4/4/2019 19:59:55'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	active remove: aName.
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/3/2019 10:16:22'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/3/2019 10:16:31'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
