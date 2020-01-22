# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0
  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
  i += 1
  end
  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point
=begin
  # GOAL:   For each Hash in Array (movies_collection), provide collection of movies and directors name to movie_with_director_name method, accumulate returned Array of movies into new Array that's returned by this method.
  
  # INPUT:   name: A director's name, movies_collection: An Array of Hashes where each Hash represents a movie
  
  # RETURN: Array of Hashes where each Hash represents a movie; however, they should all have a :director_name key. This addition can be done via movie_with_director_name method
=end
 
def movies_with_director_key(name, movies_collection) 
aoh = []
i = 0
  while i < movies_collection.length do
    aoh << movie_with_director_name(name, movies_collection[i])
  i += 1
  end
  aoh
end

=begin
  # GOAL: Given an Array of Hashes where each Hash represents a movie, return a Hash that includes the total worldwide_gross of all the movies from each studio.
  
  # INPUT: collection: Array of Hashes where each Hash represents a movie
  
  # RETURN: Hash whose keys are the studio names and whose values are the sum total of all the worldwide_gross numbers for every movie in the input Hash
=end
 
def gross_per_studio(collection) 
  result = {}
  index = 0

  while index < collection.length do
  hash = {}
  i = 0 
  while i < collection.length do 
    if !hash[collection[i][:studio]]
      hash[collection[i][:studio]] = collection[i][:worldwide_gross] 
    else
      hash[collection[i][:studio]] += collection[i][:worldwide_gross]
    end
  i += 1 
  end
  hash
end

=begin
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  
  # INPUT: source: An Array of Hashes containing director info including :name and :movies
  
  # RETURN: AoA's containing all of a director's movies. Each movie will need to have a :director_name key added to it.
=end

def movies_with_directors_set(source)
  result = []
  i = 0 
  while i < source.length do 
    dir_name = source[i][:name]
    dir_movies = source[i][:movies]
    result << movies_with_director_key(dir_name, dir_movies)
  i += 1 
  end
  return result  
end

# ----------------    End of Your Code Region-------------------
# Don't edit the following code! Make the methods above work with this method call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
