class User < ApplicationRecord
    has_secure_password

    VALID_EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    with_options presence: true do
      validates :name 
      validates :gender
      validates :password, length: { minimum: 8 }
      validates :email, format: { with: VALID_EMAIL_FORMAT},
                 uniqueness: { case_sensitive: false }
    end

    before_save { email_downcase }

    private

    def email_downcase
      self.email.downcase!
    end
end
