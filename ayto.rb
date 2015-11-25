NUM_GUYS = 10
UNKNOWN_MATCH = 0
NO_MATCH = 1
PERFECT_MATCH = 2



class Matchup
	attr_accessor :matches
	attr_accessor :count

	def initialize(matches, count)
		@matches = matches
		@count = count		
	end
	
end


class Ayto
	def initialize(guys, girls)
		raise ArgumentError, "Invalid arguments to initialize AYTO.  Need 2 arrays of 10 strings each." unless
			guys.kind_of?(Array) && girls.kind_of?(Array) && 
			guys.length == NUM_GUYS && girls.length == NUM_GUYS && 
			guys.uniq.length == NUM_GUYS && girls.uniq.length == NUM_GUYS &&
			(guys+girls).uniq.length == NUM_GUYS * 2

		@guys = guys
		@girls = girls		
		@relationships = {}
		@matchups = []
		@minmatchups = []	
		@permutations = nil

		
		@guys.each do |guy|
			@relationships[guy] = {}
			@girls.each do |girl|
				@relationships[guy][girl] = UNKNOWN_MATCH
			end
		end	
	end	
	
	def addTruth(guy, girl, truth)
		raise ArgumentError, "Invalid arguments passed to addTruth." unless 
			!@relationships[guy].nil? && 
			!@relationships[guy][girl].nil? && 
			@relationships[guy][girl].kind_of?(Integer) && 
			(truth == NO_MATCH || truth == PERFECT_MATCH)
			
		if @relationships[guy][girl] != UNKNOWN_MATCH && @relationships[guy][girl] != truth
			raise ArgumentError, "ERROR: cannot addTruth() because these 2 players are already a no match or perfect match."
		else
			@relationships[guy][girl] = truth
			if truth == PERFECT_MATCH
				@girls.each do |x|
					raise ArgumentError, "ERROR: cannot addTruth() becasue guy already has a perfect match" if ![UNKNOWN_MATCH, NO_MATCH].include?(@relationships[guy][x]) unless x == girl
					@relationships[guy][x] = NO_MATCH unless x == girl
				end
				@guys.each do |x|
					raise ArgumentError, "ERROR: cannot addTruth() becasue girl already has a perfect match" if ![UNKNOWN_MATCH, NO_MATCH].include?(@relationships[x][girl]) unless x == guy
					@relationships[x][girl] = NO_MATCH unless x == guy
				end
			end
		end
	end
	
	def addMatchup(matches, count)
		isvalid = 0;
		if matches.kind_of?(Hash) && count.is_a?(Integer)
			isvalid = 2;
			guys = matches.keys
			girls = matches.values
			guys.uniq!
			girls.uniq!	
			if guys.length == girls.length && guys.length == matches.length && count <= matches.length && count >= 0 && (guys-@guys).empty? && (girls-@girls).empty?
				isvalid = 3;
				if (guys+girls).uniq.length == NUM_GUYS * 2
					isvalid = 1
				end
			end		
		end
	
		raise ArgumentError, "ERROR: cannot addMatchup, error encountered. (#{guys.length}, #{girls.length}, #{matches.length}, #{count}, #{(guys-@guys).empty?}, #{(girls-@girls).empty?})" if isvalid != 1
		
		if count == 0
			matches.each do |guy,  girl|
				addTruth(guy, girl, NO_MATCH)
			end
		end
		
		if count == matches.count
			matches.each do |guy,  girl|
				addTruth(guy, girl, PERFECT_MATCH)
			end
		end
			
	
		@matchups.push(Matchup.new(matches, count))
		
		newmatches = []
		matches.each do |k, v|
			newmatches.push([@guys.index(k), @girls.index(v)])
		end
		
		@minmatchups.push(Matchup.new(newmatches, count))
	end
	
	def minimizeMatchups
		@minmatchups.each do |mu|
			(mu.matches.length - 1).downto(0) do |x|
				if @relationships[@guys[mu.matches[x][0]]][@girls[mu.matches[x][1]]] == NO_MATCH
					mu.matches.delete_at(x)
				elsif @relationships[@guys[mu.matches[x][0]]][@girls[mu.matches[x][1]]] == PERFECT_MATCH
					mu.matches.delete_at(x)
					mu.count -= 1

					if mu.count == 0
						mu.matches.each_index do |y|
							addTruth(@guys[mu.matches[y][0]], @girls[mu.matches[y][1]], NO_MATCH)
						end
					end
				end
			end
		end
	end
	
	def countPossibleCombinations

		minimizeMatchups
		
		if @permutations.nil?
			@permutations = (0..NUM_GUYS-1).to_a.permutation(NUM_GUYS).to_a
		end

		(@permutations.length-1).downto(0) do |x|
			catch :nextperm do
				for a in 0..NUM_GUYS-1
					#puts "@permutations[x]=#{@permutations[x]} x=#{x} a=#{a}" if x%1000000 == 0
					if @relationships[@guys[a]][@girls[@permutations[x][a]]] == NO_MATCH
						@permutations[x] = nil
						throw :nextperm						
					end
				end
				
				@minmatchups.each do |mu|
					count = 0
					mu.matches.each do |m|
						count += 1 if @permutations[x][m[0]] ==  m[1]
						if count > mu.count
							@permutations[x] = nil
							throw :nextperm
						end
					end
					
					if count != mu.count
						@permutations[x] = nil
						throw :nextperm
					end
				end				
			end
		end

		@permutations.compact!
		return @permutations


	end
	
	
	def getPossibleCombinations
		countPossibleCombinations
		
		px = []
		
		@permutations.each do |p|
			py = {}
			p.each_index do |i|
				py[@guys[i]] = @girls[p[i]]
			end
			px.push(py)
		end
	
		px
	
	end
	
	
	def getMatrix
		xx = {}
		yy = {}
		
		@guys.each do |g|
			xx[g] = []
		end
		
		@girls.each do |g|
			yy[g] = []
		end
		
		px = getPossibleCombinations
		
		px.each do |p|
			p.each do |k,v|
				xx[k].push(v)
				xx[k].uniq!
				
				yy[v].push(k)
				yy[v].uniq!			
			end		
		end
	
		xx
	
	end
	

