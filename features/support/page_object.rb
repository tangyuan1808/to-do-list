class PageObject
  class << self
    include Capybara::DSL
    include Rails.application.routes.url_helpers

    def session
      Capybara.current_session
    end

    def visit_page(url)
      session.visit(url)
    end

    def current_page
      session.current_path
    end

    def submit
      session.find('input[type="submit"]').click
    end

    def has_notice?
      session.has_css?('.alert-notice')
    end

    def has_alert?
      session.has_css?('.alert-error')
    end

    def logout
      session.find('.logout').click
    end
  end
end
