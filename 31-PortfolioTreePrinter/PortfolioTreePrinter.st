!classDefinition: #AccountReportTest category: #PortfolioTreePrinter!
TestCase subclass: #AccountReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!AccountReportTest methodsFor: 'common portfolio tree tests ' stamp: 'LGS 6/2/2019 11:50:12'!
test22CommonTreeReportOfPortfolioWithOnlyReceptiveAccountsShouldAnswerCorrectString


	| familyPortfolio myAccount portfolioTreeReport |
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.

	portfolioTreeReport := 'Portfolio de la familia
	Cuenta mia'.
	self assert: (CommonPortfolioTree on: familyPortfolio) report equals: portfolioTreeReport
		! !

!AccountReportTest methodsFor: 'common portfolio tree tests ' stamp: 'LGS 6/2/2019 11:50:12'!
test23CommonTreeReportOfPortfolioWithPortfoliosAndReceptiveAccountsShouldAnswerCorrectString


	| angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount portfolioTreeReport |
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.

	portfolioTreeReport := 'Portfolio de la familia
	Cuenta mia
	Portfolio de hijos
		Cuenta de Juan
		Cuenta de Angeles'.
	self assert: (CommonPortfolioTree on: familyPortfolio) report equals: portfolioTreeReport
		! !


!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:21:53'!
test01AccountSummaryOfEmptyReceptiveAccountShouldAnswerZeroBalanceString

	|account summaryOfAccount|
	account := ReceptiveAccount new.

	
	summaryOfAccount := 'Balance = 0'.

	self 
		assert: (AccountSummary on: account) report  equals: summaryOfAccount
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:22:02'!
test02AccountSummaryOfReceptiveAccountWithDepositShouldAnswerCorrectString

	|account otherAccount summaryOfAccount summaryOfOtherAccount|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		deposit: 200 in: otherAccount.
		
	summaryOfAccount := 'Depósito por 100.
Balance = 100'.
	summaryOfOtherAccount := 'Depósito por 200.
Balance = 200'.
	self 
		assert: (AccountSummary on: account) report  equals: summaryOfAccount;
		assert: (AccountSummary on: otherAccount ) report  equals: summaryOfOtherAccount
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:23:47'!
test03AccountSummaryOfReceptiveAccountWithWithdrawsShouldAnswerCorrectString

	|account otherAccount summaryOfAccount summaryOfOtherAccount|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		withdraw: 50 in: account;
		withdraw: 100 in: otherAccount.

	summaryOfAccount := 'Extracción por 50.
Balance = -50'.
	summaryOfOtherAccount := 'Extracción por 100.
Balance = -100'.
	self 
		assert: (AccountSummary on: account) report  equals: summaryOfAccount;
		assert: (AccountSummary on: otherAccount ) report  equals: summaryOfOtherAccount
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:30:09'!
test04AccountSummaryOfReceptiveAccountWithTransferencesShouldAnswerCorrectString

	|account otherAccount summaryOfAccount summaryOfOtherAccount|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		transfer: 50 from: account to: otherAccount;
		transfer: 30 from: otherAccount to: account.
	summaryOfAccount := 'Salida por transferencia de 50.
Entrada por transferencia de 30.
Balance = -20'.
	summaryOfOtherAccount := 'Entrada por transferencia de 50.
Salida por transferencia de 30.
Balance = 20'.
	self 
		assert: (AccountSummary on: account) report  equals: summaryOfAccount;
		assert: (AccountSummary on: otherAccount ) report  equals: summaryOfOtherAccount
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:25:55'!
test05AccountSummaryOfReceptiveAccountWithDepositsAndWithdrawsShouldAnswerCorrectString

	|account otherAccount summaryOfAccount summaryOfOtherAccount|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		withdraw: 50 in: account;
		deposit: 200 in: otherAccount;
		withdraw: 100 in: otherAccount.
	summaryOfAccount := 'Depósito por 100.
Extracción por 50.
Balance = 50'.
	summaryOfOtherAccount := 'Depósito por 200.
