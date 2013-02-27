# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  has_many :recipes, dependent: :destroy
  has_many :ingredients, :through=> :recipes
  has_many :steps, :through=> :recipes
  before_save { |user| user.email = email.downcase }
  before_create {create_remember_token(:remember_token)} 

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, unless: Proc.new { |user| user.password.nil? }
  validates :password_confirmation, presence: true, unless: Proc.new { |user| user.password.nil? }

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Recipe.where("user_id = ?", id)
  end
  
  def send_password_reset
    create_remember_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end 
  
  def create_remember_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
