# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

def can_be_instantiated_and_then_saved
  movie = Movie.new     #___
  movie.title = "This is a title."
  movie.save          #__ # undefined method `save' for #<Class:0x00007f983cbb4b18>
end

def can_be_created_with_a_hash_of_attributes
  # Initialize movie and then and save it
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  #movie = __
  movie = Movie.new(attributes)
  movie.save
  movie
end

def can_be_created_in_a_block(title: "Home Alone", release_date: 1990)
  #( args = ([{:title => "Home Alone"}, {:release_date => 1990}])) #__ in args
  # If no arguments are passed, use default values:
  # title == "Home Alone"
  # release_date == 1990
  
  Movie.create do |m|     
    #__
    # m.string :title     #need to add column, not create new tablE? 
    # m.integer :release_date
    # add_column :movies, :title, :string
    # add_column :movies, :release_date, :integer   #undefined method `add_column' 
    #m.title = title:   # :title => set title var = "title". /   undefined local variable or method `title'
    #m.release_date = release_date:  # NO literally set it = to [:release_date]
    # m.title = title
    # m.release_date = release_date
    # m.each do |key, val| self.send(("#{key}="), val)    #undefined method `each' for #<Movie:0x00007fa0c4ba0448>
    # m.title = [:title]
    # m.title = args[:title]
    # m.release_date = args[:release_date]
    # args.each{ |key, val| self.send(("#{key}="), val) } # undefined method `{:title=>"Home Alone"}=,  undefined method `title='
    m.title = title
    m.release_date = release_date
      #binding.pry
      #  INSERT INTO "movies" ("title", "release_date") VALUES (?, ?)  [["title", "The Room"], ["release_date", 2003]]
    #end
  end 
end

def can_get_the_first_item_in_the_database
  Movie.first
end

def can_get_the_last_item_in_the_database
  Movie.last
end

def can_get_size_of_the_database
  Movie.count 
end

def can_find_the_first_item_from_the_database_using_id
  #Movie.first.find_by(id: id.first)
   # `id` is not available from within an example (e.g. an `it` block) 
   # or from constructs that run in the scope of an example (e.g. `before`, `let`, etc). 
   # It is only available on an example group (e.g. a `describe` or `context` block).
   Movie.first
end

def can_find_by_multiple_attributes
  # Search Values:
  # title == "Title"
  # release_date == 2000
  # director == "Me"
  # __

  #Movie.where("title = ? AND release_date = ? AND director = ?", params[:title], [:release_date], [:director])
  # undefined local variable or method `params'
  #Movie.where("title = ? AND release_date = ? AND director = ?", params[:title, :release_date, :director])
  #Movie.where("title = ? AND release_date = ? AND director = ?", [:title, :release_date, :director])
  # ^  wrong number of bind vaoriables (1 for 3) in: title = ? AND release_date = ? AND director = ?
  # Movie.where("title = ? AND release_date = ? AND director = ?", :title, :release_date, :director) # got []
  # Movie.where("title = ? AND release_date = ? AND director = ?", [:title], [:release_date], [:director])
  # Movie.where("title = ? AND release_date = ? AND director = ?", title:, release_date:, director:)
  # Movie.where("title = ? AND release_date = ? AND director = ?", params[title:, release_date:, director:]) #  unexpected ','
  # Movie.where("title = ? AND release_date = ? AND director = ?", title: params[:title], release_date: params[:release_date], director: params[:director]) #   wrong number of bind variables (1 for 3)
  # ^ Now, "params" is undefined.. 
  # Movie.find(:conditions=>["title = ? AND release_date = ? AND director = ?", params[:title], params[:release_date], params[:director]] )
  Movie.where(title: "Title",  release_date: 2000, director: "Me")[0]

end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by 
  # release date descending
  # __

  #Client.where("released_after >= :release_date DESC"),  {released_after: params[:release_date]=2002}
  #Movie.where("released_after >= :release_date DESC", [:release_date = 2002] ) # ERROR
  #Movie.where("released_after >= ? DESC", params[2002] )
  #Movie.where("released_after >= ? DESC", 2002 )
  Movie.where("release_date > 2002").order(release_date: :desc) # w >= got: ["Movie_4", "Movie_3", "Movie_2"]

  #users = User.where(name: 'David', occupation: 'Code Artist').order(created_at: :desc)

end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick", save it, then return it
  Movie.create(title: "Awesome Flick")
  # __
  # __
  # __
  moviea = Movie.find_by(title: "Awesome Flick")
  moviea.title = "Even Awesomer Flick"
  moviea.save

end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  # __
  # __
  moviea = Movie.find_by(title: "Wat?")
  moviea.update(title: "Wat, huh?")


end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  Movie.update_all(title: "A Movie")  #__
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  b = Movie.find_by(title:"That One Where the Guy Kicks Another Guy Once") #__
  b.destroy #__
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.destroy_all  #__
end