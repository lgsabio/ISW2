!classDefinition: #I category: #'Numero de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numero de Peano'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'error' stamp: 'LGS 3/31/2019 13:58:07'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!I class methodsFor: 'error' stamp: 'LGS 3/31/2019 13:42:32'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Numeros negativos no soportados'! !


!I class methodsFor: 'operacion' stamp: 'LGS 3/28/2019 18:34:05'!
* unNumeroDePeano
	^unNumeroDePeano! !

!I class methodsFor: 'operacion' stamp: 'LGS 3/28/2019 18:15:00'!
+ unNumeroDePeano
	^unNumeroDePeano next! !

!I class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 13:45:19'!
- unNumeroDePeano
	^self error: self descripcionDeErrorDeNumerosNegativosNoSoportados ! !

!I class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:26:46'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^I].
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self - unNumeroDePeano / unNumeroDePeano + I! !

!I class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:02:58'!
<= unNumeroDePeano
	^true ! !

!I class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:00:45'!
> unNumeroDePeano
	^false ! !

!I class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:29:48'!
multiplicarPor: unNumeroDePeano
	^unNumeroDePeano! !

!I class methodsFor: 'operacion' stamp: 'LGS 3/28/2019 18:14:25'!
next

	^next ! !

!I class methodsFor: 'operacion' stamp: 'LGS 3/28/2019 19:21:01'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous! !


!I class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:32:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := II.! !


!classDefinition: #II category: #'Numero de Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numero de Peano'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'creación' stamp: 'LGS 3/28/2019 18:52:58'!
createALotOfNext

	self name = 'IIIIIIIIIIII' ifFalse: [self next createALotOfNext]

	! !

!II class methodsFor: 'creación' stamp: 'LGS 3/28/2019 18:07:57'!
removeAllNext



	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!II class methodsFor: 'accesos' stamp: 'LGS 3/28/2019 18:01:37'!
previous
	
	^previous! !

!II class methodsFor: 'accesos' stamp: 'LGS 3/28/2019 18:08:49'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano! !


!II class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:28:42'!
* unNumeroDePeano
	
	^unNumeroDePeano multiplicarPor: self ! !

!II class methodsFor: 'operacion' stamp: 'LGS 3/28/2019 17:57:54'!
+ unNumeoDePeano

	^self previous + unNumeoDePeano next! !

!II class methodsFor: 'operacion' stamp: 'LGS 3/28/2019 19:19:33'!
- unNumeoDePeano

	^unNumeoDePeano restameA: self! !

!II class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:00:05'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^I].
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self - unNumeroDePeano / unNumeroDePeano + I! !

!II class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:23:50'!
<= unNumeroDePeano

	^unNumeroDePeano previous > self previous! !

!II class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:04:01'!
> unNumeroDePeano

	^unNumeroDePeano <= self! !

!II class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 13:58:21'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!II class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:28:19'!
multiplicarPor: unNumeroDePeano

	^self * unNumeroDePeano previous + self ! !

!II class methodsFor: 'operacion' stamp: 'LGS 3/28/2019 18:11:26'!
next

	next ifNil: [next := self cloneNamed: self name , 'I'. next previous: self].
	^next ! !

!II class methodsFor: 'operacion' stamp: 'LGS 3/28/2019 19:19:33'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !


!II class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:32:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: #'Numero de Peano'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Numero de Peano'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:28'!
createALotOfNext

	self name = 'IIIIIIIIIIII' ifFalse: [self next createALotOfNext]

	! !

!III class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:29'!
removeAllNext



	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!III class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:29'!
previous
	
	^previous! !

!III class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:29'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano! !


!III class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
* unNumeroDePeano
	
	^unNumeroDePeano multiplicarPor: self ! !

!III class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
+ unNumeoDePeano

	^self previous + unNumeoDePeano next! !

!III class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
- unNumeoDePeano

	^unNumeoDePeano restameA: self! !

!III class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^I].
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self - unNumeroDePeano / unNumeroDePeano + I! !

!III class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
<= unNumeroDePeano

	^unNumeroDePeano previous > self previous! !

