class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable
  enum role: [:volunteer, :standard, :admin]

  after_initialize :set_default_role, :if => :new_record?

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles

  def name
  	return "#{self.first_name} #{self.last_name}"
  end

  def set_default_role
  	self.role ||= :volunteer
  end


end
