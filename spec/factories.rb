Factory.define :admin do |admin|
  admin.email 'admin@example.com'
  admin.password 'password'
  admin.password_confirmation { |a| a.password }
end

Factory.define :video do |video|
  video.title 'The Title'
  video.description 'My Video Description'
  video.source_url 'http://player.vimeo.com/video/20156252?title=0&amp;byline=0&amp;portrait=0&amp;color=9dca68'
  video.permalink { |v| "#{v.title.parameterize}" }
end

Factory.define :team_member do |member|
  member.name  "John Doe"
  member.email "johndoe@example.com"
  member.bio "This is my really cool bio."
end