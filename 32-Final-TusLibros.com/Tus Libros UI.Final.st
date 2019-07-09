!classDefinition: #TusLibrosClientSessionPresenterTest category: #'Tus Libros UI'!
TestCase subclass: #TusLibrosClientSessionPresenterTest
	instanceVariableNames: 'interfaceBuilder testObjectsFactory model presenter selectedBook quantityMorphSimulator monthMorphSimulator yearMorphSimulator errorMessage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus Libros UI'!

!TusLibrosClientSessionPresenterTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 11:51:29'!
test01ListCartCreatedAnswerAnEmptyList


	presenter createCart.
	presenter cartsIDIndex: 1.
	self assert: (presenter bookListOf: presenter selectedCart ) isEmpty! !

!TusLibrosClientSessionPresenterTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 12:18:28'!
test02ListCartOfCartWithAddedBooksShouldAnswerACorrectList

	presenter createCart.
	presenter cartsIDIndex: 1.
	presenter possibleBooksIndex: (self catalog indexOf: self validBook).
	presenter addBook.
	self assert: ((presenter bookListOf: presenter selectedCart) at: self validBook) equals: quantityMorphSimulator value! !

!TusLibrosClientSessionPresenterTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 12:29:03'!
test03ListPurchassesOfCartWithAddedBooksAfterCheckOutShouldAnswerACorrectList


	presenter createCart.
	presenter cartsIDIndex: 1.
	presenter possibleBooksIndex: (self catalog indexOf: self validBook).
	presenter addBook.
	presenter ccn: self validCreditCardNumber; cco: self validCreditCardOwner.
	presenter checkOutCart .
	self assert: (presenter purchaseList at: self validBook) equals: quantityMorphSimulator value.
	self assert: (presenter purchaseList at: 'Total') equals: (quantityMorphSimulator value * self priceOfValidBook)  ! !

!TusLibrosClientSessionPresenterTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 16:55:10'!
test04ListInenxistentCartShouldRaiseAnError


	self 
		should: [presenter bookListOf: -5] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: interfaceBuilder defaultInterface class invalidCartIDErrorDescription .
			self assert: model cartsID isEmpty
			]
! !

!TusLibrosClientSessionPresenterTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 16:57:42'!
test05ListACartWithDifferentAddedBooksShouldAnswerACorrectList

	presenter createCart.
	presenter cartsIDIndex: 1.
	presenter possibleBooksIndex: (self catalog indexOf: self validBook).
	presenter addBook.
	presenter possibleBooksIndex: (self catalog indexOf: testObjectsFactory anotherItemSellByTheStore).
	presenter addBook.
	self 
		assert: ((model bookListOf: presenter selectedCart) at: self validBook) equals: quantityMorphSimulator value;
		assert: ((model bookListOf: presenter selectedCart) at: testObjectsFactory anotherItemSellByTheStore) equals: quantityMorphSimulator value! !

!TusLibrosClientSessionPresenterTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 17:03:26'!
test06AddNotIntegerQuantityOfBooksShouldRaiseAnError

	presenter createCart.
	presenter cartsIDIndex: 1.
	presenter possibleBooksIndex: (self catalog indexOf: self validBook).
	quantityMorphSimulator setValuableWith: [-4].
	presenter addBook.
	self 
		assert: errorMessage equals: Cart invalidQuantityErrorMessage;
		assert: (presenter bookListOf: presenter selectedCart) isEmpty
! !

!TusLibrosClientSessionPresenterTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 17:07:10'!
test07ListPurchasesOfCartWithDifferentAddedBooksAfterCheckOutShouldAnswerACorrectList

	presenter createCart.
	presenter cartsIDIndex: 1.
	presenter possibleBooksIndex: (self catalog indexOf: self validBook).
	presenter addBook.
	presenter possibleBooksIndex: (self catalog indexOf:  testObjectsFactory anotherItemSellByTheStore).
	presenter addBook.
	presenter ccn: self validCreditCardNumber; cco: self validCreditCardOwner.
	presenter checkOutCart .
	self 
		assert: (presenter purchaseList at: self validBook) equals: quantityMorphSimulator value;
		assert: (presenter purchaseList at: testObjectsFactory anotherItemSellByTheStore) equals: quantityMorphSimulator value;
		assert: (presenter purchaseList at: 'Total') equals: (quantityMorphSimulator value * self priceOfValidBook) + (quantityMorphSimulator value * testObjectsFactory anotherItemSellByTheStorePrice)  
	! !

!TusLibrosClientSessionPresenterTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 17:11:49'!
test08ListPurchasesOfDifferentCartsWithDifferentAddedBooksAfterCheckOutShouldAnswerACorrectList

	presenter 
		createCart;
		cartsIDIndex: 1;
		possibleBooksIndex: (self catalog indexOf: self validBook);
		addBook;
		possibleBooksIndex: (self catalog indexOf:  testObjectsFactory anotherItemSellByTheStore);
		addBook;
		ccn: self validCreditCardNumber; cco: self validCreditCardOwner;
		checkOutCart;
		createCart;
		cartsIDIndex: 2;
		possibleBooksIndex: (self catalog indexOf:  testObjectsFactory anotherItemSellByTheStore);
		addBook;
		possibleBooksIndex: (self catalog indexOf: self validBook);
		addBook;
		ccn: self validCreditCardNumber; cco: self validCreditCardOwner;
		checkOutCart.
	self 
		assert: (presenter purchaseList at: self validBook) equals: quantityMorphSimulator value * 2;
		assert: (presenter purchaseList at: testObjectsFactory anotherItemSellByTheStore) equals: quantityMorphSimulator value * 2;
		assert: (presenter purchaseList at: 'Total') equals: (quantityMorphSimulator value * 2 *self priceOfValidBook) + (quantityMorphSimulator value * 2 * testObjectsFactory anotherItemSellByTheStorePrice)  
	! !

!TusLibrosClientSessionPresenterTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 17:17:48'!
test09ListPurchasesOfCartWithIncorrectCCNShouldRaiseAnError


	presenter 
		createCart;
		cartsIDIndex: 1;
		possibleBooksIndex: (self catalog indexOf: self validBook);
		addBook;
		ccn: testObjectsFactory invalidCreditCardNumber; cco: self validCreditCardOwner;
		checkOutCart.
	self 
		assert: presenter purchaseList isEmpty;
		assert: errorMessage equals: CreditCard invalidCreditCardNumberErrorDescription ! !

!TusLibrosClientSessionPresenterTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 17:18:42'!
test10ListPurchasesOfCartWithIncorrectCCOShouldRaiseAnError


	presenter 
		createCart;
		cartsIDIndex: 1;
		possibleBooksIndex: (self catalog indexOf: self validBook);
		addBook;
		ccn: self validCreditCardNumber; cco: testObjectsFactory invalidCreditCardOwner ;
		checkOutCart.
	self 
		assert: presenter purchaseList isEmpty;
		assert: errorMessage equals: CreditCard invalidCreditCardOwnerErrorDescription ! !

!TusLibrosClientSessionPresenterTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 17:20:41'!
test11ListPurchasesOfCartWithExpiratedCardShouldRaiseAnError


	yearMorphSimulator setValuableWith: [2002].
	presenter 
		createCart;
		cartsIDIndex: 1;
		possibleBooksIndex: (self catalog indexOf: self validBook);
		addBook;
		ccn: self validCreditCardNumber; cco: self validCreditCardOwner;
		checkOutCart.
	self 
		assert: presenter purchaseList isEmpty;
		assert: errorMessage equals: Cashier canNotChargeAnExpiredCreditCardErrorMessage! !


!TusLibrosClientSessionPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 12:15:06'!
catalog
	^interfaceBuilder defaultCatalog keys! !

!TusLibrosClientSessionPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 11:47:21'!
priceOfValidBook
	^testObjectsFactory defaultCatalog at: self validBook ! !

!TusLibrosClientSessionPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 12:41:35'!
setUp
	

	interfaceBuilder := TusLibrosInputInterfaceBuilder new.
	testObjectsFactory := StoreTestObjectsFactory  new.
	model := TusLibrosClientSession forClientID: self validClient authenticatedWith: self validPassword andCatalog: self catalog onWebClient: self webClient.
	quantityMorphSimulator := SimpleNumberEntryMorphSimulator withValue: [5].
	monthMorphSimulator := SimpleNumberEntryMorphSimulator withValue: [self validExpiration monthIndex].
	yearMorphSimulator := SimpleNumberEntryMorphSimulator withValue: [self validExpiration yearNumber].
	presenter := TusLibrosClientSessionPresenter 
						on: model 
						cartList: self 
						possibleBookList: self 
						addedBookList: self 
						quantityMorph: quantityMorphSimulator 
						monthMorph: monthMorphSimulator 
						yearMorph: yearMorphSimulator 
						popUpView: self! !

!TusLibrosClientSessionPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 16:32:18'!
validBook
	^testObjectsFactory itemSellByTheStore! !

!TusLibrosClientSessionPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 11:46:00'!
validClient
	^interfaceBuilder firstValidClient ! !

!TusLibrosClientSessionPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 11:46:12'!
validCreditCardNumber
	^testObjectsFactory validCreditCardNumber ! !

!TusLibrosClientSessionPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 11:46:33'!
validCreditCardOwner
	^testObjectsFactory validCreditCardOwner ! !

!TusLibrosClientSessionPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 11:46:45'!
validExpiration
	^testObjectsFactory validExpirationDate ! !

!TusLibrosClientSessionPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 11:46:57'!
validPassword
	^interfaceBuilder firstValidPassword ! !

!TusLibrosClientSessionPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 11:48:04'!
webClient

	| webClientSimulator |
	webClientSimulator := WebClientServerTestSimulator on: interfaceBuilder defaultInterface.
	^TusLibrosWebClient onURL: 'http://localhost:8080' andWebClient: webClientSimulator.! !


!TusLibrosClientSessionPresenterTest methodsFor: 'morph protocol' stamp: 'LGS 7/8/2019 17:02:19'!
inform: anErrorMessage

	errorMessage := anErrorMessage
	! !

!TusLibrosClientSessionPresenterTest methodsFor: 'morph protocol' stamp: 'LGS 7/8/2019 11:48:46'!
updateList
	! !


!classDefinition: #TusLibrosClientSessionTest category: #'Tus Libros UI'!
TestCase subclass: #TusLibrosClientSessionTest
	instanceVariableNames: 'interfaceBuilder testObjectsFactory model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus Libros UI'!

!TusLibrosClientSessionTest methodsFor: 'testing' stamp: 'LGS 7/7/2019 16:00:54'!
test01ListCartCreatedAnswerAnEmptyList


	model createCart.
	self assert: (model bookListOf: model cartsID first) isEmpty! !

!TusLibrosClientSessionTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 16:28:11'!
test02ListACartWithAddedBooksShouldAnswerACorrectList

	model createCart.
	model add: 5 ofBook: self validBook in: model cartsID first. 
	self assert: ((model bookListOf: model cartsID first) at: self validBook) equals: 5 ! !

!TusLibrosClientSessionTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 16:43:00'!
test03ListPurchasesOfCartWithAddedBooksAfterCheckOutShouldAnswerACorrectList


	model createCart.
	model add: 5 ofBook: self validBook in: model cartsID first. 
	model checkOutCart: model cartsID first withCreditCardNumber: self validCreditCardNumber andCCO: self validCreditCardOwner expiredAt: self validExpiration.
	self assert: (model purchaseList at: self validBook) equals: 5.
	self assert: (model purchaseList at: 'Total') equals: (5 * self priceOfValidBook)  ! !

!TusLibrosClientSessionTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 16:25:08'!
test04ListInenxistentCartShouldRaiseAnError


	self 
		should: [model bookListOf: -5] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: interfaceBuilder defaultInterface class invalidCartIDErrorDescription .
			self assert: model cartsID isEmpty
			]! !

!TusLibrosClientSessionTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 16:30:54'!
test05ListACartWithDifferentAddedBooksShouldAnswerACorrectList

	model createCart.
	model add: 5 ofBook: self validBook in: model cartsID first. 
	model add: 7 ofBook: testObjectsFactory anotherItemSellByTheStore in: model cartsID first. 
	self 
		assert: ((model bookListOf: model cartsID first) at: self validBook) equals: 5;
		assert: ((model bookListOf: model cartsID first) at: testObjectsFactory anotherItemSellByTheStore) equals: 7! !

!TusLibrosClientSessionTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 16:36:50'!
test06AddNotIntegerQuantityOfBooksShouldRaiseAnError

	model createCart.
	self 
		should: [model add: -3 ofBook: self validBook in: model cartsID first] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: Cart invalidQuantityErrorMessage.
			self assert: (model bookListOf: model cartsID first) isEmpty
			]! !

!TusLibrosClientSessionTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 16:43:10'!
test07ListPurchasesOfCartWithDifferentAddedBooksAfterCheckOutShouldAnswerACorrectList


	model createCart.
	model add: 5 ofBook: self validBook in: model cartsID first. 
	model add: 7 ofBook: testObjectsFactory anotherItemSellByTheStore in: model cartsID first. 
	model checkOutCart: model cartsID first withCreditCardNumber: self validCreditCardNumber andCCO: self validCreditCardOwner expiredAt: self validExpiration.
	self assert: (model purchaseList at: self validBook) equals: 5.
	self assert: (model purchaseList at: testObjectsFactory anotherItemSellByTheStore) equals: 7.
	self assert: (model purchaseList at: 'Total') equals: (5 * self priceOfValidBook) + (7 * testObjectsFactory anotherItemSellByTheStorePrice)! !

!TusLibrosClientSessionTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 16:43:17'!
test08ListPurchasesOfDifferentCartsWithDifferentAddedBooksAfterCheckOutShouldAnswerACorrectList


	model createCart.
	model add: 5 ofBook: self validBook in: model cartsID first. 
	model add: 7 ofBook: testObjectsFactory anotherItemSellByTheStore in: model cartsID first. 
	model createCart.
	model add: 1 ofBook: self validBook in: model cartsID second. 
	model add: 3 ofBook: testObjectsFactory anotherItemSellByTheStore in: model cartsID second. 
	model checkOutCart: model cartsID first withCreditCardNumber: self validCreditCardNumber andCCO: self validCreditCardOwner expiredAt: self validExpiration.
	model checkOutCart: model cartsID second withCreditCardNumber: self validCreditCardNumber andCCO: self validCreditCardOwner expiredAt: self validExpiration.
	self assert: (model purchaseList at: self validBook) equals: 6.
	self assert: (model purchaseList at: testObjectsFactory anotherItemSellByTheStore) equals: 10.
	self assert: (model purchaseList at: 'Total') equals: (6 * self priceOfValidBook) + (10 * testObjectsFactory anotherItemSellByTheStorePrice)! !

!TusLibrosClientSessionTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 17:21:09'!
test09ListPurchasesOfCartWithIncorrectCCNShouldRaiseAnError


	model createCart.
	model add: 5 ofBook: self validBook in: model cartsID first. 
	self should: [model 
					checkOutCart: model cartsID first 
					withCreditCardNumber: testObjectsFactory invalidCreditCardNumber 
					andCCO: self validCreditCardOwner 
					expiredAt: self validExpiration.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: CreditCard invalidCreditCardNumberErrorDescription;
				assert: model purchaseList isEmpty
			]
	! !

!TusLibrosClientSessionTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 17:21:25'!
test10ListPurchasesOfCartWithIncorrectCCOShouldRaiseAnError


	model createCart.
	model add: 5 ofBook: self validBook in: model cartsID first. 
	self should: [model 
					checkOutCart: model cartsID first 
					withCreditCardNumber: self validCreditCardNumber 
					andCCO: testObjectsFactory invalidCreditCardOwner
					expiredAt: self validExpiration.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: CreditCard invalidCreditCardOwnerErrorDescription;
				assert: model purchaseList isEmpty
			
			]
	! !

!TusLibrosClientSessionTest methodsFor: 'testing' stamp: 'LGS 7/8/2019 17:21:46'!
test11ListPurchasesOfCartWithExpiratedCardShouldRaiseAnError


	model createCart.
	model add: 5 ofBook: self validBook in: model cartsID first. 
	self should: [model 
					checkOutCart: model cartsID first 
					withCreditCardNumber: self validCreditCardNumber 
					andCCO: self validCreditCardOwner 
					expiredAt: testObjectsFactory expiredDate]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: Cashier canNotChargeAnExpiredCreditCardErrorMessage;
				assert: model purchaseList isEmpty
			]
	! !


!TusLibrosClientSessionTest methodsFor: 'support' stamp: 'LGS 7/8/2019 12:14:55'!
catalog
	^interfaceBuilder defaultCatalog keys! !

!TusLibrosClientSessionTest methodsFor: 'support' stamp: 'LGS 7/7/2019 16:05:01'!
priceOfValidBook
	^testObjectsFactory defaultCatalog at: self validBook ! !

!TusLibrosClientSessionTest methodsFor: 'support' stamp: 'LGS 7/7/2019 16:00:42'!
setUp
	

	interfaceBuilder := TusLibrosInputInterfaceBuilder new.
	testObjectsFactory := StoreTestObjectsFactory  new.
	model := TusLibrosClientSession forClientID: self validClient authenticatedWith: self validPassword andCatalog: self catalog onWebClient: self webClient.! !

!TusLibrosClientSessionTest methodsFor: 'support' stamp: 'LGS 7/8/2019 16:32:04'!
validBook
	^testObjectsFactory itemSellByTheStore ! !

!TusLibrosClientSessionTest methodsFor: 'support' stamp: 'LGS 7/7/2019 14:23:20'!
validClient
	^interfaceBuilder firstValidClient ! !

