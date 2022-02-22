class UserMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  require 'core_ext/string'
  default template_path: '/users/mailer'
  layout 'mailer'

  def confirmation_instructions(record, token, opts={})
    super
  end

  def reset_password_instructions(record, token, opts={})
    super
  end

  def invitation_instructions(record, token, opts={})
    super
  end

  def unlock_instructions(record, token, opts={})
    super
  end

  
end
