S5 = Ayto.new(
	:guys => ['Andre','Derrick','Edward','Hayden','Jaylan','Joey','Michael','Mike','Osvaldo','Ozzy','Tyler'],
	:girls => ['Alicia','Carolina','Casandra','Gianna','Hannah','Kam','Kari','Kathryn','Shannon','Taylor','Tyranny']
)

S5.addTruth(:guy => 'Hayden', :girl => 'Gianna', :truth => :NO_MATCH, :episode => 1)
S5.addCeremony(
	:pairs => [ 
    { :guy => 'Andre', :girl => 'Alicia' },
    { :guy => 'Derrick', :girl => 'Kathryn' },
    { :guy => 'Edward', :girl => 'Kam' },
    { :guy => 'Hayden', :girl => 'Shannon' },
    { :guy => 'Jaylan', :girl => 'Casandra' },
    { :guy => 'Joey', :girl => 'Carolina' },
    { :guy => 'Michael', :girl => 'Hannah' },
    { :guy => 'Mike', :girl => 'Kari' },
    { :guy => 'Osvaldo', :girl => 'Tyranny' },
    { :guy => 'Ozzy', :girl => 'Gianna' },
    { :guy => 'Tyler', :girl => 'Taylor' }
  ],
	:lights => 2,
  :episode => 1
)


S5.addTruth(:guy => 'Andre', :girl => 'Alicia', :truth => :NO_MATCH, :episode => 2)
S5.addCeremony(
	:pairs => [
    { :guy => 'Andre', :girl => 'Hannah'},
    { :guy => 'Derrick', :girl => 'Alicia' },
    { :guy => 'Edward', :girl => 'Shannon' },
    { :guy => 'Hayden', :girl => 'Taylor' },
    { :guy => 'Jaylan', :girl => 'Kam' },
    { :guy => 'Joey', :girl => 'Carolina' },
    { :guy => 'Michael', :girl => 'Gianna' },
    { :guy => 'Mike', :girl => 'Casandra' },
    { :guy => 'Osvaldo', :girl => 'Kari' },
    { :guy => 'Ozzy', :girl => 'Kathryn' },
    { :guy => 'Tyler', :girl => 'Tyranny' }
  ],
	:lights => 0,
  :episode => 2
)

S5.addTruth(:guy => 'Ozzy', :girl => 'Carolina', :truth => :NO_MATCH, :episode => 3)
S5.addCeremony(
	:pairs => [
    { :guy => 'Andre', :girl => 'Kari'},
    { :guy => 'Derrick', :girl => 'Hannah' },
    { :guy => 'Edward', :girl => 'Kam' },
    { :guy => 'Hayden', :girl => 'Carolina' },
    { :guy => 'Jaylan', :girl => 'Casandra' },
    { :guy => 'Joey', :girl => 'Kathryn' },
    { :guy => 'Michael', :girl => 'Taylor' },
    { :guy => 'Mike', :girl => 'Alicia' },
    { :guy => 'Osvaldo', :girl => 'Tyranny' },
    { :guy => 'Ozzy', :girl => 'Gianna' },
    { :guy => 'Tyler', :girl => 'Shannon' }
  ],
	:lights => 4,
  :episode => 3
)