!TusLibrosClientSessionTest methodsFor: 'support' stamp: 'LGS 7/7/2019 15:27:48'!
validCreditCardNumber
	^testObjectsFactory validCreditCardNumber ! !

!TusLibrosClientSessionTest methodsFor: 'support' stamp: 'LGS 7/7/2019 15:29:20'!
validCreditCardOwner
	^testObjectsFactory validCreditCardOwner ! !

!TusLibrosClientSessionTest methodsFor: 'support' stamp: 'LGS 7/7/2019 15:30:18'!
validExpiration
	^testObjectsFactory validExpirationDate ! !

!TusLibrosClientSessionTest methodsFor: 'support' stamp: 'LGS 7/7/2019 14:23:38'!
validPassword
	^interfaceBuilder firstValidPassword ! !

!TusLibrosClientSessionTest methodsFor: 'support' stamp: 'LGS 7/7/2019 15:57:54'!
webClient

	| webClientSimulator |
	webClientSimulator := WebClientServerTestSimulator on: interfaceBuilder defaultInterface.
	^TusLibrosWebClient onURL: 'http://localhost:8080' andWebClient: webClientSimulator.! !


!classDefinition: #TusLibrosLoginPresenterTest category: #'Tus Libros UI'!
TestCase subclass: #TusLibrosLoginPresenterTest
	instanceVariableNames: 'interfaceBuilder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus Libros UI'!

!TusLibrosLoginPresenterTest methodsFor: 'test login' stamp: 'LGS 7/8/2019 15:02:40'!
test01loginWithCorrectClientAndPasswordAnswerCorrectCatalog

	| model |
	model := TusLibrosLoginPresenter onWebClient: self webClient.
	model clientID: self validClient.
	model password:  self validPassword.
	self assert: model login equals: self catalog ! !

!TusLibrosLoginPresenterTest methodsFor: 'test login' stamp: 'LGS 7/8/2019 16:26:54'!
test02ListCatalogWithinValidAuthenticationNotifyError

	| model |
	model := TusLibrosLoginPresenter onWebClient: self webClient.
	model clientID: self validClient.
	model password:  ''.
	self 
		should:  [model login] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error | self assert: error messageText equals: interfaceBuilder defaultInterface class invalidAuthenticationErrorDescription]! !


!TusLibrosLoginPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 15:02:48'!
catalog
	^interfaceBuilder defaultCatalog keys! !

!TusLibrosLoginPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 11:34:43'!
setUp
	
	interfaceBuilder := TusLibrosInputInterfaceBuilder new.! !

!TusLibrosLoginPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 11:36:21'!
validClient
	^interfaceBuilder firstValidClient ! !

!TusLibrosLoginPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 11:36:33'!
validPassword
	^interfaceBuilder firstValidPassword ! !

!TusLibrosLoginPresenterTest methodsFor: 'support' stamp: 'LGS 7/8/2019 11:35:00'!
webClient

	| webClientSimulator |
	webClientSimulator := WebClientServerTestSimulator on: interfaceBuilder defaultInterface.
	^TusLibrosWebClient onURL: 'http://localhost:8080' andWebClient: webClientSimulator.! !


!classDefinition: #TusLibrosLoginTest category: #'Tus Libros UI'!
TestCase subclass: #TusLibrosLoginTest
	instanceVariableNames: 'interfaceBuilder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus Libros UI'!

!TusLibrosLoginTest methodsFor: 'support' stamp: 'LGS 6/30/2019 20:16:37'!
catalog
	^interfaceBuilder defaultCatalog ! !

!TusLibrosLoginTest methodsFor: 'support' stamp: 'LGS 7/7/2019 13:30:00'!
setUp
	
	interfaceBuilder := TusLibrosInputInterfaceBuilder new.
	
	! !

!TusLibrosLoginTest methodsFor: 'support' stamp: 'LGS 6/30/2019 20:08:46'!
validClient
	^interfaceBuilder firstValidClient ! !

!TusLibrosLoginTest methodsFor: 'support' stamp: 'LGS 6/30/2019 20:09:44'!
validPassword
	^interfaceBuilder firstValidPassword ! !

!TusLibrosLoginTest methodsFor: 'support' stamp: 'LGS 7/7/2019 15:57:30'!
webClient

	| webClientSimulator |
	webClientSimulator := WebClientServerTestSimulator on: interfaceBuilder defaultInterface.
	^TusLibrosWebClient onURL: 'http://localhost:8080' andWebClient: webClientSimulator.! !


!TusLibrosLoginTest methodsFor: 'test login' stamp: 'LGS 7/8/2019 11:34:12'!
test01ListCatalogWithValidAuthenticationAnswerCorrectCatalog

	| model |
	model := TusLibrosLogin forClientID: self validClient authenticatedWith: self validPassword webClient: self webClient.
	self assert: model login equals: self catalog keys ! !

!TusLibrosLoginTest methodsFor: 'test login' stamp: 'LGS 7/8/2019 16:27:36'!
test02ListCatalogWithinValidAuthenticationNotifyError

	| model |
	model := TusLibrosLogin forClientID: self validClient authenticatedWith: '' webClient: self webClient.
	self 
		should:  [model login] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error | self assert: error messageText equals: interfaceBuilder defaultInterface class invalidAuthenticationErrorDescription]! !


!classDefinition: #SimpleNumberEntryMorphSimulator category: #'Tus Libros UI'!
Object subclass: #SimpleNumberEntryMorphSimulator
	instanceVariableNames: 'valuable'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus Libros UI'!

!SimpleNumberEntryMorphSimulator methodsFor: 'initialization' stamp: 'LGS 7/8/2019 12:22:14'!
initializeWithValuableObject: aValuableObject 
	
	valuable := aValuableObject ! !


!SimpleNumberEntryMorphSimulator methodsFor: 'simple number entry morph protocol' stamp: 'LGS 7/8/2019 12:23:21'!
setValue: aSmallInteger 
	! !

!SimpleNumberEntryMorphSimulator methodsFor: 'simple number entry morph protocol' stamp: 'LGS 7/8/2019 12:23:01'!
value

	^valuable value! !


