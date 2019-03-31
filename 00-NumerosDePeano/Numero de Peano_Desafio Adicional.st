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


!I class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:37:13'!
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

!II class methodsFor: 'operacion' stamp: 'LGS 3/31/2019 14:35:42'!
next

	next ifNil: [next := self createChildNamed: self name , 'I'. next previous: self].
	^next ! !

!II class methodsFor: 'operacion' stamp: 'LGS 3/28/2019 19:19:33'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !


!II class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:37:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: #'Numero de Peano'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Numero de Peano'!
III class
	instanceVariableNames: ''!

!III class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:37:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: #'Numero de Peano'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Numero de Peano'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:37:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: #'Numero de Peano'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: #'Numero de Peano'!
IIIII class
	instanceVariableNames: ''!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:37:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !


!classDefinition: #IIIIII category: #'Numero de Peano'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: #'Numero de Peano'!
IIIIII class
	instanceVariableNames: ''!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:37:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIII.
	previous := IIIII.! !


!classDefinition: #IIIIIII category: #'Numero de Peano'!
IIIIII subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: #'Numero de Peano'!
IIIIIII class
	instanceVariableNames: ''!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:37:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIII.
	previous := IIIIII.! !


!classDefinition: #IIIIIIII category: #'Numero de Peano'!
IIIIIII subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: #'Numero de Peano'!
IIIIIIII class
	instanceVariableNames: ''!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:37:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIII.
	previous := IIIIIII.! !


!classDefinition: #IIIIIIIII category: #'Numero de Peano'!
IIIIIIII subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIII class' category: #'Numero de Peano'!
IIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:37:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIII.
	previous := IIIIIIII.! !


!classDefinition: #IIIIIIIIII category: #'Numero de Peano'!
IIIIIIIII subclass: #IIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIII class' category: #'Numero de Peano'!
IIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:37:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIII.
	previous := IIIIIIIII.! !


!classDefinition: #IIIIIIIIIII category: #'Numero de Peano'!
IIIIIIIIII subclass: #IIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIII class' category: #'Numero de Peano'!
IIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:37:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIIIIIII.
	previous := IIIIIIIIII.! !


!classDefinition: #IIIIIIIIIIII category: #'Numero de Peano'!
IIIIIIIIIII subclass: #IIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIIIIII class' category: #'Numero de Peano'!
IIIIIIIIIIII class
	instanceVariableNames: ''!

!IIIIIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 14:37:14'!
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