end

#====================================================================================

a = Ayto.new(
	['Alec','Austin','Chuck','Connor','Devin','Hunter','Mike','Nelson','Tyler','Zak'],
	['Amanda','Britni','Chelsey','Hannah','Kayla','Kiki','Cheyenne','Melanie','Rashida','Stacey']
)




a.addTruth('Hunter', 'Kiki', NO_MATCH)

a.addMatchup(
	{ 
		'Alec' => 'Stacey',
		'Austin' => 'Kiki',
		'Chuck' => 'Hannah',
		'Connor' => 'Chelsey',
		'Devin' => 'Melanie',
		'Hunter' => 'Britni',
		'Mike' => 'Amanda',
		'Nelson' => 'Cheyenne',
		'Tyler' => 'Rashida',
		'Zak' => 'Kayla'	
	},
	2
)

a.addTruth('Devin', 'Kiki', NO_MATCH)

a.addMatchup(
	{ 
		'Alec' => 'Chelsey',
		'Austin' => 'Kiki',
		'Chuck' => 'Hannah',
		'Connor' => 'Kayla',
		'Devin' => 'Melanie',
		'Hunter' => 'Stacey',
		'Mike' => 'Amanda',
		'Nelson' => 'Cheyenne',
		'Tyler' => 'Rashida',
		'Zak' => 'Britni'	
	},
	0
	
)

a.addTruth('Zak', 'Kiki', NO_MATCH)

a.addMatchup(
	{ 
		'Alec' => 'Stacey',
		'Austin' => 'Amanda',
		'Chuck' => 'Kiki',
		'Connor' => 'Chelsey',
		'Devin' => 'Rashida',
		'Hunter' => 'Britni',
		'Mike' => 'Kayla',
		'Nelson' => 'Melanie',
		'Tyler' => 'Cheyenne',
		'Zak' => 'Hannah'	
	},
	3
)

a.addTruth('Chuck', 'Britni', NO_MATCH)

