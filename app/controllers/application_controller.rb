class ApplicationController < ActionController::Base
  def hello
    render html: "hello, world!"
  end

  private 

    def setlocale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options
      {locale: I18n.locale}
    end
end
