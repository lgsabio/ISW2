!classDefinition: #UnaCajaDeSe�ales category: #Semaforo!
DenotativeObjectMorph subclass: #UnaCajaDeSe�ales
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaCajaDeSe�ales class' category: #Semaforo!
UnaCajaDeSe�ales class
	instanceVariableNames: ''!

!UnaCajaDeSe�ales class methodsFor: 'morph' stamp: 'LGS 3/31/2019 19:18:26'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnaCajaDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:46:46'!
apagar
	
	self UnaSe�alDeDetencion apagar.
	self UnaSe�alDePrecaucion apagar.
	self UnaSe�alDeAvance apagar
	! !

!UnaCajaDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:41:09'!
avisarPrecaucionPorEncendido
	
	5 timesRepeat: [self prenderYApagarUnaSe�alDePrecaucion]! !

!UnaCajaDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 19:18:26'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !

!UnaCajaDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 19:18:26'!
prender

	self avisarPrecaucionPorEncendido
	! !

!UnaCajaDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:45:39'!
prenderUnaSe�alDeAvance

	self UnaSe�alDeDetencion apagar.
	self UnaSe�alDePrecaucion apagar.
	self UnaSe�alDeAvance prender
	! !

!UnaCajaDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:45:59'!
prenderUnaSe�alDeDetencion

	self UnaSe�alDeDetencion prender.
	self UnaSe�alDePrecaucion apagar.
	self UnaSe�alDeAvance apagar
	! !

!UnaCajaDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:46:14'!
prenderUnaSe�alDePrecaucion

	self UnaSe�alDeDetencion apagar.
	self UnaSe�alDePrecaucion prender.
	self UnaSe�alDeAvance apagar
	! !

!UnaCajaDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:43:26'!
prenderYApagarUnaSe�alDePrecaucion
	
		self UnaSe�alDePrecaucion prender.
		self esperar: 0.1* second.
		self UnaSe�alDePrecaucion apagar.
		self esperar: 0.1* second! !


!UnaCajaDeSe�ales class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaCajaDeSe�alesDeCallaoYCorrientes category: #Semaforo!
UnaCajaDeSe�ales subclass: #UnaCajaDeSe�alesDeCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaCajaDeSe�alesDeCallaoYCorrientes class' category: #Semaforo!
UnaCajaDeSe�alesDeCallaoYCorrientes class
	instanceVariableNames: ''!

!UnaCajaDeSe�alesDeCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:06'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnaCajaDeSe�alesDeCallaoYCorrientes class methodsFor: 'acceso' stamp: 'LGS 3/31/2019 20:44:08'!
UnaSe�alDeAvance
	
		^UnaSe�alDeAvanceCallaoYCorrientes! !

!UnaCajaDeSe�alesDeCallaoYCorrientes class methodsFor: 'acceso' stamp: 'LGS 3/31/2019 20:44:19'!
UnaSe�alDeDetencion
	
		^UnaSe�alDeDetencionCallaoYCorrientes! !

!UnaCajaDeSe�alesDeCallaoYCorrientes class methodsFor: 'acceso' stamp: 'LGS 3/31/2019 20:42:01'!
UnaSe�alDePrecaucion
	
		^UnaSe�alDePrecaucionCallaoYCorrientes! !


!UnaCajaDeSe�alesDeCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaCajaDeSe�alesDeCorrientesYCallao category: #Semaforo!
UnaCajaDeSe�ales subclass: #UnaCajaDeSe�alesDeCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaCajaDeSe�alesDeCorrientesYCallao class' category: #Semaforo!
UnaCajaDeSe�alesDeCorrientesYCallao class
	instanceVariableNames: ''!

!UnaCajaDeSe�alesDeCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:08:31'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnaCajaDeSe�alesDeCorrientesYCallao class methodsFor: 'acceso' stamp: 'LGS 3/31/2019 20:44:55'!
UnaSe�alDeAvance
	
		^UnaSe�alDeAvanceCorrientesYCallao
	! !