!SimpleNumberEntryMorphSimulator methodsFor: 'accessing' stamp: 'LGS 7/8/2019 17:01:12'!
setValuableWith: aValuableObject 
	
	valuable := aValuableObject ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SimpleNumberEntryMorphSimulator class' category: #'Tus Libros UI'!
SimpleNumberEntryMorphSimulator class
	instanceVariableNames: ''!

!SimpleNumberEntryMorphSimulator class methodsFor: 'instance creation' stamp: 'LGS 7/8/2019 12:21:37'!
withValue: aValuableObject 
	
	^self new
		initializeWithValuableObject: aValuableObject ! !


!classDefinition: #TusLibrosClientSession category: #'Tus Libros UI'!
Object subclass: #TusLibrosClientSession
	instanceVariableNames: 'clientID password catalog webClient cartsID'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus Libros UI'!

!TusLibrosClientSession methodsFor: 'initialization' stamp: 'LGS 7/7/2019 15:51:02'!
initializeForClientID: aLoggedClientID authenticatedWith: authenticationOfLoggedClient andCatalog: sessionCatalog onWebClient: aWebClient
	
		clientID := aLoggedClientID.
		password := authenticationOfLoggedClient.
		catalog := sessionCatalog.
		webClient := aWebClient.
		cartsID := OrderedCollection new! !


!TusLibrosClientSession methodsFor: 'cartCreation' stamp: 'LGS 7/7/2019 14:40:40'!
createCart
	cartsID add: (webClient sendCreateCartWithClient: clientID password: password) ! !


!TusLibrosClientSession methodsFor: 'accessing' stamp: 'LGS 7/7/2019 14:43:24'!
cartsID

	^cartsID! !

!TusLibrosClientSession methodsFor: 'accessing' stamp: 'LGS 7/7/2019 18:06:20'!
catalog

	^catalog! !

!TusLibrosClientSession methodsFor: 'accessing' stamp: 'LGS 7/7/2019 17:34:37'!
clientID

	^clientID! !


!TusLibrosClientSession methodsFor: 'listing books' stamp: 'LGS 7/7/2019 14:44:11'!
bookListOf: aClientID 
	
	^webClient sendListCart: aClientID! !


!TusLibrosClientSession methodsFor: 'adding books' stamp: 'LGS 7/7/2019 15:16:52'!
add: aQuantityOfBooks ofBook: bookToAdd in: aCartID 
	webClient sendAddToCart: aCartID isbn: bookToAdd quantity: aQuantityOfBooks! !


!TusLibrosClientSession methodsFor: 'checking out cart' stamp: 'LGS 7/7/2019 15:32:05'!
checkOutCart: aCartIdToCheckOut withCreditCardNumber: ccnToPayCheckOut andCCO: ccoToPayCheckOut expiredAt: ccExpirationDate 
	
	webClient sendCheckOutCart: aCartIdToCheckOut ccn: ccnToPayCheckOut cced: ccExpirationDate cco: ccoToPayCheckOut! !


!TusLibrosClientSession methodsFor: 'list purchases' stamp: 'LGS 7/7/2019 15:35:11'!
purchaseList
	^webClient sendListPurchasesOfClient: clientID password: password! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientSession class' category: #'Tus Libros UI'!
TusLibrosClientSession class
	instanceVariableNames: ''!

!TusLibrosClientSession class methodsFor: 'instance creation' stamp: 'LGS 7/7/2019 15:53:03'!
defaultWebClient

	^ TusLibrosWebClient onURL: 'http://localhost:8080' andWebClient: WebClient.! !

!TusLibrosClientSession class methodsFor: 'instance creation' stamp: 'LGS 7/7/2019 15:52:09'!
forClientID: aLoggedClientID authenticatedWith: authenticationOfLoggedClient andCatalog: sessionCatalog onWebClient: aWebClient
	^self new
		initializeForClientID: aLoggedClientID authenticatedWith: authenticationOfLoggedClient andCatalog: sessionCatalog onWebClient: aWebClient! !

!TusLibrosClientSession class methodsFor: 'instance creation' stamp: 'LGS 7/7/2019 15:52:45'!
forClientID: aLoggedClientID authenticatedWith: authenticationOfLoggedClient catalog: sessionCatalog 
	^self forClientID: aLoggedClientID authenticatedWith: authenticationOfLoggedClient andCatalog: sessionCatalog onWebClient: self defaultWebClient! !


!classDefinition: #TusLibrosLogin category: #'Tus Libros UI'!
Object subclass: #TusLibrosLogin
	instanceVariableNames: 'clientID password client'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus Libros UI'!

!TusLibrosLogin methodsFor: 'login' stamp: 'LGS 7/8/2019 11:24:15'!
login
	^client sendListCatalogWithClient: clientID password: password! !


!TusLibrosLogin methodsFor: 'initialization' stamp: 'LGS 7/7/2019 15:49:38'!
initializeForClientID: aClientID authenticatedWith: aPasswordToAuthenticate  onWebClient: aWebClient

	clientID  := aClientID.
	password  := aPasswordToAuthenticate.
	client := aWebClient! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosLogin class' category: #'Tus Libros UI'!
TusLibrosLogin class
	instanceVariableNames: ''!

!TusLibrosLogin class methodsFor: 'instance creation' stamp: 'LGS 7/7/2019 15:49:56'!
defaultWebClient

	^ TusLibrosWebClient onURL: 'http://localhost:8080' andWebClient: WebClient.! !

!TusLibrosLogin class methodsFor: 'instance creation' stamp: 'LGS 7/7/2019 15:49:03'!
forClientID: aClientID authenticatedWith: aPasswordToAuthenticate 
	^self forClientID: aClientID authenticatedWith: aPasswordToAuthenticate webClient: self defaultWebClient! !

!TusLibrosLogin class methodsFor: 'instance creation' stamp: 'LGS 7/7/2019 15:48:29'!
forClientID: aClientID authenticatedWith: aPasswordToAuthenticate webClient: aWebClient
	^self new
		initializeForClientID: aClientID authenticatedWith: aPasswordToAuthenticate onWebClient: aWebClient ! !


