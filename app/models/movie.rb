class Movie < ActiveRecord::Base

  @@ratings_list = ['G','PG','PG-13','R']

  def self.ratings_list
    return @@ratings_list
  end

end
