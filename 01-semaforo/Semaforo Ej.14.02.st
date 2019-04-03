!classDefinition: #UnaCajaDeSeñales category: #Semaforo!
DenotativeObjectMorph subclass: #UnaCajaDeSeñales
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaCajaDeSeñales class' category: #Semaforo!
UnaCajaDeSeñales class
	instanceVariableNames: ''!

!UnaCajaDeSeñales class methodsFor: 'morph' stamp: 'LGS 3/31/2019 19:18:26'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnaCajaDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:46:46'!
apagar
	
	self UnaSeñalDeDetencion apagar.
	self UnaSeñalDePrecaucion apagar.
	self UnaSeñalDeAvance apagar
	! !

!UnaCajaDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:41:09'!
avisarPrecaucionPorEncendido
	
	5 timesRepeat: [self prenderYApagarUnaSeñalDePrecaucion]! !

!UnaCajaDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 19:18:26'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !

!UnaCajaDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 19:18:26'!
prender

	self avisarPrecaucionPorEncendido
	! !

!UnaCajaDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:45:39'!
prenderUnaSeñalDeAvance

	self UnaSeñalDeDetencion apagar.
	self UnaSeñalDePrecaucion apagar.
	self UnaSeñalDeAvance prender
	! !

!UnaCajaDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:45:59'!
prenderUnaSeñalDeDetencion

	self UnaSeñalDeDetencion prender.
	self UnaSeñalDePrecaucion apagar.
	self UnaSeñalDeAvance apagar
	! !

!UnaCajaDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:46:14'!
prenderUnaSeñalDePrecaucion

	self UnaSeñalDeDetencion apagar.
	self UnaSeñalDePrecaucion prender.
	self UnaSeñalDeAvance apagar
	! !

!UnaCajaDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:43:26'!
prenderYApagarUnaSeñalDePrecaucion
	
		self UnaSeñalDePrecaucion prender.
		self esperar: 0.1* second.
		self UnaSeñalDePrecaucion apagar.
		self esperar: 0.1* second! !


!UnaCajaDeSeñales class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaCajaDeSeñalesDeCallaoYCorrientes category: #Semaforo!
UnaCajaDeSeñales subclass: #UnaCajaDeSeñalesDeCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaCajaDeSeñalesDeCallaoYCorrientes class' category: #Semaforo!
UnaCajaDeSeñalesDeCallaoYCorrientes class
	instanceVariableNames: ''!

!UnaCajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:06'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnaCajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'acceso' stamp: 'LGS 3/31/2019 20:44:08'!
UnaSeñalDeAvance
	
		^UnaSeñalDeAvanceCallaoYCorrientes! !

!UnaCajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'acceso' stamp: 'LGS 3/31/2019 20:44:19'!
UnaSeñalDeDetencion
	
		^UnaSeñalDeDetencionCallaoYCorrientes! !

!UnaCajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'acceso' stamp: 'LGS 3/31/2019 20:42:01'!
UnaSeñalDePrecaucion
	
		^UnaSeñalDePrecaucionCallaoYCorrientes! !


!UnaCajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaCajaDeSeñalesDeCorrientesYCallao category: #Semaforo!
UnaCajaDeSeñales subclass: #UnaCajaDeSeñalesDeCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaCajaDeSeñalesDeCorrientesYCallao class' category: #Semaforo!
UnaCajaDeSeñalesDeCorrientesYCallao class
	instanceVariableNames: ''!

!UnaCajaDeSeñalesDeCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:08:31'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnaCajaDeSeñalesDeCorrientesYCallao class methodsFor: 'acceso' stamp: 'LGS 3/31/2019 20:44:55'!
UnaSeñalDeAvance
	
		^UnaSeñalDeAvanceCorrientesYCallao
	! !

!UnaCajaDeSeñalesDeCorrientesYCallao class methodsFor: 'acceso' stamp: 'LGS 3/31/2019 20:44:44'!
UnaSeñalDeDetencion
	
		^UnaSeñalDeDetencionCorrientesYCallao
	! !

!UnaCajaDeSeñalesDeCorrientesYCallao class methodsFor: 'acceso' stamp: 'LGS 3/31/2019 20:42:22'!
UnaSeñalDePrecaucion
	
		^UnaSeñalDePrecaucionCorrientesYCallao
	! !


!UnaCajaDeSeñalesDeCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDeSemaforo category: #Semaforo!
DenotativeObjectMorph subclass: #UnaSeñalDeSemaforo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDeSemaforo class' category: #Semaforo!
UnaSeñalDeSemaforo class
	instanceVariableNames: ''!

!UnaSeñalDeSemaforo class methodsFor: 'morph' stamp: 'LGS 3/31/2019 20:47:46'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDeSemaforo class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 20:47:46'!
apagar
	
	self color: Color black! !

!UnaSeñalDeSemaforo class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 20:47:46'!
prender
	
	self color: self colorDeLuz! !


!UnaSeñalDeSemaforo class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDeAvance category: #Semaforo!
UnaSeñalDeSemaforo subclass: #UnaSeñalDeAvance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDeAvance class' category: #Semaforo!
UnaSeñalDeAvance class
	instanceVariableNames: ''!

!UnaSeñalDeAvance class methodsFor: 'morph' stamp: 'LGS 3/31/2019 21:16:52'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDeAvance class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 21:16:52'!
colorDeLuz
	
	^Color green! !


!UnaSeñalDeAvance class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDeAvanceCallaoYCorrientes category: #Semaforo!
UnaSeñalDeAvance subclass: #UnaSeñalDeAvanceCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDeAvanceCallaoYCorrientes class' category: #Semaforo!
UnaSeñalDeAvanceCallaoYCorrientes class
	instanceVariableNames: ''!

!UnaSeñalDeAvanceCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:41'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !



!UnaSeñalDeAvanceCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDeAvanceCorrientesYCallao category: #Semaforo!
UnaSeñalDeAvance subclass: #UnaSeñalDeAvanceCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDeAvanceCorrientesYCallao class' category: #Semaforo!
UnaSeñalDeAvanceCorrientesYCallao class
	instanceVariableNames: ''!

!UnaSeñalDeAvanceCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:08:52'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !



!UnaSeñalDeAvanceCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDeDetencion category: #Semaforo!
UnaSeñalDeSemaforo subclass: #UnaSeñalDeDetencion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDeDetencion class' category: #Semaforo!
UnaSeñalDeDetencion class
	instanceVariableNames: ''!

!UnaSeñalDeDetencion class methodsFor: 'morph' stamp: 'LGS 3/31/2019 21:17:53'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDeDetencion class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 21:17:53'!
colorDeLuz
	
	^Color red! !


!UnaSeñalDeDetencion class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDeDetencionCallaoYCorrientes category: #Semaforo!
UnaSeñalDeDetencion subclass: #UnaSeñalDeDetencionCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDeDetencionCallaoYCorrientes class' category: #Semaforo!
UnaSeñalDeDetencionCallaoYCorrientes class
	instanceVariableNames: ''!

!UnaSeñalDeDetencionCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:24'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDeDetencionCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDeDetencionCorrientesYCallao category: #Semaforo!
UnaSeñalDeDetencion subclass: #UnaSeñalDeDetencionCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDeDetencionCorrientesYCallao class' category: #Semaforo!
UnaSeñalDeDetencionCorrientesYCallao class
	instanceVariableNames: ''!

!UnaSeñalDeDetencionCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:09:13'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDeDetencionCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDePrecaucion category: #Semaforo!
UnaSeñalDeSemaforo subclass: #UnaSeñalDePrecaucion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDePrecaucion class' category: #Semaforo!
UnaSeñalDePrecaucion class
	instanceVariableNames: ''!

!UnaSeñalDePrecaucion class methodsFor: 'morph' stamp: 'LGS 3/31/2019 21:18:18'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDePrecaucion class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 21:18:18'!
colorDeLuz
	
	^Color yellow! !


!UnaSeñalDePrecaucion class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDePrecaucionCallaoYCorrientes category: #Semaforo!
UnaSeñalDePrecaucion subclass: #UnaSeñalDePrecaucionCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDePrecaucionCallaoYCorrientes class' category: #Semaforo!
UnaSeñalDePrecaucionCallaoYCorrientes class
	instanceVariableNames: ''!

!UnaSeñalDePrecaucionCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:50:40'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDePrecaucionCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDePrecaucionCorrientesYCallao category: #Semaforo!
UnaSeñalDePrecaucion subclass: #UnaSeñalDePrecaucionCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDePrecaucionCorrientesYCallao class' category: #Semaforo!
UnaSeñalDePrecaucionCorrientesYCallao class
	instanceVariableNames: ''!

!UnaSeñalDePrecaucionCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:09:27'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDePrecaucionCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 21:21:52'!
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
	UnaCajaDeSeñalesDeCallaoYCorrientes  apagar.
	UnaCajaDeSeñalesDeCorrientesYCallao apagar
	
	! !

!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 18:02:59'!
prender

	prendido := true.
	[UnaCajaDeSeñalesDeCallaoYCorrientes  prender] fork.
	[UnaCajaDeSeñalesDeCorrientesYCallao prender] fork.
	self esperar: 1*second.
	self alternarSeñales
	! !


!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:51:24'!
alternarSeñal

	self 
		avanza: UnaCajaDeSeñalesDeCallaoYCorrientes seDetiene: UnaCajaDeSeñalesDeCorrientesYCallao;
		avanza: UnaCajaDeSeñalesDeCorrientesYCallao seDetiene: UnaCajaDeSeñalesDeCallaoYCorrientes! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:59:22'!
alternarSeñales

	[self estaPrendido] whileTrue: [self alternarSeñal].
	self apagar! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:25:22'!
avanza: unaUnaCajaDeSeñales seDetiene: otraUnaCajaDeSeñales

	unaUnaCajaDeSeñales prenderUnaSeñalDeAvance.
	otraUnaCajaDeSeñales  prenderUnaSeñalDeDetencion.
	self esperar: 2*second.
	unaUnaCajaDeSeñales prenderUnaSeñalDePrecaucion.
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

UnaCajaDeSeñales initializeAfterFileIn!
UnaCajaDeSeñalesDeCallaoYCorrientes initializeAfterFileIn!
UnaCajaDeSeñalesDeCorrientesYCallao initializeAfterFileIn!
UnaSeñalDeSemaforo initializeAfterFileIn!
UnaSeñalDeAvance initializeAfterFileIn!
UnaSeñalDeAvanceCallaoYCorrientes initializeAfterFileIn!
UnaSeñalDeAvanceCorrientesYCallao initializeAfterFileIn!
UnaSeñalDeDetencion initializeAfterFileIn!
UnaSeñalDeDetencionCallaoYCorrientes initializeAfterFileIn!
UnaSeñalDeDetencionCorrientesYCallao initializeAfterFileIn!
UnaSeñalDePrecaucion initializeAfterFileIn!
UnaSeñalDePrecaucionCallaoYCorrientes initializeAfterFileIn!
UnaSeñalDePrecaucionCorrientesYCallao initializeAfterFileIn!
SemaforoDeCorrientesYCallao initializeAfterFileIn!