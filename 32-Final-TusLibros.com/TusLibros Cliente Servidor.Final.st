!classDefinition: #TusLibrosWebClientTest category: #'TusLibros Cliente Servidor'!
TestCase subclass: #TusLibrosWebClientTest
	instanceVariableNames: 'webClient url client webClientSimulator testObjectsFactory interfaceBuilder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros Cliente Servidor'!

!TusLibrosWebClientTest methodsFor: 'support' stamp: 'LGS 6/30/2019 18:05:38'!
checkOutCart: aCartID

	client 
		sendCheckOutCart: aCartID 
		ccn: testObjectsFactory validCreditCardNumber 
		cced: testObjectsFactory validExpirationDate  
		cco: testObjectsFactory validCreditCardOwner.
! !

!TusLibrosWebClientTest methodsFor: 'support' stamp: 'LGS 6/30/2019 18:00:22'!
createACart

	^ client sendCreateCartWithClient: self validClient password: self validPassword.! !

!TusLibrosWebClientTest methodsFor: 'support' stamp: 'LGS 6/30/2019 15:59:37'!
setUp

	interfaceBuilder := TusLibrosInputInterfaceBuilder new.
	webClientSimulator := WebClientServerTestSimulator on: interfaceBuilder defaultInterface.
	client := TusLibrosWebClient onURL: 'http://localhost:8080' andWebClient: webClientSimulator.
	testObjectsFactory := StoreTestObjectsFactory new.
	 ! !

!TusLibrosWebClientTest methodsFor: 'support' stamp: 'LGS 6/30/2019 16:06:42'!
validClient
	^interfaceBuilder firstValidClient ! !

!TusLibrosWebClientTest methodsFor: 'support' stamp: 'LGS 6/30/2019 16:07:12'!
validPassword
	^interfaceBuilder firstValidPassword ! !

!TusLibrosWebClientTest methodsFor: 'support' stamp: 'LGS 6/30/2019 15:03:00'!
wrongAuthenticationErrorMessage

	^TusLibrosInputInterface invalidAuthenticationErrorDescription! !


!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 15:59:52'!
test01SendCreateCartWithWrongClientAndPasswordShouldRaiseAnError

	self 
		should: [client  sendCreateCartWithClient: self validClient password: 'wrong'.] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error | self assert: error messageText equals: self wrongAuthenticationErrorMessage]! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 15:52:40'!
test02SendCreateCartWithWrongClientShouldRaiseAnError

	self 
		should: [client  sendCreateCartWithClient: 'Algo' password: 'wrong'.] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:error | self assert: error messageText equals: TusLibrosInputInterface invalidClientIDErrorDescription ]! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 15:52:22'!
test03ListANonExistentCartShouldRaiseAnError

	self 
		should: [client sendListCart: 0]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:ex | 
			self assert: ex messageText equals: TusLibrosInputInterface invalidCartIDErrorDescription.
			 ]! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:03:53'!
test04ListACreatedCartWithAQuantityOfAnItemAddedShouldReturnAListWithTheItemWithTheQuantity

	| cartID list|
	cartID := self createACart.
	client sendAddToCart: cartID isbn: testObjectsFactory itemSellByTheStore quantity: 5.
	list := client sendListCart: cartID.
	self assert: (list includesKey: testObjectsFactory itemSellByTheStore).
	self assert: list asSet size equals: 1.
	self assert: (list at: testObjectsFactory itemSellByTheStore) equals: 5.
	! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:03:44'!
test05ListAnEmptyCartCreatedShouldReturnAnEmptyList

	| cartID |
	cartID := self createACart.
	self assert: (client sendListCart: cartID) isEmpty! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:06:08'!
test06CheckOutAnEmptyCartShouldRaiseAnError

	| cartID|
	cartID := self createACart.
	self 
		should: [self checkOutCart: cartID]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: Cashier cartCanNotBeEmptyErrorMessage;
				assert: (client sendListCart: cartID) isEmpty;
				assert: (client sendListPurchasesOfClient: self validClient password: self validPassword) isEmpty]
	! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:06:26'!
test07CheckOutAnItemAddedCartShouldListHisPurchases

	| cartID|
	cartID := self createACart.
	client sendAddToCart: cartID isbn: testObjectsFactory itemSellByTheStore quantity: 5.
	self checkOutCart: cartID.
	self 
		assert: ((client sendListPurchasesOfClient: self validClient password: self validPassword) at: testObjectsFactory itemSellByTheStore)
		equals: 5;
		assert: ((client sendListPurchasesOfClient: self validClient password: self validPassword) at: 'Total')
		equals: testObjectsFactory itemSellByTheStorePrice * 5
	! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:07:02'!
