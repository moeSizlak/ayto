

class Integer
  def factorial
    (1..self).reduce(:*) || 1
  end
end


class Ceremony
	attr_accessor :pairs
	attr_accessor :lights
  attr_accessor :episode

	def initialize(pairs, lights, episode)
		@pairs = pairs
		@lights = lights	
    @episode = episode
	end	
end

class Truth
  attr_accessor :guy
  attr_accessor :girl
  attr_accessor :truth
  attr_accessor :episode
  
  def initialize(guy, girl, truth, episode)
    @guy = guy
    @girl = girl
    @truth = truth 
    @episode = episode
  end
end

class Ayto
	def initialize(arg = {})
		raise ArgumentError, "Invalid arguments to initialize AYTO.  Need 2 arrays of 10 unique strings each." unless
			arg[:guys].kind_of?(Array) && 
      arg[:girls].kind_of?(Array) && 
			arg[:guys].length == arg[:girls].length &&
			arg[:guys].uniq.length == arg[:guys].length && 
      arg[:girls].uniq.length == arg[:girls].length &&
			(arg[:guys]+arg[:girls]).uniq.length == (arg[:guys]+arg[:girls]).length

    @cardinality = arg[:guys].length
		@guys = arg[:guys]
    @girls = arg[:girls]	
    @truths = []
    @ceremonies = []		
	end	
	
	def addTruth(arg = {})
		raise ArgumentError, "Invalid arguments passed to addTruth." unless 
			@guys.include?(arg[:guy]) && 
			@girls.include?(arg[:girl]) && 
			(arg[:truth] == :NO_MATCH || arg[:truth] == :PERFECT_MATCH) &&
      arg[:episode].is_a?(Numeric)
      
    @truths.push(Truth.new(arg[:guy], arg[:girl], arg[:truth], arg[:episode]))		
	end
	
	def addCeremony(arg = {})
    raise ArgumentError, "Invalid arguments passed to addCeremony. (E1)" unless 
      arg[:pairs].kind_of?(Array)
    raise ArgumentError, "Invalid arguments passed to addCeremony. (E2)" unless 
      arg[:pairs].count == @cardinality
    raise ArgumentError, "Invalid arguments passed to addCeremony. (E3)" unless 
      arg[:lights].is_a?(Integer)
    raise ArgumentError, "Invalid arguments passed to addCeremony. (E4)" unless 
      arg[:lights].between?(0,@cardinality)
    raise ArgumentError, "Invalid arguments passed to addCeremony. (E5)" unless 
      arg[:episode].is_a?(Numeric)
    raise ArgumentError, "Invalid arguments passed to addCeremony. (E6)" unless   
      (arg[:pairs].map{|x| x[:guy]} & @guys).count == @cardinality
    raise ArgumentError, "Invalid arguments passed to addCeremony. (E7)" unless 
      (arg[:pairs].map{|x| x[:girl]} & @girls).count == @cardinality
    
		@ceremonies.push(Ceremony.new(arg[:pairs], arg[:lights], arg[:episode]))
	end
	
  def getResults(arg = {})
    raise ArgumentError, "Invalid arguments passed to getResults: :episode must be numeric" unless 
      !arg.key?(:episode) || arg[:episode].is_a?(Numeric)
      
    if !arg.key?(:episode)
      arg[:episode] = Float::INFINITY
    end

    total = 0

    counts = Array.new(@cardinality * @cardinality).fill(0)
        
    matches = @truths.select{|x| x.truth == :PERFECT_MATCH && x.episode <= arg[:episode]}.map{|x| [@guys.index(x.guy), @girls.index(x.girl)]}
    leftMatches = matches.map{|x| x[0]}
    rightMatches = matches.map{|x| x[1]}
    matchesLength = matches.length
    
    nonmatches = @truths.select{|x| x.truth == :NO_MATCH && x.episode <= arg[:episode]}.map{|x| [@guys.index(x.guy), @girls.index(x.girl)]}
    leftNonmatches = nonmatches.map{|x| x[0]}
    rightNonmatches = nonmatches.map{|x| x[1]}
    nonmatchesLength = nonmatches.length
    
    lights = @ceremonies.select{|x| x.episode <= arg[:episode]}.map{|x| x.lights}
    ceremonies = @ceremonies.select{|c| c.episode <= arg[:episode]}.map{|c| c.pairs.sort_by{|s| @guys.index(s[:guy])}.map{|p| @girls.index(p[:girl])}}
    ceremonies = ceremonies.reduce(:+)
    ceremoniesLength = lights.length 
    
    permuted = Array.new(@cardinality)
    elements = Array.new(@cardinality)    
    identityPermutation = (0...@cardinality).to_a
    
    identityPermutation.permutation.each do |permuted|
      
      valid = true
      
      # Verify the matches
      (0...matchesLength).each do |i|
        if permuted[leftMatches[i]] != rightMatches[i]
          valid = false
          break
        end
      end
      
      next if !valid

      # Verify the nonmatches
      (0...nonmatchesLength).each do |i|
        if permuted[leftNonmatches[i]] == rightNonmatches[i]
          valid = false
          break
        end
      end
      
      next if !valid

      # Verify the matching ceremonies
      (0...ceremoniesLength).each do |i|
        correct = 0
        (0...@cardinality).each do |j|
          if permuted[j] == ceremonies[i * @cardinality + j]
            correct += 1 
          end
        end
        
        if correct != lights[i]
          valid = false
          break
        end
      end
      
      next if !valid
      
      # Record the result
      total += 1
      (0...@cardinality).each do |i|
        counts[i * @cardinality + permuted[i]] += 1
      end    
    end
    
    results = Array.new(@cardinality){Array.new(@cardinality)}
    
    (0...@cardinality).each do |x|
      (0...@cardinality).each do |y|
        results[x][y] = counts[x * @cardinality + y]
      end
    end
    
    
    return {:total => total, :results => results}
  
  end
  
  def printResults(arg = {})
    results = getResults(arg)
    
    puts "#{results[:total].to_s.reverse.gsub(/...(?=.)/,'\&,').reverse} possibilities remain.\n\n"

    w = (@guys+@girls).max_by do |e|
      e.length
    end
    w = w.length
    w = 6 if w < 6
    
    header = ' ' * w       
    (0...@cardinality).each do |x|
      header << '|' + sprintf("%#{w}s", @guys[x]) 
    end
    
    header << "\n" + ('-' * w)
    (0...@cardinality).each do |x|
      header << '+' + sprintf("%#{w}s", ('-' * w))
    end
    
    header << "\n"
    
    (0...@cardinality).each do |y|
      header << sprintf("%#{w}s", @girls[y])       
      (0...@cardinality).each do |x|
        header << '|' + sprintf("%#{w}.1f", (100.0 * results[:results][x][y].to_f)/results[:total]) 
      end
      
      header << "\n" + ('-' * w)
      (0...@cardinality).each do |x|
        header << '+' + sprintf("%#{w}s", ('-' * w))
      end
      
      header << "\n"
    end
    
    puts header
  end
  

end



require './season5.rb'

puts S5.printResults()



