Extracción por 100.
Balance = 100'.
	self 
		assert: (AccountSummary on: account) report  equals: summaryOfAccount;
		assert: (AccountSummary on: otherAccount ) report  equals: summaryOfOtherAccount
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:27:07'!
test06AccountSummaryOfReceptiveAccountWithDepositsAndTransferencesShouldAnswerCorrectString

	|account otherAccount summaryOfAccount summaryOfOtherAccount|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		deposit: 200 in: otherAccount;
		transfer: 50 from: account to: otherAccount;
		transfer: 30 from: otherAccount to: account.
	summaryOfAccount := 'Depósito por 100.
Salida por transferencia de 50.
Entrada por transferencia de 30.
Balance = 80'.
	summaryOfOtherAccount := 'Depósito por 200.
Entrada por transferencia de 50.
Salida por transferencia de 30.
Balance = 220'.
	self 
		assert: (AccountSummary on: account) report  equals: summaryOfAccount;
		assert: (AccountSummary on: otherAccount ) report  equals: summaryOfOtherAccount
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:28:54'!
test07AccountSummaryOfReceptiveAccountWithWithdrawsAndTransferencesShouldAnswerCorrectString

	|account otherAccount summaryOfAccount summaryOfOtherAccount|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		withdraw: 50 in: account;
		withdraw: 100 in: otherAccount;
		transfer: 50 from: account to: otherAccount;
		transfer: 30 from: otherAccount to: account.
	summaryOfAccount := 'Extracción por 50.
Salida por transferencia de 50.
Entrada por transferencia de 30.
Balance = -70'.
	summaryOfOtherAccount := 'Extracción por 100.
Entrada por transferencia de 50.
Salida por transferencia de 30.
Balance = -80'.
	self 
		assert: (AccountSummary on: account) report  equals: summaryOfAccount;
		assert: (AccountSummary on: otherAccount ) report  equals: summaryOfOtherAccount
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:29:04'!
test08AccountSummaryOfReceptiveAccountWithDepositsAndWithdrawsAndTransferencesShouldAnswerCorrectString

	|account otherAccount summaryOfAccount summaryOfOtherAccount|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		withdraw: 50 in: account;
		deposit: 200 in: otherAccount;
		withdraw: 100 in: otherAccount;
		transfer: 50 from: account to: otherAccount;
		transfer: 30 from: otherAccount to: account.
	summaryOfAccount := 'Depósito por 100.
Extracción por 50.
Salida por transferencia de 50.
Entrada por transferencia de 30.
Balance = 30'.
	summaryOfOtherAccount := 'Depósito por 200.
Extracción por 100.
Entrada por transferencia de 50.
Salida por transferencia de 30.
Balance = 120'.
	self 
		assert: (AccountSummary on: account) report  equals: summaryOfAccount;
		assert: (AccountSummary on: otherAccount ) report  equals: summaryOfOtherAccount
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:32:03'!
test09AccountSummaryOfPortfolioWithoutTransactionssouldAnswerZeroBalanceString

	|portfolio account otherAccount summaryOfPortfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	portfolio add: otherAccount.
	summaryOfPortfolio := 'Balance = 0'.
	self 
		assert: (AccountSummary on: portfolio) report  equals: summaryOfPortfolio 
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:33:19'!
test10AccountSummaryOfPortfolioWithDepositsShouldAnswerCorrectString

	|portfolio account otherAccount summaryOfPortfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		deposit: 200 in: otherAccount.
	portfolio := Portfolio with: account.
	portfolio add: otherAccount.
	summaryOfPortfolio := 'Depósito por 100.
Depósito por 200.
Balance = 300'.
	self 
		assert: (AccountSummary on: portfolio) report  equals: summaryOfPortfolio 
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:55:33'!
test11AccountSummaryOfPortfolioWithWithdrawsShouldAnswerCorrectString

	|portfolio account otherAccount summaryOfPortfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		withdraw: 50 in: account;
		withdraw: 100 in: otherAccount.
	portfolio := Portfolio with: account.
	portfolio add: otherAccount.
	summaryOfPortfolio := 'Extracción por 50.
