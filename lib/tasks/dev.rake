namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
    User.destroy_all
    Flight.destroy_all

    u = User.new
    u.email = "alice@example.com"
    u.password = "password"
    u.password_confirmation = "password"
    u.phone_number = "+17177238462"
    u.save

    u = User.new
    u.email = "bob@example.com"
    u.password = "password"
    u.password_confirmation = "password"
    u.phone_number = "+17177238462"
    u.save

    50.times do |n|
      f = Flight.new
      f.user_id = u.id
      f.description = Faker::Nation.capital_city
      f.departs_at = 24.hours.from_now + (n - 25).minutes
      f.save
    end

  end
end
