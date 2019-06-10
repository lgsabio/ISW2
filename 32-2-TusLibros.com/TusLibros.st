!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'repository'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'test adding' stamp: 'LGS 6/10/2019 13:24:59'!
test01NewCartsAreCreatedEmpty

	self assert: repository newCart isEmpty! !

!CartTest methodsFor: 'test adding' stamp: 'LGS 6/10/2019 13:25:30'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := repository newCart.
	
	self 
		should: [ cart add: repository itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'test adding' stamp: 'LGS 6/10/2019 13:25:45'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := repository newCart.
	
	cart add: repository itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'test adding' stamp: 'LGS 6/10/2019 13:26:00'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := repository newCart.
	
	self 
		should: [cart add: 0 of: repository itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'test adding' stamp: 'LGS 6/10/2019 13:26:16'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := repository newCart.
	
	self 
		should: [cart add: 2 of: repository itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'test adding' stamp: 'LGS 6/10/2019 13:26:38'!
test06CartRemembersAddedItems

	| cart |
	
	cart := repository newCart.
	
	cart add: repository itemSellByTheStore.
	self assert: (cart includes: repository itemSellByTheStore)! !

!CartTest methodsFor: 'test adding' stamp: 'LGS 6/10/2019 13:26:50'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := repository newCart.
	
	self deny: (cart includes: repository itemSellByTheStore)! !

!CartTest methodsFor: 'test adding' stamp: 'LGS 6/10/2019 13:27:13'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := repository newCart.
	
	cart add: 2 of: repository itemSellByTheStore.
	self assert: (cart occurrencesOf: repository itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setUp/tearDown' stamp: 'LGS 6/10/2019 13:23:18'!
setUp
	
	repository := TusLibrosTestRepository new! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'repository'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'testing check out' stamp: 'LGS 6/10/2019 13:27:41'!
test01EmptyCartCheckoutShouldRaiseCantCheckOutEmptyCartException

	| cart cashier card |
	
	cart := repository newCart.
	card := repository validCreditCard.
	cashier := repository newCashier.	
	self 
		should: [cashier checkOut: cart payingWith: card at: repository currentDate] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | 
				self assert: ex messageText equals: cashier cantCheckOutEmptyCartErrorMessage .
				self deny: cashier hasSold]! !

!CashierTest methodsFor: 'testing check out' stamp: 'LGS 6/10/2019 13:28:12'!
test02CheckingOutACartWithAnItemUsingAValidCartAddASaleForCart

	| cart cashier card |
	
	cart := repository newCart.
	card := repository validCreditCard.
	cashier := repository newCashier.
	cart add: repository itemSellByTheStore. 	
	cashier checkOut: cart payingWith: card at: repository currentDate.
	self assert: cashier hasSold.
	self assert: (cashier hasASaleFor: cart).
	self assert: (cashier saleFor: cart) saleAmount equals: repository priceOfItemSellByTheStore.! !

!CashierTest methodsFor: 'testing check out' stamp: 'LGS 6/10/2019 13:28:48'!
test03CheckingOutACartWithManyItemsUsingAValidCardRegisterCorrectSale

	| cart cashier card |
	
	cart := repository newCart.
	card := repository validCreditCard.
	cashier := repository newCashier.
	cart add: 4 of: repository itemSellByTheStore. 	
	cashier checkOut: cart payingWith: card at: repository currentDate.
	self assert: cashier hasSold.
	self assert: (cashier hasASaleFor: cart).
	self assert: (cashier saleFor: cart) saleAmount equals: (repository priceOfItemSellByTheStore * 4).! !

!CashierTest methodsFor: 'testing check out' stamp: 'LGS 6/10/2019 13:29:20'!
test04CheckingOutACartWithInvalidCreditCardShouldRaiseAnError

	| cart cashier card |
	
	cart := repository newCart.
	card := repository invalidCreditCard.
	cart add: repository itemSellByTheStore.
	cashier := repository newCashier.	
	self 
		should: [cashier checkOut: cart payingWith: card at: repository currentDate] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | 
				self assert: ex messageText equals: repository invalidCreditCardErrorMessage .
				self deny: cashier hasSold]! !

!CashierTest methodsFor: 'testing check out' stamp: 'LGS 6/10/2019 13:31:14'!
test05CheckingOutManyCartsWithManyItemsUsingAValidCardRegisterCorrectSales

	| cart cashier card anotherCard anotherCart |
	
	cart := repository newCart.
	card := repository validCreditCard.
	cashier := repository newCashier.
	anotherCart := repository newCart.
	anotherCard := repository anotherValidCreditCard.
	cart add: 4 of: repository itemSellByTheStore. 
	anotherCart add: 3 of: repository anotherItemSellByTheStore.	
	cashier checkOut: cart payingWith: card at: repository currentDate.
	cashier checkOut: anotherCart payingWith: anotherCard at: repository currentDate.
	self assert: cashier hasSold.
	self assert: (cashier hasASaleFor: cart).
	self assert: (cashier saleFor: cart) saleAmount equals: (repository priceOfItemSellByTheStore * 4).! !

!CashierTest methodsFor: 'testing check out' stamp: 'LGS 6/10/2019 13:31:42'!
test06CheckingOutManyCartsWithManyItemsUsingAnExpiredCreditCardShouldRaiseAnError

	| cart cashier card |
	
	cart := repository newCart.
	card := repository expiredCreditCard.
	cart add: repository itemSellByTheStore.
	cashier := repository newCashier.	
	self 
		should: [cashier checkOut: cart payingWith: card at: repository currentDate] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | 
				self assert: ex messageText equals: Cashier expiredCreditCardErrorMessage .
				self deny: cashier hasSold]! !


!CashierTest methodsFor: 'setUp/tearDown' stamp: 'LGS 6/10/2019 13:23:07'!
setUp
	
	repository := TusLibrosTestRepository new! !


!classDefinition: #CreditCardTest category: #TusLibros!
TestCase subclass: #CreditCardTest
	instanceVariableNames: 'repository'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'testing credit card creation' stamp: 'LGS 6/10/2019 13:38:46'!
test01CreateACreditCardWithInvalidIdentificationSizeShouldRaiseAnError

	self 
		should: [repository invalidIdentifierSizeCreditCard]  
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | self assert: ex messageText equals: CreditCard invalidIdentifierSizeErrorDescription ] 
	
	! !