Extracción por 100.
Balance = -150'.
	self 
		assert: (AccountSummary on: portfolio) report  equals: summaryOfPortfolio 
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:35:35'!
test12AccountSummaryOfPortfolioWithTransferencesShouldAnswerCorrectString

	|portfolio account otherAccount summaryOfPortfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		transfer: 50 from: account to: otherAccount;
		transfer: 30 from: otherAccount to: account.
	portfolio := Portfolio with: account.
	portfolio add: otherAccount.
	summaryOfPortfolio := 'Salida por transferencia de 50.
Entrada por transferencia de 30.
Entrada por transferencia de 50.
Salida por transferencia de 30.
Balance = 0'.
	self 
		assert: (AccountSummary on: portfolio) report  equals: summaryOfPortfolio 
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:36:19'!
test13AccountSummaryOfPortfolioWithDepositsAndWithdrawsShouldAnswerCorrectString

	|portfolio account otherAccount summaryOfPortfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		withdraw: 50 in: account;
		deposit: 200 in: otherAccount;
		withdraw: 100 in: otherAccount.
	portfolio := Portfolio with: account.
	portfolio add: otherAccount.
	summaryOfPortfolio := 'Depósito por 100.
Extracción por 50.
Depósito por 200.
Extracción por 100.
Balance = 150'.
	self 
		assert: (AccountSummary on: portfolio) report  equals: summaryOfPortfolio 
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:37:10'!
test14AccountSummaryOfPortfolioWithDepositsAndTransferencesShouldAnswerCorrectString

	|portfolio account otherAccount summaryOfPortfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		deposit: 200 in: otherAccount;
		transfer: 50 from: account to: otherAccount;
		transfer: 30 from: otherAccount to: account.
	portfolio := Portfolio with: account.
	portfolio add: otherAccount.
	summaryOfPortfolio := 'Depósito por 100.
Salida por transferencia de 50.
Entrada por transferencia de 30.
Depósito por 200.
Entrada por transferencia de 50.
Salida por transferencia de 30.
Balance = 300'.
	self 
		assert: (AccountSummary on: portfolio) report  equals: summaryOfPortfolio 
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:38:17'!
test15AccountSummaryOfPortfolioWithWithdrawsAndTransferencesShouldAnswerCorrectString

	|portfolio account otherAccount summaryOfPortfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		withdraw: 50 in: account;
		withdraw: 100 in: otherAccount;
		transfer: 50 from: account to: otherAccount;
		transfer: 30 from: otherAccount to: account.
	portfolio := Portfolio with: account.
	portfolio add: otherAccount.
	summaryOfPortfolio := 'Extracción por 50.
Salida por transferencia de 50.
Entrada por transferencia de 30.
Extracción por 100.
Entrada por transferencia de 50.
Salida por transferencia de 30.
Balance = -150'.
	self 
		assert: (AccountSummary on: portfolio) report  equals: summaryOfPortfolio 
	! !

!AccountReportTest methodsFor: 'account summary tests' stamp: 'LGS 6/2/2019 11:38:40'!
test16AccountSummaryOfPortfolioWithDepositsAndWithdrawsAndTransferencesShouldAnswerCorrectString

	|portfolio account otherAccount summaryOfPortfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		withdraw: 50 in: account;
		deposit: 200 in: otherAccount;
		withdraw: 100 in: otherAccount;
		transfer: 50 from: account to: otherAccount;
		transfer: 30 from: otherAccount to: account.
	portfolio := Portfolio with: account.
	portfolio add: otherAccount.
	summaryOfPortfolio := 'Depósito por 100.
Extracción por 50.
Salida por transferencia de 50.
Entrada por transferencia de 30.
Depósito por 200.
Extracción por 100.
Entrada por transferencia de 50.
Salida por transferencia de 30.
Balance = 150'.
	self 
		assert: (AccountSummary on: portfolio) report  equals: summaryOfPortfolio 
	! !


