class User < ActiveRecord::Base
  has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators
  before_create :set_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [ :standard, :admin, :premium ]

  private
  def set_role
    self.role = "standard" unless self.role
  end
end
