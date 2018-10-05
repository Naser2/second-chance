class Viewer
  attr_accessor :username

  @@all = []

  def initialize(username)
    @username = username
    @@all << self
    # self.class.all << self
  end

  def self.all
    @@all
  end

  def queue_items
    QueueItem.all.select do |queue|
         queue.viewer == self
    end
  end

  def queue_movies
    queue_items.map do |queue|
      queue.movie
    end
  end

  def add_movie_to_queue(movie)
    QueueItem.new(self, movie)
  end

  def rate_movie(movie, rating)
    if self.queue_movies.include?(movie)
        self.queue_items.map do |queue|
          queue.rating = rating
        end
    else
      QueueItem.new(self, movie, rating)
    end
  end


  # bottom
end```
```class QueueItem
attr_accessor :viewer, :movie, :rating

@@all =[]

  def initialize(viewer, movie, rating=nil)
    @viewer = viewer
    @movie = movie
    @rating = rating
    @@all << self
  end

def self.all
  @@all
end

end```
```class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    @title = title
    self.class.all << self
  end

  def self.all
    @@all
  end

  def queue_items
    QueueItem.all.select do |queue|
         queue.movie == self
    end
  end

 def viewers
   queue_items.map do |queue|
     queue.viewer
   end
 end

 def average_rating
   ratings = queue_items.rating.select do |rating|
     rating != nil
   end
    ratings_sum = qnum.inject(0, :+)
    rating_avg = ratings_sum/ratings.length
    rating_avg
 end

def self.highest_rated
 ratings = queue_items.rating.select do |rating|
   rating != nil
 end




end
