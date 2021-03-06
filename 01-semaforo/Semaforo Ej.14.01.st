!classDefinition: #CajaDeSe˝alesDeCallaoYCorrientes category: #Semaforo!
DenotativeObjectMorph subclass: #CajaDeSe˝alesDeCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CajaDeSe˝alesDeCallaoYCorrientes class' category: #Semaforo!
CajaDeSe˝alesDeCallaoYCorrientes class
	instanceVariableNames: ''!

!CajaDeSe˝alesDeCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:06'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!CajaDeSe˝alesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 15:29:52'!
apagar
	
	Se˝alDeDetencionCallaoYCorrientes apagar.
	Se˝alDePrecaucionCallaoYCorrientes apagar.
	Se˝alDeAvanceCallaoYCorrientes apagar
	! !

!CajaDeSe˝alesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 16:59:13'!
avisarPrecaucionPorEncendido
	
	5 timesRepeat: [
		Se˝alDePrecaucionCallaoYCorrientes prender.
		self esperar: 0.1* second.
		Se˝alDePrecaucionCallaoYCorrientes apagar.
		self esperar: 0.1* second]! !

!CajaDeSe˝alesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 15:25:05'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !

!CajaDeSe˝alesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 16:56:57'!
prender

	self avisarPrecaucionPorEncendido
	! !

!CajaDeSe˝alesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:56:25'!
prenderSe˝alDeAvance

	Se˝alDeDetencionCallaoYCorrientes apagar.
	Se˝alDePrecaucionCallaoYCorrientes apagar.
	Se˝alDeAvanceCallaoYCorrientes prender
	! !

!CajaDeSe˝alesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:56:41'!
prenderSe˝alDeDetencion

	Se˝alDeAvanceCallaoYCorrientes apagar.
	Se˝alDePrecaucionCallaoYCorrientes apagar.
	Se˝alDeDetencionCallaoYCorrientes prender
	! !

!CajaDeSe˝alesDeCallaoYCorrientes class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:05:26'!
prenderSe˝alDePrecaucion

	Se˝alDeAvanceCallaoYCorrientes apagar.
	Se˝alDeDetencionCallaoYCorrientes apagar.
	Se˝alDePrecaucionCallaoYCorrientes prender
	! !


!CajaDeSe˝alesDeCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #CajaDeSe˝alesDeCorrientesYCallao category: #Semaforo!
DenotativeObjectMorph subclass: #CajaDeSe˝alesDeCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CajaDeSe˝alesDeCorrientesYCallao class' category: #Semaforo!
CajaDeSe˝alesDeCorrientesYCallao class
	instanceVariableNames: ''!

!CajaDeSe˝alesDeCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:08:31'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!CajaDeSe˝alesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:13:21'!
apagar
	
	Se˝alDeDetencionCorrientesYCallao apagar.
	Se˝alDePrecaucionCorrientesYCallao apagar.
	Se˝alDeAvanceCorrientesYCallao apagar
	! !

!CajaDeSe˝alesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:13:44'!
avisarPrecaucionPorEncendido
	
	5 timesRepeat: [
		Se˝alDePrecaucionCorrientesYCallao prender.
		self esperar: 0.1* second.
		Se˝alDePrecaucionCorrientesYCallao apagar.
		self esperar: 0.1* second]! !

!CajaDeSe˝alesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:08:31'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !

!CajaDeSe˝alesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:08:31'!
prender

	self avisarPrecaucionPorEncendido
	! !

!CajaDeSe˝alesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:57:02'!
prenderSe˝alDeAvance

	Se˝alDeDetencionCorrientesYCallao apagar.
	Se˝alDePrecaucionCorrientesYCallao apagar.
	Se˝alDeAvanceCorrientesYCallao prender
	! !

!CajaDeSe˝alesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:57:18'!
prenderSe˝alDeDetencion

	Se˝alDeAvanceCorrientesYCallao apagar.
	Se˝alDePrecaucionCorrientesYCallao apagar.
	Se˝alDeDetencionCorrientesYCallao prender
	! !

!CajaDeSe˝alesDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:14:24'!
prenderSe˝alDePrecaucion

	Se˝alDeAvanceCorrientesYCallao apagar.
	Se˝alDeDetencionCorrientesYCallao apagar.
	Se˝alDePrecaucionCorrientesYCallao prender
	! !


!CajaDeSe˝alesDeCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #Se˝alDeAvanceCallaoYCorrientes category: #Semaforo!
DenotativeObjectMorph subclass: #Se˝alDeAvanceCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Se˝alDeAvanceCallaoYCorrientes class' category: #Semaforo!
Se˝alDeAvanceCallaoYCorrientes class
	instanceVariableNames: ''!

!Se˝alDeAvanceCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:41'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!Se˝alDeAvanceCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 15:24:03'!
apagar
	
	self color: Color black! !

!Se˝alDeAvanceCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/25/2019 20:20:36'!
colorDeLuz
	
	^Color green! !

!Se˝alDeAvanceCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 16:59:47'!
prender
	
	self color: self colorDeLuz! !


!Se˝alDeAvanceCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #Se˝alDeAvanceCorrientesYCallao category: #Semaforo!
DenotativeObjectMorph subclass: #Se˝alDeAvanceCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Se˝alDeAvanceCorrientesYCallao class' category: #Semaforo!
Se˝alDeAvanceCorrientesYCallao class
	instanceVariableNames: ''!

!Se˝alDeAvanceCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:08:52'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!Se˝alDeAvanceCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:08:52'!
apagar
	
	self color: Color black! !

