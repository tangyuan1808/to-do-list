class SignupPage < PageObject
  class << self
    def visit
      visit_page(signup_path)
    end

    def name=(name)
      session.find('#name').set(name)
    end

    def email=(email)
      session.find('#email').set(email)
    end

    def password=(password)
      session.find('#password').set(password)
    end

    def password_confirmation=(password_confirmation)
      session.find('#password_confirmation').set(password_confirmation)
    end
  end
end
