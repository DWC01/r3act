class User < ActiveRecord::Base
  before_create :generate_auth_token
  after_create :create_avatar
  belongs_to :company
  has_one :avatar
  
  has_secure_password
  email_regex = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates_uniqueness_of   :email
  validates_format_of       :email, with: email_regex
  validates_presence_of     :first_name, :email

  validates :password_confirmation, presence: true, on: :create
  validates :password, presence: true, on: :create, length: {minimum:6}

  def generate_auth_token
    self.auth_token = SecureRandom.uuid.gsub(/\-/,'')
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save(validate: false)
    UserMailer.password_reset(self).deliver
  end

  def self.current_user(user)
    {first_name: user.first_name,
    last_name: user.last_name,
    email: user.email,
    id: user.id,
    auth_token: user.auth_token}
  end

  # -- Serializer -----------------

  def self.serialized(user)
    {
      user: {
        id: user.id,
        admin: user.admin,
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
        auth_token: user.auth_token,
        title: user.title,
        position: user.position,
        company_id: user.company_id,
        password_reset_sent_at: user.password_reset_sent_at,
        created_at: user.created_at,
        updated_at: user.updated_at
      },
      avatar: [user.avatar]
    }
  end

  # -- Create Avatar -----------------
  
  def create_avatar
    Avatar.new({user_id: self.id}).save!
  end

end