!AccountReportTest methodsFor: 'transfer net tests' stamp: 'LGS 6/2/2019 11:41:05'!
test17ATransferNetOfReceptiveAccountWithoutTransferencesShouldAnswerZero

	|account otherAccount|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		withdraw: 50 in: account;
		deposit: 200 in: otherAccount;
		withdraw: 100 in: otherAccount.
	
	self 
		assert: (TransferNet on: account) report  equals: 0;
		assert: (TransferNet on: otherAccount ) report  equals: 0
	! !

!AccountReportTest methodsFor: 'transfer net tests' stamp: 'LGS 6/2/2019 11:42:21'!
test18ATransferNetOfReceptiveAccountWithOneTransferenceShouldAnswerCorrectTransferBalance

	|account otherAccount|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		withdraw: 50 in: account;
		deposit: 200 in: otherAccount;
		withdraw: 100 in: otherAccount;
		transfer: 50 from: account to: otherAccount;
		transfer: 30 from: otherAccount to: account.
	
	self 
		assert: (TransferNet on: account) report  equals: -20;
		assert: (TransferNet on: otherAccount ) report  equals: 20
	! !

!AccountReportTest methodsFor: 'transfer net tests' stamp: 'LGS 6/2/2019 11:43:19'!
test19ATransferNetOfReceptiveAccountWithManyTransferenceShouldAnswerCorrectTransferBalance

	|account otherAccount|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		withdraw: 50 in: account;
		deposit: 200 in: otherAccount;
		withdraw: 100 in: otherAccount;
		transfer: 50 from: account to: otherAccount;
		transfer: 30 from: otherAccount to: account;
		transfer: 20 from: otherAccount to: account.
	
	self 
		assert: (TransferNet on: account) report  equals: 0;
		assert: (TransferNet on: otherAccount ) report  equals: 0
	! !

!AccountReportTest methodsFor: 'transfer net tests' stamp: 'LGS 6/2/2019 11:43:41'!
test20ATransferNetOfPortfolioWithTransfersOnlyAmongItsAccountsReportsZero

	|account otherAccount portfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		withdraw: 50 in: account;
		deposit: 200 in: otherAccount;
		withdraw: 100 in: otherAccount;
		transfer: 50 from: account to: otherAccount;
		transfer: 30 from: otherAccount to: account.
	portfolio := Portfolio with: account.
	portfolio add: otherAccount .
	self 
		assert: (TransferNet on: portfolio) report  equals: 0
	! !

!AccountReportTest methodsFor: 'transfer net tests' stamp: 'LGS 6/2/2019 11:43:59'!
test21ATransferNetOfPortfolioWithTransfersToNotBelongingAccountsReportsCorrectTransferBalance

	|account otherAccount portfolio|
	account := ReceptiveAccount new.
	otherAccount := ReceptiveAccount new.
	self 
		deposit: 100 in: account;
		withdraw: 50 in: account;
		deposit: 200 in: otherAccount;
		withdraw: 100 in: otherAccount;
		transfer: 50 from: account to: otherAccount;
		transfer: 30 from: otherAccount to: account.
	portfolio := Portfolio with: account.
	self 
		assert: (TransferNet on: portfolio) report  equals: -20
	! !


!AccountReportTest methodsFor: 'special portfolio tree tests' stamp: 'LGS 6/2/2019 11:56:09'!
test24SpecialPortfolioTreeOfPortfolioCompoundedByAccountsWithDepositsWithdrawAndTransferencesShouldAnswerCorrectString


	| angiesAccount familyPortfolio myAccount portfolioTreeReport |
	angiesAccount :=  ReceptiveAccount named: 'Cuenta de Angeles'.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	self 
		deposit: 1000 in: myAccount ;
		withdraw: 300 in: myAccount;
		transfer: 100 from: myAccount to: angiesAccount.
		
	portfolioTreeReport := 'Portfolio de la familia
	Cuenta mia
		Depósito por 1000.
		Extracción por 300.
		Salida por transferencia de 100.
		Balance = 600'.
	self assert: (SpecialPortfolioTree on: familyPortfolio) report equals: portfolioTreeReport
		! !