a.addMatchup(
	{ 
		'Alec' => 'Amanda',
		'Austin' => 'Stacey',
		'Chuck' => 'Kiki',
		'Connor' => 'Chelsey',
		'Devin' => 'Hannah',
		'Hunter' => 'Rashida',
		'Mike' => 'Kayla',
		'Nelson' => 'Britni',
		'Tyler' => 'Melanie',
		'Zak' => 'Cheyenne'	
	},
	2
)

a.addTruth('Connor', 'Chelsey', PERFECT_MATCH)

a.addMatchup(
	{ 
		'Alec' => 'Stacey',
		'Austin' => 'Hannah',
		'Chuck' => 'Kiki',
		'Connor' => 'Chelsey',
		'Devin' => 'Cheyenne',
		'Hunter' => 'Melanie',
		'Mike' => 'Britni',
		'Nelson' => 'Rashida',
		'Tyler' => 'Amanda',
		'Zak' => 'Kayla'	
	},
	2
)

a.addTruth('Chuck', 'Kiki', NO_MATCH)

a.addMatchup(
	{ 
		'Alec' => 'Stacey',
		'Austin' => 'Cheyenne',
		'Chuck' => 'Amanda',
		'Connor' => 'Chelsey',
		'Devin' => 'Rashida',
		'Hunter' => 'Britni',
		'Mike' => 'Melanie',
		'Nelson' => 'Kiki',
		'Tyler' => 'Hannah',
		'Zak' => 'Kayla'	
	},
	3
)

a.addTruth('Alec', 'Melanie', NO_MATCH)

a.addMatchup(
	{ 
		'Alec' => 'Rashida',
		'Austin' => 'Kayla',
		'Chuck' => 'Melanie',
		'Connor' => 'Chelsey',
		'Devin' => 'Britni',
		'Hunter' => 'Amanda',
		'Mike' => 'Stacey',
		'Nelson' => 'Kiki',
		'Tyler' => 'Cheyenne',
		'Zak' => 'Hannah'	
	},
	3
)

a.addTruth('Nelson', 'Kiki', NO_MATCH)

a.addMatchup(
	{ 
		'Alec' => 'Stacey',
		'Austin' => 'Kiki',
		'Chuck' => 'Amanda',
		'Connor' => 'Chelsey',
		'Devin' => 'Rashida',
		'Hunter' => 'Britni',
		'Mike' => 'Melanie',
		'Nelson' => 'Kayla',
		'Tyler' => 'Cheyenne',
		'Zak' => 'Hannah'	
	},
	3
)

a.addTruth('Hunter', 'Britni', NO_MATCH)

a.addMatchup(
	{ 
		'Alec' => 'Stacey',
		'Austin' => 'Cheyenne',
		'Chuck' => 'Rashida',
		'Connor' => 'Chelsey',
		'Devin' => 'Britni',
		'Hunter' => 'Kayla',
		'Mike' => 'Kiki',
		'Nelson' => 'Amanda',
		'Tyler' => 'Melanie',
		'Zak' => 'Hannah'	
	},
	2
)

a.addTruth('Zak', 'Kayla', PERFECT_MATCH)

puts a.countPossibleCombinations.length

t = a.getPossibleCombinations

t.each do |z|
	z.each do |k,v|
		puts k + ' => ' + v
	end
	puts ""
	puts ""
end

xx = a.getMatrix
puts xx.inspect









=begin
b = Ayto.new(['Adam', 'Dre', 'Scali', 'Chris', 'Dillan', 'Ethan', 'Joey', 'John', 'Ryan', 'Wesley'], ['Amber', 'Ashleigh', 'Brittany', 'Coleysia', 'Jacy', 'Jessica', 'Kayla', 'Paige', 'Shanley', 'Simone']);