test08CheckOutAClientWithManyCartsShouldListHisPurchases

	| cartID anotherCartID |
	cartID := self createACart.
	client sendAddToCart: cartID isbn: testObjectsFactory itemSellByTheStore quantity: 5.
	anotherCartID := client sendCreateCartWithClient: self validClient password: self validPassword.
	client sendAddToCart: anotherCartID isbn: testObjectsFactory anotherItemSellByTheStore quantity:45.
	self checkOutCart: cartID.
	self checkOutCart: anotherCartID.
	self 
		assert: ((client sendListPurchasesOfClient: self validClient password: self validPassword) at: testObjectsFactory itemSellByTheStore)
		equals: 5;
		assert: ((client sendListPurchasesOfClient: self validClient password: self validPassword) at: testObjectsFactory anotherItemSellByTheStore )
		equals: 45;
		assert: ((client sendListPurchasesOfClient: self validClient password: self validPassword) at: 'Total')
		equals: testObjectsFactory itemSellByTheStorePrice * 5 + (testObjectsFactory anotherItemSellByTheStorePrice * 45) 
	! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:03:04'!
test09CheckOutAnItemAddedCartWithExpiredCardShouldRaiseAnError

	| cartID|
	cartID := self createACart.
	client sendAddToCart: cartID isbn: testObjectsFactory itemSellByTheStore quantity: 5.
	self 
		should: [client 
					sendCheckOutCart: cartID 
					ccn: testObjectsFactory validCreditCardNumber
					cced: testObjectsFactory expiredDate  
					cco: testObjectsFactory validCreditCardOwner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: Cashier canNotChargeAnExpiredCreditCardErrorMessage;
				assert: ((client sendListCart: cartID) at: testObjectsFactory itemSellByTheStore) equals: 5;
				assert: (client sendListPurchasesOfClient: self validClient password: self validPassword) isEmpty]
	! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:02:55'!
test10CheckOutAnItemAddedCartWithInvalidCreditCardNumberShouldRaiseAnError

	| cartID|
	cartID := self createACart.
	client sendAddToCart: cartID isbn: testObjectsFactory itemSellByTheStore quantity: 5.
	self 
		should: [client 
					sendCheckOutCart: cartID 
					ccn: testObjectsFactory invalidCreditCardNumber
					cced: testObjectsFactory validExpirationDate 
					cco: testObjectsFactory validCreditCardOwner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: CreditCard invalidCreditCardNumberErrorDescription;
				assert: ((client sendListCart: cartID) at: testObjectsFactory itemSellByTheStore) equals: 5;
				assert: (client sendListPurchasesOfClient: self validClient password: self validPassword) isEmpty]
	! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:02:43'!
test11CheckOutAnItemAddedCartWithInvalidCreditCardOwnerShouldRaiseAnError

	| cartID|
	cartID := self createACart.
	client sendAddToCart: cartID isbn: testObjectsFactory itemSellByTheStore quantity: 5.
	self 
		should: [client 
					sendCheckOutCart: cartID 
					ccn: testObjectsFactory validCreditCardNumber
					cced: testObjectsFactory validExpirationDate 
					cco: testObjectsFactory invalidCreditCardOwner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:ex | 
			self 
				assert: ex messageText equals: CreditCard invalidCreditCardOwnerErrorDescription;
				assert: ((client sendListCart: cartID) at: testObjectsFactory itemSellByTheStore) equals: 5;
				assert: (client sendListPurchasesOfClient: self validClient password: self validPassword) isEmpty]! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:07:27'!
test12ListAfterCheckOutShouldRaiseAnError

	| cartID|
	cartID := self createACart.
	client sendAddToCart: cartID isbn: testObjectsFactory itemSellByTheStore quantity: 5.
	self checkOutCart: cartID.
		self 
			should: [client sendListCart: cartID]
			raise: Error - MessageNotUnderstood
			withExceptionDo: [:ex | 
				self 
					assert: ex messageText equals: CartInterface soldCartErrorDescription ]! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:07:53'!
test13CheckOutAfterCheckOutShouldRaiseAnError

	| cartID|
	cartID := self createACart.
	client sendAddToCart: cartID isbn: testObjectsFactory itemSellByTheStore quantity: 5.
	self checkOutCart: cartID.
		self 
			should: [self checkOutCart: cartID]
			raise: Error - MessageNotUnderstood
			withExceptionDo: [:ex | 
				self 
					assert: ex messageText equals: CartInterface soldCartErrorDescription]! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:09:35'!