!classDefinition: #TusLibrosPresenter category: #'Tus Libros UI'!
Object subclass: #TusLibrosPresenter
	instanceVariableNames: 'popUpView'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus Libros UI'!

!TusLibrosPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 10:16:10'!
buttonWithAction: anActionButtonSymbol labeled: aLabelToShowInButton

	^PluggableButtonMorph model: self stateGetter: nil  action: anActionButtonSymbol  label: aLabelToShowInButton! !

!TusLibrosPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 10:45:00'!
columnWithMorphs: morphsToAddInLayoutColumn

	^self layout: LayoutMorph newColumn withMorphs: morphsToAddInLayoutColumn ! !

!TusLibrosPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 11:09:41'!
layout: newLayout withMorphs: morphsToAddInLayoutColumn

	|layout|
	layout := newLayout 
		separation: 5;
		padding: #center;
		yourself.
	morphsToAddInLayoutColumn do: [:morph | layout addMorph: morph].
	^layout! !

!TusLibrosPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 10:45:32'!
rowWithMorphs: morphsToAddInLayoutColumn

	^self layout: LayoutMorph newRow withMorphs: morphsToAddInLayoutColumn! !

!TusLibrosPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 18:28:44'!
textPaneForGetter: aTextGetter setter: aTextSetter labeled: aLabel
	| morph textModel |
	
	textModel := PluggableTextModel on: self..
	textModel textGetter: aTextGetter textSetter: aTextSetter selectionGetter: nil.
	self addDependent: textModel.
	morph:= LimitedHeightTextMorph new.
	morph 
		maxHeight: 68;
		model: textModel.
	morph textMorph setProperty: #keyStroke: toValue: [ :key | morph textMorph acceptContents ].
	morph
		borderWidth: 1;
		askBeforeDiscardingEdits: false;
		morphExtent: 300@25;
		yourself.
	^self columnWithMorphs: {StringMorph contents: aLabel.morph}
! !


!TusLibrosPresenter methodsFor: 'error handling' stamp: 'LGS 7/8/2019 12:33:21'!
executeNotifyingErrors: aClosureToExecuteNotifying

	aClosureToExecuteNotifying on: Error - MessageNotUnderstood do: [:ex| self notifyInPopUp: ex messageText ]! !

!TusLibrosPresenter methodsFor: 'error handling' stamp: 'LGS 7/8/2019 12:36:31'!
notifyInPopUp: anErrorMessageToInform

	popUpView inform: anErrorMessageToInform ! !


!TusLibrosPresenter methodsFor: 'initialization' stamp: 'LGS 7/8/2019 12:46:16'!
initializeWithDefaultPopUpView
	popUpView := PopUpMenu ! !