!AccountReportTest methodsFor: 'special portfolio tree tests' stamp: 'LGS 6/2/2019 11:56:09'!
test25SpecialPortfolioTreeOfPortfolioCompoundedByAccountsAndPortfoliosWithDepositsWithdrawAndTransferencesShouldAnswerCorrectString


	| angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount portfolioTreeReport |
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	self 
		deposit: 500 in: johnsAccount;
		deposit: 300 in: angiesAccount ;
		deposit: 1000 in: myAccount ;
		withdraw: 300 in: myAccount;
		transfer: 100 from: myAccount to: angiesAccount.
		
	portfolioTreeReport := 'Portfolio de la familia
	Cuenta mia
		Depósito por 1000.
		Extracción por 300.
		Salida por transferencia de 100.
		Balance = 600
	Portfolio de hijos
		Cuenta de Juan
			Depósito por 500.
			Balance = 500
		Cuenta de Angeles
			Depósito por 300.
			Entrada por transferencia de 100.
			Balance = 400'.
	self assert: (SpecialPortfolioTree on: familyPortfolio) report equals: portfolioTreeReport
		! !


!AccountReportTest methodsFor: 'accounts' stamp: 'LGS 6/1/2019 13:26:35'!
deposit: anAmount in: aReceptiveAccount 
	
	Deposit register: anAmount on: aReceptiveAccount ! !

!AccountReportTest methodsFor: 'accounts' stamp: 'LGS 6/1/2019 13:29:02'!
transfer: anAmount from: fromAccount to: toAccount 
	
	Transference register: anAmount from: fromAccount to: toAccount ! !

!AccountReportTest methodsFor: 'accounts' stamp: 'LGS 6/1/2019 13:27:33'!
withdraw: anAmount in: aReceptiveAccount 
	
	Withdraw register: anAmount on: aReceptiveAccount ! !


!classDefinition: #PortfolioTest category: #PortfolioTreePrinter!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:17:51'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:15'!
test08PortfolioTransasctionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #PortfolioTreePrinter!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LGS 6/1/2019 11:06:41'!
test08RegisterTransferenceWithdrawInOriginAndDeposInDestination

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount  new.
	destinationAccount := ReceptiveAccount  new.
	Transference register: 100 from: originAccount to: destinationAccount.
		
	self assert: -100 equals: originAccount balance.
	self assert: 100 equals: destinationAccount balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LGS 6/1/2019 11:12:13'!
test09aDepositLegKnowsHisWithdrawLegAndViceVersa

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount  new.
	destinationAccount := ReceptiveAccount  new.
	Transference register: 100 from: originAccount to: destinationAccount.
		
	self assert: originAccount transactions first equals: destinationAccount  transactions first transference withdrawTransference.
	self assert: destinationAccount transactions first equals: originAccount  transactions first transference depositTransference.
! !


!classDefinition: #Account category: #PortfolioTreePrinter!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'identity' stamp: 'LGS 6/1/2019 16:55:10'!
name
	
	^name! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!Account methodsFor: 'initialization' stamp: 'LGS 6/1/2019 16:22:19'!
initializeWithName: anAccountName 
	
	name := anAccountName ! !


!Account methodsFor: 'report' stamp: 'MGS 6/2/2019 17:02:33'!
reportOn: aReport 
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: #PortfolioTreePrinter!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'LGS 6/1/2019 16:21:37'!
named: anAccountName 
	
	^self new
		initializeWithName: anAccountName! !


!classDefinition: #Portfolio category: #PortfolioTreePrinter!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'report' stamp: 'LGS 6/2/2019 11:15:33'!
reportOn:  aReport 
	
	^aReport reportPortfolio: self withChildren: accounts copy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #PortfolioTreePrinter!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error handling' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'LGS 6/2/2019 11:49:34'!
named: aPortfolioName with: anAccountToAdd 
	
	^(self with: anAccountToAdd)
		initializeWithName: aPortfolioName! !