!UnaCajaDeSe�alesDeCorrientesYCallao class methodsFor: 'acceso' stamp: 'LGS 3/31/2019 20:44:44'!
UnaSe�alDeDetencion
	
		^UnaSe�alDeDetencionCorrientesYCallao
	! !

!UnaCajaDeSe�alesDeCorrientesYCallao class methodsFor: 'acceso' stamp: 'LGS 3/31/2019 20:42:22'!
UnaSe�alDePrecaucion
	
		^UnaSe�alDePrecaucionCorrientesYCallao
	! !


!UnaCajaDeSe�alesDeCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDeSemaforo category: #Semaforo!
DenotativeObjectMorph subclass: #UnaSe�alDeSemaforo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDeSemaforo class' category: #Semaforo!
UnaSe�alDeSemaforo class
	instanceVariableNames: ''!

!UnaSe�alDeSemaforo class methodsFor: 'morph' stamp: 'LGS 3/31/2019 20:47:46'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDeSemaforo class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 20:47:46'!
apagar
	
	self color: Color black! !

!UnaSe�alDeSemaforo class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 20:47:46'!
prender
	
	self color: self colorDeLuz! !


!UnaSe�alDeSemaforo class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDeAvance category: #Semaforo!
UnaSe�alDeSemaforo subclass: #UnaSe�alDeAvance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDeAvance class' category: #Semaforo!
UnaSe�alDeAvance class
	instanceVariableNames: ''!

!UnaSe�alDeAvance class methodsFor: 'morph' stamp: 'LGS 3/31/2019 21:16:52'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDeAvance class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 21:16:52'!
colorDeLuz
	
	^Color green! !


!UnaSe�alDeAvance class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDeAvanceCallaoYCorrientes category: #Semaforo!
UnaSe�alDeAvance subclass: #UnaSe�alDeAvanceCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDeAvanceCallaoYCorrientes class' category: #Semaforo!
UnaSe�alDeAvanceCallaoYCorrientes class
	instanceVariableNames: ''!

!UnaSe�alDeAvanceCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:41'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !



!UnaSe�alDeAvanceCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDeAvanceCorrientesYCallao category: #Semaforo!
UnaSe�alDeAvance subclass: #UnaSe�alDeAvanceCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDeAvanceCorrientesYCallao class' category: #Semaforo!
UnaSe�alDeAvanceCorrientesYCallao class
	instanceVariableNames: ''!

!UnaSe�alDeAvanceCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:08:52'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !



!UnaSe�alDeAvanceCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDeDetencion category: #Semaforo!
UnaSe�alDeSemaforo subclass: #UnaSe�alDeDetencion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDeDetencion class' category: #Semaforo!
UnaSe�alDeDetencion class
	instanceVariableNames: ''!

!UnaSe�alDeDetencion class methodsFor: 'morph' stamp: 'LGS 3/31/2019 21:17:53'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDeDetencion class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 21:17:53'!
colorDeLuz
	
	^Color red! !


!UnaSe�alDeDetencion class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDeDetencionCallaoYCorrientes category: #Semaforo!
UnaSe�alDeDetencion subclass: #UnaSe�alDeDetencionCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDeDetencionCallaoYCorrientes class' category: #Semaforo!
UnaSe�alDeDetencionCallaoYCorrientes class
	instanceVariableNames: ''!

!UnaSe�alDeDetencionCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:24'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDeDetencionCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDeDetencionCorrientesYCallao category: #Semaforo!
UnaSe�alDeDetencion subclass: #UnaSe�alDeDetencionCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDeDetencionCorrientesYCallao class' category: #Semaforo!
UnaSe�alDeDetencionCorrientesYCallao class
	instanceVariableNames: ''!

!UnaSe�alDeDetencionCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:09:13'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDeDetencionCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDePrecaucion category: #Semaforo!
UnaSe�alDeSemaforo subclass: #UnaSe�alDePrecaucion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDePrecaucion class' category: #Semaforo!
UnaSe�alDePrecaucion class
	instanceVariableNames: ''!

