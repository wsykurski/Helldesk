require 'digest/sha2'

class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :password, :confirmation => true,
            :length => { minimum: 6}
  validates :password_confirmation, :presence => true, :on => :create
  attr_accessor :password_confirmation
  attr_reader :password
  validate :password_must_be_present
  has_many :note

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "slowo" + salt)
  end

  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hash_password = self.class.encrypt_password(password, self.salt)
    end
  end

  def User.authenticate(name, password)
    if user = User.find_by_name(name)
      if user.hash_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def admin?
    return self.admin == true
  end


  private

  def password_must_be_present
    errors.add(:password, "Missing password") unless hash_password.present?
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

end
