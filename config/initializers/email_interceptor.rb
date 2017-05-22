class SandboxEmailInterceptor
  def self.delivering_email(message)
    #tests with empty to cc bcc fails as interceptor adds the to field and the mails are sent
    unless message.to.empty? and message.cc.empty? and message.bcc.empty?
      message.subject.prepend("[#{Rails.env}]")
      message.to = %w(ashishagrawal979@gmail.com)
      message.cc = ""
      message.bcc = ""
    end
  end
end

unless Rails.env.production?
  ActionMailer::Base.register_interceptor(SandboxEmailInterceptor)
end


