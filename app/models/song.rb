class Song < ActiveRecord::Base
    has_many :collections
    has_many :users, through: :collections


    def average_rating
        "The average rating is #{self.collections.sum(:song_rating)/self.collections.count}"
       
    end
end