!UnaSe�alDePrecaucion class methodsFor: 'morph' stamp: 'LGS 3/31/2019 21:18:18'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDePrecaucion class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 21:18:18'!
colorDeLuz
	
	^Color yellow! !


!UnaSe�alDePrecaucion class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDePrecaucionCallaoYCorrientes category: #Semaforo!
UnaSe�alDePrecaucion subclass: #UnaSe�alDePrecaucionCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDePrecaucionCallaoYCorrientes class' category: #Semaforo!
UnaSe�alDePrecaucionCallaoYCorrientes class
	instanceVariableNames: ''!

!UnaSe�alDePrecaucionCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:50:40'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDePrecaucionCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDePrecaucionCorrientesYCallao category: #Semaforo!
UnaSe�alDePrecaucion subclass: #UnaSe�alDePrecaucionCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDePrecaucionCorrientesYCallao class' category: #Semaforo!
UnaSe�alDePrecaucionCorrientesYCallao class
	instanceVariableNames: ''!

!UnaSe�alDePrecaucionCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:09:27'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDePrecaucionCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SemaforoDeCorrientesYCallao category: #Semaforo!
DenotativeObject subclass: #SemaforoDeCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeCorrientesYCallao class' category: #Semaforo!
SemaforoDeCorrientesYCallao class
	instanceVariableNames: 'prendido'!

!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:53:08'!
apagar

	prendido := false.
	UnaCajaDeSe�alesDeCallaoYCorrientes  apagar.
	UnaCajaDeSe�alesDeCorrientesYCallao apagar
	
	! !

!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 18:02:59'!
prender

	prendido := true.
	[UnaCajaDeSe�alesDeCallaoYCorrientes  prender] fork.
	[UnaCajaDeSe�alesDeCorrientesYCallao prender] fork.
	self esperar: 1*second.
	self alternarSe�ales
	! !


!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:51:24'!
alternarSe�al

	self 
		avanza: UnaCajaDeSe�alesDeCallaoYCorrientes seDetiene: UnaCajaDeSe�alesDeCorrientesYCallao;
		avanza: UnaCajaDeSe�alesDeCorrientesYCallao seDetiene: UnaCajaDeSe�alesDeCallaoYCorrientes! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:59:22'!
alternarSe�ales

	[self estaPrendido] whileTrue: [self alternarSe�al].
	self apagar! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:25:22'!
avanza: unaUnaCajaDeSe�ales seDetiene: otraUnaCajaDeSe�ales

	unaUnaCajaDeSe�ales prenderUnaSe�alDeAvance.
	otraUnaCajaDeSe�ales  prenderUnaSe�alDeDetencion.
	self esperar: 2*second.
	unaUnaCajaDeSe�ales prenderUnaSe�alDePrecaucion.
	self esperar: 1*second.
	! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:30:28'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:52:25'!
estaPrendido

	^prendido! !


!SemaforoDeCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prendido := false.! !

UnaCajaDeSe�ales initializeAfterFileIn!
UnaCajaDeSe�alesDeCallaoYCorrientes initializeAfterFileIn!
UnaCajaDeSe�alesDeCorrientesYCallao initializeAfterFileIn!
UnaSe�alDeSemaforo initializeAfterFileIn!
UnaSe�alDeAvance initializeAfterFileIn!
UnaSe�alDeAvanceCallaoYCorrientes initializeAfterFileIn!
UnaSe�alDeAvanceCorrientesYCallao initializeAfterFileIn!
UnaSe�alDeDetencion initializeAfterFileIn!
UnaSe�alDeDetencionCallaoYCorrientes initializeAfterFileIn!
UnaSe�alDeDetencionCorrientesYCallao initializeAfterFileIn!
UnaSe�alDePrecaucion initializeAfterFileIn!
UnaSe�alDePrecaucionCallaoYCorrientes initializeAfterFileIn!
UnaSe�alDePrecaucionCorrientesYCallao initializeAfterFileIn!
SemaforoDeCorrientesYCallao initializeAfterFileIn!