!CreditCardTest methodsFor: 'testing credit card creation' stamp: 'LGS 6/10/2019 13:39:06'!
test02CreateACreditCardWithInvalidIdentificationFormatShouldRaiseAnError

	self 
		should: [repository invalidIdentifierFormatCreditCard]  
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | self assert: ex messageText equals: CreditCard invalidIdentifierFormatErrorDescription ] 
	
	! !

!CreditCardTest methodsFor: 'testing credit card creation' stamp: 'LGS 6/10/2019 13:32:13'!
test03CreateACreditCardWithInvalidExpirationDate

	self 
		should: [repository invalidExpirationDateCreditCard]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | self assert: ex messageText equals: CreditCard invalidExpirationDateErrorDescription ]! !

!CreditCardTest methodsFor: 'testing credit card creation' stamp: 'LGS 6/10/2019 13:32:18'!
test04CreateACreditCardWithInvalidOwnerName

	self 
		should: [repository invalidOwnerNameCreditCard]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | self assert: ex messageText equals: CreditCard invalidOwnerNameErrorDescription]! !


!CreditCardTest methodsFor: 'setUp/tearDown' stamp: 'LGS 6/10/2019 13:22:31'!
setUp
	
	repository := TusLibrosTestRepository new! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items priceList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'MGS 6/6/2019 01:10:19'!
cantCheckOutWithAnItemThatIsNotInThePriceListErrorMessage
	^'Can not checkout if an item is not in the price list'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'LGS 6/9/2019 09:37:31'!
