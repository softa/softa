class Site < ActionMailer::Base
  default :from => "contato@softa.com.br"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.site.contact.subject
  #
  def contact(params)
    mail :from => params[:email], :to => "contato@softa.com.br", :body => "<div style='font-family:helvetica,arial,sans-serif; font-size:14px;'><h2>contato no site softa.com.br</h2><h3 style='color:#444;'>email:</h3><h2>#{params[:email]}</h2><br><h3 style='color:#444;'>nome:</h3><h2>#{params[:name]}</h2><br><h3 style='color:#444;'>mensagem:</h3><p style='font-size:16px; color:#444'>#{params[:message]}</p><br><h3 style='color:#444;'>código de autenticação (not for robots):</h3><code>#{params[:authenticity_token]}</code></div>"
  end
end
