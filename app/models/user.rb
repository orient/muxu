# coding: utf-8
require 'digest/sha1'

class User < ActiveRecord::Base

include Paperclip
	has_attached_file :photo, :styles =>{:medium=>"160x160>", :thumb =>"80x80>"}
	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than =>3.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png','image/gif']

	has_many :comments
	has_many :objs, :through=>:comments
	
	validates_presence_of :nickname
	validates_presence_of :email
	validates_uniqueness_of :nickname
	validates_uniqueness_of :email
	
	attr_accessor :password_confirmation
	validates_confirmation_of :password
	
	validate :password_non_blank

def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
  
  
  # 'password' is a virtual attribute
  
  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
  

private

  def password_non_blank
    errors.add(:password, "密码为空") if hashed_password.blank?
  end

  
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
  
  
  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
		
	

end
