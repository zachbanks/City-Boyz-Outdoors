ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "cityboyzoutdoors@gmail.com",
  :password             => "codyisqueer",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