!III class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
> unNumeroDePeano

	^unNumeroDePeano <= self! !

!III class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!III class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
multiplicarPor: unNumeroDePeano

	^self * unNumeroDePeano previous + self ! !

!III class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
next

	next ifNil: [next := self cloneNamed: self name , 'I'. next previous: self].
	^next ! !

!III class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !


!III class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:32:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: #'Numero de Peano'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Numero de Peano'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:29'!
createALotOfNext

	self name = 'IIIIIIIIIIII' ifFalse: [self next createALotOfNext]

	! !

!IIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:29'!
removeAllNext



	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!IIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:29'!
previous
	
	^previous! !

!IIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:29'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano! !


!IIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
* unNumeroDePeano
	
	^unNumeroDePeano multiplicarPor: self ! !

!IIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
+ unNumeoDePeano

	^self previous + unNumeoDePeano next! !

!IIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
- unNumeoDePeano

	^unNumeoDePeano restameA: self! !

!IIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^I].
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self - unNumeroDePeano / unNumeroDePeano + I! !

!IIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
<= unNumeroDePeano

	^unNumeroDePeano previous > self previous! !

!IIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
> unNumeroDePeano

	^unNumeroDePeano <= self! !

!IIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!IIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
multiplicarPor: unNumeroDePeano

	^self * unNumeroDePeano previous + self ! !

!IIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
next

	next ifNil: [next := self cloneNamed: self name , 'I'. next previous: self].
	^next ! !

!IIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !


!IIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:32:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: #'Numero de Peano'!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: #'Numero de Peano'!
IIIII class
	instanceVariableNames: 'next previous'!

!IIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:29'!
createALotOfNext

	self name = 'IIIIIIIIIIII' ifFalse: [self next createALotOfNext]

	! !

!IIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:29'!
removeAllNext



	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!IIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:29'!
previous
	
	^previous! !

!IIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:29'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano! !


!IIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
* unNumeroDePeano
	
	^unNumeroDePeano multiplicarPor: self ! !

!IIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
+ unNumeoDePeano

	^self previous + unNumeoDePeano next! !

!IIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
- unNumeoDePeano

	^unNumeoDePeano restameA: self! !

!IIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^I].
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self - unNumeroDePeano / unNumeroDePeano + I! !

!IIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
<= unNumeroDePeano

	^unNumeroDePeano previous > self previous! !

!IIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
> unNumeroDePeano

	^unNumeroDePeano <= self! !

!IIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!IIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
multiplicarPor: unNumeroDePeano

	^self * unNumeroDePeano previous + self ! !

!IIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
next

	next ifNil: [next := self cloneNamed: self name , 'I'. next previous: self].
	^next ! !

!IIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !


!IIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:32:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !


!classDefinition: #IIIIII category: #'Numero de Peano'!
DenotativeObject subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: #'Numero de Peano'!
IIIIII class
	instanceVariableNames: 'next previous'!

!IIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:29'!
createALotOfNext

	self name = 'IIIIIIIIIIII' ifFalse: [self next createALotOfNext]

	! !

!IIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:29'!
removeAllNext



	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!IIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:29'!
previous
	
	^previous! !

!IIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:29'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano! !


!IIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
* unNumeroDePeano
	
	^unNumeroDePeano multiplicarPor: self ! !

!IIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
+ unNumeoDePeano

	^self previous + unNumeoDePeano next! !

!IIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
- unNumeoDePeano

	^unNumeoDePeano restameA: self! !

!IIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^I].
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self - unNumeroDePeano / unNumeroDePeano + I! !

!IIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
<= unNumeroDePeano

	^unNumeroDePeano previous > self previous! !

!IIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
> unNumeroDePeano

	^unNumeroDePeano <= self! !

!IIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!IIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
multiplicarPor: unNumeroDePeano

	^self * unNumeroDePeano previous + self ! !

!IIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
next

	next ifNil: [next := self cloneNamed: self name , 'I'. next previous: self].
	^next ! !

!IIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !


!IIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:32:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIII.
	previous := IIIII.! !