test14AddToCartAfterCheckOutShouldRaiseAnError

	| cartID|
	cartID :=self createACart.
	client sendAddToCart: cartID isbn: testObjectsFactory itemSellByTheStore quantity: 5.
	self checkOutCart: cartID.
		self 
			should: [client sendAddToCart: cartID isbn: testObjectsFactory itemSellByTheStore quantity: 5]
			raise: Error - MessageNotUnderstood
			withExceptionDo: [:ex | 
				self 
					assert: ex messageText equals: CartInterface soldCartErrorDescription]! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:10:51'!
test15AddToCartInvalidQuantityOfItemsShouldRaiseAnError

	| cartID|
	cartID :=self createACart.
		self 
			should: [client sendAddToCart: cartID isbn: testObjectsFactory itemSellByTheStore quantity: -5.
		]
			raise: Error - MessageNotUnderstood
			withExceptionDo: [:ex | 
				self 
					assert: ex messageText equals: Cart invalidQuantityErrorMessage ]! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 6/30/2019 18:17:01'!
test16AddToCartInvalidItemShouldRaiseAnError

	| cartID|
	cartID :=self createACart.
		self 
			should: [client sendAddToCart: cartID isbn: testObjectsFactory itemNotSellByTheStore quantity: 4.
		]
			raise: Error - MessageNotUnderstood
			withExceptionDo: [:ex | 
				self 
					assert: ex messageText equals: Cart invalidItemErrorMessage ]! !

!TusLibrosWebClientTest methodsFor: 'testing send protocol' stamp: 'LGS 7/7/2019 21:57:02'!
test17ListCatalogForValidClientPasswordShouldAnswerCatalogue

	| catalog|
	catalog := client sendListCatalogWithClient: self validClient password: self validPassword.
	self assert:catalog equals: testObjectsFactory defaultCatalog keys! !


!classDefinition: #TusLibrosServer category: #'TusLibros Cliente Servidor'!
Object subclass: #TusLibrosServer
	instanceVariableNames: 'webServer interface'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros Cliente Servidor'!

!TusLibrosServer methodsFor: 'initialization' stamp: 'LGS 6/29/2019 22:45:31'!
destroy
	
	webServer destroy ! !

!TusLibrosServer methodsFor: 'initialization' stamp: 'LGS 6/30/2019 12:10:50'!
initializeOverInterface: tusLibrosInputInterface webServer: aWebServer
 
	interface := tusLibrosInputInterface.
	webServer := aWebServer.
	self addServices.
	webServer startListener! !


!TusLibrosServer methodsFor: 'services' stamp: 'LGS 6/30/2019 16:15:21'!
addServiceNamed: serviceName sendingResponseTo: aRequestActionClossure
	webServer 
		addService: '/' , serviceName 
		action: [:request | 
			[request send200Response: (WebUtils jsonEncode: (aRequestActionClossure value: request))]
				on: Error - MessageNotUnderstood 
				do: [ :anError | request send404Response: (anError messageText) ].
			] 
	! !

!TusLibrosServer methodsFor: 'services' stamp: 'LGS 6/30/2019 18:15:34'!
addServices
	self 
		addServiceNamed: 'createCart' 
		sendingResponseTo: [:request | interface createCartWithClientId: (request fields at: 'clientID')  password: (request fields at: 'password')];
		addServiceNamed: 'listCatalog' 
		sendingResponseTo: [:request | interface listCatalogForClientId: (request fields at: 'clientID')  password: (request fields at: 'password')];
		addServiceNamed: 'addToCart' 
		sendingResponseTo: [:request | interface addToCartId: (request fields at: 'cartID') asInteger bookIsbn: (request fields at: 'isbn') bookQuantity: (request fields at: 'quantity') asNumber];
		addServiceNamed: 'listCart' 
		sendingResponseTo: [:request | interface listCartId:  (request fields at: 'cartID') asInteger];
		addServiceNamed: 'checkOutCart' 
		sendingResponseTo: [:request | interface 
											checkOutCartId: (request fields at: 'cartID') asInteger 
											ccn: (request fields at: 'ccn') 
											cced: (self toMonthOfYear: (request fields at: 'cced')) 
											cco:  (request fields at: 'cco')];
		addServiceNamed: 'listPurchases' 
		sendingResponseTo: [:request | interface listPurchasesOfClientId: (request fields at: 'clientID') password:  (request fields at: 'password')]! !

