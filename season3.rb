S3 = Ayto.new(
	:guys => ['Alec','Austin','Chuck','Connor','Devin','Hunter','Mike','Nelson','Tyler','Zak'],
	:girls => ['Amanda','Britni','Chelsey','Hannah','Kayla','Kiki','Cheyenne','Melanie','Rashida','Stacey']
)

S3.addTruth(:guy => 'Hunter', :girl => 'Kiki', :truth => :NO_MATCH, :episode => 1)
S3.addCeremony(
	:pairs => [ 
		{ :guy => 'Alec', :girl => 'Stacey' },
		{ :guy => 'Austin', :girl => 'Kiki' },
		{ :guy => 'Chuck', :girl => 'Hannah' },
		{ :guy => 'Connor', :girl => 'Chelsey' },
		{ :guy => 'Devin', :girl => 'Melanie' },
		{ :guy => 'Hunter', :girl => 'Britni' },
		{ :guy => 'Mike', :girl => 'Amanda' },
		{ :guy => 'Nelson', :girl => 'Cheyenne' },
		{ :guy => 'Tyler', :girl => 'Rashida' },
		{ :guy => 'Zak', :girl => 'Kayla' }	
	],
	:lights => 2,
	:episode => 1
)

S3.addTruth(:guy => 'Devin', :girl => 'Kiki', :truth => :NO_MATCH, :episode => 2)
S3.addCeremony(
	:pairs => [ 
		{ :guy => 'Alec', :girl => 'Chelsey' },
		{ :guy => 'Austin', :girl => 'Kiki' },
		{ :guy => 'Chuck', :girl => 'Hannah' },
		{ :guy => 'Connor', :girl => 'Kayla' },
		{ :guy => 'Devin', :girl => 'Melanie' },
		{ :guy => 'Hunter', :girl => 'Stacey' },
		{ :guy => 'Mike', :girl => 'Amanda' },
		{ :guy => 'Nelson', :girl => 'Cheyenne' },
		{ :guy => 'Tyler', :girl => 'Rashida' },
		{ :guy => 'Zak', :girl => 'Britni' }	
	],
	:lights => 0,
	:episode => 2
)

S3.addTruth(:guy => 'Zak', :girl => 'Kiki', :truth => :NO_MATCH, :episode => 3)
S3.addCeremony(
	:pairs => [ 
		{ :guy => 'Alec', :girl => 'Stacey' },
		{ :guy => 'Austin', :girl => 'Amanda' },
		{ :guy => 'Chuck', :girl => 'Kiki' },
		{ :guy => 'Connor', :girl => 'Chelsey' },
		{ :guy => 'Devin', :girl => 'Rashida' },
		{ :guy => 'Hunter', :girl => 'Britni' },
		{ :guy => 'Mike', :girl => 'Kayla' },
		{ :guy => 'Nelson', :girl => 'Melanie' },
		{ :guy => 'Tyler', :girl => 'Cheyenne' },
		{ :guy => 'Zak', :girl => 'Hannah' }	
	],
	:lights => 3,
	:episode => 3
)

S3.addTruth(:guy => 'Chuck', :girl => 'Britni', :truth => :NO_MATCH, :episode => 4)
S3.addCeremony(
	:pairs => [ 
		{ :guy => 'Alec', :girl => 'Amanda' },
		{ :guy => 'Austin', :girl => 'Stacey' },
		{ :guy => 'Chuck', :girl => 'Kiki' },
		{ :guy => 'Connor', :girl => 'Chelsey' },
		{ :guy => 'Devin', :girl => 'Hannah' },
		{ :guy => 'Hunter', :girl => 'Rashida' },
		{ :guy => 'Mike', :girl => 'Kayla' },
		{ :guy => 'Nelson', :girl => 'Britni' },
		{ :guy => 'Tyler', :girl => 'Melanie' },
		{ :guy => 'Zak', :girl => 'Cheyenne' }	
	],
	:lights => 2,
	:episode => 4
)

