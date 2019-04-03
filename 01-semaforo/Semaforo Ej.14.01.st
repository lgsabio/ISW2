!classDefinition: #CajaDeSeñalesDeCallaoYCorrientes category: #Semaforo!
DenotativeObjectMorph subclass: #CajaDeSeñalesDeCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CajaDeSeñalesDeCallaoYCorrientes class' category: #Semaforo!
CajaDeSeñalesDeCallaoYCorrientes class
	instanceVariableNames: ''!

!CajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:06'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!CajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 15:29:52'!
apagar
	
	SeñalDeDetencionCallaoYCorrientes apagar.
	SeñalDePrecaucionCallaoYCorrientes apagar.
	SeñalDeAvanceCallaoYCorrientes apagar
	! !

!CajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 16:59:13'!
avisarPrecaucionPorEncendido
	
	5 timesRepeat: [
		SeñalDePrecaucionCallaoYCorrientes prender.
		self esperar: 0.1* second.
		SeñalDePrecaucionCallaoYCorrientes apagar.
		self esperar: 0.1* second]! !

!CajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 15:25:05'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !

!CajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 16:56:57'!
prender

	self avisarPrecaucionPorEncendido
	! !

!CajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:56:25'!
prenderSeñalDeAvance

	SeñalDeDetencionCallaoYCorrientes apagar.
	SeñalDePrecaucionCallaoYCorrientes apagar.
	SeñalDeAvanceCallaoYCorrientes prender
	! !

!CajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:56:41'!
prenderSeñalDeDetencion

	SeñalDeAvanceCallaoYCorrientes apagar.
	SeñalDePrecaucionCallaoYCorrientes apagar.
	SeñalDeDetencionCallaoYCorrientes prender
	! !

!CajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:05:26'!
prenderSeñalDePrecaucion

	SeñalDeAvanceCallaoYCorrientes apagar.
	SeñalDeDetencionCallaoYCorrientes apagar.
	SeñalDePrecaucionCallaoYCorrientes prender
	! !


!CajaDeSeñalesDeCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #CajaDeSeñalesDeCorrientesYCallao category: #Semaforo!
DenotativeObjectMorph subclass: #CajaDeSeñalesDeCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CajaDeSeñalesDeCorrientesYCallao class' category: #Semaforo!
CajaDeSeñalesDeCorrientesYCallao class
	instanceVariableNames: ''!

!CajaDeSeñalesDeCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:08:31'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!CajaDeSeñalesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:13:21'!
apagar
	
	SeñalDeDetencionCorrientesYCallao apagar.
	SeñalDePrecaucionCorrientesYCallao apagar.
	SeñalDeAvanceCorrientesYCallao apagar
	! !

!CajaDeSeñalesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:13:44'!
avisarPrecaucionPorEncendido
	
	5 timesRepeat: [
		SeñalDePrecaucionCorrientesYCallao prender.
		self esperar: 0.1* second.
		SeñalDePrecaucionCorrientesYCallao apagar.
		self esperar: 0.1* second]! !

!CajaDeSeñalesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:08:31'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !

!CajaDeSeñalesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:08:31'!
prender

	self avisarPrecaucionPorEncendido
	! !

!CajaDeSeñalesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:57:02'!
prenderSeñalDeAvance

	SeñalDeDetencionCorrientesYCallao apagar.
	SeñalDePrecaucionCorrientesYCallao apagar.
	SeñalDeAvanceCorrientesYCallao prender
	! !

!CajaDeSeñalesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:57:18'!
prenderSeñalDeDetencion

	SeñalDeAvanceCorrientesYCallao apagar.
	SeñalDePrecaucionCorrientesYCallao apagar.
	SeñalDeDetencionCorrientesYCallao prender
	! !

!CajaDeSeñalesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:14:24'!
prenderSeñalDePrecaucion

	SeñalDeAvanceCorrientesYCallao apagar.
	SeñalDeDetencionCorrientesYCallao apagar.
	SeñalDePrecaucionCorrientesYCallao prender
	! !


!CajaDeSeñalesDeCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeAvanceCallaoYCorrientes category: #Semaforo!
DenotativeObjectMorph subclass: #SeñalDeAvanceCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeAvanceCallaoYCorrientes class' category: #Semaforo!
SeñalDeAvanceCallaoYCorrientes class
	instanceVariableNames: ''!

!SeñalDeAvanceCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:41'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeAvanceCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 15:24:03'!
apagar
	
	self color: Color black! !

!SeñalDeAvanceCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/25/2019 20:20:36'!
colorDeLuz
	
	^Color green! !

!SeñalDeAvanceCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 16:59:47'!
prender
	
	self color: self colorDeLuz! !


!SeñalDeAvanceCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeAvanceCorrientesYCallao category: #Semaforo!
DenotativeObjectMorph subclass: #SeñalDeAvanceCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeAvanceCorrientesYCallao class' category: #Semaforo!
SeñalDeAvanceCorrientesYCallao class
	instanceVariableNames: ''!

!SeñalDeAvanceCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:08:52'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeAvanceCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:08:52'!
apagar
	
	self color: Color black! !

!SeñalDeAvanceCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:08:52'!
colorDeLuz
	
	^Color green! !

!SeñalDeAvanceCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:08:52'!
prender
	
	self color: self colorDeLuz! !


!SeñalDeAvanceCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionCallaoYCorrientes category: #Semaforo!
DenotativeObjectMorph subclass: #SeñalDeDetencionCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionCallaoYCorrientes class' category: #Semaforo!
SeñalDeDetencionCallaoYCorrientes class
	instanceVariableNames: ''!

!SeñalDeDetencionCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:24'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeDetencionCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 15:24:07'!
apagar
	
	self color: Color black! !

!SeñalDeDetencionCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/25/2019 20:20:19'!
colorDeLuz
	
	^Color red! !

!SeñalDeDetencionCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:00:07'!
prender
	
	self color: self colorDeLuz! !


!SeñalDeDetencionCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionCorrientesYCallao category: #Semaforo!
DenotativeObjectMorph subclass: #SeñalDeDetencionCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionCorrientesYCallao class' category: #Semaforo!
SeñalDeDetencionCorrientesYCallao class
	instanceVariableNames: ''!

!SeñalDeDetencionCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:09:13'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDeDetencionCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:09:13'!
apagar
	
	self color: Color black! !

!SeñalDeDetencionCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:09:13'!
colorDeLuz
	
	^Color red! !

!SeñalDeDetencionCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:09:13'!
prender
	
	self color: self colorDeLuz! !


!SeñalDeDetencionCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucionCallaoYCorrientes category: #Semaforo!
DenotativeObjectMorph subclass: #SeñalDePrecaucionCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecaucionCallaoYCorrientes class' category: #Semaforo!
SeñalDePrecaucionCallaoYCorrientes class
	instanceVariableNames: ''!

!SeñalDePrecaucionCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:50:40'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !



!SeñalDePrecaucionCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 15:24:11'!
apagar
	
	self color: Color black! !

!SeñalDePrecaucionCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/25/2019 20:11:04'!
colorDeLuz
	
	^Color yellow! !

!SeñalDePrecaucionCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:00:10'!
prender
	
	self color: self colorDeLuz! !


!SeñalDePrecaucionCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecaucionCorrientesYCallao category: #Semaforo!
DenotativeObjectMorph subclass: #SeñalDePrecaucionCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecaucionCorrientesYCallao class' category: #Semaforo!
SeñalDePrecaucionCorrientesYCallao class
	instanceVariableNames: ''!

!SeñalDePrecaucionCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:09:27'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalDePrecaucionCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:09:28'!
apagar
	
	self color: Color black! !

!SeñalDePrecaucionCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:09:28'!
colorDeLuz
	
	^Color yellow! !

!SeñalDePrecaucionCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:09:28'!
prender
	
	self color: self colorDeLuz! !


!SeñalDePrecaucionCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
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

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:51:24'!
alternarSeñal

	self 
		avanza: CajaDeSeñalesDeCallaoYCorrientes seDetiene: CajaDeSeñalesDeCorrientesYCallao;
		avanza: CajaDeSeñalesDeCorrientesYCallao seDetiene: CajaDeSeñalesDeCallaoYCorrientes! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:59:22'!
alternarSeñales

	[self estaPrendido] whileTrue: [self alternarSeñal].
	self apagar! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:25:22'!
avanza: unaCajaDeSeñales seDetiene: otraCajaDeSeñales

	unaCajaDeSeñales prenderSeñalDeAvance.
	otraCajaDeSeñales  prenderSeñalDeDetencion.
	self esperar: 2*second.
	unaCajaDeSeñales prenderSeñalDePrecaucion.
	self esperar: 1*second.
	! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:52:25'!
estaPrendido

	^prendido! !


!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:53:08'!
apagar

	prendido := false.
	CajaDeSeñalesDeCallaoYCorrientes  apagar.
	CajaDeSeñalesDeCorrientesYCallao apagar
	
	! !

!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:30:28'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !

!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 18:02:59'!
prender

	prendido := true.
	[CajaDeSeñalesDeCallaoYCorrientes  prender] fork.
	[CajaDeSeñalesDeCorrientesYCallao prender] fork.
	self esperar: 1*second.
	self alternarSeñales
	! !


!SemaforoDeCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prendido := false.! !

CajaDeSeñalesDeCallaoYCorrientes initializeAfterFileIn!
CajaDeSeñalesDeCorrientesYCallao initializeAfterFileIn!
SeñalDeAvanceCallaoYCorrientes initializeAfterFileIn!
SeñalDeAvanceCorrientesYCallao initializeAfterFileIn!
SeñalDeDetencionCallaoYCorrientes initializeAfterFileIn!
SeñalDeDetencionCorrientesYCallao initializeAfterFileIn!
SeñalDePrecaucionCallaoYCorrientes initializeAfterFileIn!
SeñalDePrecaucionCorrientesYCallao initializeAfterFileIn!
SemaforoDeCorrientesYCallao initializeAfterFileIn!