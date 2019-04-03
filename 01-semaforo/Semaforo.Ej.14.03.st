!classDefinition: #UnContenedorDeSeñales category: #Semaforo!
DenotativeObjectMorph subclass: #UnContenedorDeSeñales
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnContenedorDeSeñales class' category: #Semaforo!
UnContenedorDeSeñales class
	instanceVariableNames: 'UnaSeñalDeAvance UnaSeñalDeDetencion UnaSeñalDePrecaucion'!

!UnContenedorDeSeñales class methodsFor: 'morph' stamp: 'LGS 3/31/2019 19:18:26'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnContenedorDeSeñales class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 19:18:26'!
esperar: aDuration 
	
	(Delay for: aDuration) wait! !


!UnContenedorDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:46:46'!
apagar
	
	self UnaSeñalDeDetencion apagar.
	self UnaSeñalDePrecaucion apagar.
	self UnaSeñalDeAvance apagar
	! !

!UnContenedorDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:41:09'!
avisarPrecaucionPorEncendido
	
	5 timesRepeat: [self prenderYApagarUnaSeñalDePrecaucion]! !

!UnContenedorDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 19:18:26'!
prender

	self avisarPrecaucionPorEncendido
	! !

!UnContenedorDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:45:39'!
prenderUnaSeñalDeAvance

	self UnaSeñalDeDetencion apagar.
	self UnaSeñalDePrecaucion apagar.
	self UnaSeñalDeAvance prender
	! !

!UnContenedorDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:45:59'!
prenderUnaSeñalDeDetencion

	self UnaSeñalDeDetencion prender.
	self UnaSeñalDePrecaucion apagar.
	self UnaSeñalDeAvance apagar
	! !

!UnContenedorDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:46:14'!
prenderUnaSeñalDePrecaucion

	self UnaSeñalDeDetencion apagar.
	self UnaSeñalDePrecaucion prender.
	self UnaSeñalDeAvance apagar
	! !

!UnContenedorDeSeñales class methodsFor: 'funcionamiento' stamp: 'LGS 3/31/2019 20:43:26'!
prenderYApagarUnaSeñalDePrecaucion
	
		self UnaSeñalDePrecaucion prender.
		self esperar: 0.1* second.
		self UnaSeñalDePrecaucion apagar.
		self esperar: 0.1* second! !


!UnContenedorDeSeñales class methodsFor: 'creation' stamp: 'LGS 4/2/2019 19:46:28'!
UnaSeñalDeAvance: unaUnaSeñalDeAvance UnaSeñalDePrecaucion: unaUnaSeñalDePrecaucion UnaSeñalDeDetencion: unaUnaSeñalDeDetencion

	UnaSeñalDeAvance  := unaUnaSeñalDeAvance .
	UnaSeñalDePrecaucion  := unaUnaSeñalDePrecaucion.
	UnaSeñalDeDetencion  := unaUnaSeñalDeDetencion .
	self addMorph: unaUnaSeñalDeAvance; addMorph: unaUnaSeñalDePrecaucion; addMorph: unaUnaSeñalDeDetencion! !


!UnContenedorDeSeñales class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:30:23'!
UnaSeñalDeAvance

	^UnaSeñalDeAvance! !

!UnContenedorDeSeñales class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:30:34'!
UnaSeñalDeDetencion

	^UnaSeñalDeDetencion! !

!UnContenedorDeSeñales class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:30:47'!
UnaSeñalDePrecaucion

	^UnaSeñalDePrecaucion! !


!UnContenedorDeSeñales class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	UnaSeñalDeAvance := nil.
	UnaSeñalDeDetencion := nil.
	UnaSeñalDePrecaucion := nil.! !


!classDefinition: #UnContenedorDeSeñalesDeBoedoYSanJuan category: #Semaforo!
UnContenedorDeSeñales subclass: #UnContenedorDeSeñalesDeBoedoYSanJuan
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnContenedorDeSeñalesDeBoedoYSanJuan class' category: #Semaforo!
UnContenedorDeSeñalesDeBoedoYSanJuan class
	instanceVariableNames: ''!

!UnContenedorDeSeñalesDeBoedoYSanJuan class methodsFor: 'morph' stamp: 'LGS 4/2/2019 20:00:09'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnContenedorDeSeñalesDeBoedoYSanJuan class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	UnaSeñalDeAvance := UnaSeñalDeAvanceBoedoYSanJuan.
	UnaSeñalDeDetencion := UnaSeñalDeDetencionBoedoYSanJuan.
	UnaSeñalDePrecaucion := UnaSeñalDePrecaucionBoedoYSanJuan.! !


!classDefinition: #UnContenedorDeSeñalesDeCallaoYCorrientes category: #Semaforo!
UnContenedorDeSeñales subclass: #UnContenedorDeSeñalesDeCallaoYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnContenedorDeSeñalesDeCallaoYCorrientes class' category: #Semaforo!
UnContenedorDeSeñalesDeCallaoYCorrientes class
	instanceVariableNames: ''!

!UnContenedorDeSeñalesDeCallaoYCorrientes class methodsFor: 'morph' stamp: 'LGS 3/25/2019 19:49:06'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnContenedorDeSeñalesDeCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	UnaSeñalDeAvance := UnaSeñalDeAvanceCallaoYCorrientes.
	UnaSeñalDeDetencion := UnaSeñalDeDetencionCallaoYCorrientes.
	UnaSeñalDePrecaucion := UnaSeñalDePrecaucionCallaoYCorrientes.! !


!classDefinition: #UnContenedorDeSeñalesDeCorrientesYCallao category: #Semaforo!
UnContenedorDeSeñales subclass: #UnContenedorDeSeñalesDeCorrientesYCallao
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnContenedorDeSeñalesDeCorrientesYCallao class' category: #Semaforo!
UnContenedorDeSeñalesDeCorrientesYCallao class
	instanceVariableNames: ''!

!UnContenedorDeSeñalesDeCorrientesYCallao class methodsFor: 'morph' stamp: 'LGS 3/31/2019 17:08:31'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnContenedorDeSeñalesDeCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	UnaSeñalDeAvance := UnaSeñalDeAvanceCorrientesYCallao.
	UnaSeñalDeDetencion := UnaSeñalDeDetencionCorrientesYCallao.
	UnaSeñalDePrecaucion := UnaSeñalDePrecaucionCorrientesYCallao.! !


!classDefinition: #UnContenedorDeSeñalesDeSanJuanYBoedo category: #Semaforo!
UnContenedorDeSeñales subclass: #UnContenedorDeSeñalesDeSanJuanYBoedo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnContenedorDeSeñalesDeSanJuanYBoedo class' category: #Semaforo!
UnContenedorDeSeñalesDeSanJuanYBoedo class
	instanceVariableNames: ''!

!UnContenedorDeSeñalesDeSanJuanYBoedo class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:59:57'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!UnContenedorDeSeñalesDeSanJuanYBoedo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.
	UnaSeñalDeAvance := UnaSeñalDeAvanceSanJuanYBoedo.
	UnaSeñalDeDetencion := UnaSeñalDeDetencionSanJuanYBoedo.
	UnaSeñalDePrecaucion := UnaSeñalDePrecaucionSanJuanYBoedo.! !


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


!UnaSeñalDeSemaforo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
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


!UnaSeñalDeAvance class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDeAvanceBoedoYSanJuan category: #Semaforo!
UnaSeñalDeAvance subclass: #UnaSeñalDeAvanceBoedoYSanJuan
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDeAvanceBoedoYSanJuan class' category: #Semaforo!
UnaSeñalDeAvanceBoedoYSanJuan class
	instanceVariableNames: ''!

!UnaSeñalDeAvanceBoedoYSanJuan class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:58:52'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDeAvanceBoedoYSanJuan class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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



!UnaSeñalDeAvanceCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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



!UnaSeñalDeAvanceCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDeAvanceSanJuanYBoedo category: #Semaforo!
UnaSeñalDeAvance subclass: #UnaSeñalDeAvanceSanJuanYBoedo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDeAvanceSanJuanYBoedo class' category: #Semaforo!
UnaSeñalDeAvanceSanJuanYBoedo class
	instanceVariableNames: ''!

!UnaSeñalDeAvanceSanJuanYBoedo class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:58:40'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDeAvanceSanJuanYBoedo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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


!UnaSeñalDeDetencion class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDeDetencionBoedoYSanJuan category: #Semaforo!
UnaSeñalDeDetencion subclass: #UnaSeñalDeDetencionBoedoYSanJuan
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDeDetencionBoedoYSanJuan class' category: #Semaforo!
UnaSeñalDeDetencionBoedoYSanJuan class
	instanceVariableNames: ''!

!UnaSeñalDeDetencionBoedoYSanJuan class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:59:15'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDeDetencionBoedoYSanJuan class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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


!UnaSeñalDeDetencionCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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


!UnaSeñalDeDetencionCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDeDetencionSanJuanYBoedo category: #Semaforo!
UnaSeñalDeDetencion subclass: #UnaSeñalDeDetencionSanJuanYBoedo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDeDetencionSanJuanYBoedo class' category: #Semaforo!
UnaSeñalDeDetencionSanJuanYBoedo class
	instanceVariableNames: ''!

!UnaSeñalDeDetencionSanJuanYBoedo class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:59:04'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDeDetencionSanJuanYBoedo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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


!UnaSeñalDePrecaucion class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDePrecaucionBoedoYSanJuan category: #Semaforo!
UnaSeñalDePrecaucion subclass: #UnaSeñalDePrecaucionBoedoYSanJuan
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDePrecaucionBoedoYSanJuan class' category: #Semaforo!
UnaSeñalDePrecaucionBoedoYSanJuan class
	instanceVariableNames: ''!

!UnaSeñalDePrecaucionBoedoYSanJuan class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:59:41'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDePrecaucionBoedoYSanJuan class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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


!UnaSeñalDePrecaucionCallaoYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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


!UnaSeñalDePrecaucionCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnaSeñalDePrecaucionSanJuanYBoedo category: #Semaforo!
UnaSeñalDePrecaucion subclass: #UnaSeñalDePrecaucionSanJuanYBoedo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnaSeñalDePrecaucionSanJuanYBoedo class' category: #Semaforo!
UnaSeñalDePrecaucionSanJuanYBoedo class
	instanceVariableNames: ''!

!UnaSeñalDePrecaucionSanJuanYBoedo class methodsFor: 'morph' stamp: 'LGS 4/2/2019 19:59:30'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!UnaSeñalDePrecaucionSanJuanYBoedo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
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
	instanceVariableNames: 'prendido primerUnContenedorDeSeñales segundoUnContenedorDeSeñales'!

!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 19:56:43'!
apagar

	prendido := false.
	self primerUnContenedorDeSeñales  apagar.
	self segundoUnContenedorDeSeñales apagar
	
	! !

!SemaforoDeCorrientesYCallao class methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 19:37:15'!
prender

	prendido := true.
	[self primerUnContenedorDeSeñales  prender] fork.
	[self segundoUnContenedorDeSeñales prender] fork.
	self esperar: 1*second.
	self alternarSeñales
	! !


!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:37:57'!
alternarSeñal

	self 
		avanza: self primerUnContenedorDeSeñales seDetiene: self segundoUnContenedorDeSeñales ;
		avanza: self segundoUnContenedorDeSeñales seDetiene: self primerUnContenedorDeSeñales ! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 3/31/2019 17:59:22'!
alternarSeñales

	[self estaPrendido] whileTrue: [self alternarSeñal].
	self apagar! !

!SemaforoDeCorrientesYCallao class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:38:30'!
avanza: unUnContenedorDeSeñales seDetiene: otroUnContenedorDeSeñales

	unUnContenedorDeSeñales prenderUnaSeñalDeAvance.
	otroUnContenedorDeSeñales  prenderUnaSeñalDeDetencion.
	self esperar: 2*second.
	unUnContenedorDeSeñales prenderUnaSeñalDePrecaucion.
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

	self primerUnContenedorDeSeñales openInWorld .
	self segundoUnContenedorDeSeñales openInWorld! !


!SemaforoDeCorrientesYCallao class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:36:08'!
primerUnContenedorDeSeñales

	^primerUnContenedorDeSeñales ! !

!SemaforoDeCorrientesYCallao class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:43:05'!
primerUnContenedorDeSeñales: unUnContenedorDeSeñales segundoUnContenedorDeSeñales: otroUnContenedorDeSeñales

	primerUnContenedorDeSeñales := unUnContenedorDeSeñales.
	segundoUnContenedorDeSeñales  := otroUnContenedorDeSeñales ! !

!SemaforoDeCorrientesYCallao class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:36:22'!
segundoUnContenedorDeSeñales

	^segundoUnContenedorDeSeñales ! !


!SemaforoDeCorrientesYCallao class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prendido := false.
	primerUnContenedorDeSeñales := UnContenedorDeSeñalesDeCallaoYCorrientes.
	segundoUnContenedorDeSeñales := UnContenedorDeSeñalesDeCorrientesYCallao.! !


!classDefinition: #SemaforoDeSanJuanYBoedo category: #Semaforo!
DenotativeObject subclass: #SemaforoDeSanJuanYBoedo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeSanJuanYBoedo class' category: #Semaforo!
SemaforoDeSanJuanYBoedo class
	instanceVariableNames: 'prendido primerUnContenedorDeSeñales segundoUnContenedorDeSeñales'!

