FactoryBot.define do

  factory :house do
    csv_id               {1}
    firstname            {"Tom"}
    lastname             {"Brown"}
    city                 {"London"}
    num_of_people        {2}
    has_child            {"Yes"}
  end

end