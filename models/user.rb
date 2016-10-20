require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password, String

  @user_count = 0

  class << self
    attr_reader :user_count
  end

  def self.increase
    @user_count += 1
  end
end
