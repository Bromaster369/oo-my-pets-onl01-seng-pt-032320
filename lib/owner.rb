class Owner
  
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    "I am a human."
  end
  
  def self.all 
    @@all
  end 
  
  def self.count
    @@all.length 
  end 
  
  def self.reset_all
    @@all.clear
  end
  
  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end 
  
  def buy_cat(name)
   Cat.new(name, self)
  end
  
  def buy_dog(name)
   Dog.new(name, self)
  end
  
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end 
  
  def sell_pets
  pets = self.dogs + self.cats  #selling all pets 
  pets.each do |pet|
   pet.owner = nil #remember owners are leaving home to nyc so pets are being given away to adoption/hound and will no longer have owners therefore we use nil 
   pet.mood = "nervous"

    end 
  end 
  
  def list_pets
  "I have 2 dog(s), and 2 cat(s)."
  end 

end