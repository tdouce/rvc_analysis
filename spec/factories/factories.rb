Factory.define :diver do |f|
  f.sequence(:last_name) {|n| "Last Name #{n}"}
  f.sequence(:first_name) {|n| "First Name #{n}"}
end

Factory.define :site do |f|
  f.sequence(:name) {|n| "Site Name #{n}"}
end

Factory.define :visit do |f|
  current_time  = Time.now
  f.dive_start          current_time
  f.sample_start        current_time + 30.minutes
  f.sample_end          current_time + 35.minutes
  f.dive_end            current_time + 1.hour
  f.substrate_max_depth 50 
  f.substrate_min_depth 30 
end
