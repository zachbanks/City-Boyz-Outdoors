namespace "update_database" do
  desc "add auth tokens to admins"
  task "add_auth_tokens" => :environment do
    admins = Admin.all
    admins.each do |admin|
      unless admin.auth_token
        admin.generate_token(:auth_token)
        admin.save
      end
    end
  end
end