assertIsValidItem: anItem

	(priceList keys includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'LGS 6/9/2019 09:34:49'!
initializeWithPriceList: aPriceList 

	items := OrderedCollection new.
	priceList := aPriceList.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'pricing' stamp: 'LGS 6/9/2019 17:55:44'!
itemsPrice
	
	^items sum:
		[:eachItem | priceList at: eachItem 
				ifAbsent: [^self error: self cantCheckOutWithAnItemThatIsNotInThePriceListErrorMessage]]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'LGS 6/9/2019 09:34:22'!
withPriceList: aPriceList 

	^self new initializeWithPriceList: aPriceList ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'sales interface'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'error message' stamp: 'LGS 6/9/2019 18:06:24'!
cantCheckOutEmptyCartErrorMessage
	^self class cantCheckOutEmptyCartErrorMessage! !


!Cashier methodsFor: 'initialization' stamp: 'LGS 6/9/2019 11:59:15'!
initializeWithInterface: aCashierInterface 

	interface := aCashierInterface.
	sales := OrderedCollection new! !


!Cashier methodsFor: 'testing' stamp: 'LGS 6/9/2019 12:04:31'!
assertNotEmptyCart: aCart 
	
	aCart isEmpty ifTrue: [Error signal: self cantCheckOutEmptyCartErrorMessage]! !

!Cashier methodsFor: 'testing' stamp: 'LGS 6/9/2019 18:05:20'!
hasASaleFor: aCart 
	^sales detect: [:aSaleTransaction | aSaleTransaction isForCart: aCart] ifFound: [:sale | true]  ifNone: [false]! !

!Cashier methodsFor: 'testing' stamp: 'LGS 6/9/2019 12:05:01'!
hasSold
	^sales notEmpty! !


!Cashier methodsFor: 'sales' stamp: 'LGS 6/9/2019 11:58:26'!
addSale: aSaleTransaction 
	
	sales add: aSaleTransaction ! !

!Cashier methodsFor: 'sales' stamp: 'LGS 6/9/2019 12:58:42'!
checkOut: aCart payingWith: aCreditCard at: aDate 
	
	| transaction |
	self assertNotEmptyCart: aCart.
	transaction := SaleTransaction on: aCart payingWith: aCreditCard.
	transaction checkOutAt: aDate interfacingWith: interface.
	self addSale: transaction! !

!Cashier methodsFor: 'sales' stamp: 'LGS 6/9/2019 12:29:04'!
saleFor: aCart 
	^sales detect: [:sale | sale isForCart: aCart]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'LGS 6/9/2019 18:02:53'!
withInterface: aCashierInterface
 
	^self new initializeWithInterface: aCashierInterface ! !


!Cashier class methodsFor: 'error message' stamp: 'LGS 6/9/2019 18:06:09'!
cantCheckOutEmptyCartErrorMessage
	^'An empty cart is unable to checkout'! !

!Cashier class methodsFor: 'error message' stamp: 'LGS 6/9/2019 18:00:43'!
expiredCreditCardErrorMessage
	^'La tarjeta de crédito se encuentra vencida'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'ownerName identifier expirationMonthOfYear'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'LGS 6/9/2019 10:01:00'!
initializeOwnedBy: anOwnerName identifiedBy: aCreditCardIdentifier expiredIn: anExpirationMonthOfYear
 
	ownerName := anOwnerName .
	identifier := aCreditCardIdentifier.
	expirationMonthOfYear := anExpirationMonthOfYear ! !


!CreditCard methodsFor: 'testing' stamp: 'MGS 6/10/2019 00:15:32'!
expiredAt: aDate 
	
	^aDate > expirationMonthOfYear! !

!CreditCard methodsFor: 'testing' stamp: 'LGS 6/9/2019 11:58:00'!
isIdentifiedBy: anIdentifierString 
	
	^identifier = anIdentifierString! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'LGS 6/9/2019 13:14:51'!
identifierSize
	^16! !

!CreditCard class methodsFor: 'instance creation' stamp: 'MGS 6/10/2019 01:08:49'!
ownerName: aCreditCardOwnerName id: aCreditCardIdentification  expiration: anExpirationMonthOfYear 
	
	self assertValidIdentifier: aCreditCardIdentification.
	self assertValidExpirationMonthOfYear: anExpirationMonthOfYear.
	self assertValidOwnerName: aCreditCardOwnerName.	

	^self new
		initializeOwnedBy: aCreditCardOwnerName identifiedBy: aCreditCardIdentification expiredIn: anExpirationMonthOfYear ! !


!CreditCard class methodsFor: 'error handling' stamp: 'MGS 6/10/2019 00:49:41'!
assertValidExpirationMonthOfYear: aMonthOfYear 
	
	^[GregorianMonthOfYear year: aMonthOfYear year month: aMonthOfYear month] 
		on: Error do: [self error: self invalidExpirationDateErrorDescription]! !

!CreditCard class methodsFor: 'error handling' stamp: 'LGS 6/9/2019 13:28:56'!
assertValidIdentifier: aPossibleIdentifier 
	
	aPossibleIdentifier size = self identifierSize ifFalse: [Error signal: self invalidIdentifierSizeErrorDescription].
	(aPossibleIdentifier allSatisfy: [:character | character isDigit]) ifFalse: [Error signal: self invalidIdentifierFormatErrorDescription].! !

!CreditCard class methodsFor: 'error handling' stamp: 'MGS 6/10/2019 01:29:53'!
assertValidOwnerName: anOwnerNameString 
	
	^(anOwnerNameString isString and: [anOwnerNameString size between: 1 and: 30]) 
		ifFalse: [self error: self invalidOwnerNameErrorDescription]! !


!CreditCard class methodsFor: 'error description' stamp: 'MGS 6/10/2019 00:41:15'!
invalidExpirationDateErrorDescription
	
	^'El formato de la fecha de expiración es invalido'.! !

!CreditCard class methodsFor: 'error description' stamp: 'LGS 6/9/2019 13:20:28'!
invalidIdentifierFormatErrorDescription
	^'El formato del identificador es invalido'! !

!CreditCard class methodsFor: 'error description' stamp: 'LGS 6/9/2019 13:20:45'!
invalidIdentifierSizeErrorDescription
	^'El identificador de la tarjeta debe tener 16 digitos'! !

!CreditCard class methodsFor: 'error description' stamp: 'MGS 6/10/2019 01:12:00'!
invalidOwnerNameErrorDescription
	^'El nombre de la tarjeta es inválido, o supera los 30 caracteres'! !


!classDefinition: #SaleTransaction category: #TusLibros!
Object subclass: #SaleTransaction
	instanceVariableNames: 'checkingOutCart creditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!SaleTransaction methodsFor: 'initialization' stamp: 'LGS 6/9/2019 11:40:34'!
initializeOn: aCartToCheckOut payingWith: aCreditCardToPay
	
	checkingOutCart := aCartToCheckOut.
	creditCard := aCreditCardToPay ! !


!SaleTransaction methodsFor: 'testing' stamp: 'MGS 6/10/2019 00:15:32'!
assertValidDate: aDate 
	
	(creditCard expiredAt: aDate) ifTrue: [Error signal: Cashier expiredCreditCardErrorMessage ]! !

!SaleTransaction methodsFor: 'testing' stamp: 'LGS 6/9/2019 12:27:51'!
isForCart: aCart 
	
	^checkingOutCart = aCart! !


!SaleTransaction methodsFor: 'sale' stamp: 'LGS 6/9/2019 17:54:54'!
checkOutAt: aDate interfacingWith: aMerchantProcessorInterface  

	self assertValidDate: aDate.
	aMerchantProcessorInterface checkOut: checkingOutCart withCreditCard: creditCard! !

!SaleTransaction methodsFor: 'sale' stamp: 'LGS 6/9/2019 18:01:36'!
saleAmount
	^checkingOutCart itemsPrice! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SaleTransaction class' category: #TusLibros!
SaleTransaction class
	instanceVariableNames: ''!

!SaleTransaction class methodsFor: 'instance creation' stamp: 'LGS 6/9/2019 11:36:57'!
on: aCartToCheckOut payingWith: aCreditCardToPayCheckOut
	
	^self new
		initializeOn: aCartToCheckOut 
		payingWith: aCreditCardToPayCheckOut! !


!classDefinition: #TusLibrosTestRepository category: #TusLibros!
Object subclass: #TusLibrosTestRepository
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 09:45:32'!
anotherItemSellByTheStore
	^'another valid book'
! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/10/2019 13:39:53'!
anotherValidCreditCard
	^CreditCard
		ownerName: self validOwnerName 
		id: self anotherValidCreditCardIdentifier
		expiration: self validExpirationMonthOfYear! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/10/2019 13:39:53'!
anotherValidCreditCardIdentifier
	^'2222222222223333'! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 11:30:50'!
currentDate

	^FixedGregorianDate yearNumber: 2019  monthNumber: 06 dayNumber: 01! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 17:45:47'!
defaultPriceList
	
	^Dictionary newFromPairs: {self itemSellByTheStore. self priceOfItemSellByTheStore. self anotherItemSellByTheStore. self priceOfAnotherItemSellByTheStore}
	
! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/10/2019 13:39:30'!
expiredCreditCard

	^CreditCard
		ownerName: self validOwnerName 
		id: self validCreditCardId
		expiration: self expirednMonthOfYear ! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 17:41:07'!
expirednMonthOfYear
	^June of: 2005! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/10/2019 13:37:53'!
identifierWithInvalidFormat

	^ 'AASAS12211111111' ! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/10/2019 13:38:12'!
identifierWithInvalidSize

	^ '0930940093' ! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/10/2019 13:35:33'!
invalidCreditCard
	
	^CreditCard
		ownerName: self validOwnerName 
		id: self invalidCreditCardId
		expiration: self validExpirationMonthOfYear! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 13:39:31'!
invalidCreditCardId
	
	^'0001000100333333'! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/10/2019 13:35:47'!
invalidExpirationDateCreditCard
	
	^CreditCard
		ownerName: self validOwnerName 
		id: self validCreditCardId
		expiration: self invalidExpirationMonthOfYear! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'MGS 6/10/2019 00:50:36'!
invalidExpirationMonthOfYear
	 
	^'01/19'! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/10/2019 13:39:06'!
invalidIdentifierFormatCreditCard
	
	^CreditCard 
		ownerName: self validOwnerName
		id: self identifierWithInvalidFormat
		expiration: self validExpirationMonthOfYear ! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/10/2019 13:38:46'!
invalidIdentifierSizeCreditCard

	^CreditCard
		ownerName: self validOwnerName 
		id: self identifierWithInvalidSize
		expiration: self validExpirationMonthOfYear ! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'MGS 6/10/2019 01:30:32'!
invalidOwnerName
	^''! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'MGS 6/10/2019 01:08:16'!
invalidOwnerNameCreditCard
	
	^CreditCard
		ownerName: self invalidOwnerName
		id: self validCreditCardId
		expiration: self validExpirationMonthOfYear! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 09:44:57'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 09:42:55'!
itemSellByTheStore
	
	^ 'validBook'! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 09:43:32'!
newCart
	
	^Cart withPriceList: self defaultPriceList! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 10:02:49'!
newCashier
	
	^Cashier withInterface: self! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 17:43:37'!
priceOfAnotherItemSellByTheStore
	^5! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 09:46:33'!
priceOfItemSellByTheStore
	^10! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 09:58:40'!
validCreditCard
	
	^CreditCard
		ownerName: 'Pepe Sanchez'
		id: self validCreditCardId
		expiration: self validExpirationMonthOfYear! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 09:58:40'!
validCreditCardId
	
	^'0001000100010001'! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/9/2019 09:53:05'!
validExpirationMonthOfYear
	^June of: 2025! !

!TusLibrosTestRepository methodsFor: 'repository' stamp: 'LGS 6/10/2019 13:34:08'!
validOwnerName
	^'Pepe Sanchez'! !


!TusLibrosTestRepository methodsFor: 'MP interface simulation' stamp: 'LGS 6/10/2019 13:39:53'!
checkOut: aCart withCreditCard: aCreditCard 
	
	((aCreditCard isIdentifiedBy: self validCreditCardId) or: [aCreditCard isIdentifiedBy: self anotherValidCreditCardIdentifier])
		ifFalse: [Error signal: self invalidCreditCardErrorMessage]! !

!TusLibrosTestRepository methodsFor: 'MP interface simulation' stamp: 'LGS 6/9/2019 13:43:01'!
invalidCreditCardErrorMessage
	^'Hubo un error al debitar de la tarjeta'! !
