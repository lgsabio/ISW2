!classDefinition: #ContenedorDeSe�ales category: #'Semaforo-ClassBased'!
Object subclass: #ContenedorDeSe�ales
	instanceVariableNames: 'se�alDeAvance se�alDeDetencion se�alDePrecaucion morph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!ContenedorDeSe�ales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 20:14:43'!
apagar
	
	self se�alDeDetencion apagar.
	self se�alDePrecaucion apagar.
	self se�alDeAvance apagar
	! !

!ContenedorDeSe�ales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 20:14:43'!
avisarPrecaucionPorEncendido
	
	5 timesRepeat: [self prenderYApagarSe�alDePrecaucion]! !

!ContenedorDeSe�ales methodsFor: 'funcionamiento' stamp: 'LGS 4/3/2019 13:34:35'!
prender

	self avisarPrecaucionPorEncendido
	! !

!ContenedorDeSe�ales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 21:49:39'!
prenderSe�alDeAvance

	self se�alDeDetencion apagar.
	self se�alDePrecaucion apagar.
	self se�alDeAvance prender.
	morph redrawNeeded
	! !

!ContenedorDeSe�ales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 21:49:49'!
prenderSe�alDeDetencion

	self se�alDeDetencion prender.
	self se�alDePrecaucion apagar.
	self se�alDeAvance apagar.
	morph redrawNeeded
	! !

!ContenedorDeSe�ales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 21:49:55'!
prenderSe�alDePrecaucion

	self se�alDeDetencion apagar.
	self se�alDePrecaucion prender.
	self se�alDeAvance apagar.
	morph redrawNeeded
	! !

!ContenedorDeSe�ales methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 21:50:49'!
prenderYApagarSe�alDePrecaucion
	
		self prenderSe�alDePrecaucion.
		self esperar: 0.1* second.
		self se�alDePrecaucion apagar.
		morph redrawNeeded.
		self esperar: 0.1* second! !


!ContenedorDeSe�ales methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:14:43'!
se�alDeAvance

	^se�alDeAvance! !

!ContenedorDeSe�ales methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:14:43'!
se�alDeDetencion

	^se�alDeDetencion! !

!ContenedorDeSe�ales methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:14:43'!
se�alDePrecaucion

	^se�alDePrecaucion! !


!ContenedorDeSe�ales methodsFor: 'creation' stamp: 'LGS 4/2/2019 20:14:43'!
se�alDeAvance: unaSe�alDeAvance se�alDePrecaucion: unaSe�alDePrecaucion se�alDeDetencion: unaSe�alDeDetencion

	se�alDeAvance  := unaSe�alDeAvance .
	se�alDePrecaucion  := unaSe�alDePrecaucion.
	se�alDeDetencion  := unaSe�alDeDetencion .
	self addMorph: unaSe�alDeAvance; addMorph: unaSe�alDePrecaucion; addMorph: unaSe�alDeDetencion! !


!ContenedorDeSe�ales methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 20:14:43'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !


!ContenedorDeSe�ales methodsFor: 'morph' stamp: 'LGS 4/3/2019 14:02:51'!
createMorphWith: aPosition

	^LayoutMorph newColumn
		morphPosition: aPosition extent: 60 @ 130;
		yourself
! !

!ContenedorDeSe�ales methodsFor: 'morph' stamp: 'LGS 4/3/2019 13:42:39'!
doesNotUnderstand: aMessage

	^aMessage sendTo:  morph ! !


!ContenedorDeSe�ales methodsFor: 'initialization' stamp: 'LGS 4/3/2019 13:59:34'!
initializeWithPosition: aPosition

	super initialize.
	morph := self createMorphWith: aPosition.
	self se�alDeAvance: Se�alDeAvance  new se�alDePrecaucion: Se�alDePrecaucion new se�alDeDetencion: Se�alDeDetencion new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ContenedorDeSe�ales class' category: #'Semaforo-ClassBased'!
ContenedorDeSe�ales class
	instanceVariableNames: ''!

!ContenedorDeSe�ales class methodsFor: 'initialization' stamp: 'LGS 4/3/2019 13:57:29'!
position: aPoint 
	
	^self new
		initializeWithPosition: aPoint;
		yourself! !


