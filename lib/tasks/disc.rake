desc "Fill the database tables with some sample data"
task({ :sample_disc => :environment }) do
  puts "Sample disc task running"
  if Rails.env.development?
    Discipline.destroy_all
  end
  if Rails.env.production?
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end

  200.times do

    dopt="C&C DVW DWW FTW TERM".split
    topt="Uniform Tardy Attitude Compliance Other Trainings Hours".split

d=Discipline.new
d.effective=Faker::Date.between(from: 20.years.ago, to: 1.day.ago)
d.expires=d.effective + 1.year
d.level=dopt.sample
d.notes=Faker::Quotes::Shakespeare.as_you_like_it_quote
d.reason=Faker::Quote.yoda
d.expectations=Faker::Quote.matz
d.title_for=topt.sample
d.emp_id=Employee.pluck(:emp_id).sample
d.sup_id="431842"

d.save
  end
end