!Portfolio class methodsFor: 'instance creation' stamp: 'LGS 6/1/2019 16:24:21'!
named: anAccountName with: anAccountToAdd with: anotherAccountToAdd 
	
	^(self with: anAccountToAdd with: anotherAccountToAdd)
		initializeWithName: anAccountName! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #PortfolioTreePrinter!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'LGS 5/30/2019 13:54:40'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!ReceptiveAccount methodsFor: 'report' stamp: 'LGS 6/1/2019 15:43:21'!
reportOn: aReport 
	
	^aReport reportReceptiveAccount: self! !


!classDefinition: #AccountReport category: #PortfolioTreePrinter!
Object subclass: #AccountReport
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!AccountReport methodsFor: 'initialization' stamp: 'LGS 6/1/2019 15:21:21'!
initializeOn: anAccount 
	
	account := anAccount.! !


!AccountReport methodsFor: 'report' stamp: 'LGS 6/1/2019 15:30:39'!
report
	
	^account reportOn:  self
	! !

!AccountReport methodsFor: 'report' stamp: 'LGS 6/1/2019 15:47:41'!
reportAccount: anAccount 
	self subclassResponsibility! !

!AccountReport methodsFor: 'report' stamp: 'LGS 6/1/2019 15:54:31'!
reportDeposit: aDeposit 
	self subclassResponsibility ! !

!AccountReport methodsFor: 'report' stamp: 'LGS 6/1/2019 15:57:08'!
reportDepositTransference: aDepositTransference 
		
	self subclassResponsibility ! !

!AccountReport methodsFor: 'report' stamp: 'LGS 6/2/2019 11:12:40'!
reportPortfolio: aPortfolio withChildren: childrenAccounts
	self subclassResponsibility.! !

!AccountReport methodsFor: 'report' stamp: 'LGS 6/1/2019 15:46:07'!
reportReceptiveAccount: aReceptiveAccount 
	self subclassResponsibility ! !

!AccountReport methodsFor: 'report' stamp: 'LGS 6/1/2019 15:55:20'!
reportWithdraw: aWithdraw 
	self subclassResponsibility! !

!AccountReport methodsFor: 'report' stamp: 'LGS 6/1/2019 15:56:05'!
reportWithdrawTransference: aWithdrawTransference 
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: #PortfolioTreePrinter!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'instance creation' stamp: 'LGS 6/1/2019 15:21:03'!
on: anAccount 
	
	^self new initializeOn: anAccount! !


!classDefinition: #AccountSummary category: #PortfolioTreePrinter!
AccountReport subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!AccountSummary methodsFor: 'report' stamp: 'LGS 6/1/2019 15:42:20'!
reportAccount: anAccount  
	
	|stream|
	stream := ReadWriteStream on: ''.
	anAccount transactions do:[:transaction | stream nextPutAll: (transaction reportOn: self). stream newLine].
	stream nextPutAll: 'Balance = '; nextPutAll: anAccount balance asString.
	^stream contents! !

!AccountSummary methodsFor: 'report' stamp: 'LGS 6/1/2019 15:37:34'!
reportDeposit: aDeposit  
	
	^'Depósito por ' , aDeposit value asString , '.'! !

!AccountSummary methodsFor: 'report' stamp: 'LGS 6/1/2019 15:38:09'!
reportDepositTransference: aDepositTransference  
	
	^'Entrada por transferencia de ', aDepositTransference value asString, '.'! !

!AccountSummary methodsFor: 'report' stamp: 'LGS 6/2/2019 11:13:25'!
reportPortfolio: aPortfolio withChildren: childrenAccounts
	
	^self reportAccount: aPortfolio ! !

!AccountSummary methodsFor: 'report' stamp: 'LGS 6/1/2019 15:41:44'!
reportReceptiveAccount: aReceptiveAccount  
	
	^self reportAccount: aReceptiveAccount ! !

!AccountSummary methodsFor: 'report' stamp: 'LGS 6/1/2019 15:39:26'!
reportWithdraw: aWithdraw  
	
	^'Extracción por ', aWithdraw value asString, '.'! !

