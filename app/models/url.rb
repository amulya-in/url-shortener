class Url < ApplicationRecord
  belongs_to :user
  validates :original, presence: true
  before_create :generate_key
  UNIQUE_KEY_LENGTH = 6

  private
    def generate_key
      chars = ('a'..'z').to_a + (0..9).to_a
      begin
        unique_key = ([nil]*UNIQUE_KEY_LENGTH).
                     map {|char| chars[rand(chars.length - 1)]}.join
        self.key = unique_key             
      end while self.class.exists?(key: unique_key) 
    end 
end
