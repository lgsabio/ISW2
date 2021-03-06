!classDefinition: #ContenedorDeSeņales category: #'Semaforo-ClassBased'!
Object subclass: #ContenedorDeSeņales
	instanceVariableNames: 'seņalDeAvance seņalDeDetencion seņalDePrecaucion morph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!ContenedorDeSeņales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 20:14:43'!
apagar
	
	self seņalDeDetencion apagar.
	self seņalDePrecaucion apagar.
	self seņalDeAvance apagar
	! !

!ContenedorDeSeņales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 20:14:43'!
avisarPrecaucionPorEncendido
	
	5 timesRepeat: [self prenderYApagarSeņalDePrecaucion]! !

!ContenedorDeSeņales methodsFor: 'funcionamiento' stamp: 'LGS 4/3/2019 13:34:35'!
prender

	self avisarPrecaucionPorEncendido
	! !

!ContenedorDeSeņales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 21:49:39'!
prenderSeņalDeAvance

	self seņalDeDetencion apagar.
	self seņalDePrecaucion apagar.
	self seņalDeAvance prender.
	morph redrawNeeded
	! !

!ContenedorDeSeņales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 21:49:49'!
prenderSeņalDeDetencion

	self seņalDeDetencion prender.
	self seņalDePrecaucion apagar.
	self seņalDeAvance apagar.
	morph redrawNeeded
	! !

!ContenedorDeSeņales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 21:49:55'!
prenderSeņalDePrecaucion

	self seņalDeDetencion apagar.
	self seņalDePrecaucion prender.
	self seņalDeAvance apagar.
	morph redrawNeeded
	! !

!ContenedorDeSeņales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 21:50:49'!
prenderYApagarSeņalDePrecaucion
	
		self prenderSeņalDePrecaucion.
		self esperar: 0.1* second.
		self seņalDePrecaucion apagar.
		morph redrawNeeded.
		self esperar: 0.1* second! !


!ContenedorDeSeņales methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:14:43'!
seņalDeAvance

	^seņalDeAvance! !

!ContenedorDeSeņales methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:14:43'!
seņalDeDetencion

	^seņalDeDetencion! !

!ContenedorDeSeņales methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:14:43'!
seņalDePrecaucion

	^seņalDePrecaucion! !


!ContenedorDeSeņales methodsFor: 'creation' stamp: 'LGS 4/2/2019 20:14:43'!
seņalDeAvance: unaSeņalDeAvance seņalDePrecaucion: unaSeņalDePrecaucion seņalDeDetencion: unaSeņalDeDetencion

	seņalDeAvance  := unaSeņalDeAvance .
	seņalDePrecaucion  := unaSeņalDePrecaucion.
	seņalDeDetencion  := unaSeņalDeDetencion .
	self addMorph: unaSeņalDeAvance; addMorph: unaSeņalDePrecaucion; addMorph: unaSeņalDeDetencion! !


!ContenedorDeSeņales methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 20:14:43'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !


!ContenedorDeSeņales methodsFor: 'morph' stamp: 'LGS 4/3/2019 14:02:51'!
createMorphWith: aPosition

	^LayoutMorph newColumn
		morphPosition: aPosition extent: 60 @ 130;
		yourself
! !

!ContenedorDeSeņales methodsFor: 'morph' stamp: 'LGS 4/3/2019 13:42:39'!
doesNotUnderstand: aMessage

	^aMessage sendTo:  morph ! !


!ContenedorDeSeņales methodsFor: 'initialization' stamp: 'LGS 4/3/2019 13:59:34'!
initializeWithPosition: aPosition

	super initialize.
	morph := self createMorphWith: aPosition.
	self seņalDeAvance: SeņalDeAvance  new seņalDePrecaucion: SeņalDePrecaucion new seņalDeDetencion: SeņalDeDetencion new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ContenedorDeSeņales class' category: #'Semaforo-ClassBased'!
ContenedorDeSeņales class
	instanceVariableNames: ''!

!ContenedorDeSeņales class methodsFor: 'initialization' stamp: 'LGS 4/3/2019 13:57:29'!
position: aPoint 
	
	^self new
		initializeWithPosition: aPoint;
		yourself! !


