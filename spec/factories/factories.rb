Factory.define :diver do |f|
  f.sequence(:last_name) {|n| "Last Name #{n}"}
  f.sequence(:first_name) {|n| "First Name #{n}"}
end

Factory.define :site do |f|
  f.sequence(:name) {|n| "Site Name #{n}"}
end

Factory.define :visit do |f|
  current_time  = Time.now
  f.dive_start  current_time
  f.dive_end    current_time + 1.hour
end