S3.addTruth(:guy => 'Connor', :girl => 'Chelsey', :truth => :PERFECT_MATCH, :episode => 5)
S3.addCeremony(
	:pairs => [ 
		{ :guy => 'Alec', :girl => 'Stacey' },
		{ :guy => 'Austin', :girl => 'Hannah' },
		{ :guy => 'Chuck', :girl => 'Kiki' },
		{ :guy => 'Connor', :girl => 'Chelsey' },
		{ :guy => 'Devin', :girl => 'Cheyenne' },
		{ :guy => 'Hunter', :girl => 'Melanie' },
		{ :guy => 'Mike', :girl => 'Britni' },
		{ :guy => 'Nelson', :girl => 'Rashida' },
		{ :guy => 'Tyler', :girl => 'Amanda' },
		{ :guy => 'Zak', :girl => 'Kayla' }	
	],
	:lights => 2,
	:episode => 5
)

S3.addTruth(:guy => 'Chuck', :girl => 'Kiki', :truth => :NO_MATCH, :episode => 6)
S3.addCeremony(
	:pairs => [ 
		{ :guy => 'Alec', :girl => 'Stacey' },
		{ :guy => 'Austin', :girl => 'Cheyenne' },
		{ :guy => 'Chuck', :girl => 'Amanda' },
		{ :guy => 'Connor', :girl => 'Chelsey' },
		{ :guy => 'Devin', :girl => 'Rashida' },
		{ :guy => 'Hunter', :girl => 'Britni' },
		{ :guy => 'Mike', :girl => 'Melanie' },
		{ :guy => 'Nelson', :girl => 'Kiki' },
		{ :guy => 'Tyler', :girl => 'Hannah' },
		{ :guy => 'Zak', :girl => 'Kayla' }	
	],
	:lights => 3,
	:episode => 6
)

S3.addTruth(:guy => 'Alec', :girl => 'Melanie', :truth => :NO_MATCH, :episode => 7)
S3.addCeremony(
	:pairs => [ 
		{ :guy => 'Alec', :girl => 'Rashida' },
		{ :guy => 'Austin', :girl => 'Kayla' },
		{ :guy => 'Chuck', :girl => 'Melanie' },
		{ :guy => 'Connor', :girl => 'Chelsey' },
		{ :guy => 'Devin', :girl => 'Britni' },
		{ :guy => 'Hunter', :girl => 'Amanda' },
		{ :guy => 'Mike', :girl => 'Stacey' },
		{ :guy => 'Nelson', :girl => 'Kiki' },
		{ :guy => 'Tyler', :girl => 'Cheyenne' },
		{ :guy => 'Zak', :girl => 'Hannah' }	
	],
	:lights => 3,
	:episode => 7
)

S3.addTruth(:guy => 'Nelson', :girl => 'Kiki', :truth => :NO_MATCH, :episode => 8)
S3.addCeremony(
	:pairs => [ 
		{ :guy => 'Alec', :girl => 'Stacey' },
		{ :guy => 'Austin', :girl => 'Kiki' },
		{ :guy => 'Chuck', :girl => 'Amanda' },
		{ :guy => 'Connor', :girl => 'Chelsey' },
		{ :guy => 'Devin', :girl => 'Rashida' },
		{ :guy => 'Hunter', :girl => 'Britni' },
		{ :guy => 'Mike', :girl => 'Melanie' },
		{ :guy => 'Nelson', :girl => 'Kayla' },
		{ :guy => 'Tyler', :girl => 'Cheyenne' },
		{ :guy => 'Zak', :girl => 'Hannah' }	
	],
	:lights => 3,
	:episode => 8
)

S3.addTruth(:guy => 'Hunter', :girl => 'Britni', :truth => :NO_MATCH, :episode => 9)
S3.addCeremony(
	:pairs => [ 
		{ :guy => 'Alec', :girl => 'Stacey' },
		{ :guy => 'Austin', :girl => 'Cheyenne' },
		{ :guy => 'Chuck', :girl => 'Rashida' },
		{ :guy => 'Connor', :girl => 'Chelsey' },
		{ :guy => 'Devin', :girl => 'Britni' },
		{ :guy => 'Hunter', :girl => 'Kayla' },
		{ :guy => 'Mike', :girl => 'Kiki' },
		{ :guy => 'Nelson', :girl => 'Amanda' },
		{ :guy => 'Tyler', :girl => 'Melanie' },
		{ :guy => 'Zak', :girl => 'Hannah' }	
	],
	:lights => 2,
	:episode => 9
)

S3.addTruth(:guy => 'Zak', :girl => 'Kayla', :truth => :PERFECT_MATCH, :episode => 10)