!classDefinition: #TusLibrosClientSessionPresenter category: #'Tus Libros UI'!
TusLibrosPresenter subclass: #TusLibrosClientSessionPresenter
	instanceVariableNames: 'model cartsIDIndex cartList possibleBooksList addedBooksList possibleBooksIndex addedBooksIndex quantityMorph cco ccn monthMorph yearMorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus Libros UI'!

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 11:04:38'!
addKeyStrokePropertyTo: simpleNumberEntryMorph

	|morph|
	morph := simpleNumberEntryMorph.
	morph setProperty: #keyStroke: toValue: [ :key | morph crAction ifNotNil: [ :thunk | thunk value ] ].
	^morph
	! !

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 18:16:51'!
cartRow
	| addedBooksColumn possibleBooksColumn quantityColumn |
		
	possibleBooksColumn := self 
		columnWithMorphs: {StringMorph contents:'Catalog:'. possibleBooksList. self buttonWithAction: #addBook labeled: 'Add Book'.}.
	addedBooksColumn := self 
		columnWithMorphs: {StringMorph contents:'Added Books'. addedBooksList. self buttonWithAction: #checkOutCart labeled:  'Check Out'.}.
	quantityColumn := self columnWithMorphs: {StringMorph contents:'Quantity:'.quantityMorph .}.
	^self rowWithMorphs: {possibleBooksColumn. quantityColumn. addedBooksColumn}
		! !

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 18:16:57'!
cartsRow
		
	^self rowWithMorphs: {self columnWithMorphs: {StringMorph contents: 'Carts'. cartList. 
								self buttonWithAction: #createCart labeled: 'Create Cart'. 
								self buttonWithAction: #listPurchases labeled: 'List Purchases'.}}
		! !

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 17:26:35'!
createViews

	SystemWindow new
		addMorph: self cartsRow;
		addMorph: self cartRow;
		addMorph: self creditCardRow; 
		openInWorld;
		setLabel: self label;
		morphExtent: 1026.0@648.0;
		yourself! !

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 18:17:05'!
creditCardRow


	| expirationDateColumn |
	expirationDateColumn := self columnWithMorphs: {StringMorph contents:'Expiration Date:'. 
								self rowWithMorphs: {monthMorph. StringMorph contents:'/'. yearMorph.}.}.
	^self rowWithMorphs:{self textPaneForGetter: #ccn setter: #ccn: labeled: 'Credit Card Number:'. 
							self textPaneForGetter: #cco setter: #cco: labeled: 'Credit Card Owner:'. 
							expirationDateColumn }
		! !

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 09:56:19'!
defaultAddedBookList

	^(PluggableListMorph model: self listGetter: #addedBooks indexGetter: #addedBooksIndex indexSetter: #addedBooksIndex:)
		borderWidth: 1;
		yourself
	! !

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 09:45:40'!
defaultCartList

	^(PluggableListMorph model: self listGetter: #cartsID indexGetter: #cartsIDIndex indexSetter: #cartsIDIndex:)
		borderColor: Color skyBlue;
		borderWidth: 1;
		yourself
! !

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 11:05:06'!
defaultMonthMorph

	^self addKeyStrokePropertyTo: (SimpleNumberEntryMorph integerRangeFrom: 1 to: 12 maxNumChars: 2)
	! !

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 09:54:57'!
defaultPossibleBookList

	^(PluggableListMorph model: self listGetter: #possibleBooks indexGetter: #possibleBooksIndex indexSetter: #possibleBooksIndex:)
		borderWidth: 1;
		yourself
	! !

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 11:01:55'!
defaultQuantityMorph

	|morph|
	morph := (SimpleNumberEntryMorph integerDefault: 1 maxNumChars: 8).
	morph setProperty: #keyStroke: toValue: [ :key | morph crAction ifNotNil: [ :thunk | thunk value ] ].
	^morph
	! !

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 11:05:25'!
defaultYearMorph

	^self addKeyStrokePropertyTo: (SimpleNumberEntryMorph integerRangeFrom: 2019 to: 9999 maxNumChars:4)
! !

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/7/2019 17:35:38'!
label
	^'Client Session of: {1}' format: {model clientID.} ! !

!TusLibrosClientSessionPresenter methodsFor: 'views' stamp: 'LGS 7/7/2019 16:43:55'!
open

	self createViews! !


!TusLibrosClientSessionPresenter methodsFor: 'initialization' stamp: 'LGS 7/8/2019 10:41:31'!
initializeOn: aClientSession 
	
	
	self 
		initializeWithModel: aClientSession;
		initializeWithDefaultViews ! !

!TusLibrosClientSessionPresenter methodsFor: 'initialization' stamp: 'LGS 7/8/2019 12:41:03'!
initializeOn: aClientSession cartList: cartListView possibleBookList: possibleBookListView addedBookList: addedBookListView quantityMorph: aQuantityMorph monthMorph: expirationDateMonthMorph yearMorph: expirationDateYearMorph popUpView: aPopUpView 
	
	self initializeWithModel: aClientSession.
	cartList := cartListView.
	possibleBooksList := possibleBookListView.
	addedBooksList := addedBookListView.
	quantityMorph := aQuantityMorph.
	monthMorph := expirationDateMonthMorph.
	yearMorph := expirationDateYearMorph.
	popUpView := aPopUpView ! !

!TusLibrosClientSessionPresenter methodsFor: 'initialization' stamp: 'LGS 7/8/2019 12:37:41'!
initializeWithDefaultViews

	self initializeWithDefaultPopUpView.
	cartList := self defaultCartList.
	possibleBooksList := self defaultPossibleBookList.
	addedBooksList := self defaultAddedBookList.
	quantityMorph := self defaultQuantityMorph.
	monthMorph := self defaultMonthMorph. 
	yearMorph := self defaultYearMorph.! !

!TusLibrosClientSessionPresenter methodsFor: 'initialization' stamp: 'LGS 7/8/2019 10:35:21'!
initializeWithModel: aClientSession 

	model := aClientSession.
	cartsIDIndex := addedBooksIndex := possibleBooksIndex := 0.
	cco := ccn := ''.! !


!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/8/2019 12:24:53'!
addedBooks
	
	| selected |
	self executeNotifyingErrors: [selected := self selectedCart ifNil: [OrderedCollection new] ifNotNil: [:cart | self bookListDescriptionOf: cart]].
	^selected ifNil: [OrderedCollection new]! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 18:10:10'!
addedBooksIndex
	^addedBooksIndex! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 20:05:49'!
addedBooksIndex: aSmallInteger 

	addedBooksIndex _ aSmallInteger! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 17:28:25'!
cartsID
	^model cartsID! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 17:29:01'!
cartsIDIndex
	^cartsIDIndex! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 19:47:58'!
cartsIDIndex: aSmallInteger 

	cartsIDIndex _ aSmallInteger.
	addedBooksList updateList! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 20:59:19'!
ccn
	
	^ccn! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 21:00:43'!
ccn: aText 

	ccn _ aText! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 20:37:38'!
cco
	^cco! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 20:49:57'!
cco: aText 

	cco _ aText! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 21:02:58'!
expiredDate
	^Month month: monthMorph value year: yearMorph value! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 18:06:09'!
possibleBooks
	^model catalog! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 18:09:35'!
possibleBooksIndex
	^possibleBooksIndex! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 18:24:42'!
possibleBooksIndex: aSmallInteger 

	possibleBooksIndex _ aSmallInteger.
	addedBooksList updateList! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 19:31:57'!
quantity
	^quantityMorph value! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 18:22:52'!
selectedBook
	^model catalog at: possibleBooksIndex ifAbsent: []! !

!TusLibrosClientSessionPresenter methodsFor: 'accessing' stamp: 'LGS 7/8/2019 11:43:56'!
selectedCart
	^model cartsID at: cartsIDIndex ifAbsent: []! !


!TusLibrosClientSessionPresenter methodsFor: 'model protocol' stamp: 'LGS 7/8/2019 11:43:56'!
addBook

	self executeNotifyingErrors: [
		model add: self quantity ofBook: self selectedBook in: self selectedCart. 
		addedBooksList updateList.
		quantityMorph setValue: 1] ! !

!TusLibrosClientSessionPresenter methodsFor: 'model protocol' stamp: 'LGS 7/8/2019 12:25:33'!
bookListDescriptionOf: aCartID 

	| list |
	list := OrderedCollection new.
	(self bookListOf: aCartID) associationsDo: [:association | list add: association value asString , ' of: ' , association key].
	^list
	
	! !

!TusLibrosClientSessionPresenter methodsFor: 'model protocol' stamp: 'LGS 7/8/2019 12:25:55'!
bookListOf: aCartID
	
	^model bookListOf: aCartID! !

!TusLibrosClientSessionPresenter methodsFor: 'model protocol' stamp: 'LGS 7/8/2019 12:33:21'!
checkOutCart
	self executeNotifyingErrors: [model 
									checkOutCart: self selectedCart withCreditCardNumber: ccn andCCO: cco expiredAt: self expiredDate.
									self notifyInPopUp: ('Check out of: {1} with credit card number: {2}' format: {self selectedCart. ccn.}) ]! !

!TusLibrosClientSessionPresenter methodsFor: 'model protocol' stamp: 'LGS 7/7/2019 19:43:50'!
createCart
	self executeNotifyingErrors: [model createCart. cartList updateList]
	! !

!TusLibrosClientSessionPresenter methodsFor: 'model protocol' stamp: 'LGS 7/9/2019 10:41:01'!
listPurchases
	| list |

	list := self purchaseList.
	Transcript clearAll.
	Transcript nextPutAll: 'Resume Of: '; nextPutAll: model clientID;cr.
	model catalog do: [ :book | 
		Transcript 
			nextPutAll: book; 
			nextPutAll: ' quantity: '; 
			nextPutAll: (list at: book ifAbsent: [0]) asString;
			cr ].
	Transcript nextPutAll: 'Total Amount: '; nextPutAll: (list at: 'Total' ifAbsent: [0]) asString.
	TranscriptWindow openTranscript ! !

!TusLibrosClientSessionPresenter methodsFor: 'model protocol' stamp: 'LGS 7/8/2019 12:29:53'!
purchaseList.
	
	^model purchaseList ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientSessionPresenter class' category: #'Tus Libros UI'!
TusLibrosClientSessionPresenter class
	instanceVariableNames: ''!

!TusLibrosClientSessionPresenter class methodsFor: 'instance creation' stamp: 'LGS 7/7/2019 16:21:14'!
on: aClientSession

	^self new initializeOn: aClientSession! !

!TusLibrosClientSessionPresenter class methodsFor: 'instance creation' stamp: 'LGS 7/8/2019 12:39:48'!
on: aClientSession cartList: cartListView possibleBookList: possibleBookListView addedBookList: addedBookListView quantityMorph: aQuantityMorph monthMorph: expirationDateMonthMorph yearMorph: expirationDateYearMorph popUpView: popUpView 

	^self new 
		initializeOn: aClientSession 
		cartList: cartListView 
		possibleBookList: possibleBookListView 
		addedBookList: addedBookListView 
		quantityMorph: aQuantityMorph 
		monthMorph: expirationDateMonthMorph 
		yearMorph: expirationDateYearMorph
		popUpView: popUpView! !

!TusLibrosClientSessionPresenter class methodsFor: 'instance creation' stamp: 'LGS 7/7/2019 16:43:28'!
openOn: aClientSesion

	(self on: aClientSesion) open! !


!classDefinition: #TusLibrosLoginPresenter category: #'Tus Libros UI'!
TusLibrosPresenter subclass: #TusLibrosLoginPresenter
	instanceVariableNames: 'clientID password webClient view'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus Libros UI'!

!TusLibrosLoginPresenter methodsFor: 'initialization' stamp: 'LGS 7/8/2019 12:38:23'!
initialize

	self initializeWithDefaultPopUpView.
	password := ''.
	clientID := ''.
	webClient := TusLibrosLogin defaultWebClient.
	! !

!TusLibrosLoginPresenter methodsFor: 'initialization' stamp: 'LGS 7/8/2019 12:50:56'!
initializeWithWebClient: aWebClient

	self initialize.
	webClient := aWebClient ! !


!TusLibrosLoginPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 13:35:40'!
clientID
	^clientID! !

!TusLibrosLoginPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 13:35:28'!
clientID: aClientID
	clientID := aClientID! !

!TusLibrosLoginPresenter methodsFor: 'accessing' stamp: 'LGS 7/8/2019 11:30:21'!
model

	^TusLibrosLogin 
		forClientID: clientID authenticatedWith: password webClient: webClient! !

!TusLibrosLoginPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 13:36:02'!
password
	^password! !

!TusLibrosLoginPresenter methodsFor: 'accessing' stamp: 'LGS 7/7/2019 13:36:22'!
password: aPassword
	password := aPassword! !


!TusLibrosLoginPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 18:30:06'!
createViews

	view := SystemWindow new
		addMorph: (self columnWithMorphs: {
						self textPaneForGetter: #clientID setter: #clientID: labeled: 'Cliente:'.
						self textPaneForGetter: #password setter: #password: labeled: 'Password:'.
						self loginPane.});
		openInWorld;
		setLabel: self label;
		morphExtent: 460@230;
		yourself
	! !

!TusLibrosLoginPresenter methodsFor: 'views' stamp: 'LGS 6/30/2019 20:38:48'!
label
	^'Tus Libros Log In'! !

!TusLibrosLoginPresenter methodsFor: 'views' stamp: 'LGS 7/8/2019 11:23:07'!
loginPane
		
	^self buttonWithAction: #loginAndOpenSession  labeled: 'Log In'.! !

!TusLibrosLoginPresenter methodsFor: 'views' stamp: 'LGS 6/30/2019 20:20:32'!
open

	self createViews! !


!TusLibrosLoginPresenter methodsFor: 'login' stamp: 'LGS 7/8/2019 11:24:38'!
login

	^ self model login! !

!TusLibrosLoginPresenter methodsFor: 'login' stamp: 'LGS 7/8/2019 11:24:38'!
loginAndOpenSession
	|catalog|
	self executeNotifyingErrors: [catalog := self login].
	catalog ifNotNil:[
	self openSessionWithCatalog: catalog.
	view  delete]! !


!TusLibrosLoginPresenter methodsFor: 'client session' stamp: 'LGS 7/7/2019 16:42:30'!
openSessionWithCatalog: aSessionCatalog 

	TusLibrosClientSessionPresenter openOn: (TusLibrosClientSession forClientID: clientID authenticatedWith: password catalog: aSessionCatalog)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosLoginPresenter class' category: #'Tus Libros UI'!
TusLibrosLoginPresenter class
	instanceVariableNames: ''!

!TusLibrosLoginPresenter class methodsFor: 'instance creation' stamp: 'LGS 7/8/2019 11:32:05'!
onWebClient: aWebClient
	^self new initializeWithWebClient: aWebClient ! !

!TusLibrosLoginPresenter class methodsFor: 'instance creation' stamp: 'LGS 7/7/2019 13:42:29'!
open
	^self new open! !
