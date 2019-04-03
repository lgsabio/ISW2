!classDefinition: #ContenedorDeSeñales category: #'Semaforo-ClassBased'!
Object subclass: #ContenedorDeSeñales
	instanceVariableNames: 'señalDeAvance señalDeDetencion señalDePrecaucion morph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!ContenedorDeSeñales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 20:14:43'!
apagar
	
	self señalDeDetencion apagar.
	self señalDePrecaucion apagar.
	self señalDeAvance apagar
	! !

!ContenedorDeSeñales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 20:14:43'!
avisarPrecaucionPorEncendido
	
	5 timesRepeat: [self prenderYApagarSeñalDePrecaucion]! !

!ContenedorDeSeñales methodsFor: 'funcionamiento' stamp: 'LGS 4/3/2019 13:34:35'!
prender

	self avisarPrecaucionPorEncendido
	! !

!ContenedorDeSeñales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 21:49:39'!
prenderSeñalDeAvance

	self señalDeDetencion apagar.
	self señalDePrecaucion apagar.
	self señalDeAvance prender.
	morph redrawNeeded
	! !

!ContenedorDeSeñales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 21:49:49'!
prenderSeñalDeDetencion

	self señalDeDetencion prender.
	self señalDePrecaucion apagar.
	self señalDeAvance apagar.
	morph redrawNeeded
	! !

!ContenedorDeSeñales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 21:49:55'!
prenderSeñalDePrecaucion

	self señalDeDetencion apagar.
	self señalDePrecaucion prender.
	self señalDeAvance apagar.
	morph redrawNeeded
	! !

!ContenedorDeSeñales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 21:50:49'!
prenderYApagarSeñalDePrecaucion
	
		self prenderSeñalDePrecaucion.
		self esperar: 0.1* second.
		self señalDePrecaucion apagar.
		morph redrawNeeded.
		self esperar: 0.1* second! !


!ContenedorDeSeñales methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:14:43'!
señalDeAvance

	^señalDeAvance! !

!ContenedorDeSeñales methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:14:43'!
señalDeDetencion

	^señalDeDetencion! !

!ContenedorDeSeñales methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:14:43'!
señalDePrecaucion

	^señalDePrecaucion! !


!ContenedorDeSeñales methodsFor: 'creation' stamp: 'LGS 4/2/2019 20:14:43'!
señalDeAvance: unaSeñalDeAvance señalDePrecaucion: unaSeñalDePrecaucion señalDeDetencion: unaSeñalDeDetencion

	señalDeAvance  := unaSeñalDeAvance .
	señalDePrecaucion  := unaSeñalDePrecaucion.
	señalDeDetencion  := unaSeñalDeDetencion .
	self addMorph: unaSeñalDeAvance; addMorph: unaSeñalDePrecaucion; addMorph: unaSeñalDeDetencion! !


!ContenedorDeSeñales methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 20:14:43'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !


!ContenedorDeSeñales methodsFor: 'morph' stamp: 'LGS 4/3/2019 14:02:51'!
createMorphWith: aPosition

	^LayoutMorph newColumn
		morphPosition: aPosition extent: 60 @ 130;
		yourself
! !

!ContenedorDeSeñales methodsFor: 'morph' stamp: 'LGS 4/3/2019 13:42:39'!
doesNotUnderstand: aMessage

	^aMessage sendTo:  morph ! !


!ContenedorDeSeñales methodsFor: 'initialization' stamp: 'LGS 4/3/2019 13:59:34'!
initializeWithPosition: aPosition

	super initialize.
	morph := self createMorphWith: aPosition.
	self señalDeAvance: SeñalDeAvance  new señalDePrecaucion: SeñalDePrecaucion new señalDeDetencion: SeñalDeDetencion new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ContenedorDeSeñales class' category: #'Semaforo-ClassBased'!
ContenedorDeSeñales class
	instanceVariableNames: ''!

!ContenedorDeSeñales class methodsFor: 'initialization' stamp: 'LGS 4/3/2019 13:57:29'!
position: aPoint 
	
	^self new
		initializeWithPosition: aPoint;
		yourself! !


!classDefinition: #Semaforo category: #'Semaforo-ClassBased'!
Object subclass: #Semaforo
	instanceVariableNames: 'prendido primerContenedorDeSeñales segundoContenedorDeSeñales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!Semaforo methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:09:10'!
primerContenedorDeSeñales

	^primerContenedorDeSeñales ! !