!AccountSummary methodsFor: 'report' stamp: 'LGS 6/1/2019 15:40:01'!
reportWithdrawTransference: aWithdrawTransference  
	
	^'Salida por transferencia de ', aWithdrawTransference value asString , '.'! !


!classDefinition: #PortfolioTreePrinter category: #PortfolioTreePrinter!
AccountReport subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!PortfolioTreePrinter methodsFor: 'report' stamp: 'LGS 6/1/2019 18:36:30'!
addTabToAllLinesOf: aStringToAddTabsInAllLines
	
	|stream|
	stream := ReadWriteStream on: ''.
	aStringToAddTabsInAllLines linesDo:[:line | stream tab; nextPutAll: line; newLine].
	^stream contents withoutTrailingBlanks! !

!PortfolioTreePrinter methodsFor: 'report' stamp: 'LGS 6/2/2019 11:14:05'!
reportPortfolio: aPortfolio withChildren: childrenAccounts
	|stream|
	stream := ReadWriteStream on: ''.
	stream nextPutAll: aPortfolio name;newLine.
	childrenAccounts do:[:childAccount | stream nextPutAll: (self addTabToAllLinesOf: (childAccount reportOn: self)); newLine].
	^stream contents withoutTrailingBlanks! !

!PortfolioTreePrinter methodsFor: 'report' stamp: 'LGS 6/1/2019 18:25:45'!
reportReceptiveAccount: aReceptiveAccount 
	
	^aReceptiveAccount  name! !


!classDefinition: #CommonPortfolioTree category: #PortfolioTreePrinter!
PortfolioTreePrinter subclass: #CommonPortfolioTree
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!


!classDefinition: #SpecialPortfolioTree category: #PortfolioTreePrinter!
PortfolioTreePrinter subclass: #SpecialPortfolioTree
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!SpecialPortfolioTree methodsFor: 'report' stamp: 'LGS 6/1/2019 18:52:23'!
reportReceptiveAccount: aReceptiveAccount 
	
	| stream |
	stream := ReadWriteStream on: ''.
	stream 
		nextPutAll: (super reportReceptiveAccount: aReceptiveAccount);newLine;
		nextPutAll: (self addTabToAllLinesOf: (AccountSummary on: aReceptiveAccount) report).
	^stream contents withoutTrailingBlanks! !


!classDefinition: #TransferNet category: #PortfolioTreePrinter!
AccountReport subclass: #TransferNet
	instanceVariableNames: 'transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!TransferNet methodsFor: 'report' stamp: 'LGS 6/1/2019 16:00:13'!
initializeOn: anAccount 
	
	super initializeOn: anAccount.
	transferNet  := 0! !

!TransferNet methodsFor: 'report' stamp: 'LGS 6/1/2019 15:54:07'!
reportAccount: anAccount 
	
	transferNet := 0.
	anAccount transactions do: [:transaction | transaction reportOn: self].
	^transferNet! !

!TransferNet methodsFor: 'report' stamp: 'LGS 6/1/2019 15:54:59'!
reportDeposit: aDeposit 
	
	! !

!TransferNet methodsFor: 'report' stamp: 'LGS 6/1/2019 16:04:40'!
reportDepositTransference: aDepositTransference 
	
	transferNet := aDepositTransference affectBalance: transferNet ! !

!TransferNet methodsFor: 'report' stamp: 'LGS 6/2/2019 11:14:56'!
reportPortfolio: aPortfolio withChildren: childrenAccounts
	^self reportAccount: aPortfolio! !

!TransferNet methodsFor: 'report' stamp: 'LGS 6/1/2019 15:46:56'!
reportReceptiveAccount: aReceptiveAccount 
	
	^self reportAccount: aReceptiveAccount ! !

!TransferNet methodsFor: 'report' stamp: 'LGS 6/1/2019 15:55:38'!
reportWithdraw: aWithdraw 
	! !

!TransferNet methodsFor: 'report' stamp: 'LGS 6/1/2019 16:04:57'!
reportWithdrawTransference: aWithdrawTransference 
	
	transferNet := aWithdrawTransference affectBalance: transferNet! !