!SemaforoDeSanJuanYBoedo class methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 19:58:17'!
apagar

	prendido := false.
	self primerUnContenedorDeSeñales  apagar.
	self segundoUnContenedorDeSeñales apagar
	
	! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'funcionamiento' stamp: 'LGS 4/2/2019 19:58:17'!
prender

	prendido := true.
	[self primerUnContenedorDeSeñales  prender] fork.
	[self segundoUnContenedorDeSeñales prender] fork.
	self esperar: 1*second.
	self alternarSeñales
	! !


!SemaforoDeSanJuanYBoedo class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:58:17'!
alternarSeñal

	self 
		avanza: self primerUnContenedorDeSeñales seDetiene: self segundoUnContenedorDeSeñales ;
		avanza: self segundoUnContenedorDeSeñales seDetiene: self primerUnContenedorDeSeñales ! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:58:18'!
alternarSeñales

	[self estaPrendido] whileTrue: [self alternarSeñal].
	self apagar! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'auxiliar' stamp: 'LGS 4/2/2019 19:58:18'!
avanza: unUnContenedorDeSeñales seDetiene: otroUnContenedorDeSeñales

	unUnContenedorDeSeñales prenderUnaSeñalDeAvance.
	otroUnContenedorDeSeñales  prenderUnaSeñalDeDetencion.
	self esperar: 2*second.
	unUnContenedorDeSeñales prenderUnaSeñalDePrecaucion.
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

	self primerUnContenedorDeSeñales openInWorld .
	self segundoUnContenedorDeSeñales openInWorld! !


!SemaforoDeSanJuanYBoedo class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:58:18'!
primerUnContenedorDeSeñales

	^primerUnContenedorDeSeñales ! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:58:18'!
primerUnContenedorDeSeñales: unUnContenedorDeSeñales segundoUnContenedorDeSeñales: otroUnContenedorDeSeñales

	primerUnContenedorDeSeñales := unUnContenedorDeSeñales.
	segundoUnContenedorDeSeñales  := otroUnContenedorDeSeñales ! !

!SemaforoDeSanJuanYBoedo class methodsFor: 'collaborators' stamp: 'LGS 4/2/2019 19:58:18'!
segundoUnContenedorDeSeñales

	^segundoUnContenedorDeSeñales ! !


!SemaforoDeSanJuanYBoedo class methodsFor: 'as yet unclassified' stamp: 'LGS 4/2/2019 20:07:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prendido := false.
	primerUnContenedorDeSeñales := UnContenedorDeSeñalesDeSanJuanYBoedo.
	segundoUnContenedorDeSeñales := UnContenedorDeSeñalesDeBoedoYSanJuan.! !

UnContenedorDeSeñales initializeAfterFileIn!
UnContenedorDeSeñalesDeBoedoYSanJuan initializeAfterFileIn!
UnContenedorDeSeñalesDeCallaoYCorrientes initializeAfterFileIn!
UnContenedorDeSeñalesDeCorrientesYCallao initializeAfterFileIn!
UnContenedorDeSeñalesDeSanJuanYBoedo initializeAfterFileIn!
UnaSeñalDeSemaforo initializeAfterFileIn!
UnaSeñalDeAvance initializeAfterFileIn!
UnaSeñalDeAvanceBoedoYSanJuan initializeAfterFileIn!
UnaSeñalDeAvanceCallaoYCorrientes initializeAfterFileIn!
UnaSeñalDeAvanceCorrientesYCallao initializeAfterFileIn!
UnaSeñalDeAvanceSanJuanYBoedo initializeAfterFileIn!
UnaSeñalDeDetencion initializeAfterFileIn!
UnaSeñalDeDetencionBoedoYSanJuan initializeAfterFileIn!
UnaSeñalDeDetencionCallaoYCorrientes initializeAfterFileIn!
UnaSeñalDeDetencionCorrientesYCallao initializeAfterFileIn!
UnaSeñalDeDetencionSanJuanYBoedo initializeAfterFileIn!
UnaSeñalDePrecaucion initializeAfterFileIn!
UnaSeñalDePrecaucionBoedoYSanJuan initializeAfterFileIn!
UnaSeñalDePrecaucionCallaoYCorrientes initializeAfterFileIn!
UnaSeñalDePrecaucionCorrientesYCallao initializeAfterFileIn!
UnaSeñalDePrecaucionSanJuanYBoedo initializeAfterFileIn!
SemaforoDeCorrientesYCallao initializeAfterFileIn!
SemaforoDeSanJuanYBoedo initializeAfterFileIn!