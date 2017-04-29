Rails.application.config.middleware.use ExceptionNotification::Rack,
                                        :email => {
                                            :email_prefix => '[Tinglado ERP]',
                                            :sender_address => '"Tinglado ERP" <noreply@tinglado.in>',
                                            :exception_recipients => 'ashishagrawal979@gmail.com'
                                        }
