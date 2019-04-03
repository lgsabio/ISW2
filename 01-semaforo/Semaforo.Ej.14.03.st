!classDefinition: #UnContenedorDeSe�ales category: #Semaforo!
DenotativeObjectMorph subclass: #UnContenedorDeSe�ales
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnContenedorDeSe�ales class' category: #Semaforo!
UnContenedorDeSe�ales class
	instanceVariableNames: 'UnaSe�alDeAvance UnaSe�alDeDetencion UnaSe�alDePrecaucion'!

!UnContenedorDeSe�ales class methodsFor: 'morph' stamp: 'LGS 3/31/2019 19:18:26'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnContenedorDeSe�ales class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 19:18:26'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !


!UnContenedorDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:46:46'!
apagar
	
	self UnaSe�alDeDetencion apagar.
	self UnaSe�alDePrecaucion apagar.
	self UnaSe�alDeAvance apagar
	! !

!UnContenedorDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:41:09'!
avisarPrecaucionPorEncendido
	
	5 timesRepeat: [self prenderYApagarUnaSe�alDePrecaucion]! !

!UnContenedorDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 19:18:26'!
prender

	self avisarPrecaucionPorEncendido
	! !

!UnContenedorDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:45:39'!
prenderUnaSe�alDeAvance

	self UnaSe�alDeDetencion apagar.
	self UnaSe�alDePrecaucion apagar.
	self UnaSe�alDeAvance prender
	! !

!UnContenedorDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:45:59'!
prenderUnaSe�alDeDetencion

	self UnaSe�alDeDetencion prender.
	self UnaSe�alDePrecaucion apagar.
	self UnaSe�alDeAvance apagar
	! !

!UnContenedorDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:46:14'!
prenderUnaSe�alDePrecaucion

	self UnaSe�alDeDetencion apagar.
	self UnaSe�alDePrecaucion prender.
	self UnaSe�alDeAvance apagar
	! !

!UnContenedorDeSe�ales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:43:26'!
prenderYApagarUnaSe�alDePrecaucion
	
		self UnaSe�alDePrecaucion prender.
		self esperar: 0.1* second.
		self UnaSe�alDePrecaucion apagar.
		self esperar: 0.1* second! !


!UnContenedorDeSe�ales class methodsFor: 'creation' stamp: 'LGS 4/2/2019 19:46:28'!
UnaSe�alDeAvance: unaUnaSe�alDeAvance UnaSe�alDePrecaucion: unaUnaSe�alDePrecaucion UnaSe�alDeDetencion: unaUnaSe�alDeDetencion

	UnaSe�alDeAvance  := unaUnaSe�alDeAvance .
	UnaSe�alDePrecaucion  := unaUnaSe�alDePrecaucion.
	UnaSe�alDeDetencion  := unaUnaSe�alDeDetencion .
	self addMorph: unaUnaSe�alDeAvance; addMorph: unaUnaSe�alDePrecaucion; addMorph: unaUnaSe�alDeDetencion! !


!UnContenedorDeSe�ales class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:30:23'!
UnaSe�alDeAvance

	^UnaSe�alDeAvance! !

!UnContenedorDeSe�ales class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:30:34'!
UnaSe�alDeDetencion

	^UnaSe�alDeDetencion! !

!UnContenedorDeSe�ales class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:30:47'!
UnaSe�alDePrecaucion

	^UnaSe�alDePrecaucion! !


!UnContenedorDeSe�ales class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	UnaSe�alDeAvance := nil.
	UnaSe�alDeDetencion := nil.
	UnaSe�alDePrecaucion := nil.! !


!classDefinition: #UnContenedorDeSe�alesDeBoedoYSanJuan category: #Semaforo!
UnContenedorDeSe�ales subclass: #UnContenedorDeSe�alesDeBoedoYSanJuan
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnContenedorDeSe�alesDeBoedoYSanJuan class' category: #Semaforo!
UnContenedorDeSe�alesDeBoedoYSanJuan class
	instanceVariableNames: ''!

!UnContenedorDeSe�alesDeBoedoYSanJuan class methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:00:09'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnContenedorDeSe�alesDeBoedoYSanJuan class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	UnaSe�alDeAvance := UnaSe�alDeAvanceBoedoYSanJuan.
	UnaSe�alDeDetencion := UnaSe�alDeDetencionBoedoYSanJuan.
	UnaSe�alDePrecaucion := UnaSe�alDePrecaucionBoedoYSanJuan.! !


