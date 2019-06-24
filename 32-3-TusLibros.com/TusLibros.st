!classDefinition: #APIRestInputInterfaceTest category: #TusLibros!
TestCase subclass: #APIRestInputInterfaceTest
	instanceVariableNames: 'testObjectsFactory clockBehavior merchantProcessorSimulator inputInterface validClient validPassword'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 00:52:35'!
assertAfterWaitShouldRaiseTimeOutError: aClossure
	self waitTimeLimit.
	self 
		should: aClossure
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: CartInterface timeOutErrorDescription]

! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/24/2019 13:27:17'!
test01CreateCartWithInvalidUserShouldRaiseAnError

	validClient := false.
	self 
		should: [inputInterface createCartWithClientId: self clientID password: self ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: APIRestInputInterface invalidClientIDErrorDescription.
			 ]! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:41:52'!
test02CreateCartWithInvalidPasswordShouldRaiseAnError

	validPassword := false.
	self 
		should: [inputInterface createCartWithClientId: self clientID password: self ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: APIRestInputInterface invalidAuthenticationErrorDescription.
			 ]! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/17/2019 14:14:38'!
test03ListANonExistentCartShouldRaiseAnError

	self 
		should: [inputInterface listCartId: 0]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: APIRestInputInterface invalidCartIDErrorDescription.
			 ]! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:42:04'!
test04ListACreatedCartWithAQuantityOfAnItemAddedShouldReturnAListWithTheItemWithTheQuantity

	| cartID list|
	cartID := inputInterface createCartWithClientId: self clientID password: self.
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	list := inputInterface listCartId: cartID.
	self assert: (list includes: testObjectsFactory itemSellByTheStore).
	self assert: list asSet size equals: 1.
	self assert: (list occurrencesOf: testObjectsFactory itemSellByTheStore) equals: 5.
	! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:42:32'!
test05ListAnEmptyCartCreatedShouldReturnAnEmptyList

	| cartID|
	inputInterface := APIRestInputInterface catalog: testObjectsFactory defaultCatalog authentications: self clock: self merchantProcessor: self.
	cartID := inputInterface createCartWithClientId: self clientID password: self.
	self assert: (inputInterface listCartId: cartID) isEmpty! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/24/2019 13:44:44'!
test06CheckOutAnEmptyCartShouldRaiseAnError

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self.
	self 
		should: [inputInterface 
					checkOutCartId: cartID 
					ccn: testObjectsFactory validCreditCardNumber
					cced: testObjectsFactory validExpirationDate  
					cco: testObjectsFactory validCreditCardOwner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: Cashier cartCanNotBeEmptyErrorMessage;
				assert: (inputInterface listCartId: cartID) isEmpty;
				assert: (inputInterface listPurchasesOfClientId: self clientID password: self) isEmpty]
	! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/24/2019 13:48:12'!
test07CheckOutAnItemAddedCartShouldListHisPurchases

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self .
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	inputInterface 
		checkOutCartId: cartID 
		ccn: testObjectsFactory validCreditCardNumber 
		cced: testObjectsFactory validExpirationDate  
		cco: testObjectsFactory validCreditCardOwner.
	self 
		assert: (inputInterface listPurchasesOfClientId: self clientID password: self) second
		equals: 5;
		assert: (inputInterface listPurchasesOfClientId: self clientID password: self) last
		equals: testObjectsFactory itemSellByTheStorePrice * 5
	! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/24/2019 13:50:24'!
test08CheckOutAClientWithManyCartsShouldListHisPurchases

	| cartID anotherCartID |
	cartID := inputInterface createCartWithClientId: self clientID password: self .
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	anotherCartID := inputInterface createCartWithClientId: self clientID password: self .
	inputInterface addToCartId: anotherCartID bookIsbn: testObjectsFactory anotherItemSellByTheStore bookQuantity:45.
	inputInterface 
		checkOutCartId: cartID 
		ccn: testObjectsFactory validCreditCardNumber 
		cced: testObjectsFactory validExpirationDate  
		cco: testObjectsFactory validCreditCardOwner.
	inputInterface 
		checkOutCartId: anotherCartID 
		ccn: testObjectsFactory validCreditCardNumber 
		cced: testObjectsFactory validExpirationDate  
		cco: testObjectsFactory validCreditCardOwner.
	self 
		assert: (inputInterface listPurchasesOfClientId: self clientID password: self) second
		equals: 5;
		assert: (inputInterface listPurchasesOfClientId: self clientID password: self) fourth
		equals: 45;
		assert: (inputInterface listPurchasesOfClientId: self clientID password: self) last
		equals: testObjectsFactory itemSellByTheStorePrice * 5 + (testObjectsFactory anotherItemSellByTheStorePrice * 45) 
	! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/24/2019 13:46:26'!
