class User < ActiveRecord::Base
  attr_accessible :name, :displayname, :email

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,        :presence => true,
                          :length => { :minimum => 4, :maximum => 16 }
  validates :displayname, :presence => true,
                          :length => { :minimum => 4, :maximum => 16 }
  validates :email,       :presence => true,
                          :format   => { :with => email_regex },
                          :uniqueness => { :case_sensitive => false }

end