!TusLibrosServer methodsFor: 'services' stamp: 'LGS 6/30/2019 12:01:22'!
toMonthOfYear: aStringWithMonthOfYearFormat

	^(aStringWithMonthOfYearFormat replaceAll: $| with: $/) asMonth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosServer class' category: #'TusLibros Cliente Servidor'!
TusLibrosServer class
	instanceVariableNames: ''!

!TusLibrosServer class methodsFor: 'instance creation' stamp: 'LGS 6/30/2019 15:26:57'!
over: tusLibrosInputInterface webServer: aWebServer 
	
	^self new
		initializeOverInterface: tusLibrosInputInterface
		webServer: aWebServer! !


!classDefinition: #TusLibrosWebClient category: #'TusLibros Cliente Servidor'!
Object subclass: #TusLibrosWebClient
	instanceVariableNames: 'webClient url'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros Cliente Servidor'!

!TusLibrosWebClient methodsFor: 'initialization' stamp: 'LGS 6/30/2019 12:13:55'!
initializeOnURL: anURLToSendRequests andWebClient: aWebClient  
	url := anURLToSendRequests.
	webClient := aWebClient ! !


!TusLibrosWebClient methodsFor: 'sending request' stamp: 'LGS 6/30/2019 11:44:32'!
encodedDictionary: aDictionaryOfFieldsToSendRequest

	| encodedDictionary |
	encodedDictionary := Dictionary new.
	aDictionaryOfFieldsToSendRequest 
		associationsDo: [:assoc | encodedDictionary at: assoc key put: (self encodedParameter: assoc value asString)].
	^encodedDictionary! !

!TusLibrosWebClient methodsFor: 'sending request' stamp: 'LGS 6/30/2019 11:43:24'!
encodedParameter: aParameter
	
	^aParameter copyReplaceAll: ' ' with: '%20'. ! !

!TusLibrosWebClient methodsFor: 'sending request' stamp: 'LGS 6/30/2019 09:56:21'!
sendAddToCart: aCartID isbn: anISBNToAddInCart quantity: quantityOfItemsToAdd 
	
	| fields |
	fields := Dictionary new
				at: 'cartID' put: aCartID;
				at: 'isbn' put: anISBNToAddInCart;
				at: 'quantity' put: quantityOfItemsToAdd;
				yourself.
	self sendRequestNamed: 'addToCart' fields: fields.! !

!TusLibrosWebClient methodsFor: 'sending request' stamp: 'LGS 6/30/2019 12:00:27'!
sendCheckOutCart: aCartID ccn: aCreditCardNumber cced: anExpirationDate cco: aCreditCardOwner 
	
	| fields encodedExpirationDate|
	encodedExpirationDate := '{1}|{2}' format: {anExpirationDate monthIndex.anExpirationDate yearNumber.}.
	fields := Dictionary new
				at: 'cartID' put: aCartID;
				at: 'ccn' put: aCreditCardNumber;
				at: 'cced' put: encodedExpirationDate;
				at: 'cco' put: aCreditCardOwner;
				yourself.
	^self sendRequestNamed: 'checkOutCart' fields: fields! !

!TusLibrosWebClient methodsFor: 'sending request' stamp: 'LGS 6/30/2019 09:49:12'!
sendCreateCartWithClient: aClientIDToCartCreation password: passwordToLoginWithClient 
	|fields|
	fields := Dictionary  new at: 'clientID' put: aClientIDToCartCreation; at: 'password' put: passwordToLoginWithClient; yourself.
	^self sendRequestNamed: 'createCart' fields: fields! !

!TusLibrosWebClient methodsFor: 'sending request' stamp: 'LGS 6/30/2019 10:01:03'!
sendListCart: aCartIDToList 
	
	^self sendRequestNamed: 'listCart' fields: (Dictionary new at: 'cartID' put: aCartIDToList; yourself)! !

!TusLibrosWebClient methodsFor: 'sending request' stamp: 'LGS 6/30/2019 10:03:44'!
sendListCatalogWithClient: aClientIDToListCatalog password: passwordOfTheClientToLogin 
	
	| fields |
	fields := Dictionary new 
				at: 'clientID' put: aClientIDToListCatalog;
				at: 'password' put: passwordOfTheClientToLogin;
				yourself.
	^self sendRequestNamed: 'listCatalog' fields: fields
	! !

!TusLibrosWebClient methodsFor: 'sending request' stamp: 'LGS 6/30/2019 17:38:34'!
sendListPurchasesOfClient: aClientID password: aPassword 
	
	| fields |
	fields := Dictionary new
				at: 'clientID' put: aClientID;
				at: 'password' put: aPassword;
				yourself.
	^self sendRequestNamed: 'listPurchases' fields: fields ! !