!classDefinition: #Semaforo category: #'Semaforo-ClassBased'!
Object subclass: #Semaforo
	instanceVariableNames: 'prendido primerContenedorDeSe�ales segundoContenedorDeSe�ales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!Semaforo methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:09:10'!
primerContenedorDeSe�ales

	^primerContenedorDeSe�ales ! !

!Semaforo methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:09:09'!
primerContenedorDeSe�ales: unContenedorDeSe�ales segundoContenedorDeSe�ales: otroContenedorDeSe�ales

	primerContenedorDeSe�ales := unContenedorDeSe�ales.
	segundoContenedorDeSe�ales  := otroContenedorDeSe�ales ! !

!Semaforo methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 20:09:09'!
segundoContenedorDeSe�ales

	^segundoContenedorDeSe�ales ! !


!Semaforo methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 20:09:09'!
alternarSe�al

	self 
		avanza: self primerContenedorDeSe�ales seDetiene: self segundoContenedorDeSe�ales ;
		avanza: self segundoContenedorDeSe�ales seDetiene: self primerContenedorDeSe�ales ! !

!Semaforo methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 20:09:09'!
alternarSe�ales

	[self estaPrendido] whileTrue: [self alternarSe�al].
	self apagar! !

!Semaforo methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 21:07:05'!
avanza: unContenedorDeSe�ales seDetiene: otrocontenedorDeSe�ales

	unContenedorDeSe�ales prenderSe�alDeAvance.
	otrocontenedorDeSe�ales  prenderSe�alDeDetencion.
	self esperar: 2*second.
	unContenedorDeSe�ales prenderSe�alDePrecaucion.
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

	self primerContenedorDeSe�ales openInWorld.
	self segundoContenedorDeSe�ales openInWorld! !


!Semaforo methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 20:09:10'!
apagar

	prendido := false.
	self primerContenedorDeSe�ales  apagar.
	self segundoContenedorDeSe�ales apagar
	
	! !

!Semaforo methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 20:09:09'!
prender

	prendido := true.
	[self primerContenedorDeSe�ales  prender] fork.
	[self segundoContenedorDeSe�ales prender] fork.
	self esperar: 1*second.
	self alternarSe�ales
	! !


!Semaforo methodsFor: 'initialization' stamp: 'LGS 4/3/2019 14:07:48'!
initialize

	super initialize.
	self 
		primerContenedorDeSe�ales: (ContenedorDeSe�ales position: (100@100)) 
		segundoContenedorDeSe�ales: (ContenedorDeSe�ales position: (190@100))! !

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


!classDefinition: #Se�alDeSemaforo category: #'Semaforo-ClassBased'!
Object subclass: #Se�alDeSemaforo
	instanceVariableNames: 'morph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!Se�alDeSemaforo methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:04'!
apagar
	
	self color: Color black! !

!Se�alDeSemaforo methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:04'!
prender
	
	self color: self colorDeLuz! !


!Se�alDeSemaforo methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:12:04'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !

!Se�alDeSemaforo methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:40:24'!
doesNotUnderstand: aMessage

	^aMessage sendTo:  morph ! !


!Se�alDeSemaforo methodsFor: 'initialization' stamp: 'LGS 4/2/2019 20:33:44'!
initialize
	
	super initialize.
	morph := self createMorph! !


!classDefinition: #Se�alDeAvance category: #'Semaforo-ClassBased'!
Se�alDeSemaforo subclass: #Se�alDeAvance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!Se�alDeAvance methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:04'!
colorDeLuz
	
	^Color green! !


!Se�alDeAvance methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:12:04'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!classDefinition: #Se�alDeDetencion category: #'Semaforo-ClassBased'!
Se�alDeSemaforo subclass: #Se�alDeDetencion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!Se�alDeDetencion methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:31'!
colorDeLuz
	
	^Color red! !


!Se�alDeDetencion methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:12:31'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!classDefinition: #Se�alDePrecaucion category: #'Semaforo-ClassBased'!
Se�alDeSemaforo subclass: #Se�alDePrecaucion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo-ClassBased'!

!Se�alDePrecaucion methodsFor: 'propiedad' stamp: 'LGS 4/2/2019 20:12:59'!
colorDeLuz
	
	^Color yellow! !


!Se�alDePrecaucion methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:13:00'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !