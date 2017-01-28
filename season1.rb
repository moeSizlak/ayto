S1 = Ayto.new(
  :guys => ['Adam', 'Dre', 'Scali', 'Chris', 'Dillan', 'Ethan', 'Joey', 'John', 'Ryan', 'Wesley'], 
  :girls => ['Amber', 'Ashleigh', 'Brittany', 'Coleysia', 'Jacy', 'Jessica', 'Kayla', 'Paige', 'Shanley', 'Simone']
)

S1.addTruth(:guy => 'Chris', :girl => 'Shanley', :truth => :NO_MATCH, :episode => 1)
S1.addCeremony(
	:pairs => [ 
		{ :guy => 'Adam', :girl => 'Brittany' },
		{ :guy => 'Dillan', :girl => 'Coleysia' },
		{ :guy => 'Joey', :girl => 'Paige' },
		{ :guy => 'John', :girl => 'Simone' },
		{ :guy => 'Wesley', :girl => 'Kayla' },
		{ :guy => 'Ethan', :girl => 'Shanley' },
		{ :guy => 'Chris', :girl => 'Jessica' },
		{ :guy => 'Dre', :girl => 'Jacy' },
		{ :guy => 'Scali', :girl => 'Ashleigh' },
		{ :guy => 'Ryan', :girl => 'Amber' }
	],
	:lights => 2,
	:episode => 1
)

S1.addTruth(:guy => 'Ethan', :girl => 'Jessica', :truth => :NO_MATCH, :episode => 2)
S1.addCeremony(
	:pairs => [ 
		{ :guy => 'Adam', :girl => 'Shanley' },
		{ :guy => 'Dillan', :girl => 'Jessica' },
		{ :guy => 'Wesley', :girl => 'Coleysia' },
		{ :guy => 'Ethan', :girl => 'Amber' },
		{ :guy => 'Chris', :girl => 'Paige' },
		{ :guy => 'John', :girl => 'Jacy' },
		{ :guy => 'Scali', :girl => 'Simone' },
		{ :guy => 'Dre', :girl => 'Ashleigh' },
		{ :guy => 'Ryan', :girl => 'Kayla' },
		{ :guy => 'Joey', :girl => 'Brittany' }
	],
	:lights => 4,
	:episode => 2
)

S1.addTruth(:guy => 'John', :girl => 'Simone', :truth => :NO_MATCH, :episode => 3)
S1.addCeremony(
	:pairs => [ 
		{ :guy => 'Adam', :girl => 'Brittany' },
		{ :guy => 'John', :girl => 'Jessica' },
		{ :guy => 'Ryan', :girl => 'Kayla' },
		{ :guy => 'Scali', :girl => 'Paige' },
		{ :guy => 'Wesley', :girl => 'Jacy' },
		{ :guy => 'Ethan', :girl => 'Amber' },
		{ :guy => 'Joey', :girl => 'Shanley' },
		{ :guy => 'Dillan', :girl => 'Coleysia' },
		{ :guy => 'Chris', :girl => 'Simone' },
		{ :guy => 'Dre', :girl => 'Ashleigh' }
	],
	:lights => 2,
	:episode => 3
)

S1.addTruth(:guy => 'Dillan', :girl => 'Jessica', :truth => :NO_MATCH, :episode => 4)
S1.addCeremony(
	:pairs => [ 
		{ :guy => 'Adam', :girl => 'Amber' },
		{ :guy => 'Wesley', :girl => 'Jessica' },
		{ :guy => 'Dre', :girl => 'Simone' },
		{ :guy => 'Joey', :girl => 'Jacy' },
		{ :guy => 'Chris', :girl => 'Ashleigh' },
		{ :guy => 'Ryan', :girl => 'Brittany' },
		{ :guy => 'Scali', :girl => 'Paige' },
		{ :guy => 'John', :girl => 'Shanley' },
		{ :guy => 'Dillan', :girl => 'Coleysia' },
		{ :guy => 'Ethan', :girl => 'Kayla' }
	],
	:lights => 2,
	:episode => 4
)

