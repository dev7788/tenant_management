class User < ApplicationRecord

  enum role: [:user, :admin]
  enum state: [:active, :suspend]

  after_initialize :set_default_role, :if => :new_record?
  after_initialize :set_default_state, :if => :new_record?

  has_many :origin_user_links, class_name: "UserLink", foreign_key: :link_user_id

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

  devise :omniauthable, :omniauth_providers => [:saml]

  def self.find_for_saml_oauth(auth, signed_in_resource=nil)
    uid = ''
    auth.extra.raw_info.each do |key, val|
      uid = val[0]
      break
    end
    # user = User.where(:provider => auth.provider, :uid => auth.uid).first
    user = User.where(:provider => auth.provider, :uid => uid).first

    name = auth.info.name || 'no name'
    email = auth.info.email || Faker::Internet.email

    unless user
      user = User.create(name: name,
                         provider:auth.provider,
                         uid:uid,
                         email:email,
                         password:Devise.friendly_token[0,20]
      )
    end
    user
  end


end