!Semaforo methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:09:09'!
primerContenedorDeSeñales: unContenedorDeSeñales segundoContenedorDeSeñales: otroContenedorDeSeñales

	primerContenedorDeSeñales := unContenedorDeSeñales.
	segundoContenedorDeSeñales  := otroContenedorDeSeñales ! !

!Semaforo methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:09:09'!
segundoContenedorDeSeñales

	^segundoContenedorDeSeñales ! !


!Semaforo methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 20:09:09'!
alternarSeñal

	self 
		avanza: self primerContenedorDeSeñales seDetiene: self segundoContenedorDeSeñales ;
		avanza: self segundoContenedorDeSeñales seDetiene: self primerContenedorDeSeñales ! !

!Semaforo methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 20:09:09'!
alternarSeñales

	[self estaPrendido] whileTrue: [self alternarSeñal].
	self apagar! !

!Semaforo methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 21:07:05'!
avanza: unContenedorDeSeñales seDetiene: otrocontenedorDeSeñales

	unContenedorDeSeñales prenderSeñalDeAvance.
	otrocontenedorDeSeñales  prenderSeñalDeDetencion.
	self esperar: 2*second.
	unContenedorDeSeñales prenderSeñalDePrecaucion.
	self esperar: 1*second.
	! !

!Semaforo methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 20:09:09'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !

!Semaforo methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 20:09:09'!
estaPrendido

	^prendido! !

!Semaforo methodsFor: 'auxiliar' stamp: 'LGS 4/3/2019 13:44:59'!
openInWorld

	self primerContenedorDeSeñales openInWorld.
	self segundoContenedorDeSeñales openInWorld! !


!Semaforo methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 20:09:10'!
apagar

	prendido := false.
	self primerContenedorDeSeñales  apagar.
	self segundoContenedorDeSeñales apagar
	
	! !

!Semaforo methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 20:09:09'!
prender

	prendido := true.
	[self primerContenedorDeSeñales  prender] fork.
	[self segundoContenedorDeSeñales prender] fork.
	self esperar: 1*second.
	self alternarSeñales
	! !


!Semaforo methodsFor: 'initialization' stamp: 'LGS 4/3/2019 14:07:48'!
initialize

	super initialize.
	self 
		primerContenedorDeSeñales: (ContenedorDeSeñales position: (100@100)) 
		segundoContenedorDeSeñales: (ContenedorDeSeñales position: (190@100))! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Semaforo class' category: #'Semaforo-ClassBased'!
Semaforo class
	instanceVariableNames: ''!

!Semaforo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/3/2019 14:05:32'!
crearSemaforoYPrenderlo

	|semaforo|
	[semaforo := self new.
	semaforo openInWorld.
	semaforo prender] fork! !


!classDefinition: #SeñalDeSemaforo category: #'Semaforo-ClassBased'!
Object subclass: #SeñalDeSemaforo
	instanceVariableNames: 'morph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!SeñalDeSemaforo methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:04'!
apagar
	
	self color: Color black! !

!SeñalDeSemaforo methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:04'!
prender
	
	self color: self colorDeLuz! !


!SeñalDeSemaforo methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:12:04'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !

!SeñalDeSemaforo methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:40:24'!
doesNotUnderstand: aMessage

	^aMessage sendTo:  morph ! !


!SeñalDeSemaforo methodsFor: 'initialization' stamp: 'LGS 4/2/2019 20:33:44'!
initialize
	
	super initialize.
	morph := self createMorph! !


!classDefinition: #SeñalDeAvance category: #'Semaforo-ClassBased'!
SeñalDeSemaforo subclass: #SeñalDeAvance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!SeñalDeAvance methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:04'!
colorDeLuz
	
	^Color green! !


!SeñalDeAvance methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:12:04'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!classDefinition: #SeñalDeDetencion category: #'Semaforo-ClassBased'!
SeñalDeSemaforo subclass: #SeñalDeDetencion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!SeñalDeDetencion methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:31'!
colorDeLuz
	
	^Color red! !


!SeñalDeDetencion methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:12:31'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!classDefinition: #SeñalDePrecaucion category: #'Semaforo-ClassBased'!
SeñalDeSemaforo subclass: #SeñalDePrecaucion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!SeñalDePrecaucion methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:59'!
colorDeLuz
	
	^Color yellow! !


!SeñalDePrecaucion methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:13:00'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !
