!classDefinition: #CartTest category: #'TusLibros.com'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!CartTest methodsFor: 'testing' stamp: 'LGS 6/1/2019 21:02:20'!
test01NewCartIsEmpty

	|cart|
	cart := Cart catalog: self bookCatalog.
	self assert: cart isEmpty! !

!CartTest methodsFor: 'testing' stamp: 'LGS 6/1/2019 21:52:36'!
test02CartWithABookIsNotEmpty

	|cart|
	cart := Cart catalog: self bookCatalog.
	cart addBook: self inCatalogBook quantity: 1.
	self deny: cart isEmpty! !

!CartTest methodsFor: 'testing' stamp: 'LGS 6/1/2019 21:37:29'!
test03AddNotInCatalogBookToACartShouldRaiseNotInACartError

	|cart|
	cart := Cart catalog: self bookCatalog.
	self 
		should: [cart addBook: self notInCatalogBook quantity: 1]
		raise: Error
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: Cart notInCatalogBookErrorDescription;
				assert: cart isEmpty
			]! !

!CartTest methodsFor: 'testing' stamp: 'MGS 6/2/2019 18:25:07'!
test04AddNotAnIntegerQuantityOfBooksToACartShouldRaiseNotAnIntegerQuantityError

	|cart|
	cart := Cart catalog: self bookCatalog.
	self 
		should: [cart addBook: self inCatalogBook quantity: 1.3]
		raise: Error
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: Cart quantityMustBeAPositiveIntegerErrorDescription;
				assert: cart isEmpty
			]! !

!CartTest methodsFor: 'testing' stamp: 'MGS 6/2/2019 18:26:55'!
test05AddNegativeQuantityOfBooksToACartShouldRaiseNotAPositiveIntegerQuantityError

	|cart|
	cart := Cart catalog: self bookCatalog.
	self 
		should: [cart addBook: self inCatalogBook quantity: -1]
		raise: Error
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: Cart quantityMustBeAPositiveIntegerErrorDescription;
				assert: cart isEmpty
			]! !

!CartTest methodsFor: 'testing' stamp: 'MGS 6/2/2019 18:26:19'!
test06ListBooksInAnEmptyCartShouldReturnAnEmptyCollection
	|cart|
	cart := Cart catalog: self bookCatalog.
	self assert: cart bookList isEmpty! !

!CartTest methodsFor: 'testing' stamp: 'MGS 6/2/2019 18:26:27'!
test07ListBooksInACartWithBooksShouldReturnBooksQuantityAssociations
	|cart|
	cart := Cart catalog: self bookCatalog.
	cart addBook: self inCatalogBook quantity: 3.
	self assert: cart bookList equals: (Dictionary newFromPairs: {self inCatalogBook. 3.})! !

!CartTest methodsFor: 'testing' stamp: 'MGS 6/2/2019 18:26:36'!
test08AddTwoTimesSameBookWithDifferentQuantitiesShouldListTheBookWithAddedQuantities
	|cart|
	cart := Cart catalog: self bookCatalog.
	cart addBook: self inCatalogBook quantity: 3.
	cart addBook: self inCatalogBook quantity: 5.	
	self assert: cart bookList equals: (Dictionary newFromPairs: {self inCatalogBook. 8.})! !

!CartTest methodsFor: 'testing' stamp: 'MGS 6/2/2019 18:26:47'!
test09AddingDifferentsBookShouldListAllTheBookQuantitiesAssociations
	|cart|
	cart := Cart catalog: self bookCatalog.
	cart addBook: self inCatalogBook quantity: 3.
	cart addBook: self anotherInCatalogBook quantity: 5.	
	self assert: cart bookList equals: (Dictionary newFromPairs: {self inCatalogBook. 3. self anotherInCatalogBook. 5.})! !


!CartTest methodsFor: 'books' stamp: 'LGS 6/1/2019 22:16:50'!
anotherInCatalogBook
	^#AdánBuenosayres! !

!CartTest methodsFor: 'books' stamp: 'LGS 6/1/2019 22:17:11'!
bookCatalog
	^BookCatalog with: self inCatalogBook with: self anotherInCatalogBook ! !

!CartTest methodsFor: 'books' stamp: 'LGS 6/1/2019 22:15:56'!
inCatalogBook
	
	^#LosSieteLocos! !

!CartTest methodsFor: 'books' stamp: 'LGS 6/1/2019 22:18:04'!
notInCatalogBook
	^#LasPalabrasYLasCosas! !


!classDefinition: #BookCatalog category: #'TusLibros.com'!
Object subclass: #BookCatalog
	instanceVariableNames: 'booksInCatalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!BookCatalog methodsFor: 'initialization' stamp: 'LGS 6/1/2019 21:06:06'!
initializeWith: aBookToAddInCatalog
 
	booksInCatalog := OrderedCollection with: aBookToAddInCatalog ! !


!BookCatalog methodsFor: 'adding books' stamp: 'LGS 6/1/2019 22:20:34'!
add: aBookToAddInCatalog 
	
	booksInCatalog add: aBookToAddInCatalog ! !

!BookCatalog methodsFor: 'adding books' stamp: 'LGS 6/1/2019 21:46:11'!
add: aBookToAddInCart quantity: aBookQuantity in: aCart 
	
	booksInCatalog detect: [:book | book = aBookToAddInCart] 
		ifFound: [:book | aCart addCataloguedBook: aBookToAddInCart quantity: aBookQuantity]
		ifNone: [aCart raiseNotInCatalogError]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BookCatalog class' category: #'TusLibros.com'!
BookCatalog class
	instanceVariableNames: ''!

!BookCatalog class methodsFor: 'instance creation' stamp: 'LGS 6/1/2019 21:04:54'!
with: aBookToAddInCatalog 
	
	^self new
		initializeWith: aBookToAddInCatalog! !

!BookCatalog class methodsFor: 'instance creation' stamp: 'LGS 6/1/2019 22:19:48'!
with: aBook with: anotherBook 
	
	^(self with: aBook)
		add: anotherBook;
		yourself! !


!classDefinition: #Cart category: #'TusLibros.com'!
Object subclass: #Cart
	instanceVariableNames: 'catalog booksInCart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros.com'!

!Cart methodsFor: 'testing' stamp: 'MGS 6/2/2019 18:23:29'!
assertIsBookQuantityAPositiveInteger: aBookQuantity 
	
	(aBookQuantity isInteger and: [aBookQuantity positive]) 
		ifFalse: [self signalABookQuantityIsNotAPositiveIntegerError]! !

!Cart methodsFor: 'testing' stamp: 'LGS 6/1/2019 20:44:40'!
isEmpty
	^booksInCart isEmpty! !


!Cart methodsFor: 'initialization' stamp: 'LGS 6/1/2019 21:40:34'!
initializeWithCatalog: aBooksCatalog 
	
	catalog := aBooksCatalog.
	booksInCart := Dictionary new! !


!Cart methodsFor: 'adding books' stamp: 'MGS 6/2/2019 18:21:49'!
addBook: aBookToAdd quantity: aBookQuantity
	
	self assertIsBookQuantityAPositiveInteger: aBookQuantity.
	catalog add: aBookToAdd quantity: aBookQuantity in: self! !

!Cart methodsFor: 'adding books' stamp: 'LGS 6/1/2019 21:44:18'!
addCataloguedBook: aCataloguedBook quantity: aBookQuantity  
	
	booksInCart at: aCataloguedBook put: (self quantityOf: aCataloguedBook) + aBookQuantity ! !


!Cart methodsFor: 'listing books' stamp: 'LGS 6/3/2019 07:42:47'!
bookList
	^booksInCart copy! !

!Cart methodsFor: 'listing books' stamp: 'LGS 6/1/2019 21:47:57'!
quantityOf: aBook 
	
	^booksInCart at: aBook ifAbsent: [0]! !


!Cart methodsFor: 'error handling' stamp: 'LGS 6/1/2019 21:49:35'!
raiseNotInCatalogError
	
	Error signal: self class notInCatalogBookErrorDescription ! !

!Cart methodsFor: 'error handling' stamp: 'MGS 6/2/2019 18:24:59'!
signalABookQuantityIsNotAPositiveIntegerError
	Error signal: self class quantityMustBeAPositiveIntegerErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros.com'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'LGS 6/1/2019 20:38:43'!
catalog: aBookCatalog 
	
	^self new
		initializeWithCatalog: aBookCatalog! !


!Cart class methodsFor: 'error handling' stamp: 'LGS 6/1/2019 20:50:00'!
notInCatalogBookErrorDescription
	^'El libro que se quiere agregar no se encuentra en el catalogo.'! !

!Cart class methodsFor: 'error handling' stamp: 'MGS 6/2/2019 18:24:40'!
quantityMustBeAPositiveIntegerErrorDescription
	^'La cantidad de libros a agregar debe ser un entero positivo'! !