!classDefinition: #IIIIIII category: #'Numero de Peano'!
DenotativeObject subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: #'Numero de Peano'!
IIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:29'!
createALotOfNext

	self name = 'IIIIIIIIIIII' ifFalse: [self next createALotOfNext]

	! !

!IIIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:29'!
removeAllNext



	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!IIIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:29'!
previous
	
	^previous! !

!IIIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:29'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano! !


!IIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
* unNumeroDePeano
	
	^unNumeroDePeano multiplicarPor: self ! !

!IIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
+ unNumeoDePeano

	^self previous + unNumeoDePeano next! !

!IIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
- unNumeoDePeano

	^unNumeoDePeano restameA: self! !

!IIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^I].
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self - unNumeroDePeano / unNumeroDePeano + I! !

!IIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
<= unNumeroDePeano

	^unNumeroDePeano previous > self previous! !

!IIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
> unNumeroDePeano

	^unNumeroDePeano <= self! !

!IIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!IIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
multiplicarPor: unNumeroDePeano

	^self * unNumeroDePeano previous + self ! !

!IIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
next

	next ifNil: [next := self cloneNamed: self name , 'I'. next previous: self].
	^next ! !

!IIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !


!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:32:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIII.
	previous := IIIIII.! !


!classDefinition: #IIIIIIII category: #'Numero de Peano'!
DenotativeObject subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: #'Numero de Peano'!
IIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:29'!
createALotOfNext

	self name = 'IIIIIIIIIIII' ifFalse: [self next createALotOfNext]

	! !

!IIIIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:29'!
removeAllNext



	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!IIIIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:29'!
previous
	
	^previous! !

!IIIIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:29'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano! !


!IIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
* unNumeroDePeano
	
	^unNumeroDePeano multiplicarPor: self ! !

!IIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
+ unNumeoDePeano

	^self previous + unNumeoDePeano next! !

!IIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
- unNumeoDePeano

	^unNumeoDePeano restameA: self! !

!IIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^I].
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self - unNumeroDePeano / unNumeroDePeano + I! !

!IIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
<= unNumeroDePeano

	^unNumeroDePeano previous > self previous! !

!IIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
> unNumeroDePeano

	^unNumeroDePeano <= self! !

!IIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!IIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:29'!
multiplicarPor: unNumeroDePeano

	^self * unNumeroDePeano previous + self ! !

!IIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
next

	next ifNil: [next := self cloneNamed: self name , 'I'. next previous: self].
	^next ! !

!IIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !


!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:32:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIII.
	previous := IIIIIII.! !


!classDefinition: #IIIIIIIII category: #'Numero de Peano'!
DenotativeObject subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIII class' category: #'Numero de Peano'!
IIIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:30'!
createALotOfNext

	self name = 'IIIIIIIIIIII' ifFalse: [self next createALotOfNext]

	! !

!IIIIIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:30'!
removeAllNext



	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!IIIIIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:30'!
previous
	
	^previous! !

!IIIIIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:30'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano! !


!IIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
* unNumeroDePeano
	
	^unNumeroDePeano multiplicarPor: self ! !

!IIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
+ unNumeoDePeano

	^self previous + unNumeoDePeano next! !

!IIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
- unNumeoDePeano

	^unNumeoDePeano restameA: self! !

!IIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^I].
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self - unNumeroDePeano / unNumeroDePeano + I! !

!IIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
<= unNumeroDePeano

	^unNumeroDePeano previous > self previous! !

!IIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
> unNumeroDePeano

	^unNumeroDePeano <= self! !

!IIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!IIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
multiplicarPor: unNumeroDePeano

	^self * unNumeroDePeano previous + self ! !

!IIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
next

	next ifNil: [next := self cloneNamed: self name , 'I'. next previous: self].
	^next ! !

!IIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !


!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:32:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIII.
	previous := IIIIIIII.! !


!classDefinition: #IIIIIIIIII category: #'Numero de Peano'!
DenotativeObject subclass: #IIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIII class' category: #'Numero de Peano'!
IIIIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:30'!
createALotOfNext

	self name = 'IIIIIIIIIIII' ifFalse: [self next createALotOfNext]

	! !

!IIIIIIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:30'!
removeAllNext



	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!IIIIIIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:30'!
previous
	
	^previous! !

!IIIIIIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:30'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano! !


!IIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
* unNumeroDePeano
	
	^unNumeroDePeano multiplicarPor: self ! !

!IIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
+ unNumeoDePeano

	^self previous + unNumeoDePeano next! !

!IIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
- unNumeoDePeano

	^unNumeoDePeano restameA: self! !

!IIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^I].
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self - unNumeroDePeano / unNumeroDePeano + I! !

!IIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
<= unNumeroDePeano

	^unNumeroDePeano previous > self previous! !

!IIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
> unNumeroDePeano

	^unNumeroDePeano <= self! !

!IIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!IIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
multiplicarPor: unNumeroDePeano

	^self * unNumeroDePeano previous + self ! !

!IIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
next

	next ifNil: [next := self cloneNamed: self name , 'I'. next previous: self].
	^next ! !

!IIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !


!IIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:32:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIII.
	previous := IIIIIIIII.! !


!classDefinition: #IIIIIIIIIII category: #'Numero de Peano'!
DenotativeObject subclass: #IIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIII class' category: #'Numero de Peano'!
IIIIIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:30'!
createALotOfNext

	self name = 'IIIIIIIIIIII' ifFalse: [self next createALotOfNext]

	! !

!IIIIIIIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:30'!
removeAllNext



	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!IIIIIIIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:30'!
previous
	
	^previous! !

!IIIIIIIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:30'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano! !


!IIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
* unNumeroDePeano
	
	^unNumeroDePeano multiplicarPor: self ! !

!IIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
+ unNumeoDePeano

	^self previous + unNumeoDePeano next! !

!IIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
- unNumeoDePeano

	^unNumeoDePeano restameA: self! !

!IIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^I].
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self - unNumeroDePeano / unNumeroDePeano + I! !

!IIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
<= unNumeroDePeano

	^unNumeroDePeano previous > self previous! !

!IIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
> unNumeroDePeano

	^unNumeroDePeano <= self! !

!IIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!IIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
multiplicarPor: unNumeroDePeano

	^self * unNumeroDePeano previous + self ! !

!IIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
next

	next ifNil: [next := self cloneNamed: self name , 'I'. next previous: self].
	^next ! !

!IIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !


!IIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:32:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIII.
	previous := IIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIII category: #'Numero de Peano'!
DenotativeObject subclass: #IIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIII class' category: #'Numero de Peano'!
IIIIIIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIIIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:30'!
createALotOfNext

	self name = 'IIIIIIIIIIII' ifFalse: [self next createALotOfNext]

	! !

!IIIIIIIIIIII class methodsFor: 'creación' stamp: 'LGS 3/31/2019 14:30:30'!
removeAllNext



	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!IIIIIIIIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:30'!
previous
	
	^previous! !

!IIIIIIIIIIII class methodsFor: 'accesos' stamp: 'LGS 3/31/2019 14:30:30'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano! !


!IIIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
* unNumeroDePeano
	
	^unNumeroDePeano multiplicarPor: self ! !

!IIIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
+ unNumeoDePeano

	^self previous + unNumeoDePeano next! !

!IIIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
- unNumeoDePeano

	^unNumeoDePeano restameA: self! !

!IIIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
/ unNumeroDePeano
	unNumeroDePeano = self ifTrue: [^I].
	self > unNumeroDePeano ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	^self - unNumeroDePeano / unNumeroDePeano + I! !

!IIIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
<= unNumeroDePeano

	^unNumeroDePeano previous > self previous! !

!IIIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
> unNumeroDePeano

	^unNumeroDePeano <= self! !

!IIIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'! !

!IIIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
multiplicarPor: unNumeroDePeano

	^self * unNumeroDePeano previous + self ! !

!IIIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
next

	next ifNil: [next := self cloneNamed: self name , 'I'. next previous: self].
	^next ! !

!IIIIIIIIIIII class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:30:30'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !


!IIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:32:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIIIIIIIIII.! !

I initializeAfterFileIn!
II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!
IIIIIII initializeAfterFileIn!
IIIIIIII initializeAfterFileIn!
IIIIIIIII initializeAfterFileIn!
IIIIIIIIII initializeAfterFileIn!
IIIIIIIIIII initializeAfterFileIn!
IIIIIIIIIIII initializeAfterFileIn!