!classDefinition: #UnContenedorDeSe�alesDeCallaoYCorrientes category: #Semaforo!
UnContenedorDeSe�ales subclass: #UnContenedorDeSe�alesDeCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnContenedorDeSe�alesDeCallaoYCorrientes class' category: #Semaforo!
UnContenedorDeSe�alesDeCallaoYCorrientes class
	instanceVariableNames: ''!

!UnContenedorDeSe�alesDeCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:06'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnContenedorDeSe�alesDeCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	UnaSe�alDeAvance := UnaSe�alDeAvanceCallaoYCorrientes.
	UnaSe�alDeDetencion := UnaSe�alDeDetencionCallaoYCorrientes.
	UnaSe�alDePrecaucion := UnaSe�alDePrecaucionCallaoYCorrientes.! !


!classDefinition: #UnContenedorDeSe�alesDeCorrientesYCallao category: #Semaforo!
UnContenedorDeSe�ales subclass: #UnContenedorDeSe�alesDeCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnContenedorDeSe�alesDeCorrientesYCallao class' category: #Semaforo!
UnContenedorDeSe�alesDeCorrientesYCallao class
	instanceVariableNames: ''!

!UnContenedorDeSe�alesDeCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:08:31'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnContenedorDeSe�alesDeCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	UnaSe�alDeAvance := UnaSe�alDeAvanceCorrientesYCallao.
	UnaSe�alDeDetencion := UnaSe�alDeDetencionCorrientesYCallao.
	UnaSe�alDePrecaucion := UnaSe�alDePrecaucionCorrientesYCallao.! !


!classDefinition: #UnContenedorDeSe�alesDeSanJuanYBoedo category: #Semaforo!
UnContenedorDeSe�ales subclass: #UnContenedorDeSe�alesDeSanJuanYBoedo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnContenedorDeSe�alesDeSanJuanYBoedo class' category: #Semaforo!
UnContenedorDeSe�alesDeSanJuanYBoedo class
	instanceVariableNames: ''!

!UnContenedorDeSe�alesDeSanJuanYBoedo class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:59:57'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnContenedorDeSe�alesDeSanJuanYBoedo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	UnaSe�alDeAvance := UnaSe�alDeAvanceSanJuanYBoedo.
	UnaSe�alDeDetencion := UnaSe�alDeDetencionSanJuanYBoedo.
	UnaSe�alDePrecaucion := UnaSe�alDePrecaucionSanJuanYBoedo.! !


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


!UnaSe�alDeSemaforo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
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


!UnaSe�alDeAvance class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDeAvanceBoedoYSanJuan category: #Semaforo!
UnaSe�alDeAvance subclass: #UnaSe�alDeAvanceBoedoYSanJuan
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDeAvanceBoedoYSanJuan class' category: #Semaforo!
UnaSe�alDeAvanceBoedoYSanJuan class
	instanceVariableNames: ''!

!UnaSe�alDeAvanceBoedoYSanJuan class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:58:52'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDeAvanceBoedoYSanJuan class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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



!UnaSe�alDeAvanceCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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



!UnaSe�alDeAvanceCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDeAvanceSanJuanYBoedo category: #Semaforo!
UnaSe�alDeAvance subclass: #UnaSe�alDeAvanceSanJuanYBoedo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDeAvanceSanJuanYBoedo class' category: #Semaforo!
UnaSe�alDeAvanceSanJuanYBoedo class
	instanceVariableNames: ''!

!UnaSe�alDeAvanceSanJuanYBoedo class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:58:40'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDeAvanceSanJuanYBoedo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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


!UnaSe�alDeDetencion class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDeDetencionBoedoYSanJuan category: #Semaforo!
UnaSe�alDeDetencion subclass: #UnaSe�alDeDetencionBoedoYSanJuan
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDeDetencionBoedoYSanJuan class' category: #Semaforo!
UnaSe�alDeDetencionBoedoYSanJuan class
	instanceVariableNames: ''!

!UnaSe�alDeDetencionBoedoYSanJuan class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:59:15'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDeDetencionBoedoYSanJuan class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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


!UnaSe�alDeDetencionCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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


!UnaSe�alDeDetencionCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDeDetencionSanJuanYBoedo category: #Semaforo!
UnaSe�alDeDetencion subclass: #UnaSe�alDeDetencionSanJuanYBoedo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDeDetencionSanJuanYBoedo class' category: #Semaforo!
UnaSe�alDeDetencionSanJuanYBoedo class
	instanceVariableNames: ''!

!UnaSe�alDeDetencionSanJuanYBoedo class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:59:04'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDeDetencionSanJuanYBoedo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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


!UnaSe�alDePrecaucion class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDePrecaucionBoedoYSanJuan category: #Semaforo!
UnaSe�alDePrecaucion subclass: #UnaSe�alDePrecaucionBoedoYSanJuan
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDePrecaucionBoedoYSanJuan class' category: #Semaforo!
UnaSe�alDePrecaucionBoedoYSanJuan class
	instanceVariableNames: ''!

!UnaSe�alDePrecaucionBoedoYSanJuan class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:59:41'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDePrecaucionBoedoYSanJuan class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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


!UnaSe�alDePrecaucionCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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


!UnaSe�alDePrecaucionCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSe�alDePrecaucionSanJuanYBoedo category: #Semaforo!
UnaSe�alDePrecaucion subclass: #UnaSe�alDePrecaucionSanJuanYBoedo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSe�alDePrecaucionSanJuanYBoedo class' category: #Semaforo!
UnaSe�alDePrecaucionSanJuanYBoedo class
	instanceVariableNames: ''!

!UnaSe�alDePrecaucionSanJuanYBoedo class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:59:30'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSe�alDePrecaucionSanJuanYBoedo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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
	instanceVariableNames: 'prendido primerUnContenedorDeSe�ales segundoUnContenedorDeSe�ales'!

!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 19:56:43'!
apagar

	prendido := false.
	self primerUnContenedorDeSe�ales  apagar.
	self segundoUnContenedorDeSe�ales apagar
	
	! !

!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 19:37:15'!
prender

	prendido := true.
	[self primerUnContenedorDeSe�ales  prender] fork.
	[self segundoUnContenedorDeSe�ales prender] fork.
	self esperar: 1*second.
	self alternarSe�ales
	! !


!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:37:57'!
alternarSe�al

	self 
		avanza: self primerUnContenedorDeSe�ales seDetiene: self segundoUnContenedorDeSe�ales ;
		avanza: self segundoUnContenedorDeSe�ales seDetiene: self primerUnContenedorDeSe�ales ! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:59:22'!
alternarSe�ales

	[self estaPrendido] whileTrue: [self alternarSe�al].
	self apagar! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:38:30'!
avanza: unUnContenedorDeSe�ales seDetiene: otroUnContenedorDeSe�ales

	unUnContenedorDeSe�ales prenderUnaSe�alDeAvance.
	otroUnContenedorDeSe�ales  prenderUnaSe�alDeDetencion.
	self esperar: 2*second.
	unUnContenedorDeSe�ales prenderUnaSe�alDePrecaucion.
	self esperar: 1*second.
	! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:30:28'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:52:25'!
estaPrendido

	^prendido! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:55:48'!
openInWorld

	self primerUnContenedorDeSe�ales openInWorld .
	self segundoUnContenedorDeSe�ales openInWorld! !


!SemaforoDeCorrientesYCallao class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:36:08'!
primerUnContenedorDeSe�ales

	^primerUnContenedorDeSe�ales ! !

!SemaforoDeCorrientesYCallao class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:43:05'!
primerUnContenedorDeSe�ales: unUnContenedorDeSe�ales segundoUnContenedorDeSe�ales: otroUnContenedorDeSe�ales

	primerUnContenedorDeSe�ales := unUnContenedorDeSe�ales.
	segundoUnContenedorDeSe�ales  := otroUnContenedorDeSe�ales ! !

!SemaforoDeCorrientesYCallao class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:36:22'!
segundoUnContenedorDeSe�ales

	^segundoUnContenedorDeSe�ales ! !


!SemaforoDeCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prendido := false.
	primerUnContenedorDeSe�ales := UnContenedorDeSe�alesDeCallaoYCorrientes.
	segundoUnContenedorDeSe�ales := UnContenedorDeSe�alesDeCorrientesYCallao.! !


!classDefinition: #SemaforoDeSanJuanYBoedo category: #Semaforo!
DenotativeObject subclass: #SemaforoDeSanJuanYBoedo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeSanJuanYBoedo class' category: #Semaforo!
SemaforoDeSanJuanYBoedo class
	instanceVariableNames: 'prendido primerUnContenedorDeSe�ales segundoUnContenedorDeSe�ales'!

!SemaforoDeSanJuanYBoedo class methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 19:58:17'!
apagar

	prendido := false.
	self primerUnContenedorDeSe�ales  apagar.
	self segundoUnContenedorDeSe�ales apagar
	
	! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 19:58:17'!
prender

	prendido := true.
	[self primerUnContenedorDeSe�ales  prender] fork.
	[self segundoUnContenedorDeSe�ales prender] fork.
	self esperar: 1*second.
	self alternarSe�ales
	! !


!SemaforoDeSanJuanYBoedo class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:58:17'!
alternarSe�al

	self 
		avanza: self primerUnContenedorDeSe�ales seDetiene: self segundoUnContenedorDeSe�ales ;
		avanza: self segundoUnContenedorDeSe�ales seDetiene: self primerUnContenedorDeSe�ales ! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:58:18'!
alternarSe�ales

	[self estaPrendido] whileTrue: [self alternarSe�al].
	self apagar! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:58:18'!
avanza: unUnContenedorDeSe�ales seDetiene: otroUnContenedorDeSe�ales

	unUnContenedorDeSe�ales prenderUnaSe�alDeAvance.
	otroUnContenedorDeSe�ales  prenderUnaSe�alDeDetencion.
	self esperar: 2*second.
	unUnContenedorDeSe�ales prenderUnaSe�alDePrecaucion.
	self esperar: 1*second.
	! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:58:18'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:58:18'!
estaPrendido

	^prendido! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:58:18'!
openInWorld

	self primerUnContenedorDeSe�ales openInWorld .
	self segundoUnContenedorDeSe�ales openInWorld! !


!SemaforoDeSanJuanYBoedo class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:58:18'!
primerUnContenedorDeSe�ales

	^primerUnContenedorDeSe�ales ! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:58:18'!
primerUnContenedorDeSe�ales: unUnContenedorDeSe�ales segundoUnContenedorDeSe�ales: otroUnContenedorDeSe�ales

	primerUnContenedorDeSe�ales := unUnContenedorDeSe�ales.
	segundoUnContenedorDeSe�ales  := otroUnContenedorDeSe�ales ! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:58:18'!
segundoUnContenedorDeSe�ales

	^segundoUnContenedorDeSe�ales ! !


!SemaforoDeSanJuanYBoedo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prendido := false.
	primerUnContenedorDeSe�ales := UnContenedorDeSe�alesDeSanJuanYBoedo.
	segundoUnContenedorDeSe�ales := UnContenedorDeSe�alesDeBoedoYSanJuan.! !

UnContenedorDeSe�ales initializeAfterFileIn!
UnContenedorDeSe�alesDeBoedoYSanJuan initializeAfterFileIn!
UnContenedorDeSe�alesDeCallaoYCorrientes initializeAfterFileIn!
UnContenedorDeSe�alesDeCorrientesYCallao initializeAfterFileIn!
UnContenedorDeSe�alesDeSanJuanYBoedo initializeAfterFileIn!
UnaSe�alDeSemaforo initializeAfterFileIn!
UnaSe�alDeAvance initializeAfterFileIn!
UnaSe�alDeAvanceBoedoYSanJuan initializeAfterFileIn!
UnaSe�alDeAvanceCallaoYCorrientes initializeAfterFileIn!
UnaSe�alDeAvanceCorrientesYCallao initializeAfterFileIn!
UnaSe�alDeAvanceSanJuanYBoedo initializeAfterFileIn!
UnaSe�alDeDetencion initializeAfterFileIn!
UnaSe�alDeDetencionBoedoYSanJuan initializeAfterFileIn!
UnaSe�alDeDetencionCallaoYCorrientes initializeAfterFileIn!
UnaSe�alDeDetencionCorrientesYCallao initializeAfterFileIn!
UnaSe�alDeDetencionSanJuanYBoedo initializeAfterFileIn!
UnaSe�alDePrecaucion initializeAfterFileIn!
UnaSe�alDePrecaucionBoedoYSanJuan initializeAfterFileIn!
UnaSe�alDePrecaucionCallaoYCorrientes initializeAfterFileIn!
UnaSe�alDePrecaucionCorrientesYCallao initializeAfterFileIn!
UnaSe�alDePrecaucionSanJuanYBoedo initializeAfterFileIn!
SemaforoDeCorrientesYCallao initializeAfterFileIn!
SemaforoDeSanJuanYBoedo initializeAfterFileIn!