test09CheckOutAnItemAddedCartWithExpiredCardShouldRaiseAnError

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self .
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	self 
		should: [inputInterface 
					checkOutCartId: cartID 
					ccn: testObjectsFactory validCreditCardNumber
					cced: testObjectsFactory expiredDate  
					cco: testObjectsFactory validCreditCardOwner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: Cashier canNotChargeAnExpiredCreditCardErrorMessage;
				assert: ((inputInterface listCartId: cartID) occurrencesOf: testObjectsFactory itemSellByTheStore) equals: 5;
				assert: (inputInterface listPurchasesOfClientId: self clientID password: self) isEmpty]
	
! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/24/2019 13:46:40'!
test10CheckOutAnItemAddedCartWithCardWithoutCreditShouldRaiseAnError

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self .
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	merchantProcessorSimulator debitBehavior: [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	self 
		should: [inputInterface 
					checkOutCartId: cartID 
					ccn: testObjectsFactory validCreditCardNumber
					cced: testObjectsFactory validExpirationDate 
					cco: testObjectsFactory validCreditCardOwner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: Cashier creditCardHasNoCreditErrorMessage;
				assert: ((inputInterface listCartId: cartID) occurrencesOf: testObjectsFactory itemSellByTheStore) equals: 5;
				assert: (inputInterface listPurchasesOfClientId: self clientID password: self) isEmpty]
	
! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/24/2019 13:46:52'!
test11CheckOutAnItemAddedCartWithInvalidCreditCardNumberShouldRaiseAnError

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self .
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	self 
		should: [inputInterface 
					checkOutCartId: cartID 
					ccn: testObjectsFactory invalidCreditCardNumber
					cced: testObjectsFactory validExpirationDate 
					cco: testObjectsFactory validCreditCardOwner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: CreditCard invalidCreditCardNumberErrorDescription;
				assert: ((inputInterface listCartId: cartID) occurrencesOf: testObjectsFactory itemSellByTheStore) equals: 5;
				assert: (inputInterface listPurchasesOfClientId: self clientID password: self) isEmpty]
	
! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/24/2019 13:47:02'!
test12CheckOutAnItemAddedCartWithInvalidCreditCardOwnerShouldRaiseAnError

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self .
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	self 
		should: [inputInterface 
					checkOutCartId: cartID 
					ccn: testObjectsFactory validCreditCardNumber
					cced: testObjectsFactory validExpirationDate 
					cco: testObjectsFactory invalidCreditCardOwner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: CreditCard invalidCreditCardOwnerErrorDescription;
				assert: ((inputInterface listCartId: cartID) occurrencesOf: testObjectsFactory itemSellByTheStore) equals: 5;
				assert: (inputInterface listPurchasesOfClientId: self clientID password: self) isEmpty]
	
! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:45:06'!
test13CheckOutAClientWithManyCartsChargesCreditCardUsingMerchantProcessor

	| cartID debitedAmount debitedCreditCard |

	cartID := inputInterface createCartWithClientId: self clientID password: self .
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	merchantProcessorSimulator debitBehavior:  [ :anAmount :aCreditCard | 
														debitedAmount := anAmount.
														debitedCreditCard := aCreditCard].
	inputInterface 
		checkOutCartId: cartID 
		ccn: testObjectsFactory validCreditCardNumber 
		cced: testObjectsFactory validExpirationDate  
		cco: testObjectsFactory validCreditCardOwner.
	self 
		assert: debitedAmount equals: testObjectsFactory itemSellByTheStorePrice * 5;
		assert: (debitedCreditCard isOwnedBy: testObjectsFactory validCreditCardOwner);
		assert: (debitedCreditCard isIdentifiedBy: testObjectsFactory validCreditCardNumber)! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:45:35'!
test14AddCartAfterWaitMoreThan30MinutesOfLastOperationShoulRaiseAnError

	| cartID |
	cartID := inputInterface createCartWithClientId: self clientID password: self.
	self 
		assertAfterWaitShouldRaiseTimeOutError: [inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5]


! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:45:50'!
test15ListCartAfterWaitMoreThan30MinutesOfAnotherOperationShouldRaiseAnError

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self.
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	self 
		assertAfterWaitShouldRaiseTimeOutError: [inputInterface listCartId: cartID]

	! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:46:01'!
test16CheckOutCartAfterWaitMoreThan30MinutesOfAnotherOperationShouldRaiseAnError

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self .
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	self 
		assertAfterWaitShouldRaiseTimeOutError: [inputInterface 
														checkOutCartId: cartID 
														ccn: testObjectsFactory validCreditCardNumber
														cced: testObjectsFactory validExpirationDate 
														cco: testObjectsFactory validCreditCardOwner]

	! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:46:08'!
test17ListAfterCheckOutShouldRaiseAnError

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self .
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	inputInterface 
		checkOutCartId: cartID 
		ccn: testObjectsFactory validCreditCardNumber 
		cced: testObjectsFactory validExpirationDate  
		cco: testObjectsFactory validCreditCardOwner.
		self 
			should: [inputInterface 
						listCartId: cartID]
			raise: Error - MessageNotUnderstood
			withExceptionDo: [:ex | 
				self 
					assert: ex messageText equals: CartInterface soldCartErrorDescription ]! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:46:22'!
test18CheckOutAfterCheckOutShouldRaiseAnError

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self .
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	inputInterface 
		checkOutCartId: cartID 
		ccn: testObjectsFactory validCreditCardNumber 
		cced: testObjectsFactory validExpirationDate  
		cco: testObjectsFactory validCreditCardOwner.
		self 
			should: [inputInterface 
						checkOutCartId: cartID 
						ccn: testObjectsFactory validCreditCardNumber 
						cced: testObjectsFactory validExpirationDate  
						cco: testObjectsFactory validCreditCardOwner.
		]
			raise: Error - MessageNotUnderstood
			withExceptionDo: [:ex | 
				self 
					assert: ex messageText equals: CartInterface soldCartErrorDescription]! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:46:30'!
test19AddToCartAfterCheckOutShouldRaiseAnError

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self .
	inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
	inputInterface 
		checkOutCartId: cartID 
		ccn: testObjectsFactory validCreditCardNumber 
		cced: testObjectsFactory validExpirationDate  
		cco: testObjectsFactory validCreditCardOwner.
		self 
			should: [inputInterface 
						addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: 5.
		]
			raise: Error - MessageNotUnderstood
			withExceptionDo: [:ex | 
				self 
					assert: ex messageText equals: CartInterface soldCartErrorDescription]! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:46:43'!
test20AddToCartInvalidQuantityOfItemsShouldRaiseAnError

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self .
		self 
			should: [inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemSellByTheStore bookQuantity: -5.
		]
			raise: Error - MessageNotUnderstood
			withExceptionDo: [:ex | 
				self 
					assert: ex messageText equals: Cart invalidQuantityErrorMessage ]! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:46:51'!
test21AddToCartInvalidItemShouldRaiseAnError

	| cartID|
	cartID := inputInterface createCartWithClientId: self clientID password: self .
		self 
			should: [inputInterface addToCartId: cartID bookIsbn: testObjectsFactory itemNotSellByTheStore bookQuantity: 4.
		]
			raise: Error - MessageNotUnderstood
			withExceptionDo: [:ex | 
				self 
					assert: ex messageText equals: Cart invalidItemErrorMessage ]! !

!APIRestInputInterfaceTest methodsFor: 'testing' stamp: 'LGS 6/23/2019 00:52:18'!
waitTimeLimit

	^ self wait: CartInterface timeOutLimit. ! !


!APIRestInputInterfaceTest methodsFor: 'support' stamp: 'LGS 6/23/2019 14:50:16'!
canLogInWith: aClientID authenticatedBy: anAuthentication
	
	^validPassword ! !

!APIRestInputInterfaceTest methodsFor: 'support' stamp: 'LGS 6/23/2019 14:41:37'!
clientID
	^'Cliente'! !

!APIRestInputInterfaceTest methodsFor: 'support' stamp: 'LGS 6/13/2019 20:28:52'!
currentDateAndTime

	^DateAndTime
		year: 2019 day: 300 hour: 10  minute: 15 second: 13! !

!APIRestInputInterfaceTest methodsFor: 'support' stamp: 'LGS 6/23/2019 14:49:54'!
existClientId: aClientID 
	
	^validClient! !

!APIRestInputInterfaceTest methodsFor: 'support' stamp: 'LGS 6/16/2019 19:24:12'!
now
	^clockBehavior value! !

!APIRestInputInterfaceTest methodsFor: 'support' stamp: 'LGS 6/23/2019 14:38:18'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	clockBehavior := [self currentDateAndTime].
	validClient := true.
	validPassword := true.
	merchantProcessorSimulator := MerchantProcessorSimulator new.
	inputInterface := APIRestInputInterface 
					catalog: testObjectsFactory defaultCatalog 
					authentications: self 
					clock: self 
					merchantProcessor: merchantProcessorSimulator.
! !

!APIRestInputInterfaceTest methodsFor: 'support' stamp: 'LGS 6/16/2019 14:45:25'!
today
	^testObjectsFactory today! !

!APIRestInputInterfaceTest methodsFor: 'support' stamp: 'LGS 6/16/2019 19:24:12'!
wait: aDurationToWait

	clockBehavior  := [self currentDateAndTime + aDurationToWait]! !


!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory merchantProcessorSimulator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'LGS 6/17/2019 14:29:01'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: merchantProcessorSimulator 
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'LGS 6/17/2019 14:29:09'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: merchantProcessorSimulator 
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'LGS 6/17/2019 14:29:16'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: merchantProcessorSimulator 
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'LGS 6/17/2019 14:29:23'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: merchantProcessorSimulator 
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'LGS 6/17/2019 14:30:06'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: merchantProcessorSimulator 
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	 merchantProcessorSimulator debitBehavior: [ :anAmount :aCreditCard | 
														debitedAmout := anAmount.
														debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'LGS 6/17/2019 14:30:31'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	merchantProcessorSimulator debitBehavior: [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: merchantProcessorSimulator 
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'LGS 6/17/2019 14:27:23'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	merchantProcessorSimulator := MerchantProcessorSimulator new! !


!classDefinition: #APIRestInputInterface category: #TusLibros!
Object subclass: #APIRestInputInterface
	instanceVariableNames: 'catalog carts systemClock timeStamps merchantProcessor clients authenticationSystem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!APIRestInputInterface methodsFor: 'initialization' stamp: 'LGS 6/23/2019 14:32:51'!
initializeWith: aCatalogToAddBooks authenticatedBy: anAuthenticationSystem timedWith: aSystemClock merchantProcessor: aMerchantProcessor   
	
	catalog := aCatalogToAddBooks.
	authenticationSystem := anAuthenticationSystem.
	systemClock := aSystemClock.
	merchantProcessor := aMerchantProcessor.
	clients := OrderedCollection new! !


!APIRestInputInterface methodsFor: 'sales' stamp: 'LGS 6/24/2019 13:51:32'!
purchasesOf: salesToBeListed 
	|purchases|
	purchases := OrderedCollection new.
	salesToBeListed do: [:sale |
		sale itemsList asSet asSortedCollection do:  [:item | purchases add: item; add: (sale itemsList occurrencesOf: item)]].
	purchases add: (salesToBeListed sum: [:sale | sale total] ifEmpty: [^purchases]).	
	^purchases! !

!APIRestInputInterface methodsFor: 'sales' stamp: 'LGS 6/23/2019 00:45:45'!
salesBookOfCart: aCart
	
	^(self clientOfCart: aCart) salesBook ! !


!APIRestInputInterface methodsFor: 'carts' stamp: 'LGS 6/22/2019 23:18:13'!
cartOfID: aCartID 
	^self carts detect: [:cart | cart isIdentifiedBy: aCartID] ifNone: [self class notifyInvalidCartIdError]! !

!APIRestInputInterface methodsFor: 'carts' stamp: 'LGS 6/22/2019 23:20:25'!
carts
	^clients inject: OrderedCollection new into: [:clientsCarts :client | clientsCarts addAll: client carts; yourself]! !

!APIRestInputInterface methodsFor: 'carts' stamp: 'LGS 6/22/2019 23:21:44'!
newID 
	
	| id |
	[id := 10000000 atRandom. self carts anySatisfy: [:cart | cart isIdentifiedBy: id]] whileTrue: [].
	^id! !


!APIRestInputInterface methodsFor: 'cart creation' stamp: 'LGS 6/23/2019 00:40:15'!
createCartWithClientId: clientIdToLogin password: passwordOfClientID
	
	| cartForInterface client id |
	self assertCorrectId: clientIdToLogin password: passwordOfClientID.
	id := self newID.
	cartForInterface := CartInterface forCart: (Cart acceptingItemsOf: catalog) id: id clock: systemClock.
	client := (self clientWithID: clientIdToLogin).
	client addCart: cartForInterface.
	^id
	! !


!APIRestInputInterface methodsFor: 'testing' stamp: 'LGS 6/24/2019 13:26:27'!
assertCorrectId: clientIDToLogin password: passwordOfClientID
 
	(authenticationSystem existClientId: clientIDToLogin) ifFalse: [self class notifyInvalidClientIDError].
	(authenticationSystem canLogInWith: clientIDToLogin authenticatedBy: passwordOfClientID) ifFalse: [self class notifyAuthenticationError]
! !

!APIRestInputInterface methodsFor: 'testing' stamp: 'LGS 6/22/2019 23:44:50'!
assertIsValidCart: aCartToValid
	
	(systemClock  now - (timeStamps at: aCartToValid )  < self class timeOutLimit) ifFalse: [self class notifyTimeOutError]! !


!APIRestInputInterface methodsFor: 'cart listing' stamp: 'LGS 6/23/2019 00:35:27'!
listCartId: aCartID
 
	^(self cartOfID: aCartID) itemsList ! !


!APIRestInputInterface methodsFor: 'cart add' stamp: 'LGS 6/23/2019 00:34:51'!
addToCartId: aCartID bookIsbn: aBookToAdd bookQuantity: aQuantityOfAddedBook 
	
	(self cartOfID: aCartID) add: aQuantityOfAddedBook of: aBookToAdd! !


!APIRestInputInterface methodsFor: 'cart check out' stamp: 'LGS 6/23/2019 14:03:33'!
checkOutCartId: aCartIdentifier ccn: aCreditCardNumber cced: aCreditCardExpirationDate cco: aCreditCardOwner 
	|cart creditCard cashier  |
	
	creditCard := CreditCard expiringOn: aCreditCardExpirationDate ccn: aCreditCardNumber cco: aCreditCardOwner.
	cart := self cartOfID: aCartIdentifier.
	cashier := Cashier
					toCheckout: cart 
					charging: creditCard 
					throught: merchantProcessor 
					on: systemClock today 
					registeringOn: (self salesBookOfCart: cart).
	cashier checkOut.
	cart markSold! !


!APIRestInputInterface methodsFor: 'cart list purchases' stamp: 'LGS 6/23/2019 00:49:54'!
listPurchasesOfClientId: aClientIdentifier password: anAuthentication
	
	self assertCorrectId: aClientIdentifier password: anAuthentication.
	^self purchasesOf: (self clientWithID: aClientIdentifier) salesBook ! !


!APIRestInputInterface methodsFor: 'clients' stamp: 'LGS 6/23/2019 00:47:14'!
clientOfCart: aCart 
	^clients detect: [:client | client includesCart: aCart]! !

!APIRestInputInterface methodsFor: 'clients' stamp: 'LGS 6/22/2019 23:39:12'!
clientWithID: aClientID 
	^clients detect: [:aClient | aClient isIdentifiedBy: aClientID] ifNone: [clients add: (Client withID: aClientID)] ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'APIRestInputInterface class' category: #TusLibros!
APIRestInputInterface class
	instanceVariableNames: ''!

!APIRestInputInterface class methodsFor: 'instance creation' stamp: 'LGS 6/16/2019 12:51:31'!
catalog: catalog authentications: authentications clock: systemClock merchantProcessor: aMerchantProcessor   
	
	^self new initializeWith: catalog authenticatedBy: authentications timedWith: systemClock merchantProcessor: aMerchantProcessor! !


!APIRestInputInterface class methodsFor: 'as yet unclassified' stamp: 'LGS 6/12/2019 20:11:51'!
initializeWith: aDictionary 
	self shouldBeImplemented.! !


!APIRestInputInterface class methodsFor: 'error handling' stamp: 'LGS 6/12/2019 20:22:39'!
invalidAuthenticationErrorDescription
	^'El usuario/password es incorrecto'! !

!APIRestInputInterface class methodsFor: 'error handling' stamp: 'LGS 6/16/2019 20:14:19'!
invalidCartIDErrorDescription
	^'El ID del carrito es invalido'! !

!APIRestInputInterface class methodsFor: 'error handling' stamp: 'LGS 6/24/2019 13:27:00'!
invalidClientIDErrorDescription
	^'El ID del cliente es invalido'! !

!APIRestInputInterface class methodsFor: 'error handling' stamp: 'LGS 6/16/2019 20:30:29'!
notifyAuthenticationError
	self error: self invalidAuthenticationErrorDescription ! !

!APIRestInputInterface class methodsFor: 'error handling' stamp: 'LGS 6/16/2019 20:29:33'!
notifyInvalidCartIdError
	self error: self invalidCartIDErrorDescription ! !

!APIRestInputInterface class methodsFor: 'error handling' stamp: 'LGS 6/24/2019 13:26:46'!
notifyInvalidClientIDError
	self error: self invalidClientIDErrorDescription ! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'LGS 6/23/2019 14:24:54'!
invalidItemErrorMessage
	
	^self class invalidItemErrorMessage ! !

!Cart methodsFor: 'error messages' stamp: 'LGS 6/23/2019 14:25:06'!
invalidQuantityErrorMessage
	
	^self class invalidQuantityErrorMessage ! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'listing' stamp: 'LGS 6/12/2019 21:29:44'!
itemsList
	^items asBag! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error messages' stamp: 'LGS 6/23/2019 14:23:54'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart class methodsFor: 'error messages' stamp: 'LGS 6/23/2019 14:24:27'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #CartInterface category: #TusLibros!
Object subclass: #CartInterface
	instanceVariableNames: 'cart id systemClock timeStamp sold'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartInterface methodsFor: 'initialization' stamp: 'LGS 6/23/2019 14:03:17'!
initializeWithCart: aCart identifiedWith: anIdForCart clock: aSystemClock 

	cart := aCart.
	id := anIdForCart.
	systemClock := aSystemClock.
	timeStamp := aSystemClock  now.
	sold := false! !


!CartInterface methodsFor: 'interface' stamp: 'LGS 6/22/2019 23:42:49'!
isIdentifiedBy: aCartIdentifier 
	^id = aCartIdentifier ! !

!CartInterface methodsFor: 'interface' stamp: 'LGS 6/23/2019 14:03:33'!
markSold

	sold := true! !


!CartInterface methodsFor: 'cart' stamp: 'LGS 6/23/2019 14:03:53'!
at: timeStampOfNewOperation do: aClossureToEvaluate 
	|answer|
	self
		assertCartNotSold; 
		assertValidCartAt: timeStampOfNewOperation.
	answer := aClossureToEvaluate value.
	timeStamp := timeStampOfNewOperation.
	^answer! !

!CartInterface methodsFor: 'cart' stamp: 'LGS 6/23/2019 00:38:07'!
doesNotUnderstand: aMessage

	^(cart class canUnderstand: aMessage selector) 
		ifTrue: [self at: systemClock now do: [aMessage sendTo: cart]]
		ifFalse: [super doesNotUnderstand: aMessage]! !


!CartInterface methodsFor: 'testing' stamp: 'LGS 6/23/2019 14:04:12'!
assertCartNotSold
	
	sold ifTrue: [self class notifySoldCartError]
	! !

!CartInterface methodsFor: 'testing' stamp: 'LGS 6/23/2019 00:43:00'!
assertValidCartAt: aTimeStampToAssert 
	
	(aTimeStampToAssert - timeStamp < self class timeOutLimit) ifFalse: [self class notifyTimeOutError]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartInterface class' category: #TusLibros!
CartInterface class
	instanceVariableNames: ''!

!CartInterface class methodsFor: 'error handling' stamp: 'LGS 6/23/2019 14:04:26'!
notifySoldCartError
	self error: self soldCartErrorDescription ! !

!CartInterface class methodsFor: 'error handling' stamp: 'LGS 6/23/2019 00:14:23'!
notifyTimeOutError
	self error: self timeOutErrorDescription ! !

!CartInterface class methodsFor: 'error handling' stamp: 'LGS 6/23/2019 14:04:26'!
soldCartErrorDescription
	^'No se puede operar con un carrito al cual se le hizo check out'! !

!CartInterface class methodsFor: 'error handling' stamp: 'LGS 6/23/2019 00:15:37'!
timeOutErrorDescription
	^'Se venció el tiempo del carrito'! !

!CartInterface class methodsFor: 'error handling' stamp: 'LGS 6/23/2019 00:16:12'!
timeOutLimit
	^30 minutes! !


!CartInterface class methodsFor: 'instance creation' stamp: 'LGS 6/23/2019 00:28:39'!
forCart: aCart id: idOfCart clock: aSystemClock   
	^self new initializeWithCart: aCart identifiedWith: idOfCart clock: aSystemClock ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'LGS 6/23/2019 14:02:26'!
createSale

	^Sale of: total selling: cart itemsList
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'LGS 6/16/2019 13:07:26'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate ) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #Client category: #TusLibros!
Object subclass: #Client
	instanceVariableNames: 'id carts salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Client methodsFor: 'initialization' stamp: 'LGS 6/23/2019 00:48:50'!
initializeWithID: aClientIdentifier 
	id := aClientIdentifier.
	carts := OrderedCollection new.
	salesBook := OrderedCollection new! !


!Client methodsFor: 'carts' stamp: 'LGS 6/22/2019 23:36:13'!
addCart: aCart

	carts add: aCart
	
	! !

!Client methodsFor: 'carts' stamp: 'LGS 6/22/2019 23:39:38'!
carts

	^carts! !

!Client methodsFor: 'carts' stamp: 'LGS 6/23/2019 00:47:43'!
includesCart: aCart
	^carts includes: aCart! !


!Client methodsFor: 'sales' stamp: 'LGS 6/23/2019 00:49:01'!
salesBook
	^salesBook! !


!Client methodsFor: 'testing' stamp: 'LGS 6/23/2019 00:50:55'!
isIdentifiedBy: aClientIdentifier
 
	^id = aClientIdentifier ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Client class' category: #TusLibros!
Client class
	instanceVariableNames: ''!

!Client class methodsFor: 'instance creation' stamp: 'LGS 6/22/2019 23:22:45'!
withID: aClientIdentifier 
	^self new initializeWithID: aClientIdentifier ! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration creditCardNumber creditCardOwner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'LGS 6/16/2019 13:07:25'!
isExpiredOn: aDate     
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !

!CreditCard methodsFor: 'testing' stamp: 'LGS 6/16/2019 20:08:41'!
isIdentifiedBy: aCreditCardNumber 
	^creditCardNumber  = aCreditCardNumber ! !

!CreditCard methodsFor: 'testing' stamp: 'LGS 6/16/2019 20:08:11'!
isOwnedBy: aCreditCardOwner 
	^creditCardOwner  = aCreditCardOwner ! !


!CreditCard methodsFor: 'initialization' stamp: 'LGS 6/16/2019 14:01:03'!
initializeExpiringOn: aMonth ccn: aCreditCardNumber cco: aCreditCardOwner   
	
	expiration := aMonth.
	creditCardNumber := aCreditCardNumber.
	creditCardOwner := aCreditCardOwner
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'LGS 6/16/2019 19:45:57'!
expiringOn: aMonth ccn: aCreditCardNumber cco: aCreditCardOwner   
	
	self 
		assertCreditCardNumber: aCreditCardNumber;
		assertCreditCardOwner: aCreditCardOwner.
	
	^self new initializeExpiringOn: aMonth ccn: aCreditCardNumber cco: aCreditCardOwner! !


!CreditCard class methodsFor: 'testing' stamp: 'LGS 6/16/2019 19:48:23'!
assertCreditCardNumber: aCreditCardNumber
 
	(aCreditCardNumber size = 16 and: [aCreditCardNumber allSatisfy: [:numberPart | numberPart isDigit]])
		ifFalse: [self error: self invalidCreditCardNumberErrorDescription]! !

!CreditCard class methodsFor: 'testing' stamp: 'LGS 6/16/2019 19:59:53'!
assertCreditCardOwner: aCreditCardOwner
 
	((aCreditCardOwner class canUnderstand:  #notEmpty) and: [ aCreditCardOwner notEmpty])
		ifFalse: [self error: self invalidCreditCardOwnerErrorDescription]! !


!CreditCard class methodsFor: 'error handling' stamp: 'LGS 6/16/2019 19:50:55'!
invalidCreditCardNumberErrorDescription
	^'El numero de la tarjeta no es valido'! !

!CreditCard class methodsFor: 'error handling' stamp: 'LGS 6/16/2019 19:54:44'!
invalidCreditCardOwnerErrorDescription
	^'El dueño de la tarjeta de crédito es invalido'! !


!classDefinition: #MerchantProcessorSimulator category: #TusLibros!
Object subclass: #MerchantProcessorSimulator
	instanceVariableNames: 'debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorSimulator methodsFor: 'initialization' stamp: 'LGS 6/17/2019 14:31:26'!
initialize
	
	debitBehavior :=  [ :anAmount :aCreditCard | ]! !


!MerchantProcessorSimulator methodsFor: 'debit' stamp: 'LGS 6/17/2019 14:23:55'!
debit: anAmountToDebit from: aCreditCardToDebit
	
	debitBehavior value: anAmountToDebit value: aCreditCardToDebit! !

!MerchantProcessorSimulator methodsFor: 'debit' stamp: 'LGS 6/17/2019 14:25:02'!
debitBehavior: aBlockClosure 

	debitBehavior _ aBlockClosure! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total itemsList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'LGS 6/23/2019 14:09:44'!
itemsList

	^itemsList ! !

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'LGS 6/23/2019 14:09:21'!
initializeTotal: aTotal selling: aCartItemsList

	total := aTotal.
	itemsList := aCartItemsList! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'LGS 6/23/2019 14:09:36'!
of: aTotal selling: aCartItemsList

	self assertTotalIsPositive: aTotal.
	^self new initializeTotal: aTotal selling: aCartItemsList ! !


!Sale class methodsFor: 'error handling' stamp: 'LGS 6/23/2019 14:14:25'!
assertTotalIsPositive: aTotal 
	
	aTotal positive ifFalse: [self signalNotPositiveTotalError]! !

!Sale class methodsFor: 'error handling' stamp: 'LGS 6/23/2019 14:13:59'!
signalNotPositiveTotalError

	self error: 'El total debe ser positivo'! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'LGS 6/16/2019 19:30:12'!
anotherItemSellByTheStore
	^ 'anotherValidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'LGS 6/16/2019 19:30:51'!
anotherItemSellByTheStorePrice
	
	^20! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'LGS 6/16/2019 19:31:28'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		at: self anotherItemSellByTheStore put: self anotherItemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'LGS 6/16/2019 19:39:18'!
expiredCreditCard
	
	^CreditCard expiringOn: self expiredDate ccn: '1111111111111111' cco: 'Juan Perez'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'LGS 6/16/2019 19:39:18'!
expiredDate

	^ (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'LGS 6/16/2019 19:50:25'!
invalidCreditCardNumber
	^'AAA11121'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'LGS 6/16/2019 19:54:10'!
invalidCreditCardOwner
	^''! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'LGS 6/16/2019 14:07:12'!
notExpiredCreditCard
	
	^CreditCard expiringOn: self validExpirationDate ccn: self validCreditCardNumber cco: self validCreditCardOwner! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'LGS 6/16/2019 14:06:53'!
validCreditCardNumber

	^ '1111111111111111'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'LGS 6/16/2019 14:07:12'!
validCreditCardOwner

	^ 'Juan Perez'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'LGS 6/16/2019 14:05:51'!
validExpirationDate

	^ (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !
