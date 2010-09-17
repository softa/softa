class Site < ActionMailer::Base
  default :from => "contato@softa.com.br"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.site.contact.subject
  #
  def contact(params)
    @greeting = "Hi"

    mail :to => "contato@softa.com.br", :body => params.inspect
  end
end