S1.addTruth(:guy => 'Dre', :girl => 'Ashleigh', :truth => :NO_MATCH, :episode => 5)
S1.addTruth(:guy => 'Dillan', :girl => 'Coleysia', :truth => :PERFECT_MATCH, :episode => 5)
S1.addCeremony(
	:pairs => [ 
		{ :guy => 'Adam', :girl => 'Shanley' },
		{ :guy => 'Dre', :girl => 'Brittany' },
		{ :guy => 'John', :girl => 'Jacy' },
		{ :guy => 'Chris', :girl => 'Paige' },
		{ :guy => 'Joey', :girl => 'Jessica' },
		{ :guy => 'Scali', :girl => 'Simone' },
		{ :guy => 'Dillan', :girl => 'Coleysia' },
		{ :guy => 'Ethan', :girl => 'Amber' },
		{ :guy => 'Ryan', :girl => 'Ashleigh' },
		{ :guy => 'Wesley', :girl => 'Kayla' }
	],
	:lights => 5,
	:episode => 5
)

S1.addTruth(:guy => 'Chris', :girl => 'Paige', :truth => :PERFECT_MATCH, :episode => 6)
S1.addCeremony(
	:pairs => [ 
		{ :guy => 'Adam', :girl => 'Ashleigh' },
		{ :guy => 'Ethan', :girl => 'Amber' },
		{ :guy => 'Joey', :girl => 'Simone' },
		{ :guy => 'Wesley', :girl => 'Kayla' },
		{ :guy => 'Chris', :girl => 'Paige' },
		{ :guy => 'John', :girl => 'Jacy' },
		{ :guy => 'Dre', :girl => 'Shanley' },
		{ :guy => 'Scali', :girl => 'Brittany' },
		{ :guy => 'Dillan', :girl => 'Coleysia' },
		{ :guy => 'Ryan', :girl => 'Jessica' }
	],
	:lights => 5,
	:episode => 6
)

S1.addTruth(:guy => 'Ryan', :girl => 'Kayla', :truth => :NO_MATCH, :episode => 7)
S1.addCeremony(
	:pairs => [ 
		{ :guy => 'Adam', :girl => 'Shanley' },
		{ :guy => 'Ethan', :girl => 'Amber' },
		{ :guy => 'Scali', :girl => 'Jacy' },
		{ :guy => 'Chris', :girl => 'Paige' },
		{ :guy => 'Dre', :girl => 'Simone' },
		{ :guy => 'Wesley', :girl => 'Kayla' },
		{ :guy => 'Dillan', :girl => 'Coleysia' },
		{ :guy => 'John', :girl => 'Brittany' },
		{ :guy => 'Joey', :girl => 'Jessica' },
		{ :guy => 'Ryan', :girl => 'Ashleigh' }
	],
	:lights => 7,
	:episode => 7
)

S1.addTruth(:guy => 'Wes', :girl => 'Kayla', :truth => :PERFECT_MATCH, :episode => 8)
S1.addCeremony(
	:pairs => [ 
		{ :guy => 'Adam', :girl => 'Shanley' },
		{ :guy => 'Chris', :girl => 'Paige' },
		{ :guy => 'Joey', :girl => 'Brittany' },
		{ :guy => 'Ryan', :girl => 'Jessica' },
		{ :guy => 'Ethan', :girl => 'Amber' },
		{ :guy => 'Scali', :girl => 'Ashleigh' },
		{ :guy => 'Dre', :girl => 'Simone' },
		{ :guy => 'Dillan', :girl => 'Coleysia' },
		{ :guy => 'John', :girl => 'Jacy' },
		{ :guy => 'Wesley', :girl => 'Kayla' }
	],
	:lights => 8,
	:episode => 8
)

S1.addTruth(:guy => 'John', :girl => 'Jacy', :truth => :NO_MATCH, :episode => 9)
S1.addCeremony(
	:pairs => [ 
		{ :guy => 'Adam', :girl => 'Shanley' },
		{ :guy => 'Chris', :girl => 'Paige' },
		{ :guy => 'Ryan', :girl => 'Jessica' },
		{ :guy => 'Scali', :girl => 'Jacy' },
		{ :guy => 'Dre', :girl => 'Simone' },
		{ :guy => 'John', :girl => 'Ashleigh' },
		{ :guy => 'Dillan', :girl => 'Coleysia' },
		{ :guy => 'Joey', :girl => 'Brittany' },
		{ :guy => 'Ethan', :girl => 'Amber' },
		{ :guy => 'Wesley', :girl => 'Kayla' }
	],
	:lights => 10,
	:episode => 9
)