!Se˝alDeAvanceCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:08:52'!
colorDeLuz
	
	^Color green! !

!Se˝alDeAvanceCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:08:52'!
prender
	
	self color: self colorDeLuz! !


!Se˝alDeAvanceCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #Se˝alDeDetencionCallaoYCorrientes category: #Semaforo!
DenotativeObjectMorph subclass: #Se˝alDeDetencionCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Se˝alDeDetencionCallaoYCorrientes class' category: #Semaforo!
Se˝alDeDetencionCallaoYCorrientes class
	instanceVariableNames: ''!

!Se˝alDeDetencionCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:24'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!Se˝alDeDetencionCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 15:24:07'!
apagar
	
	self color: Color black! !

!Se˝alDeDetencionCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/25/2019 20:20:19'!
colorDeLuz
	
	^Color red! !

!Se˝alDeDetencionCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:00:07'!
prender
	
	self color: self colorDeLuz! !


!Se˝alDeDetencionCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #Se˝alDeDetencionCorrientesYCallao category: #Semaforo!
DenotativeObjectMorph subclass: #Se˝alDeDetencionCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Se˝alDeDetencionCorrientesYCallao class' category: #Semaforo!
Se˝alDeDetencionCorrientesYCallao class
	instanceVariableNames: ''!

!Se˝alDeDetencionCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:09:13'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!Se˝alDeDetencionCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:09:13'!
apagar
	
	self color: Color black! !

!Se˝alDeDetencionCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:09:13'!
colorDeLuz
	
	^Color red! !

!Se˝alDeDetencionCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:09:13'!
prender
	
	self color: self colorDeLuz! !


!Se˝alDeDetencionCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #Se˝alDePrecaucionCallaoYCorrientes category: #Semaforo!
DenotativeObjectMorph subclass: #Se˝alDePrecaucionCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Se˝alDePrecaucionCallaoYCorrientes class' category: #Semaforo!
Se˝alDePrecaucionCallaoYCorrientes class
	instanceVariableNames: ''!

!Se˝alDePrecaucionCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:50:40'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !



!Se˝alDePrecaucionCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 15:24:11'!
apagar
	
	self color: Color black! !

!Se˝alDePrecaucionCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/25/2019 20:11:04'!
colorDeLuz
	
	^Color yellow! !

!Se˝alDePrecaucionCallaoYCorrientes class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:00:10'!
prender
	
	self color: self colorDeLuz! !


!Se˝alDePrecaucionCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #Se˝alDePrecaucionCorrientesYCallao category: #Semaforo!
DenotativeObjectMorph subclass: #Se˝alDePrecaucionCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Se˝alDePrecaucionCorrientesYCallao class' category: #Semaforo!
Se˝alDePrecaucionCorrientesYCallao class
	instanceVariableNames: ''!

!Se˝alDePrecaucionCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:09:27'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!Se˝alDePrecaucionCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:09:28'!
apagar
	
	self color: Color black! !

!Se˝alDePrecaucionCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:09:28'!
colorDeLuz
	
	^Color yellow! !

!Se˝alDePrecaucionCorrientesYCallao class methodsFor: 'propiedad' stamp: 'LGS 3/31/2019 17:09:28'!
prender
	
	self color: self colorDeLuz! !


!Se˝alDePrecaucionCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
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
alternarSe˝al

	self 
		avanza: CajaDeSe˝alesDeCallaoYCorrientes seDetiene: CajaDeSe˝alesDeCorrientesYCallao;
		avanza: CajaDeSe˝alesDeCorrientesYCallao seDetiene: CajaDeSe˝alesDeCallaoYCorrientes! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:59:22'!
alternarSe˝ales

	[self estaPrendido] whileTrue: [self alternarSe˝al].
	self apagar! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:25:22'!
avanza: unaCajaDeSe˝ales seDetiene: otraCajaDeSe˝ales

	unaCajaDeSe˝ales prenderSe˝alDeAvance.
	otraCajaDeSe˝ales  prenderSe˝alDeDetencion.
	self esperar: 2*second.
	unaCajaDeSe˝ales prenderSe˝alDePrecaucion.
	self esperar: 1*second.
	! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:52:25'!
estaPrendido

	^prendido! !


!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:53:08'!
apagar

	prendido := false.
	CajaDeSe˝alesDeCallaoYCorrientes  apagar.
	CajaDeSe˝alesDeCorrientesYCallao apagar
	
	! !

!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 17:30:28'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !

!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 18:02:59'!
prender

	prendido := true.
	[CajaDeSe˝alesDeCallaoYCorrientes  prender] fork.
	[CajaDeSe˝alesDeCorrientesYCallao prender] fork.
	self esperar: 1*second.
	self alternarSe˝ales
	! !


!SemaforoDeCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 3/31/2019 19:13:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prendido := false.! !

CajaDeSe˝alesDeCallaoYCorrientes initializeAfterFileIn!
CajaDeSe˝alesDeCorrientesYCallao initializeAfterFileIn!
Se˝alDeAvanceCallaoYCorrientes initializeAfterFileIn!
Se˝alDeAvanceCorrientesYCallao initializeAfterFileIn!
Se˝alDeDetencionCallaoYCorrientes initializeAfterFileIn!
Se˝alDeDetencionCorrientesYCallao initializeAfterFileIn!
Se˝alDePrecaucionCallaoYCorrientes initializeAfterFileIn!
Se˝alDePrecaucionCorrientesYCallao initializeAfterFileIn!
SemaforoDeCorrientesYCallao initializeAfterFileIn!