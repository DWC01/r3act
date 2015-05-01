class User < ActiveRecord::Base
  before_create :generate_auth_token
  after_create  :proccess_avatar_file
  
  has_secure_password
  belongs_to :company
  
  email_regex = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates_uniqueness_of   :email
  validates_format_of       :email, with: email_regex
  validates_presence_of     :first_name, :email

  validates :password,              presence: true, on: :create, length: { minimum: 6 }
  validates :password_confirmation, presence: true, on: :create


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

  def proccess_avatar_file
    avatar = Avatar.new(self.id, default_avatar_url)
    avatar.proccess_img
    save_additional_avatar_urls(avatar)
  end

  def save_additional_avatar_urls(avatar)
    self.avatar_original = avatar.original_url
    self.avatar_profile = avatar.profile_url
    self.avatar_nav = avatar.nav_url
    self.save!
  end

  def default_avatar_url
    'https://s3-us-west-1.amazonaws.com/r3act/uploads/development/user/profile-photos/fallback/abe-lincoln.jpg'
  end

end