b.addTruth('Chris', 'Shanley', NO_MATCH)
b.addMatchup(
	{ 
		'Adam' => 'Brittany',
		'Dillan' => 'Coleysia',
		'Joey' => 'Paige',
		'John' => 'Simone',
		'Wesley' => 'Kayla',
		'Ethan' => 'Shanley',
		'Chris' => 'Jessica',
		'Dre' => 'Jacy',
		'Scali' => 'Ashleigh',
		'Ryan' => 'Amber'
	},
	2
)
b.addTruth('Ethan', 'Jessica', NO_MATCH)
b.addMatchup(
	{ 
		'Adam' => 'Shanley',
		'Dillan' => 'Jessica',
		'Wesley' => 'Coleysia',
		'Ethan' => 'Amber',
		'Chris' => 'Paige',
		'John' => 'Jacy',
		'Scali' => 'Simone',
		'Dre' => 'Ashleigh',
		'Ryan' => 'Kayla',
		'Joey' => 'Brittany'
	},
	4
)
b.addTruth('John', 'Simone', NO_MATCH)
b.addMatchup(
	{ 
		'Adam' => 'Brittany',
		'John' => 'Jessica',
		'Ryan' => 'Kayla',
		'Scali' => 'Paige',
		'Wesley' => 'Jacy',
		'Ethan' => 'Amber',
		'Joey' => 'Shanley',
		'Dillan' => 'Coleysia',
		'Chris' => 'Simone',
		'Dre' => 'Ashleigh'
	},
	2
)
b.addTruth('Dillan', 'Jessica', NO_MATCH)
b.addMatchup(
	{ 
		'Adam' => 'Amber',
		'Wesley' => 'Jessica',
		'Dre' => 'Simone',
		'Joey' => 'Jacy',
		'Chris' => 'Ashleigh',
		'Ryan' => 'Brittany',
		'Scali' => 'Paige',
		'John' => 'Shanley',
		'Dillan' => 'Coleysia',
		'Ethan' => 'Kayla'
	},
	2
)
b.addTruth('Dre', 'Ashleigh', NO_MATCH)
b.addTruth('Dillan', 'Coleysia', PERFECT_MATCH)
b.addMatchup(
	{ 
		'Adam' => 'Shanley',
		'Dre' => 'Brittany',
		'John' => 'Jacy',
		'Chris' => 'Paige',
		'Joey' => 'Jessica',
		'Scali' => 'Simone',
		'Dillan' => 'Coleysia',
		'Ethan' => 'Amber',
		'Ryan' => 'Ashleigh',
		'Wesley' => 'Kayla'
	},
	5
)
b.addTruth('Chris', 'Paige', PERFECT_MATCH)
b.addMatchup(
	{ 
		'Adam' => 'Ashleigh',
		'Ethan' => 'Amber',
		'Joey' => 'Simone',
		'Wesley' => 'Kayla',
		'Chris' => 'Paige',
		'John' => 'Jacy',
		'Dre' => 'Shanley',
		'Scali' => 'Brittany',
		'Dillan' => 'Coleysia',
		'Ryan' => 'Jessica'
	},
	5
)
b.addTruth('Ryan', 'Kayla', NO_MATCH)
b.addMatchup(
	{ 
		'Adam' => 'Shanley',
		'Ethan' => 'Amber',
		'Scali' => 'Jacy',
		'Chris' => 'Paige',
		'Dre' => 'Simone',
		'Wesley' => 'Kayla',
		'Dillan' => 'Coleysia',
		'John' => 'Brittany',
		'Joey' => 'Jessica',
		'Ryan' => 'Ashleigh'
	},
	7
)
b.addTruth('Wes', 'Kayla', PERFECT_MATCH)
b.addMatchup(
	{ 
		'Adam' => 'Shanley',
		'Chris' => 'Paige',
		'Joey' => 'Brittany',
		'Ryan' => 'Jessica',
		'Ethan' => 'Amber',
		'Scali' => 'Ashleigh',
		'Dre' => 'Simone',
		'Dillan' => 'Coleysia',
		'John' => 'Jacy',
		'Wesley' => 'Kayla'
	},
	8
)
b.addTruth('John', 'Jacy', NO_MATCH)
b.addMatchup(
	{ 
		'Adam' => 'Shanley',
		'Chris' => 'Paige',
		'Ryan' => 'Jessica',
		'Scali' => 'Jacy',
		'Dre' => 'Simone',
		'John' => 'Ashleigh',
		'Dillan' => 'Coleysia',
		'Joey' => 'Brittany',
		'Ethan' => 'Amber',
		'Wesley' => 'Kayla'
	},
	10
)
=end


