!classDefinition: #AccountTransaction category: #PortfolioTreePrinter!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!classDefinition: #Deposit category: #PortfolioTreePrinter!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'report' stamp: 'LGS 6/1/2019 15:43:40'!
reportOn: aReport 
	
	^aReport reportDeposit: self ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #PortfolioTreePrinter!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LGS 6/3/2019 07:39:34'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #TransferenceLeg category: #PortfolioTreePrinter!
AccountTransaction subclass: #TransferenceLeg
	instanceVariableNames: 'transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!TransferenceLeg methodsFor: 'initialization' stamp: 'LGS 6/1/2019 11:03:52'!
initializeFor: aTransference

	transference := aTransference ! !


!TransferenceLeg methodsFor: 'balance' stamp: 'LGS 6/1/2019 10:51:33'!
value
	
	^transference value! !


!TransferenceLeg methodsFor: 'transference' stamp: 'LGS 6/1/2019 11:12:40'!
transference
	
	^transference! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceLeg class' category: #PortfolioTreePrinter!
TransferenceLeg class
	instanceVariableNames: ''!

!TransferenceLeg class methodsFor: 'instance creation' stamp: 'LGS 6/1/2019 11:04:12'!
for: aTransference

	^ self new initializeFor: aTransference ! !


!classDefinition: #DepositTransference category: #PortfolioTreePrinter!
TransferenceLeg subclass: #DepositTransference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!DepositTransference methodsFor: 'balance' stamp: 'LGS 5/30/2019 19:03:26'!
affectBalance: aCurrentBalance 
	
	^aCurrentBalance + self value! !


!DepositTransference methodsFor: 'report' stamp: 'LGS 6/1/2019 15:44:52'!
reportOn: aReport
	
	^aReport reportDepositTransference: self! !


!classDefinition: #WithdrawTransference category: #PortfolioTreePrinter!
TransferenceLeg subclass: #WithdrawTransference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!WithdrawTransference methodsFor: 'balance' stamp: 'LGS 5/30/2019 19:02:03'!
affectBalance: aCurrentBalance 
	
	^aCurrentBalance  - self value! !


!WithdrawTransference methodsFor: 'report' stamp: 'LGS 6/1/2019 15:45:02'!
reportOn: aReport 
	
	^aReport reportWithdrawTransference: self! !


!classDefinition: #Withdraw category: #PortfolioTreePrinter!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'report' stamp: 'LGS 6/1/2019 15:45:11'!
reportOn: aReport 
	
	^aReport reportWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #PortfolioTreePrinter!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LGS 6/3/2019 07:39:44'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Transference category: #PortfolioTreePrinter!
Object subclass: #Transference
	instanceVariableNames: 'value withdrawTransference depositTransference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Transference methodsFor: 'value' stamp: 'LGS 5/30/2019 13:50:07'!
value

	^ value! !


!Transference methodsFor: 'initialization' stamp: 'LGS 6/1/2019 11:02:50'!
initializeFor: aValue 

	value := aValue.
	withdrawTransference  := WithdrawTransference for: self.
	depositTransference  := DepositTransference for: self! !


!Transference methodsFor: 'transferenceLeg' stamp: 'LGS 5/30/2019 19:21:53'!
depositTransference
	
	^depositTransference! !

!Transference methodsFor: 'transferenceLeg' stamp: 'LGS 5/30/2019 19:11:06'!
withdrawTransference
	
	^withdrawTransference! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: #PortfolioTreePrinter!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'LGS 6/1/2019 11:00:52'!
for: aValue

	^ self new initializeFor: aValue ! !

!Transference class methodsFor: 'instance creation' stamp: 'LGS 6/1/2019 11:00:15'!
register: anAmount from: originAccount to: destinationAccount
  
  | transfer |
    transfer := self for: anAmount.
    originAccount register: transfer withdrawTransference.
    destinationAccount register: transfer depositTransference.
    ^transfer
	! !
