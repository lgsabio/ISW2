!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MGS 5/26/2019 15:43:55'!
test01PortfolioWithOneAccountBalanceEqualsToAccountBalance

	|portfolio receptiveAccount |
	
	receptiveAccount := ReceptiveAccount new.
	portfolio := Portfolio with: receptiveAccount.
	self deposit: 100 on: receptiveAccount.
	
	self assert: portfolio balance equals: receptiveAccount  balance! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MGS 5/26/2019 15:54:52'!
test02PortfolioWithManyAccountsEqualsToSummarizedAccountsBalances

	|portfolio receptiveAccount1 receptiveAccount2 |
	
	receptiveAccount1 := ReceptiveAccount new.
	self deposit: 100 on: receptiveAccount1.
	receptiveAccount2 := ReceptiveAccount new.
	self deposit: 200 on: receptiveAccount2.
	portfolio := Portfolio with: receptiveAccount1.
	portfolio add: receptiveAccount2.
		
	self assert: portfolio balance equals: receptiveAccount1  balance + receptiveAccount2  balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MGS 5/26/2019 15:54:37'!
test03PortfolioHasATransactionThatIsRegisteredInHisAccount

	|portfolio receptiveAccount1 receptiveAccount2 deposit |
	
	receptiveAccount1 := ReceptiveAccount new.
	deposit := self deposit: 100 on: receptiveAccount1.
	receptiveAccount2 := ReceptiveAccount new.
	self deposit: 200 on: receptiveAccount2.
	portfolio := Portfolio with: receptiveAccount1.
	portfolio add: receptiveAccount2.
		
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/24/2019 19:56:18'!
test03PortfolioHasRegisteredATransactionRegisterInHisAccount

	|portfolio receptiveAccount1 receptiveAccount2 deposit |
	receptiveAccount1 := ReceptiveAccount new.
	portfolio := Portfolio with: receptiveAccount1.
	deposit := Deposit register: 100 on: receptiveAccount1.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 200 on: receptiveAccount2.
	portfolio 
		add: receptiveAccount2.
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MGS 5/26/2019 15:54:21'!
test04PortfolioDoesntHaveATransactionWichIsNotRegisteredInHisAccounts

	|portfolio receptiveAccount1 receptiveAccount2 deposit |
	
	receptiveAccount1 := ReceptiveAccount new.
	deposit := self deposit: 100 on: receptiveAccount1.
	receptiveAccount2 := ReceptiveAccount new.
	self deposit: 200 on: receptiveAccount2.
	portfolio := Portfolio with: receptiveAccount2.
	
	self deny: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/24/2019 19:56:55'!
test04PortfolioHasntRegisteredATransactionNotRegisteredInHisAccounts

	|portfolio receptiveAccount1 receptiveAccount2 deposit |
	receptiveAccount2 := ReceptiveAccount new.
	portfolio := Portfolio with: receptiveAccount2.
	receptiveAccount1 := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccount1.
	Deposit register: 200 on: receptiveAccount2.
	self deny: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MGS 5/26/2019 15:57:25'!
test05PortfolioTransactionsEqualsToHisAccountsTransactions

	|portfolio receptiveAccount1 receptiveAccount2|
	
	receptiveAccount1 := self newReceptiveAccountWith3Transactions.
	receptiveAccount2 := self newReceptiveAccountWith3Transactions.
	portfolio := Portfolio with: receptiveAccount1.
	portfolio add: receptiveAccount2 .
	
	self assert: portfolio transactions asSet equals: (receptiveAccount1 transactions , receptiveAccount2 transactions) asSet! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MGS 5/26/2019 15:57:50'!
test06PortfolioWithPortfoliosHaveSameTransactionsThanHisAccountables

	|portfolio portfolio2 receptiveAccount1 receptiveAccount2|
	
	receptiveAccount1 := self newReceptiveAccountWith3Transactions.
	receptiveAccount2 := self newReceptiveAccountWith3Transactions.
	portfolio := Portfolio with:receptiveAccount1.
	portfolio2 := Portfolio with: portfolio.
	portfolio2 add: receptiveAccount2 .
	
	self assert: portfolio2 transactions asSet equals: (receptiveAccount1 transactions , receptiveAccount2 transactions) asSet.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MGS 5/26/2019 15:58:12'!
test07BalancePortfolioWithPortfoliosEqualsToSumarizedBalancesOfHisAccountables

	|portfolio portfolio2 receptiveAccount1 receptiveAccount2|
	
	receptiveAccount1 := self newReceptiveAccountWith3Transactions.
	receptiveAccount2 := self newReceptiveAccountWith3Transactions.
	portfolio := Portfolio with:receptiveAccount1.
	portfolio2 := Portfolio with: portfolio.
	portfolio2 add: receptiveAccount2.
	
	self assert: portfolio2 balance equals: receptiveAccount1 balance + receptiveAccount2 balance.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/24/2019 20:03:04'!
