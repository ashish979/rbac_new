Rails.application.config.middleware.use ExceptionNotification::Rack,
                                        :email => {
                                            :email_prefix => '[RBAC App]',
                                            :sender_address => '"RBAC App" <noreply@sample.in>',
                                            :exception_recipients => 'ashishagrawal979@gmail.com'
                                        }
