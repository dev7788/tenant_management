class User < ApplicationRecord

  enum role: [:user, :admin]
  enum state: [:active, :suspend]

  after_initialize :set_default_role, :if => :new_record?
  after_initialize :set_default_state, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def set_default_state
    self.state ||= :active
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable, :invite_for => 2.weeks

  has_many :origin_user_links, class_name: "UserLink", foreign_key: :link_user_id
end