!classDefinition: #Semaforo category: #'Semaforo-ClassBased'!
Object subclass: #Semaforo
	instanceVariableNames: 'prendido primerContenedorDeSeņales segundoContenedorDeSeņales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!Semaforo methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:09:10'!
primerContenedorDeSeņales

	^primerContenedorDeSeņales ! !

!Semaforo methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:09:09'!
primerContenedorDeSeņales: unContenedorDeSeņales segundoContenedorDeSeņales: otroContenedorDeSeņales

	primerContenedorDeSeņales := unContenedorDeSeņales.
	segundoContenedorDeSeņales  := otroContenedorDeSeņales ! !

!Semaforo methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:09:09'!
segundoContenedorDeSeņales

	^segundoContenedorDeSeņales ! !


!Semaforo methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 20:09:09'!
alternarSeņal

	self 
		avanza: self primerContenedorDeSeņales seDetiene: self segundoContenedorDeSeņales ;
		avanza: self segundoContenedorDeSeņales seDetiene: self primerContenedorDeSeņales ! !

!Semaforo methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 20:09:09'!
alternarSeņales

	[self estaPrendido] whileTrue: [self alternarSeņal].
	self apagar! !

!Semaforo methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 21:07:05'!
avanza: unContenedorDeSeņales seDetiene: otrocontenedorDeSeņales

	unContenedorDeSeņales prenderSeņalDeAvance.
	otrocontenedorDeSeņales  prenderSeņalDeDetencion.
	self esperar: 2*second.
	unContenedorDeSeņales prenderSeņalDePrecaucion.
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

	self primerContenedorDeSeņales openInWorld.
	self segundoContenedorDeSeņales openInWorld! !


!Semaforo methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 20:09:10'!
apagar

	prendido := false.
	self primerContenedorDeSeņales  apagar.
	self segundoContenedorDeSeņales apagar
	
	! !

!Semaforo methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 20:09:09'!
prender

	prendido := true.
	[self primerContenedorDeSeņales  prender] fork.
	[self segundoContenedorDeSeņales prender] fork.
	self esperar: 1*second.
	self alternarSeņales
	! !


!Semaforo methodsFor: 'initialization' stamp: 'LGS 4/3/2019 14:07:48'!
initialize

	super initialize.
	self 
		primerContenedorDeSeņales: (ContenedorDeSeņales position: (100@100)) 
		segundoContenedorDeSeņales: (ContenedorDeSeņales position: (190@100))! !

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


!classDefinition: #SeņalDeSemaforo category: #'Semaforo-ClassBased'!
Object subclass: #SeņalDeSemaforo
	instanceVariableNames: 'morph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!SeņalDeSemaforo methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:04'!
apagar
	
	self color: Color black! !

!SeņalDeSemaforo methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:04'!
prender
	
	self color: self colorDeLuz! !


!SeņalDeSemaforo methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:12:04'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !

!SeņalDeSemaforo methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:40:24'!
doesNotUnderstand: aMessage

	^aMessage sendTo:  morph ! !


!SeņalDeSemaforo methodsFor: 'initialization' stamp: 'LGS 4/2/2019 20:33:44'!
initialize
	
	super initialize.
	morph := self createMorph! !


!classDefinition: #SeņalDeAvance category: #'Semaforo-ClassBased'!
SeņalDeSemaforo subclass: #SeņalDeAvance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!SeņalDeAvance methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:04'!
colorDeLuz
	
	^Color green! !


!SeņalDeAvance methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:12:04'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!classDefinition: #SeņalDeDetencion category: #'Semaforo-ClassBased'!
SeņalDeSemaforo subclass: #SeņalDeDetencion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!SeņalDeDetencion methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:31'!
colorDeLuz
	
	^Color red! !


!SeņalDeDetencion methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:12:31'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!classDefinition: #SeņalDePrecaucion category: #'Semaforo-ClassBased'!
SeņalDeSemaforo subclass: #SeņalDePrecaucion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!SeņalDePrecaucion methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:59'!
colorDeLuz
	
	^Color yellow! !


!SeņalDePrecaucion methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:13:00'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !
