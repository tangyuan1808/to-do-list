class LoginPage < PageObject
  class << self
    def visit
      visit_page(login_path)
    end

    def email=(email)
      session.find('#email').set(email)
    end

    def password=(password)
      session.find('#password').set(password)
    end
  end
end