!TusLibrosWebClient methodsFor: 'sending request' stamp: 'LGS 6/30/2019 12:14:15'!
sendRequestNamed: aRequestName fields: fieldsToSendInRequest 
	
	| response |
	response := webClient htmlSubmit: url, '/' , aRequestName fields: (self encodedDictionary: fieldsToSendInRequest).
	^response isSuccess 
		ifTrue:[(WebUtils jsonDecode: ((response content) readStream)) ] 
		ifFalse:[self error: response content].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosWebClient class' category: #'TusLibros Cliente Servidor'!
TusLibrosWebClient class
	instanceVariableNames: ''!

!TusLibrosWebClient class methodsFor: 'instance creation' stamp: 'LGS 6/30/2019 12:13:39'!
onURL: anURLToSendRequest andWebClient: aWebClient  
	^self new
		initializeOnURL: anURLToSendRequest andWebClient: aWebClient ! !


!classDefinition: #WebClientServerTestSimulator category: #'TusLibros Cliente Servidor'!
Object subclass: #WebClientServerTestSimulator
	instanceVariableNames: 'webServer services fields'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros Cliente Servidor'!

!WebClientServerTestSimulator methodsFor: 'initialization' stamp: 'LGS 6/30/2019 15:59:11'!
initializeOn: anInterface

	services := Dictionary new.
	webServer := TusLibrosServer over: anInterface webServer: self! !


!WebClientServerTestSimulator methodsFor: 'services' stamp: 'LGS 6/30/2019 15:28:29'!
addService: aServiceName action: aServiceAction 
	
	services at: aServiceName put: aServiceAction ! !


!WebClientServerTestSimulator methodsFor: 'server protocol' stamp: 'LGS 6/30/2019 15:29:22'!
startListener
! !


!WebClientServerTestSimulator methodsFor: 'client protocol' stamp: 'LGS 6/30/2019 15:34:22'!
htmlSubmit: anURL fields: aDictionaryOfParameters
	
	fields := aDictionaryOfParameters.
	^self request: (self serviceNameFrom: anURL) ! !


!WebClientServerTestSimulator methodsFor: 'client support' stamp: 'LGS 6/30/2019 15:40:17'!
serviceNameFrom: anURL 

	^'/' , (anURL prefixAndSuffix: $/) second! !


!WebClientServerTestSimulator methodsFor: 'request protocol' stamp: 'LGS 6/30/2019 15:43:36'!
fields

	^fields! !

!WebClientServerTestSimulator methodsFor: 'request protocol' stamp: 'LGS 6/30/2019 16:11:46'!
send200Response: aResponseContent 
	
	^WebResponseSimulator contents: aResponseContent
		! !

!WebClientServerTestSimulator methodsFor: 'request protocol' stamp: 'LGS 6/30/2019 15:42:57'!
send404Response: anErrorMessage 
	
	self error: anErrorMessage! !


!WebClientServerTestSimulator methodsFor: 'server support' stamp: 'LGS 6/30/2019 15:41:41'!
request: aServiceName 
	^(services at: aServiceName) value: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WebClientServerTestSimulator class' category: #'TusLibros Cliente Servidor'!
WebClientServerTestSimulator class
	instanceVariableNames: ''!

!WebClientServerTestSimulator class methodsFor: 'instance creation' stamp: 'LGS 6/30/2019 15:58:29'!
on: anInterface

	^self new
		initializeOn: anInterface! !


!classDefinition: #WebResponseSimulator category: #'TusLibros Cliente Servidor'!
Object subclass: #WebResponseSimulator
	instanceVariableNames: 'content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros Cliente Servidor'!

!WebResponseSimulator methodsFor: 'initialization' stamp: 'LGS 6/30/2019 16:18:48'!
initializeOn: aResponseContents 
	content := aResponseContents ! !


!WebResponseSimulator methodsFor: 'response protocol' stamp: 'LGS 6/30/2019 16:18:48'!
content
	^content ! !

!WebResponseSimulator methodsFor: 'response protocol' stamp: 'LGS 6/30/2019 16:17:00'!
isSuccess
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WebResponseSimulator class' category: #'TusLibros Cliente Servidor'!
WebResponseSimulator class
	instanceVariableNames: ''!

!WebResponseSimulator class methodsFor: 'instance creation' stamp: 'LGS 6/30/2019 16:16:04'!
contents: aResponseContents 
	^self new
		initializeOn: aResponseContents ! !