test08PortfolioHasRegisteredATransactionRegisterInHisAccountables

	|portfolio portfolio2 receptiveAccount1 receptiveAccount2 deposit  |
	
	receptiveAccount1 := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccount1.
	Deposit register: 200 on: receptiveAccount1.
	Withdraw register: 50 on: receptiveAccount1.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount2.
	Deposit register: 200 on: receptiveAccount2.
	Withdraw register: 50 on: receptiveAccount2.
	portfolio := Portfolio with:receptiveAccount1.
	portfolio2 := Portfolio with: portfolio.
	portfolio2 add: receptiveAccount2 .
	self assert: (portfolio2 hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MGS 5/26/2019 15:58:23'!
test08PortfolioPortfolioHasATransactionThatIsRegisteredInHisAccountables

	|portfolio portfolio2 receptiveAccount1 receptiveAccount2 deposit  |
	
	receptiveAccount1 := ReceptiveAccount new.
	deposit := self deposit: 100 on: receptiveAccount1.
	self deposit: 200 on: receptiveAccount1;
		withdraw: 50 on: receptiveAccount1.
	receptiveAccount2 := self newReceptiveAccountWith3Transactions.
	portfolio := Portfolio with:receptiveAccount1.
	portfolio2 := Portfolio with: portfolio.
	portfolio2 add: receptiveAccount2.
	
	self assert: (portfolio2 hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MGS 5/26/2019 15:58:38'!
test09PortfolioCantHaveRepeatedAccounts

	|portfolio portfolio2 receptiveAccount1 receptiveAccount2|
	
	receptiveAccount1 := self newReceptiveAccountWith3Transactions.
	receptiveAccount2 := self newReceptiveAccountWith3Transactions.
	portfolio := Portfolio with: receptiveAccount1..
	portfolio2 := Portfolio with: portfolio.
	portfolio2 add: receptiveAccount2.
	
	self should: [portfolio2 add: receptiveAccount1] raise: Error  withExceptionDo: [:exception |
		self assert: exception messageText equals: Portfolio alreadyContainedAccountErrorDescription].
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'LGS 5/24/2019 20:14:00'!
test10CantAddAnAccountToAPortfolioWhenThisAccountExistsInAPortfolioThatContainIt

	|portfolio portfolio2 receptiveAccount1 receptiveAccount2 receptiveAccount3 portfolio3   |
	receptiveAccount1 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount1.
	Deposit register: 200 on: receptiveAccount1.
	Withdraw register: 50 on: receptiveAccount1.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount2.
	Deposit register: 200 on: receptiveAccount2.
	Withdraw register: 50 on: receptiveAccount2.
	receptiveAccount3 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount3.
	portfolio := Portfolio with: receptiveAccount1..
	portfolio2 := Portfolio with: portfolio.
	portfolio2 add: receptiveAccount2.
	portfolio3 := Portfolio with: receptiveAccount3.
	portfolio2 add: portfolio3.
	self should: [portfolio3 add: receptiveAccount1 ] raise: Error  withExceptionDo: [:exception |
		self assert: exception messageText equals: Portfolio alreadyContainedAccountErrorDescription].
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MGS 5/26/2019 15:58:49'!
test10CantAddAnAccountToAPortfolioWhenThisAccountExistsInAPortfolioThatContainsIt

	|portfolio portfolio2 receptiveAccount1 receptiveAccount2 receptiveAccount3 portfolio3|
	
	receptiveAccount1 := self newReceptiveAccountWith3Transactions.
	receptiveAccount2 := self newReceptiveAccountWith3Transactions.
	receptiveAccount3 := ReceptiveAccount new.
	self deposit: 100 on: receptiveAccount3.
	portfolio := Portfolio with: receptiveAccount1..
	portfolio2 := Portfolio with: portfolio.
	portfolio2 add: receptiveAccount2.
	portfolio3 := Portfolio with: receptiveAccount3.
	portfolio2 add: portfolio3.
	
	self should: [portfolio3 add: receptiveAccount1 ] raise: Error  withExceptionDo: [:exception |
		self assert: exception messageText equals: Portfolio alreadyContainedAccountErrorDescription].
	! !


!PortfolioTest methodsFor: 'helpers' stamp: 'MGS 5/26/2019 15:46:22'!
deposit: aValue on: aReceptiveAccount 
	
	^Deposit register: 100 on: aReceptiveAccount.! !

!PortfolioTest methodsFor: 'helpers' stamp: 'MGS 5/26/2019 15:57:08'!
newReceptiveAccountWith3Transactions

	|receptiveAccount|
	
	receptiveAccount := ReceptiveAccount new.
	self deposit: 100 on: receptiveAccount;
		deposit: 200 on: receptiveAccount;
		withdraw: 50 on: receptiveAccount.
	
	^receptiveAccount! !

!PortfolioTest methodsFor: 'helpers' stamp: 'MGS 5/26/2019 15:49:13'!
withdraw: aValue on: aReceptiveAccount 
	
	^Withdraw register: aValue on: aReceptiveAccount ! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'LGS 5/23/2019 20:52:03'!
affectBalance: aBalance 
	
	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'LGS 5/23/2019 20:51:23'!
affectBalance: aBalance
 
	^aBalance + value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'LGS 5/23/2019 20:51:52'!
affectBalance: aBalance 
	
	^aBalance  - value! !

!Withdraw methodsFor: 'value' stamp: 'LGS 5/23/2019 20:17:17'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Accountable category: #'Portfolio-Ejercicio'!
Object subclass: #Accountable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Accountable methodsFor: 'transactions' stamp: 'LGS 5/26/2019 19:16:22'!
transactions
	
	self subclassResponsibility ! !


!Accountable methodsFor: 'balance' stamp: 'LGS 5/24/2019 20:26:42'!
balance
	
	self subclassResponsibility ! !


!Accountable methodsFor: 'testing' stamp: 'LGS 5/26/2019 19:18:57'!
hasRegistered: aTransaction
	
	self subclassResponsibility ! !


!Accountable methodsFor: 'adding' stamp: 'LGS 5/26/2019 19:19:40'!
accounts
	
	self subclassResponsibility ! !

!Accountable methodsFor: 'adding' stamp: 'LGS 5/26/2019 19:20:04'!
addInto: aPortfolio
	
	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Accountable subclass: #Portfolio
	instanceVariableNames: 'owners accountables'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'LGS 5/24/2019 18:30:44'!
initializeWith: anAccountable

	accountables := OrderedCollection new.
	owners := OrderedCollection new.
	self add: anAccountable ! !


!Portfolio methodsFor: 'balance' stamp: 'LGS 5/24/2019 17:57:45'!
balance
	
	^accountables sum: [:accountable | accountable balance] ifEmpty: [0]! !


!Portfolio methodsFor: 'adding' stamp: 'MGS 5/26/2019 15:27:47'!
accounts
	
	^self accountablesUnionCollectValuable: [:accountable | accountable accounts].! !

!Portfolio methodsFor: 'adding' stamp: 'LGS 5/24/2019 20:16:57'!
add: anAccountable 
	
	self checkIfCanAdd: anAccountable.
	anAccountable addInto: self ! !

!Portfolio methodsFor: 'adding' stamp: 'LGS 5/24/2019 18:19:29'!
addInto: aPortfolio 
	
	owners add: aPortfolio.
	aPortfolio addPortfolio: self! !

!Portfolio methodsFor: 'adding' stamp: 'LGS 5/24/2019 18:31:52'!
addPortfolio: aPortfolio 
	
	accountables add: aPortfolio! !

!Portfolio methodsFor: 'adding' stamp: 'LGS 5/24/2019 18:18:03'!
addReceptiveAccount: aReceptiveAccount 
	
	accountables add: aReceptiveAccount ! !

!Portfolio methodsFor: 'adding' stamp: 'LGS 5/24/2019 20:24:20'!
canAdd: anAccountable 
	
	^(self accounts includesAnyOf: anAccountable accounts) not! !

!Portfolio methodsFor: 'adding' stamp: 'LGS 5/24/2019 20:24:07'!
checkIfCanAdd: anAccountable

	((self canAdd: anAccountable) and: [owners allSatisfy: [:portfolio | portfolio canAdd: anAccountable]]) 
		ifFalse: [^Error signal: self class alreadyContainedAccountErrorDescription].! !


!Portfolio methodsFor: 'testing' stamp: 'LGS 5/24/2019 17:58:28'!
hasRegistered: aTransaction

	^accountables anySatisfy: [:accountable | accountable transactions includes: aTransaction ]
	
	! !


!Portfolio methodsFor: 'collecting' stamp: 'MGS 5/26/2019 15:26:57'!
accountablesUnionCollectValuable: aClosure
	
	^accountables inject: OrderedCollection new 
		into:  [:accounts :eachAccountable | accounts addAll: (aClosure value: eachAccountable); yourself]! !


!Portfolio methodsFor: 'transactions' stamp: 'MGS 5/26/2019 15:28:41'!
transactions
	
	^self accountablesUnionCollectValuable: [:accountable | accountable transactions].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error handling' stamp: 'LGS 5/23/2019 21:19:45'!
alreadyContainedAccountErrorDescription
	
	^'No se puede agregar una cuenta que ya posee un portfolio'! !

!Portfolio class methodsFor: 'error handling' stamp: 'LGS 5/24/2019 18:29:14'!
with: anAccountable

	^self new initializeWith: anAccountable ! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Accountable subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'LGS 5/23/2019 20:48:45'!
balance

	^transactions inject: 0 into: [ :currentBalance :aTransaction | aTransaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'adding' stamp: 'LGS 5/23/2019 21:51:45'!
accounts
	^OrderedCollection with: self! !

!ReceptiveAccount methodsFor: 'adding' stamp: 'LGS 5/24/2019 18:17:34'!
addInto: aPortfolio 
	
	aPortfolio addReceptiveAccount: self! !
