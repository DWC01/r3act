class User < ActiveRecord::Base
  after_create :generate_api_key
  
  has_secure_password
  
  has_one :api_key
  belongs_to :company
  
  email_regex = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates_uniqueness_of   :email
  validates_format_of       :email, with: email_regex
  validates_presence_of     :first_name, :email, :password_confirmation
  validates :password,      presence: true, on: :create, length: { minimum: 6 }


  def generate_api_key
    ApiKey.create!(user_id: self.id)
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

end
