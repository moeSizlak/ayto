S4 = Ayto.new(
	:guys => ['Cameron','Morgan','Tyler','Stephen','Asaf','John','Giovanni','Prosper','Sam','Cam'],
	:girls => ['Camille','Francesca','Victoria','Tori','Julia','Mikala','Kaylen','Emma','Nicole','Alyssa']
)

S4.addTruth(:guy => 'Prosper', :girl => 'Tori', :truth => :NO_MATCH, :episode => 1)
S4.addCeremony(
	:pairs => [
    { :guy => 'Giovanni', :girl => 'Kaylen' },
    { :guy => 'Cam', :girl => 'Victoria' },
    { :guy => 'Asaf', :girl => 'Francesca' },
    { :guy => 'John', :girl => 'Emma' },
    { :guy => 'Prosper', :girl => 'Camille' },
    { :guy => 'Sam', :girl => 'Alyssa' },
    { :guy => 'Cameron', :girl => 'Mikala' },
    { :guy => 'Morgan', :girl => 'Julia' },
    { :guy => 'Stephen', :girl => 'Nicole' },
    { :guy => 'Tyler', :girl => 'Tori' }	
  ],
	:lights => 3,
  :episode => 1
)

S4.addTruth(:guy => 'John', :girl => 'Julia', :truth => :NO_MATCH, :episode => 2)
S4.addCeremony(
	:pairs => [
    { :guy => 'Cam', :girl => 'Julia' },
    { :guy => 'Tyler', :girl => 'Victoria' },
    { :guy => 'Stephen', :girl => 'Tori' },
    { :guy => 'Cameron', :girl => 'Mikala' }, #
    { :guy => 'Morgan', :girl => 'Alyssa' },
    { :guy => 'Sam', :girl => 'Francesca' },
    { :guy => 'Prosper', :girl => 'Emma' },
    { :guy => 'Asaf', :girl => 'Camille' },
    { :guy => 'Giovanni', :girl => 'Kaylen' }, #
    { :guy => 'John', :girl => 'Nicole' }	
  ],
	:lights => 3,
  :episode => 2
)

S4.addTruth(:guy => 'Cameron', :girl => 'Mikala', :truth => :PERFECT_MATCH, :episode => 3)
S4.addCeremony(
	:pairs => [
    { :guy => 'Morgan', :girl => 'Francesca' },
    { :guy => 'Asaf', :girl => 'Camille' },
    { :guy => 'Cam', :girl => 'Nicole' },
    { :guy => 'Stephen', :girl => 'Tori' }, 
    { :guy => 'John', :girl => 'Victoria' },
    { :guy => 'Prosper', :girl => 'Emma' },
    { :guy => 'Giovanni', :girl => 'Kaylen' },
    { :guy => 'Sam', :girl => 'Alyssa' },
    { :guy => 'Cameron', :girl => 'Mikala' }, 
    { :guy => 'Tyler', :girl => 'Julia' }	
  ],
	:lights => 4,
  :episode => 3
)

S4.addTruth(:guy => 'Asaf', :girl => 'Tori', :truth => :NO_MATCH, :episode => 4)
S4.addCeremony(
	:pairs => [
    { :guy => 'Morgan', :girl => 'Tori' },
    { :guy => 'Asaf', :girl => 'Camille' },
    { :guy => 'Cam', :girl => 'Emma' },
    { :guy => 'Stephen', :girl => 'Julia' }, 
    { :guy => 'John', :girl => 'Victoria' },
    { :guy => 'Prosper', :girl => 'Nicole' },
    { :guy => 'Giovanni', :girl => 'Kaylen' },
    { :guy => 'Sam', :girl => 'Alyssa' },
    { :guy => 'Cameron', :girl => 'Mikala' }, 
    { :guy => 'Tyler', :girl => 'Francesca' }	
  ],
	:lights => 4,
  :episode => 4
)

S4.addTruth(:guy => 'Giovanni', :girl => 'Kaylen', :truth => :NO_MATCH, :episode => 5)
S4.addCeremony(
	:pairs => [
    { :guy => 'John', :girl => 'Tori' },
    { :guy => 'Asaf', :girl => 'Camille' },
    { :guy => 'Cam', :girl => 'Emma' },
    { :guy => 'Morgan', :girl => 'Julia' }, 
    { :guy => 'Prosper', :girl => 'Victoria' },
    { :guy => 'Stephen', :girl => 'Nicole' },
    { :guy => 'Tyler', :girl => 'Kaylen' },
    { :guy => 'Sam', :girl => 'Alyssa' },
    { :guy => 'Cameron', :girl => 'Mikala' }, 
    { :guy => 'Giovanni', :girl => 'Francesca' }	
  ],
	:lights => 4,
  :episode => 5
)

S4.addTruth(:guy => 'Sam', :girl => 'Alyssa', :truth => :PERFECT_MATCH, :episode => 6)
S4.addCeremony(
	:pairs => [
    { :guy => 'John', :girl => 'Emma' },
    { :guy => 'Asaf', :girl => 'Camille' },
    { :guy => 'Cam', :girl => 'Victoria' },
    { :guy => 'Morgan', :girl => 'Tori' }, 
    { :guy => 'Prosper', :girl => 'Kaylen' },
    { :guy => 'Stephen', :girl => 'Julia' },
    { :guy => 'Tyler', :girl => 'Nicole' },
    { :guy => 'Sam', :girl => 'Alyssa' },
    { :guy => 'Cameron', :girl => 'Mikala' }, 
    { :guy => 'Giovanni', :girl => 'Francesca' }	
  ],
	:lights => 4,
  :episode => 6
)

S4.addTruth(:guy => 'Cam', :girl => 'Victoria', :truth => :NO_MATCH, :episode => 7)
S4.addCeremony(
	:pairs => [
    { :guy => 'Giovanni', :girl => 'Emma' },
    { :guy => 'Tyler', :girl => 'Camille' },
    { :guy => 'Prosper', :girl => 'Victoria' },
    { :guy => 'Morgan', :girl => 'Tori' }, 
    { :guy => 'John', :girl => 'Kaylen' },
    { :guy => 'Stephen', :girl => 'Julia' },
    { :guy => 'Cam', :girl => 'Nicole' },
    { :guy => 'Sam', :girl => 'Alyssa' },
    { :guy => 'Cameron', :girl => 'Mikala' }, 
    { :guy => 'Asaf', :girl => 'Francesca' }	
  ],
	:lights => 4,
  :episode => 7
)